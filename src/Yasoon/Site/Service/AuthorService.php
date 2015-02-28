<?php
/**
 * Author: Fedor Avetisov <cousenavi@gmail.com>
 * Date: 5/26/13
 */

namespace Yasoon\Site\Service;

use Doctrine\ORM\Query\ResultSetMapping;
use Doctrine\ORM\Query\ResultSetMappingBuilder;
use JMS\DiExtraBundle\Annotation as DI;
use Symfony\Component\Security\Core\Exception\AccessDeniedException;
use Yasoon\Site\Entity\AuthorEntity;
use Yasoon\Site\Entity\BlankQuestionEntity;
use Yasoon\Site\Entity\PostEntity;
use Yasoon\Site\Entity\QuestionEntity;
use Yasoon\Site\Entity\FriendsEntity;
use Yasoon\Site\Entity\TimelineEntity;
use Yasoon\Site\Entity\AuthorChangedPassEntity;
use Yasoon\Site\Mail\Sender;
use Symfony\Component\DependencyInjection\Container;
use Symfony\Component\Security\Core\Authentication\Token\UsernamePasswordToken;
use Symfony\Component\HttpFoundation\Session\Session;
use Symfony\Component\HttpFoundation\JsonResponse;

error_reporting(0);

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
     * @var AllfService
     *
     * @DI\Inject("yasoon.service.allf")
     */
    public $allf;
    
    /**
     * @return array
     */
    public function setFriends($author, $friend)
    {
        try {
            $write = $this->em->getRepository('Yasoon\Site\Entity\FriendsEntity')->createQueryBuilder('f')
                    ->where('f.readerId = '.$author.' AND f.writerId = '.$friend)
                    ->getQuery()->getResult();
                    
            if(count($write) > 0)
            {
                $this->em->remove($write[0]);
                $this->em->flush();
                $type = 'delete';
            }
            else
            {     
                $friendsEntity = (new FriendsEntity())
                        ->setReaderId($author)
                        ->setWriterId($friend)
                        ->setDateWrite(new \DateTime());
                
                $this->em->persist($friendsEntity);
                $this->em->flush();
                $type = 'add';
            }
        } catch(\Exception $e) {
            return ['error' => true, 'errorText' => $e->getMessage()];
        }
        
        return ['type' => $type, 'id' => $author];
    }
    
    
    /**
     * @param array $data
     * @return array
     */
    public function setQuestion($data)
    {
        try {
            /** @var $questions QuestionEntity */
            $QuestionEntity = (new QuestionEntity())
                ->setAskAuthorId((int)$data['ask_authorId'])
                ->setAuthorId((int)$data['authorId'])
                ->setText($data['question'])
                ->setDate(new \DateTime());
            
            $QuestionEntity->setAuthor($this->em->getReference('Yasoon\Site\Entity\AuthorEntity', $data['authorId']));
            $QuestionEntity->setAuthorAsk($this->em->getReference('Yasoon\Site\Entity\AuthorEntity', $data['ask_authorId']));
            
            $this->em->persist($QuestionEntity);
            $this->em->flush();
            
            $timeline =  $this->em->createQueryBuilder()
                ->select('t')
                ->from('Yasoon\Site\Entity\TimelineEntity', 't')
                ->where('t.author_id = :aid')
                ->setParameter('aid', $QuestionEntity->getAuthorId())
                ->getQuery()->getResult();
            if (count($timeline) < 1 || !is_object($timeline[0])) {
                $timeline = (new TimelineEntity())
                    ->setAuthorId($QuestionEntity->getAuthorId())
                    ->setPostsCount('0')
                    ->setQuestionsCount('1')
                    ->setAnswersCount('0');
                    
                $this->em->persist($timeline);
                $this->em->flush();
            }
            else
            {
                $timeline[0]->setQuestionsCount(($timeline[0]->getQuestionsCount()*1) + 1);
                $this->em->merge($timeline[0]);
                $this->em->flush();
            }
            
            
            $data = ['id' => 'questions_'.$QuestionEntity->getId(),
                     'url' => 'http://'.$_SERVER['HTTP_HOST'].'/#author/'.$QuestionEntity->getAuthorId().'/questions',
                     'image' => '',
                     'subtype' => 'questions',
                     'sumtext' => trim( strip_tags($QuestionEntity->getAnswer()) ),
                     'tags' => '"Questions"',
                     'body' => trim( strip_tags($QuestionEntity->getAnswer()) ),
                     'date' => date('Y-m-d\TH:i:s', $QuestionEntity->getDate()->getTimestamp() ),
                     'title' => trim( strip_tags($QuestionEntity->getText()))];
            
            $this->allf->indexistoQueryAdd($data);
            
        } catch(\Exception $e) {
            return ['error' => true, 'errorText' => $e->getMessage()];
        }
        return ['error' => false];
    }
    
    
    
    /**
     * @return array
     */
    public function getAllAuthors() {

        /** @var AuthorEntity $post */
        $authors = $this->em->createQueryBuilder()
            ->select('a')
            ->from('Yasoon\Site\Entity\AuthorEntity', 'a')
            ->getQuery()->getResult();

        return $authors;
    }
    
    /**
     * @param int $id
     * @return array
     */
    public function deleteQuestion($id)
    {        
        $authorId = (int) $this->securityContext->getToken()->getUsername();
        if (!is_int($authorId)) {
            return ['error' => true, 'errorText' => 'accessDenied'];
        }
        
        $question = $this->em->getRepository('Yasoon\Site\Entity\QuestionEntity')->findById($id);
        if (!$question || $question[0]->getAuthorId() != $authorId) {
            return ['error' => true, 'errorText' => 'accessDenied'];
        }
        
        try {
            $this->em->remove($question[0]);
            $this->em->flush();
            
            $data = json_encode(['_id' => 'questions_'.$id]);
            $batchDataBody = '[' . $data . ']';
            $this->allf->indexistoQueryDelete($batchDataBody);
            
            return ['type' => 'delete', 'id' => $id];
        } catch(\Exception $e) {
            return ['error' => true, 'errorText' => $e->getMessage()];
        }
    }
    
    /**
     * @param array $data
     * @return array
     */
    public function answerQuestion($data)
    {
        try {
            $question = $this->em->getRepository('Yasoon\Site\Entity\QuestionEntity')->createQueryBuilder('q')
                ->where('q.id = '.$data['id'])
                ->andWhere('q.authorId = '.$data['authorId'])
                ->getQuery()->getResult();
            if(count($question) > 0 && is_object($question[0]))
            {
                $question[0]->setAnswer($data['questionAnswerText']);
                $this->em->merge($question[0]);
                $this->em->flush();
                
                $friends = $this->em->getRepository('Yasoon\Site\Entity\AuthorEntity')->find($data['authorId'])->getFriends();
                foreach($friends as $friend)
                {
                    $timeline =  $this->em->createQueryBuilder()
                        ->select('t')
                        ->from('Yasoon\Site\Entity\TimelineEntity', 't')
                        ->where('t.author_id = :aid')
                        ->setParameter('aid', $friend->getId())
                        ->getQuery()->getResult();
                    if (count($timeline) < 1 || !is_object($timeline[0])) {
                        $timeline = (new TimelineEntity())
                            ->setAuthorId($friend->getId())
                            ->setPostsCount('0')
                            ->setQuestionsCount('0')
                            ->setAnswersCount('1');
                            
                        $this->em->persist($timeline);
                        $this->em->flush();
                    }
                    else
                    {
                        $timeline[0]->setAnswersCount(($timeline[0]->getAnswersCount()*1) + 1);
                        $this->em->merge($timeline[0]);
                        $this->em->flush();
                    }
                }
                
                return ['error' => false, 'errorText' => ''];
            }
        } catch(\Exception $e) {
            return ['error' => true, 'errorText' => $e->getMessage()];
        }
        return ['error' => true, 'errorText' => 'notFound'];
    }


    /**
    * @param array $data
    * @return array
    */
    public function clearTimeline(array $data){

        //return $data['authorId'];

        try{
            $timeline =  $this->em->createQueryBuilder()
                ->select('t')
                ->from('Yasoon\Site\Entity\TimelineEntity', 't')
                ->where('t.author_id = :aid')
                ->setParameter('aid', (int)$data['authorId'])
                ->getQuery()->getResult();

            if (count($timeline) < 1 || !is_object($timeline[0])) {
                $timeline = (new TimelineEntity())
                    ->setAuthorId($friend->getId())
                    ->setPostsCount('0')
                    ->setQuestionsCount('0')
                    ->setAnswersCount('0');
                    
                $this->em->persist($timeline);
                $this->em->flush();
            }
            else
            {

                switch($data['type']){
                    case 'questions':
                      $timeline[0]->setQuestionsCount(0); 
                      break;
                    case 'all':
                      $timeline[0]->setPostsCount(0); 
                      $timeline[0]->setAnswersCount(0); 
                      break;
                    default:
                      $timeline[0]->setPostsCount(0); 
                      $timeline[0]->setAnswersCount(0);  
                      break;
                }

                $this->em->merge($timeline[0]);
                $this->em->flush();

                return ['error'=>false];
            }

          } catch(\Exception $e) {

            return ['error' => true, 'errorText' => $e->getMessage()];

        }

        return ['error' => true, 'errorText' => 'Not Found'];

    }


    /**
     * @param int $authorId
     * @return array
     */
    public function getShortInfo($authorId)
    {

//        $data = $this->em->createQueryBuilder()
//            ->select('author.id, author.name, author.description, author.publicationDate, author.img,
//            author.job, author.interest, author.dream, posts.id as postId, questions.id as questionId')
//            ->from('Yasoon\Site\Entity\AuthorEntity', 'author')
//            ->leftJoin('author.posts', 'posts')
//            ->leftJoin('author.questions', 'questions', 'WITH', 'questions.answer IS NOT NULL')
//            ->where("author.id = $authorId")
//            ->getQuery()->getResult();
//
//
//        //@TODO пипец костыль (устал и хочу спать). Исправить на нормальный подсчёт sql-ем или ещё как
//        $posts = []; $questions = [];
//        foreach ($data as $row) {
//            $posts[] = $row['postId'];
//            $questions[] = $row['questionId'];
//        }
//        $data = $row;
//        $data['postsCount'] = count(array_unique($posts));
//        $data['answersCount'] = count(array_unique($questions));
//        //------------------- костыль моде офф

        $userId = $this->securityContext->getToken()->getUsername();

        $stmt = $this->em->getConnection()->prepare(
            "SELECT a.id, a.id ownerId, a.role, a.name, a.description,
              a.job, a.interest, a.dream,
              (SELECT count(1) FROM post     WHERE author_id = a.id) posts,
              (SELECT count(1) FROM question WHERE author_id = a.id and answer is not null) answers,
              (f.id is not null) is_friend
            FROM author a
              LEFT JOIN friends f
                ON a.id = f.writer_id AND f.reader_id = :userId
            WHERE a.id = :authorId");
        $stmt->bindValue('userId', $userId);
        $stmt->bindValue('authorId', $authorId);
        $stmt->execute();
        $data = $stmt->fetchAll();
        $stmt->closeCursor();

        $data[0]['is_friend'] = $data[0]['is_friend'] != 0;

        return $data[0];
/*
        $result = [
            'id'      => $data['id'],
            'ownerId' => $data['id'],
            'name'    => $data['name'],
            'description' => $data['description'],
            'job' => $data['job'],
            'interest' => $data['interest'],
            'dream' => $data['dream'],
            'posts'   => $data['postsCount'],
            'answers' => $data['answersCount'],
            'friend' => $data['friend'],
            'img'     => $data['img'],
        ];

//        $access = $this->getAccessLevel($authorId);
//
//        return ['access' => $access, 'data' => $result];

        return $result; */
    }



    /**
     * приватная инфа для редактирования профиля
     *
     * @return array
     * @throws \Symfony\Component\Security\Core\Exception\AccessDeniedException
     */
    public function getPrivateInfo()
    {

//        $access = 'ADMIN';
//
//        return ['access' => $access, 'data' => $result];


        $authorId = $this->securityContext->getToken()->getUsername();
        //echo $authorId; die;

        if (!(int)$authorId) {
            $response = new JsonResponse(false, 200);
            $response->send();
            die;
        }
        
        $data = $this->em->getRepository('Yasoon\Site\Entity\AuthorEntity')->find($authorId);

        $post = $this->em->getRepository('Yasoon\Site\Entity\PostEntity')->createQueryBuilder('p')
            ->leftJoin('p.author', 'a')
            ->where('a.id = '.$authorId)->setMaxResults(1)->setFirstResult(0)
            ->orderBy('p.date', 'desc')->getQuery()->getResult();
        if($post)
        {
            $post_date = $post[0]->getDate()->format('d/m/Y');
        }
        else
        {
            $post_date = null;
        }
        
        $ask_questions_data = $this->em->getRepository('Yasoon\Site\Entity\QuestionEntity')->findBy(array('ask_authorId' => $authorId));
        $ask_questions = [];
        foreach($ask_questions_data as $q)
        {
            $ask_questions[] = $q->getId();
        }
        
        //$followers = $this->em->getRepository('Yasoon\Site\Entity\FriendsEntity')->findBy(array('writerId' => $data->getId()));
        $followers = $data->getFriends();
        $friends = [];
        foreach($followers as $follower)
        {
            $friends[] = ['id' => $follower->getId(), 'date' => $follower->getPublicationDate()->format('d/m/Y')];
        }
        
        $timeline = null;
        $timeline_data = $this->em->getRepository('Yasoon\Site\Entity\TimelineEntity')->findBy(array('author_id' => $data->getId()));
        if($timeline_data)
        {
            $timeline = ['posts_count' => $timeline_data[0]->getPostsCount(),
                         'answers_count' => $timeline_data[0]->getAnswersCount(),
                         'question_count' => $timeline_data[0]->getQuestionsCount()];
        }
        
        $result = [
            'id'    => $data->getId(),
            'name'    => $data->getName(),
            'email'   => $data->getEmail(),
            'avatarImg' => $data->getImg(),
            'interviewCaption' => $data->getInterviewCaption(),
            'job' => $data->getJob(),
            'homepage' => $data->getHomepage(),
            'interest' => $data->getInterest(),
            'last_publish_date' => $post_date,
            'dream' => $data->getDream(),
            'ask_questions' => $ask_questions,
            'friends' => $friends,
            'timeline' => $timeline,
            'roles' => $data->getRoles(),
            'regFrom' => $data->getRegFrom()
        ];

//        $access = $this->getAccessLevel($authorId);
//
//        return ['access' => $access, 'data' => $result];

        return $result;
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
//          'access' => 'USER',
//          'data' => [
              'id' => $data['id'],
              'ownerId' => $data['id'],
              'name' => $data['name'],
              'questions' => $data['questionsCount'],
              'img' =>  $data['img']
//          ]
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



        /*$interviewQuestions= $this->em->createQueryBuilder()
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
        }*/
        

        $result['ownerId'] = $authorId;
//        $access = $this->getAccessLevel($authorId);
//
//        return ['access' => $access, 'data' => $result];

        return $result;
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

//        $access = $this->getAccessLevel($authorId);
//
//        return ['access' => $access, 'data' => $result];

        $result['ownerId'] = $authorId;

        return $result;
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
                'place' => $question->getPlace(),
                'ownerId' => $authorId
            ];
        }

