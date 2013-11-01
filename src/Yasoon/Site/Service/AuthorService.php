<?php
/**
 * Author: Fedor Avetisov <cousenavi@gmail.com>
 * Date: 5/26/13
 */

namespace Yasoon\Site\Service;

use JMS\DiExtraBundle\Annotation as DI;
use Symfony\Component\Security\Core\Exception\AccessDeniedException;
use Yasoon\Site\Entity\AuthorEntity;
use Yasoon\Site\Entity\BlankQuestionEntity;
use Yasoon\Site\Entity\PostEntity;
use Yasoon\Site\Entity\QuestionEntity;
use Yasoon\Site\Mail\Sender;
use Symfony\Component\DependencyInjection\Container;
use Symfony\Component\Security\Core\Authentication\Token\UsernamePasswordToken;
use Symfony\Component\HttpFoundation\Session\Session;
/**
 * @DI\Service("yasoon.service.author")
 */
class AuthorService extends AbstractApiService {

    /**
     * @var Sender
     *
     * @DI\Inject("yasoon.mail.sender")
     */
    public $mailer;

    /**
     * @var ContentService
     *
     * @DI\Inject("yasoon.service.content")
     */
    public $contentService;

    /**
     * @var Container
     *
     * @DI\Inject("service_container")
     */
    public $container;


    /**
     * @var \Symfony\Component\Security\Core\SecurityContextInterface
     *
     * @DI\Inject("security.context")
     */
    public  $securityContext;

