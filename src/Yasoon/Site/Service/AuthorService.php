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
            ->select('author.id, author.name, author.description, author.publicationDate,
            author.job, author.interest, author.dream, posts.id as postId, questions.id as questionId')
            ->from('Yasoon\Site\Entity\AuthorEntity', 'author')
            ->leftJoin('author.posts', 'posts')
            ->leftJoin('author.questions', 'questions', 'WITH', 'questions.answer IS NOT NULL')
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
            'publicationDate' => $data['publicationDate']->format('d/m/Y'),
            'job' => $data['job'],
            'interest' => $data['interest'],
            'dream' => $data['dream'],
            'posts'   => $data['postsCount'],
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
        $posts = $this->em->getRepository('Yasoon\Site\Entity\PostEntity')
            ->findBy(
                ['authorId' => $authorId],
                ['date' => 'DESC']
            );

        foreach ($posts as $post) {
            $result[] = [
                'id'      => $post->getId(),
                'caption' => $post->getCaption(),
                'preview' => $post->getPreview(),
                'date'    => $post->getDate()->format('d/m/Y'),
                'authorId'=> $post->getAuthorId()
            ];
        }

        $interviewQuestions= $this->em->createQueryBuilder()
            ->select('question')
            ->from('Yasoon\Site\Entity\QuestionEntity', 'question')
            ->where('question.isInBlank = 1')
            ->andWhere('question.answer IS NOT NULL')
            ->orderBy('question.date', 'desc')
            ->getQuery()->getResult();

        if (isset($interviewQuestions[0])) {
            array_unshift($result, [
              'id'      => 'blank',
              'caption' => 'Интервью',
              'preview' => 'Пост, составленный из ответов на вопросы интервью',
              'date'    => $interviewQuestions[0]->getDate()->format('d/m/Y'),
              'authorId'=> $post->getAuthorId()
            ]);
        }

        return $result;
    }

    /**
     * @param $authorId
     * @return array
     */
    public function getQuestions($authorId) {

        $result = [];

        $questions = $this->em->createQueryBuilder()
            ->select('question')
            ->from('Yasoon\Site\Entity\QuestionEntity', 'question')
            ->where("question.authorId = $authorId")
            ->andWhere('question.isInBlank = 0')
            ->orderBy('question.id', 'DESC')
            ->getQuery()->getResult();

        foreach ($questions as $question) {
            $result[] = [
              'id'  => $question->getId(),
              'caption' => $question->getCaption(),
              'date'    => $question->getDate()->format('d/m/Y'),
              'answer' => $question->getAnswer()
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
            ->select('question')
            ->from('Yasoon\Site\Entity\QuestionEntity', 'question')
            ->where('question.isInBlank = true')
            ->andWhere("question.authorId = $authorId")
            ->getQuery()->getResult();

        foreach ($questions as $question) {
            $result[] = [
                'id'     => $question->getId(),
                'caption'   => $question->getCaption(),
                'answer' => $question->getAnswer()
            ];
        }

        return $result;
    }


}