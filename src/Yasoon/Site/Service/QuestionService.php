<?php
/**
 * Author: Fedor Avetisov <cousenavi@gmail.com>
 * Date: 5/26/13
 */

namespace Yasoon\Site\Service;

use JMS\DiExtraBundle\Annotation as DI;
use Yasoon\Site\Entity\AuthorEntity;
use Yasoon\Site\Entity\PostEntity;
use Yasoon\Site\Entity\QuestionEntity;

/**
 * @DI\Service("yasoon.service.question")
 */
class QuestionService extends AbstractApiService {


    /**
     * @param array $model
     * @return array
     */
    public function add(array $model) {

        $authorId = $model['authorId'];

        $place =$this->em->getConnection()
            ->executeQuery("select max(place) as place from question where author_id = $authorId and is_in_blank=0")
            ->fetch()['place'];

        $entity = (new QuestionEntity())
            ->setCaption($model['caption'])
            ->setDate(new \DateTime())
            ->setIsInBlank(false)
            ->setAuthorId($model['authorId'])
            ->setPlace(++$place);

        $entity->setAuthor($this->em->getReference('Yasoon\Site\Entity\AuthorEntity', $model['authorId']));

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
        /** @var AuthorEntity  $entity */
        $entity = $this->em->getRepository('Yasoon\Site\Entity\AuthorEntity')->find($model['authorId']);

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

        $entity->setAuthor($this->em->getReference('Yasoon\Site\Entity\AuthorEntity', $this->clientId));

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

        /** @var QuestionEntity $entity */
        $entity = $this->em->getRepository('Yasoon\Site\Entity\QuestionEntity')->find($model['id']);

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
     */
    public function delete(array $model) {
        $post = $this->em->getRepository('Yasoon\Site\Entity\QuestionEntity')->find($model['id']);

        $this->em->remove($post);
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

        return $result;
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