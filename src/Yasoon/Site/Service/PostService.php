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
 * @DI\Service("yasoon.service.post")
 */
class PostService extends AbstractApiService {

    /**
     * @param array $model
     * @return array
     */
    public function add(array $model) {
        /** @var $postEntity PostEntity */
        $postEntity = (new PostEntity())
            ->setCaption($model['caption'])
            ->setPreview($model['preview'])
            ->setText($model['text'])
            ->setAuthorId($model['authorId'])
            ->setDate(new \DateTime());

        $postEntity->setAuthor($this->em->getReference('Yasoon\Site\Entity\AuthorEntity', $model['authorId']));

        $this->em->persist($postEntity);
        $this->em->flush();

        $result = [
            'id'       => $postEntity->getId(),
            'caption'  => $postEntity->getCaption(),
            'preview'  => $postEntity->getPreview(),
            'text'     => $postEntity->getText(),
            'authorId' => $postEntity->getAuthorId(),
            'date'     => $postEntity->getDate()->format('Y-m-d H:i')
        ];

        return $result;

    }

    /**
     * @param array $model
     */
    public function update(array $model) {
        $entity = (new PostEntity())
            ->setId($model['id'])
            ->setPreview($model['preview'])
            ->setText($model['text'])
            ->setAuthor($model['authorId']);

        parent::updateEntity($entity);
    }

    /**
     * @param array $model
     */
    public function delete(array $model) {
        $entity = (new PostEntity())
            ->setId($model['id']);
        parent::deleteEntity($entity);
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
                'text'       => $question->getText(),
                'answerText' => $question->getAnswer()->getText()
            ];
        }

        return $result;
    }


}