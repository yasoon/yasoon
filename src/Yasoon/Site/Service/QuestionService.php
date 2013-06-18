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
        $entity = (new QuestionEntity())
            ->setCaption($model['caption'])
            ->setDate(new \DateTime())
            ->setIsInBlank(false);

        $entity->setAuthor($this->em->getReference('Yasoon\Site\Entity\AuthorEntity', $model['authorId']));

        $this->em->persist($entity);
        $this->em->flush();

        $result = [
            'id'       => $entity->getId(),
            'caption'  => $entity->getCaption(),
            'date'     => $entity->getDate()->format('Y-m-d'),
            'authorId' => $entity->getAuthorId(),
            'answer'   => ''
        ];

        return $result;

    }

    /**
     * @param array $model
     * @return array
     */
    public function addInterview(array $model) {
        $entity = (new QuestionEntity())
            ->setCaption($model['caption'])
            ->setAnswer(isset($model['answer'])? $model['answer'] : '')
            ->setDate(new \DateTime())
            ->setIsInBlank(true);

        $entity->setAuthor($this->em->getReference('Yasoon\Site\Entity\AuthorEntity', $this->clientId));

        $this->em->persist($entity);
        $this->em->flush();

        $result = [
            'id'       => $entity->getId(),
            'caption'  => $entity->getCaption(),
            'date'     => $entity->getDate()->format('Y-m-d'),
            'authorId' => $entity->getAuthorId(),
            'answer'   => $entity->getAnswer()
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
            'date'     => $entity->getDate()->format('Y-m-d')
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
            'date'    => $post->getDate()->format('Y-m-d')
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