//        $access = $this->getAccessLevel($authorId);
//
//        return ['access' => $access, 'data' => $result];
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
                return ['error'     => true,
                        'errorType' => 'emailExist'];
            }
            /*$registredAuthors = $this->em->getRepository('Yasoon\Site\Entity\AuthorEntity')->findByName($author['name']);

            if (count($registredAuthors)) {
                return ['error'     => true,
                        'errorType' => 'userExist'];
            }*/

            $entity = (new AuthorEntity())
                ->setName($author['name'])
                ->setEmail($author['email'])
                ->setPassword(md5($author['password']))
                ->setSubscribed((int) $author['subscribed'])
                ->setPublicationDate(new \DateTime())
                ->setDateChange(new \DateTime())
                ->setRegFrom(0)
                ->setRole(1);

            $this->em->persist($entity);
            $this->em->flush();
            
            $data = ['id' => 'author_'.$entity->getId(),
                     'url' => 'http://'.$_SERVER['HTTP_HOST'].'/#author/'.$entity->getId().'/posts',
                     'image' => '',
                     'subtype' => 'users',
                     'sumtext' => trim( strip_tags($entity->getDescription()) ).' ' .trim( strip_tags($entity->getInterest()) ),
                     'tags' => '"Authors"',
                     'body' => trim( strip_tags($entity->getDescription()) ),
                     'date' => date('Y-m-d\TH:i:s', $entity->getPublicationDate()->getTimestamp() ),
                     'title' => trim( strip_tags($entity->getName()))];
            
            $this->allf->indexistoQueryAdd($data);

            /** @var BlankQuestionEntity[] $blankQuestions */
            /*$blankQuestions =  $this->em->getRepository('Yasoon\Site\Entity\BlankQuestionEntity')->findAll();

            $questions = [];
            $date = (new \DateTime())->format('Y-m-d');
            foreach ($blankQuestions as $question) {
                $questions[] = sprintf("(%d, '%s', '%s', %d, %d)",
                    $entity->getId(), $question->getText(), $date, true, $question->getPlace());
            }
            $sql = 'INSERT INTO question (author_id, caption, date, is_in_blank, place) VALUES '.implode(',', $questions);
            $this->em->getConnection()->executeQuery($sql);
*/
        } catch (\Exception $e) {
            throw $e;
            #$this->em->rollback();
        }
        
        $message = $this->contentService->getAllContent(0)[6]['text'];

        $message = str_replace(['%name%', '%email%', '%password%'], [$author['name'], $author['email'], $author['password']], $message);

        $this->mailer->send($entity->getEmail(), 'Добро пожаловать на Ясун!', $message);
        #$this->em->commit();

        // Сразу авторизуем чела
        $token = new UsernamePasswordToken((string) $entity->getId(), $entity->getPassword(), "secured_area", ['ROLE_USER']);

        $this->securityContext->setToken($token);

        /** @var Session $session */
        $session = $this->container->get('request')->getSession();
        $session->set('_security_secured_area', serialize($token));
        $this->container->get('request')->setSession($session);

        return ['error' => false,
                'userId' => $entity->getId()];
    }


    /**
     * @param array $author
     * @return array
     */
    public function editInfo(array $author)
    {
        if ($this->allf->isAdmin()) {
            (int)$authorId = $author['id'];
        }
        else
        {
            (int)$authorId = $this->securityContext->getToken()->getUsername();
        }
        
        if ($authorId < 1) {
            return ['error' => true, 'errorText' => 'accessDenied'];
        }
        
        try {
            /** @var AuthorEntity $entity */
            $entity = $this->em->getRepository('Yasoon\Site\Entity\AuthorEntity')
                ->find($authorId);
    
            
            if (isset($author['new_pasword']) && $author['new_pasword'] != '') {
                
                if (md5($author['old_pasword']) == $entity->getPassword()) {
                    $entity->setPassword(md5($author['new_pasword']));
                    
                }
                else
                {
                    return ['authorData' => false, 'message' => 'wrongPass'];
                }
            }
    
    
            isset($author['name']) && $entity->setName($author['name']);
            isset($author['email']) && $entity->setEmail($author['email']);
            isset($author['description']) && $entity->setDescription($author['description']);
            isset($author['job']) && $entity->setJob($author['job']);
            isset($author['interest']) && $entity->setInterest($author['interest']);
            isset($author['dream']) && $entity->setDream($author['dream']);
            isset($author['img']) && $entity->setImg($author['img']);
            isset($author['interviewCaption']) && $entity->setInterviewCaption($author['interviewCaption']);
            isset($author['homepage']) && $entity->setHomepage($author['homepage']);
            $entity->setDateChange(new \DateTime());
            if(isset($author['subscribed']))
            {
                $entity->setSubscribed(1);
            }
            else
            {
                $entity->setSubscribed(0);
            }
        
            $entity = $this->em->merge($entity);
            $this->em->flush();
            
            $data = ['id' => 'author_'.$entity->getId(),
                     'url' => 'http://'.$_SERVER['HTTP_HOST'].'/#author/'.$entity->getId().'/posts',
                     'image' => '',
                     'subtype' => 'users',
                     'sumtext' => trim( strip_tags($entity->getDescription()) ).' ' .trim( strip_tags($entity->getInterest()) ),
                     'tags' => '"Authors"',
                     'body' => trim( strip_tags($entity->getDescription()) ),
                     'date' => date('Y-m-d\TH:i:s', $entity->getDateChange()->getTimestamp() ),
                     'title' => trim( strip_tags($entity->getName()))];
            
            $this->allf->indexistoQueryAdd($data);
            
            $session = new Session();
            
            if (!empty($session->get('reviewStatus'))) {
                $reviewId = $session->get('reviewStatus');
                $review = $this->em->getRepository('Yasoon\Site\Entity\ReviewEntity')->find($reviewId);
                $review->setStatus('saved')
                        ->setAuthorId($entity->getId());
                
                $this->em->merge($review);
                $this->em->flush();
                
                $session->remove('reviewStatus');
                
                return ['authorData' => true, 'reviewId' => $reviewId];
            }
            return ['authorData' => true];
        } catch(\Exception $e) {
            return ['authorData' => false, 'message' => $e->getMessage()];
        }
    }

    /**
     * @param $email
     * @return array
     */
    public function notify($email)
    {
        try {
            $author = $this->em->getRepository('Yasoon\Site\Entity\AuthorEntity')->findOneByEmail($email);
            
            if (empty($author)) {
                return ['error' => true, 'errorType' => 'nouser'];
            }
            if($author->getRole() == 4)
            {
                return ['error' => true, 'errorType' => 'admin'];
            }
    
            $newPass = '';
            for ($i = 0; $i < 10; $i++) {
                $newPass .= mt_rand(0, mt_rand(5,9));
            }
    
            $author->setNewpass($newPass);
    
            $this->em->merge($author);
            $this->em->flush();
    
            $name = $author->getName();
            
            $protocol = stripos($_SERVER['SERVER_PROTOCOL'],'https') === true ? 'https://' : 'http://';
            $link = $protocol.$_SERVER['HTTP_HOST'].'/api/author/change_pass/'.$author->getEmail().'/'.md5($newPass);
            
            $message = $this->contentService->getAllContent(0)[5]['text'];
            $message = str_replace(['%email%', '%newpass%', '%link%'], [$author->getEmail(), $newPass, $link], $message);
    
            $request = $this->mailer->send($author->getEmail(), 'Восстановление пароля Yasoon', $message);
            
            if ($request) {
                return ['error' => true, 'errorType' => 'alliswell'];
            }
            
            return ['error' => true, 'errorType' => 'notSent '];
        } catch(\Exception $e) {
            return ['error' => true, 'errorType' => 'empty'];
        }
    }
    
    /**
     * @param $email
     * @return string
     */
    public function change_pass($email, $hash)
    {
        $author = $this->em->getRepository('Yasoon\Site\Entity\AuthorEntity')->findOneByEmail($email);
        
        if($hash == md5($author->getNewpass()))
        {
            $authorId = $author->getId();
            $author->setPassword(md5($author->getNewpass()));
            $author->setNewpass(NULL);
            
            $author = $this->em->merge($author);
            $this->em->flush();
            
            // Сразу авторизуем чела
            $token = new UsernamePasswordToken((string) $author->getId(), $author->getPassword(), "secured_area", ['ROLE_USER']);
    
            $this->securityContext->setToken($token);
    
            /** @var Session $session */
            $session = $this->container->get('request')->getSession();
            $session->set('_security_secured_area', serialize($token));
            $this->container->get('request')->setSession($session);

//            $statEntity = new AuthorChangedPassEntity();
//            $statEntity->setAuthorId($authorId);
//            $statEntity->setLastDate(new \DateTime());
//            
//            $this->em->persist($statEntity);
//            $this->em->flush();
    
            return true;
        }
        else
        {
            return false;
        }
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

    /**
     * @param array $ids
     * @return array
     */
    public function getAuthorsByIds($ids)
    {
        try {
            $data = [];
            if (count($ids) > 0) {
                $authors = $this->em->createQueryBuilder()
                    ->select('a')
                    ->from('Yasoon\Site\Entity\AuthorEntity', 'a')
                    ->where('a.id IN('.implode(',', array_keys($ids)).')')
                    ->getQuery()->getResult();

                $adata = [];
                foreach($authors as $author)
                {
                    $adata[] = ['id' => $author->getId(),
                        'name' => $author->getName(),
                        'avatarImg' => $author->getImg(),
                        'last_publish_date' => $author->getPublicationDate()->format('d/m/Y'),
                        'interviewCaption' => $author->getInterviewCaption(),
                        'likes_count' => $ids[$author->getId()]['likes'],
                        'posts_count' => $ids[$author->getId()]['posts'],
                        'email' => $author->getEmail()];
                }
                //print_r($ids);

                uasort($adata, function($a, $b) {
                    if($a['likes_count'] == $b['likes_count']){
                        return 0;
                    }
                    if($a['likes_count'] > $b['likes_count']){
                        return -1;
                    }
                    return 1;
                });

                foreach($adata as $ad)
                {
                    $data[] = $ad;
                }
            }
        } catch(\Exception $e) {
            return ['error' => true, 'errorText' => $e->getMessage()];
        }
        return $data;
    }
    
    /**
     * @param array $ids
     * @return array
     */
    public function getAuthorsInfoByIds($ids)
    {
        $result = [];
        
        $authors = $this->em->createQueryBuilder()
            ->select('a')
            ->from('Yasoon\Site\Entity\AuthorEntity', 'a')
            ->where('a.id IN('.implode(',', $ids).')')
            ->getQuery()->getResult();
        $adata = [];
        $last_date = 0;
        foreach($authors as $author)
        {
            $posts = $this->em->getRepository('Yasoon\Site\Entity\PostEntity')->createQueryBuilder('p')
                ->leftJoin('p.author', 'a')
                ->where('a.id = '.$author->getId())
                ->orderBy('p.date', 'desc')->getQuery()->getResult();
            $aposts = [];
            $i = 0;
            foreach($posts as $post)
            {
                if($i == 0)
                {
                    $last_date = $post->getDate();
                }
                $aposts[] = $post->getId();
                $i++;
            }
            
            $aquestions = [];
            $questions = $this->em->getRepository('Yasoon\Site\Entity\QuestionEntity')->createQueryBuilder('q')
                ->leftJoin('q.author', 'a')
                ->where('a.id = '.$author->getId())
                ->orderBy('q.date', 'desc')->getQuery()->getResult();
            $aquestions = [];
            $answer_count = 0;
            foreach($questions as $question)
            {
                $aquestions[] = $question->getId();
                if($question->getAnswer() != '')
                {
                    $answer_count++;
                }
            }
            
            if(!is_object($last_date) || (isset($last_date) && $last_date->getTimestamp() < $author->getPublicationDate()->getTimestamp()))
            {
                $date = $author->getPublicationDate()->format('d/m/Y');
            }
            else
            {
                $date = $last_date->format('d/m/Y');
            }
            
            $friends = $this->em->getRepository('Yasoon\Site\Entity\FriendsEntity')->createQueryBuilder('f')
                ->where('f.readerId = '.$author->getId())
                ->getQuery()->getResult();
            $afriends = [];
            foreach($friends as $friend)
            {
                $afriends[] = $friend->getWriterId();
            }
            
            $adata[] = ['id' => $author->getId(),
                        'name' => $author->getName(),
                        'email' => $author->getEmail(),
                        'avatarImg' => $author->getImg(),
                        'interviewCaption' => $author->getInterviewCaption(),
                        'job' => $author->getJob(),
                        'dream' => $author->getDream(),
                        'homepage' => $author->getHomepage(),
                        'posts' => $aposts,
                        'friends' => $afriends,
                        'answers' => $aquestions,
                        'last_publish_date' => $date,
                        'interest' => $author->getInterest(),
                        'answers_count' => $answer_count];
        }
        return $adata;
    }
    
    
    /**
     * @return array
     */
    public function get_all($page = 0, $items = 0)
    {
        try {
        $authors = $this->em->createQueryBuilder()
            ->select('a')
            ->from('Yasoon\Site\Entity\AuthorEntity', 'a');
            
        if($page != 0 && $items != 0)
        {
            $offset = ($page*$items)-$items;
            $authors->setMaxResults($items)
                ->setFirstResult($offset);
        }
            
        $authors = $authors->orderBy('a.publicationDate', 'desc')
            ->getQuery()->getResult();
            //echo count($authors);
            //die;
            
        $adata = [];
        foreach($authors as $author)
        {
            $story_count = count($author->getPosts());
            
            $answer_count = 0;
            $answers = $author->getQuestions();
            foreach($answers as $answer)
            {
                if($answer->getAnswer() != '')
                {
                    $answer_count++;
                }
            }
            
            switch($author->getRegFrom())
            {
                case 1:
                    $from = 'facebook';
                break;
                case 2:
                    $from = 'vkontakte';
                break;
                default: 
                    $from = 'email';
                break;
            }
            
            if($author->getDateChange() != null)
            {
                $lchange = $author->getDateChange()->format('Y-m-d H:i:s');
            }
            else{
                $lchange = '';
            }
            
            $adata[] = ['id' => $author->getId(),
                        'name' => $author->getName(),
                        'email' => $author->getEmail(),
                        'avatarImg' => $author->getImg(),
                        'date_reg' => $author->getPublicationDate()->format('Y-m-d H:i:s'),
                        'story_count' => $story_count,
                        'answer_count' => $answer_count,
                        'reg_from' => $from,
                        'roles' => $author->getRoles(),
                        'last_change' => $lchange];
        }
        return $adata;
        
        } catch(\Exception $e) {
            return ['error' => true, 'errorText' => $e->getMessage()];
        }
    }
    
    /**
     * @return array
     */
    public function get_all_subscribed()
    {
        try {
        $authors = $this->em->createQueryBuilder()
            ->select('a')
            ->from('Yasoon\Site\Entity\AuthorEntity', 'a')
            ->orderBy('a.publicationDate', 'desc')
            //->where('a.subscribed = 1')
            ->getQuery()->getResult();
            
        $adata = [];
        foreach($authors as $author)
        {
            $story_count = count($author->getPosts());
            
            $answer_count = 0;
            $answers = $author->getQuestions();
            foreach($answers as $answer)
            {
                if($answer->getAnswer() != '')
                {
                    $answer_count++;
                }
            }
            
            
            if($author->getDateChange() != null)
            {
                $lchange = $author->getDateChange()->format('Y-m-d H:i:s');
            }
            else{
                $lchange = '';
            }
            
            $reg_from = $author->getRegFrom();
            if($reg_from == 0)
                $reg_from = 'email';
            elseif($reg_from == 1)
                $reg_from = 'facebook';
            elseif($reg_from == 2)
                $reg_from = 'vkontakte';
            
            $posts = $author->getPosts();
            
            $adata[] = ['id' => $author->getId(),
                        'name' => $author->getName(),
                        'email' => $author->getEmail(),
                        'date_reg' => $author->getPublicationDate()->format('Y-m-d H:i:s'),
                        'reg_from' => $reg_from,
                        'last_change' => $lchange,
                        'subscribed' => $author->getSubscribed(),
                        'post_count' => count($posts),
                        'answers_count' => $answer_count];
        }
        return $adata;
        
        } catch(\Exception $e) {
            return ['error' => true, 'errorText' => $e->getMessage()];
        }
    }
    
    
    /**
     * @return array
     */
    public function get_all_admins()
    {
        try {
        $authors = $this->em->createQueryBuilder()
            ->select('a')
            ->from('Yasoon\Site\Entity\AuthorEntity', 'a')
            ->orderBy('a.publicationDate', 'desc')
            ->where('a.role = 4')
            ->getQuery()->getResult();
            
        $adata = [];
        foreach($authors as $author)
        {
            $story_count = count($author->getPosts());
            
            $answer_count = 0;
            $answers = $author->getQuestions();
            foreach($answers as $answer)
            {
                if($answer->getAnswer() != '')
                {
                    $answer_count++;
                }
            }
            
            
            if($author->getDateChange() != null)
            {
                $lchange = $author->getDateChange()->format('Y-m-d H:i:s');
            }
            else{
                $lchange = '';
            }
            
            $adata[] = ['id' => $author->getId(),
                        'name' => $author->getName(),
                        'email' => $author->getEmail(),
                        'date_reg' => $author->getPublicationDate()->format('Y-m-d H:i:s'),
                        'last_change' => $lchange];
        }
        return $adata;
        
        } catch(\Exception $e) {
            return ['error' => true, 'errorText' => $e->getMessage()];
        }
    }
    
    
    /**
     * @return array
     */
    public function deleteUser($id)
    {
        $delete_data = ['author_changed_pass' => 0,
                        'friends_readers' => 0,
                        'friends_writers' => 0,
                        'post_answer' => 0,
                        'post' => 0,
                        'post_likes' => 0,
                        'story_of_the_day' => 0,
                        'timeline' => 0,
                        'questions_author' => 0,
                        'questions_askauthor' => 0,
                        'author' => 0,
                        'post_category' => 0];
        $id = (int)$id;
        
        try {
            $user = $this->em->getRepository('Yasoon\Site\Entity\AuthorEntity')->find($id);
            if($user)
            {
                /** Пользователи сменившие пароль **/
                $tbl_changed_pass = $this->em->getRepository('Yasoon\Site\Entity\AuthorChangedPassEntity')->findByAuthorId($id);
                foreach($tbl_changed_pass as $tcp)
                {
                    $this->em->remove($tcp);
                    //$this->em->flush();
                    $delete_data['author_changed_pass']++;
                }
                
                /** Подписчики **/
                $tbl_friends_readers = $this->em->getRepository('Yasoon\Site\Entity\FriendsEntity')->findByWriterId($id);
                foreach($tbl_friends_readers as $tfr)
                {
                    $this->em->remove($tfr);
                    //$this->em->flush();
                    $delete_data['friends_readers']++;
                }
                
                /** Читатели **/
                $tbl_friends_writers = $this->em->getRepository('Yasoon\Site\Entity\FriendsEntity')->findByReaderId($id);
                foreach($tbl_friends_writers as $tfw)
                {
                    $this->em->remove($tfw);
                    //$this->em->flush();
                    $delete_data['friends_writers']++;
                }
                
                /** Посты **/
                $tbl_posts = $this->em->getRepository('Yasoon\Site\Entity\PostEntity')->findByAuthorId($id);
                foreach($tbl_posts as $tp)
                {
                    /** Ответы на интервью **/
                    $answer = $tp->getAnswer();
                    foreach($answer as $ans)
                    {
                        $this->em->remove($ans);
                        //$this->em->flush();
                        $delete_data['post_answer']++;
                    }
                    /** Категории постов **/
                    $category = $tp->getCategory();
                    foreach($category as $cat)
                    {
                        $this->em->remove($cat);
                        //$this->em->flush();
                        $delete_data['post_category']++;
                    }
                    
                    /** Лайки постов **/
                    $likes = $this->em->getRepository('Yasoon\Site\Entity\PostLikesEntity')->findBy(array('post_id' => $id));
                    foreach($likes as $like)
                    {
                        $this->em->remove($like);
                        //$this->em->flush();
                        $delete_data['post_likes']++;
                    }
                    
                    /** Истории дня **/
                    $story_day = $this->em->getRepository('Yasoon\Site\Entity\PostOfTheDayEntity')->findBy(array('postId' => $id));
                    foreach($story_day as $sd)
                    {
                        $this->em->remove($sd);
                        //$this->em->flush();
                        $delete_data['story_of_the_day']++;
                    }
                    $this->em->remove($tp);
                    //$this->em->flush();
                    $delete_data['post']++;
                }
                /** Лента новостей **/
                $timeline =  $this->em->createQueryBuilder()
                    ->select('t')
                    ->from('Yasoon\Site\Entity\TimelineEntity', 't')
                    ->where('t.author_id = :aid')
                    ->setParameter('aid', $id)
                    ->getQuery()->getResult();
                if (count($timeline) > 0 || is_object($timeline[0]))
                {
                    $this->em->remove($timeline[0]);
                    //$this->em->flush();
                    $delete_data['timeline']++;
                }
                
                /** Вопросы автора **/
                $tbl_questions_author = $this->em->getRepository('Yasoon\Site\Entity\QuestionEntity')->findBy(array('authorId' => $id));
                foreach($tbl_questions_author as $tq)
                {
                    $this->em->remove($tq);
                    //$this->em->flush();
                    $delete_data['questions_author']++;
                }
                
                /** Вопросы автора **/
                $tbl_questions_askauthor = $this->em->getRepository('Yasoon\Site\Entity\QuestionEntity')->findBy(array('ask_authorId' => $id));
                foreach($tbl_questions_askauthor as $tqa)
                {
                    $this->em->remove($tqa);
                    //$this->em->flush();
                    $delete_data['questions_askauthor']++;
                }
                if(is_file($_SERVER['DOCUMENT_ROOT'].'/upload/avatar/'.$user->getImg()))
                {
                    unlink($_SERVER['DOCUMENT_ROOT'].'/upload/avatar/'.$user->getImg());
                }
                $this->em->remove($user);
                $this->em->flush();
                $delete_data['author']++;
            }
            else
            {
                return ['error' => true, 'errorText' => 'not found'];
            }
        } catch(\Exception $e) {
            return ['error' => true, 'errorText' => $e->getMessage()];
        }
        return $delete_data;
    }
    
    /**
     * @param $id
     * @return array
     */
    public function set_admin($id)
    {
        try {
            /** @var AuthorEntity $entity */
            $entity = $this->em->getRepository('Yasoon\Site\Entity\AuthorEntity')
                ->find($id);
            
            if($entity->getRole() == 4)
            {
                $entity->setRole(1);
                $oper = 'unset';
            }
            else
            {
                $entity->setRole(4);
                $oper = 'set';
            }
        
            $this->em->merge($entity);
            $this->em->flush();
            
            return ['authorData' => true, 'oper' => $oper];
        } catch(\Exception $e) {
            return ['authorData' => false, 'message' => $e->getMessage()];
        }
    }

    /**
     * @param $post
     * @return array
     */
    public function save($post) {
        if (isset($post['id'])) {
            $author = $this->em->getRepository('Yasoon\Site\Entity\AuthorEntity')->find($post['id']);
            isset($post['name'])?$author->setName($post['name']):$author->setName($author->getName());
            isset($post['email'])?$author->setEmail($post['email']):$author->setEmail($author->getEmail());
            isset($post['description'])?$author->setDescription($post['description']):$author->setDescription($author->getDescription());
            isset($post['job'])?$author->setJob($post['job']):$author->setJob($author->getJob());
            isset($post['dream'])?$author->setDream($post['dream']):$author->setDream($author->getDream());
            isset($post['password'])?$author->setPassword(md5($post['password'])):$author->setPassword($author->getPassword());
            isset($post['interest'])?$author->setInterest($post['interest']):$author->setInterest($author->getInterest());
            $this->em->flush();
        } else {
            $author = new AuthorEntity();
            $author->setName($post['name']);
            $author->setEmail($post['email']);
            $author->setDescription($post['description']);
            $author->setJob($post['job']);
            $author->setDream($post['dream']);
            $author->setPassword(md5($post['password']));
            $author->setInterest($post['interest']);
            isset($post['role'])?$author->setRole($post['role']):$author->setRole(1);
            $this->em->persist($author);
            $this->em->flush();
        }
    }
}