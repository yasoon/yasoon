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

    /**
     * @param int $authorId
     * @return array
     */
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

        return $result;
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
    }

}