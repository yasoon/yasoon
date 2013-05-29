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
 * @DI\Service("yasoon.service.author")
 */
class AuthorService extends AbstractApiService {

    /**
     * @param array $model
     * @return int
     */
    public function add(array $model) {
        $entity = (new AuthorEntity())
            ->setName($model['name']);

        $this->addEntity($entity);

        return $entity->getId();
    }

    /**
     * @param array $model
     */
    public function update(array $model) {
        $entity = (new AuthorEntity())
            ->setId($model['id'])
            ->setName($model['name']);

        $this->updateEntity($entity);
    }

    /**
     * @param array $model
     */
    public function delete(array $model) {
        $entity = (new AuthorEntity())
            ->setId($model['id']);

        $this->deleteEntity($entity);
    }

    public function getShortInfo($authorId)
    {
        $data = $this->em->createQueryBuilder()
            ->select('author.name, count(posts) as postsCount, count(answers) as answersCount')
            ->from('Yasoon\Site\Entity\AuthorEntity', 'author')
            ->leftJoin('author.posts', 'posts')
            ->leftJoin('author.answers', 'answers')
            ->getQuery()->getSingleResult();

        $result = [
          'name' => $data['name'],
          'posts' => $data['postsCount'],
          'answers' => $data['answersCount']
        ];

        return $result;
    }

    /**
     * @param $authorId
     * @return array
     */
    public function getPosts($authorId) {

        $result= [];

        /** @var PostEntity[] $posts */
        $posts = $this->em->getRepository('Yasoon\Site\Entity\PostEntity')->findBy(['authorId' => $authorId]);
        foreach ($posts as $post) {
            $result[] = [
                'id'      => $post->getId(),
                'preview' => $post->getPreview(),
                'date'    => $post->getDate()
            ];
        }

        return $result;
    }

    /**
     * @param $authorId
     * @return array
     */
    public function getQuestions($authorId) {

        $result = [];

        /** @var QuestionEntity[] $questions */
        $questions = $this->em->getRepository('Yasoon\Site\Entity\QuestionEntity')
            ->findBy([
                'authorId' => $authorId,
                'postId'   => null,
                'isInBlank' => false
                ]);

        foreach ($questions as $question) {
            $result[] = [
              'id'  => $question->getId(),
              'text' => $question->getText()
            ];
        }

        return $result;
    }


    /**
     * @param $authorId
     * @return array
     */
    public function getBlank($authorId) {

        $result = [];

        /** @var QuestionEntity[] $questions */
        $questions= $this->em->createQueryBuilder()
            ->select('question, answer')
            ->from('Yasoon\Site\Entity\QuestionEntity', 'question')
            ->leftJoin('question.answer', 'answer')
            ->where('question.isInBlank = true')
            ->andWhere("question.authorId = $authorId")
            ->getQuety()->getResult();

        foreach ($questions as $question) {
            $qst = [
                'id'   => $question->getId(),
                'text' => $question->getText()
            ];
            $answer = ($answer = $question->getAnswer() === null) ? null : [
                'text' => $answer->getText()
            ];
            $result[] = ['question' => $qst, 'answer' => $answer];
        }

        return $result;
    }


}