    /**
     * @param int $authorId
     * @return array
     */
    public function getShortInfo($authorId)
    {

        $data = $this->em->createQueryBuilder()
            ->select('author.id, author.name, author.description, author.publicationDate, author.img,
            author.job, author.interest, author.dream, posts.id as postId, questions.id as questionId')
            ->from('Yasoon\Site\Entity\AuthorEntity', 'author')
            ->leftJoin('author.posts', 'posts')
            ->leftJoin('author.questions', 'questions', 'WITH', 'questions.answer IS NOT NULL')
            ->where("author.id = $authorId")
            ->getQuery()->getResult();


        //@TODO пипец костыль (устал и хочу спать). Исправить на нормальный подсчёт sql-ем или ещё как
        $posts = []; $questions = [];
        foreach ($data as $row) {
            $posts[] = $row['postId'];
            $questions[] = $row['questionId'];
        }
        $data = $row;
        $data['postsCount'] = count(array_unique($posts));
        $data['answersCount'] = count(array_unique($questions));
        //------------------- костыль моде офф

        $result = [
            'id'      => $data['id'],
            'name'    => $data['name'],
            'description' => $data['description'],
            'job' => $data['job'],
            'interest' => $data['interest'],
            'dream' => $data['dream'],
            'posts'   => $data['postsCount'],
            'answers' => $data['answersCount'],
            'img'     => $data['img']
        ];

        $access = $this->getAccessLevel($authorId);

        return ['access' => $access, 'data' => $result];
    }



    /**
     * приватная инфа для редактирования профиля
     *
     * @return array
     * @throws \Symfony\Component\Security\Core\Exception\AccessDeniedException
     */
    public function getPrivateInfo()
    {
        $result = [
            'id'    => 1,
            'name'    => 'sdsdsdsd',
            'email'   => 'wef',
            'password' => 1313,
            'description' => 'SDFSDF',
            'publicationDate' => (new \DateTime())->format('d/m/Y'),
            'job' => '',
            'interest' => '',
            'dream' => ''
        ];

        $access = 'ADMIN';

        return ['access' => $access, 'data' => $result];

        $authorId = $this->securityContext->getToken()->getUsername();

        if (!(int)$authorId) {
            throw new AccessDeniedException();
        }

        $data = $this->em->createQueryBuilder()
            ->select('author.id, author.name, author.description, author.publicationDate,
            author.job, author.interest, author.dream, author.email, author.password')
            ->from('Yasoon\Site\Entity\AuthorEntity', 'author')
            ->where("author.id = $authorId")
            ->getQuery()->getSingleResult();

        $result = [
            'id'    => $data['id'],
            'name'    => $data['name'],
            'email'   => $data['email'],
            'password' => $data['password'],
            'description' => $data['description'],
            'publicationDate' => $data['publicationDate']->format('d/m/Y'),
            'job' => $data['job'],
            'interest' => $data['interest'],
            'dream' => $data['dream']
        ];

        $access = $this->getAccessLevel($authorId);

        return ['access' => $access, 'data' => $result];
    }

    /**
     * Информация об обновлениях
     */
    public function getStatusInfo()
    {
        $authorId = $this->securityContext->getToken()->getUsername();

        if ($authorId == 'anon.') {
            return ['access' => 'ANON'];
        }

        $data = $this->em->createQueryBuilder()
            ->select('author.id, author.name, count(question) as questionsCount, author.img')
            ->from('Yasoon\Site\Entity\AuthorEntity', 'author')
            ->leftJoin('author.questions', 'question', 'WITH', 'question.answer IS NULL')
            ->where("author.id = $authorId")
            ->getQuery()->getSingleResult();

        return [
          'access' => 'USER',
          'data' => [
              'id' => $data['id'],
              'name' => $data['name'],
              'questions' => $data['questionsCount'],
              'img' =>  $data['img']
          ]
        ];
    }


    /**
     * @param $authorId
     * @return array
     */
    public function getPosts($authorId) {

        $result= [];

        /** @var PostEntity[] $posts */
        $posts = $this->em->getRepository('Yasoon\Site\Entity\PostEntity')
            ->findBy(
                ['authorId' => $authorId],
                ['place' => 'ASC']
            );


        foreach ($posts as $post) {
            $result[] = [
                'id'      => $post->getId(),
                'caption' => $post->getCaption(),
                'preview' => $post->getPreview(),
                'date'    => $post->getDate()->format('d/m/Y'),
                'authorId'=> $post->getAuthorId(),
                'likes'   => $post->getLikes()
            ];
        }



        $interviewQuestions= $this->em->createQueryBuilder()
            ->select('question')
            ->from('Yasoon\Site\Entity\QuestionEntity', 'question')
            ->where('question.isInBlank = 1')
            ->andWhere('question.answer IS NOT NULL')
            ->andWhere("question.authorId = $authorId")
            ->orderBy('question.date', 'desc')
            ->getQuery()->getResult();


        if (isset($interviewQuestions[0])) {
            array_unshift($result, [
              'id'      => 'blank',
              'caption' => 'Интервью',
              'preview' => 'Пост, составленный из ответов на вопросы интервью',
              'date'    => $interviewQuestions[0]->getDate()->format('d/m/Y'),
              'authorId'=> $post->getAuthorId(),
              'likes'   => 0
            ]);
        }


        $access = $this->getAccessLevel($authorId);

        return ['access' => $access, 'data' => $result];
    }

    public function getQuestionsStack($authorId, $offset) {
        $limit = 50;

        $result = [];

        $qb = $this->em->createQueryBuilder();
        $questions = $qb->select('question.id')
            ->from('Yasoon\Site\Entity\QuestionEntity', 'question')
            ->andWhere("question.authorId = $authorId")
            ->andWhere('question.isInBlank = false')
            ->setFirstResult($offset)
            ->setMaxResults($limit)
            ->getQuery()->getResult();

        foreach ($questions as $question) {
            $result[] = $question['id'];
        }

        $access = $this->getAccessLevel($authorId);

        return ['access' => $access, 'data' => $result];

    }

    /**
     * @param array $map
     * @return array
     */
    public function getQuestions(array $map) {

        $result = [];

        $qb = $this->em->createQueryBuilder();
        /** @var QuestionEntity[] $questions  */
        $questions = $qb
            ->select('question')
            ->from('Yasoon\Site\Entity\QuestionEntity', 'question')
            ->andWhere($qb->expr()->in('question.id', $map))
            ->getQuery()->getResult();

        foreach ($questions as $question) {
            $result[] = [
              'id'  => $question->getId(),
              'caption' => $question->getCaption(),
              'date'    => $question->getDate()->format('d/m/Y'),
              'answer' => $question->getAnswer(),
              'place' => $question->getPlace()
            ];
        }

        //@TODO addd authorization
    }


    /**
     * @param $authorId
     * @return array
     */
    public function getBlank($authorId) {

        $result = [];

        /** @var QuestionEntity[] $questions */
        $questions= $this->em->createQueryBuilder()
            ->select('question')
            ->from('Yasoon\Site\Entity\QuestionEntity', 'question')
            ->where('question.isInBlank = true')
            ->andWhere("question.authorId = $authorId")
            ->orderBy('question.place', 'ASC')
            ->getQuery()->getResult();

        foreach ($questions as $question) {
            $result[] = [
                'id'     => $question->getId(),
                'caption'   => $question->getCaption(),
                'answer' => $question->getAnswer(),
                'place' => $question->getPlace()
            ];
        }

        $access = $this->getAccessLevel($authorId);

        return ['access' => $access, 'data' => $result];
    }

    /**
     * @param array $map
     * @return array
     */
    public function updateQuestionsPlaces(array $map)
    {
        $values = [];
        foreach ($map as $place => $id) {
            $place = (int)$place;
            $id =    (int)$id;
            $values[] = "('$id', '$place')";
        }
        $sql = 'INSERT INTO question (id, place) VALUES  '.implode(',', $values).
            'ON DUPLICATE KEY UPDATE place=VALUES(place)';

        $this->em->getConnection()->executeQuery($sql);

        return $map;

        //@TODO addd authorization
    }

    /**
     * @param array $map
     * @return array
     */
    public function updatePostsPlaces(array $map)
    {
        $values = [];
        foreach ($map as $place => $id) {
            $place = (int)$place;
            $id =    (int)$id;
            $values[] = "('$id', '$place')";
        }
        $sql = 'INSERT INTO post (id, place) VALUES  '.implode(',', $values).
            'ON DUPLICATE KEY UPDATE place=VALUES(place)';

        $this->em->getConnection()->executeQuery($sql);

        return $map;

        //@TODO addd authorization
    }

    /**
     * @param array $author
     * @return array
     * @throws \Exception
     */
    public function register(array $author)
    {
        try {
            $registredAuthors = $this->em->getRepository('Yasoon\Site\Entity\AuthorEntity')->findByEmail($author['email']);

            if (count($registredAuthors)) {
                return ['error' => 'EMAIL_REGISTRED'];
            }

            #$this->em->beginTransaction();

            if (empty($author['subscribed']) || $author['subscribed'] !='on') {
                $subscribed = false;
            } else {
                $subscribed = true;
            }

            $entity = (new AuthorEntity())
                ->setName($author['name'])
                ->setEmail($author['email'])
                ->setPassword(md5($author['password']))
                ->setSubscribed((int) $subscribed)
                ->setPublicationDate(new \DateTime())
                ->setRole(1);

            $this->em->persist($entity);
            $this->em->flush();

            /** @var BlankQuestionEntity[] $blankQuestions */
            $blankQuestions =  $this->em->getRepository('Yasoon\Site\Entity\BlankQuestionEntity')->findAll();

            $questions = [];
            $date = (new \DateTime())->format('Y-m-d');
            foreach ($blankQuestions as $question) {
                $questions[] = sprintf("(%d, '%s', '%s', %d, %d)",
                    $entity->getId(), $question->getText(), $date, true, $question->getPlace());
            }
            $sql = 'INSERT INTO question (author_id, caption, date, is_in_blank, place) VALUES '.implode(',', $questions);
            $this->em->getConnection()->executeQuery($sql);

        } catch (\Exception $e) {
            throw $e;
            #$this->em->rollback();
        }

        try {
            $message = $this->contentService->getAllContent()[6]['text'];

            $message = str_replace(['%name%', '%email%', '%password%'], [$author['name'], $author['email'], $author['password']], $message);

            $this->mailer->send($entity->getEmail(), $message);
        } catch (\Exception $e) {

        }
        #$this->em->commit();

        // Сразу авторизуем чела
        $token = new UsernamePasswordToken((string) $entity->getId(), $entity->getPassword(), "secured_area", ['ROLE_USER']);

        $this->securityContext->setToken($token);

        /** @var Session $session */
        $session = $this->container->get('request')->getSession();
        $session->set('_security_secured_area', serialize($token));
        $this->container->get('request')->setSession($session);

        return [
            'id'    => $entity->getId(),
            'name'  => $entity->getName(),
            'email' => $entity->getEmail()
        ];
    }


    /**
     * @param array $author
     * @return array
     */
    public function editInfo(array $author)
    {
        $authorId = $this->securityContext->getToken()->getUsername();

        /** @var AuthorEntity $entity */
        $entity = $this->em->getRepository('Yasoon\Site\Entity\AuthorEntity')
            ->find($authorId);


        isset($author['name']) && $entity->setDescription($author['name']);
        isset($author['email']) && $entity->setDescription($author['email']);
        isset($author['shortHistory']) && $entity->setDescription($author['shortHistory']);
        isset($author['job']) && $entity->setJob($author['job']);
        isset($author['interests']) && $entity->setInterest($author['interests']);
        isset($author['dreams']) && $entity->setDream($author['dreams']);

        isset($author['homepage']) && $entity->setHomepage($author['homepage']);

        if (isset($author['new_password'])) {
            if (md5($author['old_password']) != $entity->getPassword()) {
                $entity->setPassword(md5($author['new_password']));
            }
        }

        $this->em->merge($entity);
        $this->em->flush();

        return [
            'id'  => $entity->getId(),
            'name' => $entity->getName(),
            'description' => $entity->getDescription(),
            'job' => $entity->getJob(),
            'interest' => $entity->getInterest(),
            'dream' => $entity->getDream(),
            'homepage' => $entity->getHomepage(),
        ];
    }

    /**
     * @param $email
     * @return array
     */
    public function notify($email)
    {
        $author = $this->em->getRepository('Yasoon\Site\Entity\AuthorEntity')->findOneByEmail($email);

        $newPass = '';
        for ($i = 0; $i < 10; $i++) {
            $newPass .= mt_rand(0, mt_rand(5,9));
        }

        $author->setPassword(md5($newPass));

        $this->em->merge($author);
        $this->em->flush();

        $name = $author->getName();

        $message = $this->contentService->getAllContent()[7]['text'];

        $this->mailer->send($author->getEmail(), $message);

        return [
            'id' => $author->getId()
        ];

    }

    /**
     * @param string $imageName
     * @return string
     */
    public function setAvatarAuthor($imageName)
    {
        $authorId = (int) $this->securityContext->getToken()->getUsername();

        /** @var AuthorEntity $entity */
        $entity = $this->em->getRepository('Yasoon\Site\Entity\AuthorEntity')
            ->find($authorId);

        $oldImage = $entity->getImg();
        $entity->setImg($imageName);

        $this->em->merge($entity);
        $this->em->flush();

        return $oldImage;
    }
}