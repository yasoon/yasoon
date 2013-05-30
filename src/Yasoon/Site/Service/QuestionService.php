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


//        /** @var $postEntity PostEntity */
//        $entity = (new QuestionEntity())
//            ->setText($model['text'])
//            ->setDate(new \DateTime())
//            ->setIsInBlank(false);
//
//        $entity->setPost($this->em->getReference('Yasoon\Site\Entity\PostEntity', $model['authorId']));
//
//        $entity->setAuthor($this->em->getReference('Yasoon\Site\Entity\AuthorEntity', $model['authorId']));
//
//        $this->em->persist($entity);
//        $this->em->flush();

        $result = [
            'id'       => $postEntity->getId(),
            'text'     => $postEntity->getText(),
            'authorId' => $postEntity->getAuthorId()
        ];

        return $result;

    }

    /**
     * @param array $model
     */
    public function update(array $model) {
        $post = $this->em->getRepository('Yasoon\Site\Entity\PostEntity')->find($model['id']);

        $post->setCaption($model['caption'])
            ->setPreview($model['preview'])
            ->setText($model['text']);

        $this->em->merge($post);
        $this->em->flush();

        $result = [
            'id'       => $post->getId(),
            'caption'  => $post->getCaption(),
            'preview'  => $post->getPreview(),
            'text'     => $post->getText(),
            'authorId' => $post->getAuthorId(),
            'date'     => $post->getDate()->format('Y-m-d H:i')
        ];

        return $result;

    }

    /**
     * @param array $model
     */
    public function delete(array $model) {
        $post = $this->em->getRepository('Yasoon\Site\Entity\PostEntity')->find($model['id']);

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
                'text'       => $question->getText(),
                'answerText' => $question->getAnswer()->getText()
            ];
        }

        return $result;
    }


}