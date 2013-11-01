<?php
/**
 * Author: Fedor Avetisov <cousenavi@gmail.com>
 * Date: 5/26/13
 */

namespace Yasoon\Site\Service;

use JMS\DiExtraBundle\Annotation as DI;
use Symfony\Component\Security\Core\Exception\AccessDeniedException;
use Yasoon\Site\Entity\AuthorEntity;
use Yasoon\Site\Entity\PostEntity;
use Yasoon\Site\Entity\QuestionEntity;

/**
 * @DI\Service("yasoon.service.question")
 */
class QuestionService extends AbstractApiService {

    /**
     * @var \Symfony\Component\Security\Core\SecurityContextInterface
     *
     * @DI\Inject("security.context")
     */
    public  $securityContext;

    /**
     * @param array $model
     * @return array
     */
    public function add(array $model) {

        $authorId = (int) $this->securityContext->getToken()->getUsername();

        $place =$this->em->getConnection()
            ->executeQuery("select max(place) as place from question where author_id = $authorId and is_in_blank=0")
            ->fetch()['place'];

        $entity = (new QuestionEntity())
            ->setCaption($model['caption'])
            ->setDate(new \DateTime())
            ->setIsInBlank(false)
            ->setAuthorId($model['authorId'])
            ->setPlace(++$place);

        $entity->setAuthor($this->em->getReference('Yasoon\Site\Entity\AuthorEntity', $authorId));

        $this->em->persist($entity);
        $this->em->flush();

        $result = [
            'id'       => $entity->getId(),
            'caption'  => $entity->getCaption(),
            'date'     => $entity->getDate()->format('d/m/Y'),
            'authorId' => $entity->getAuthorId(),
            'answer'   => ''
        ];

        return $result;

    }

    /**
     * @param $model
     * @return array
     */
    public function setInterviewCaption($model)
    {
        $authorId = (int) $this->securityContext->getToken()->getUsername();

        /** @var AuthorEntity  $entity */
        $entity = $this->em->getRepository('Yasoon\Site\Entity\AuthorEntity')->find($authorId);

        $entity->setInterviewCaption($model['interviewCaption']);

        $this->em->merge($entity);
        $this->em->flush();

        return [
          'authorId' => $entity->getId(),
          'interviewCaption' => $entity->getInterviewCaption()
        ];
    }

    /**
     * @param array $model
     * @return array
     */
    public function addInterview(array $model) {

        $authorId = (int) $this->securityContext->getToken()->getUsername();

        $place =$this->em->getConnection()
            ->executeQuery("select max(place) as place from question where author_id = $this->clientId and is_in_blank=1")
            ->fetch()['place'];

        $entity = (new QuestionEntity())
            ->setCaption($model['caption'])
            ->setAnswer(isset($model['answer'])? $model['answer'] : '')
            ->setDate(new \DateTime())
            ->setIsInBlank(true)
            ->setAuthorId($this->clientId)
            ->setPlace($place);

        $entity->setAuthor($this->em->getReference('Yasoon\Site\Entity\AuthorEntity', $authorId));

        $this->em->persist($entity);
        $this->em->flush();

        $result = [
            'id'       => $entity->getId(),
            'caption'  => $entity->getCaption(),
            'date'     => $entity->getDate()->format('d/m/Y'),
            'authorId' => $entity->getAuthorId(),
            'answer'   => $entity->getAnswer(),
            'place'    => $entity->getPlace()
        ];

        return $result;

    }

    /**
     * @param array $model
     * @return array
     */
    public function update(array $model) {

        $authorId = (int) $this->securityContext->getToken()->getUsername();

        /** @var QuestionEntity $entity */
        $entity = $this->em->getRepository('Yasoon\Site\Entity\QuestionEntity')->find($model['id']);

        if ($entity->getAuthorId() != $authorId) {
            throw new AccessDeniedException();
        }

        $entity->setCaption($model['caption'])
            ->setAnswer($model['answer']);

        $this->em->merge($entity);
        $this->em->flush();

        $result = [
            'id'       => $entity->getId(),
            'caption'  => $entity->getCaption(),
            'answer'   => $entity->getAnswer(),
            'authorId' => $entity->getAuthorId(),
            'date'     => $entity->getDate()->format('d/m/Y'),
        ];

        return $result;

    }

    /**
     * @param array $model
     * @throws \Symfony\Component\Security\Core\Exception\AccessDeniedException
     */
    public function delete(array $model) {
        $authorId = (int) $this->securityContext->getToken()->getUsername();

        /** @var QuestionEntity $question */
        $question = $this->em->getRepository('Yasoon\Site\Entity\QuestionEntity')->find($model['id']);

        if ($question->getAuthorId() != $authorId) {
            throw new AccessDeniedException();
        }

        $this->em->remove($question);
        $this->em->flush();
    }

    /**
     * @param $postId
     * @return array
     */
    public function getPost($postId) {

        /** @var PostEntity $post */
        $post = $this->em->getRepository('Yasoon\Site\Entity\PostEntity')->find($postId);
        $result = [
            'id'      => $post->getId(),
            'caption' => $post->getCaption(),
            'authorId'=> $post->getAuthorId(),
            'preview' => $post->getPreview(),
            'text'    => $post->getText(),
            'date'    => $post->getDate()->format('d/m/Y'),
        ];

        $access = $this->getAccessLevel($post->getAuthorId());

        return ['access' => $access, 'data' => $result];
    }

    public function getQuestions($postId) {

        $result = [];

        /** @var QuestionEntity[] $questions */
        $questions = $this->em->createQueryBuilder()
            ->select('question, answer')
            ->from('Yasoon\Site\Entity\QuestionEntity', 'question')
            ->join('question.answer', 'answer')
            ->where("question.postId = $postId")
            ->getQuery()->getResult();


        foreach ($questions as $question) {
            $result[] = [
                'id'         => $question->getId(),
                'text'       => $question->getCaption(),
                'answerText' => $question->getAnswer()->getText()
            ];
        }

        return $result;
    }


}