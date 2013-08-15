<?php
/**
 * Author: Fedor Avetisov <cousenavi@gmail.com>
 * Date: 5/22/13
 */

namespace Yasoon\Site\Service;
use Doctrine\ORM\AbstractQuery;
use Symfony\Component\Security\Core\Exception\InsufficientAuthenticationException;
use JMS\DiExtraBundle\Annotation as DI;

/**
 * @DI\Service("yasoon.service.friends")
 */
class FriendsService extends AbstractApiService {

    //@TODO!! ЗАКРЫТЬ ВСЕ МЕТОДЫ АВТОРИЗАЦИЕЙ!!!

    /**
     * @param $writerId
     * @return array
     */
    public function addFriend($writerId) {

        $writerId = (int)$writerId;

        $ids = $this->em->createQueryBuilder()
            ->select('friends.id')
            ->from('Yasoon\Site\Entity\AuthorEntity', 'author')
            ->leftJoin('author.friends', 'friends')
            ->where("author.id = $this->clientId")
            ->getQuery()->getResult();

        foreach ($ids as $arr) {
            if ($arr['id'] == $writerId) {
                return ['ok' => 'ok'];
            }
        }

        $sql = "INSERT INTO friends (reader_id, writer_id) VALUES({$this->clientId}, $writerId)";

        $this->em->getConnection()->executeQuery($sql);

        return ['ok' => 'ok'];
    }

    /**
     * @param $writerId
     * @return array
     */
    public function deleteFriend($writerId) {

        $writerId = (int)$writerId;

        $sql = "DELETE FROM friends WHERE reader_id = {$this->clientId} AND writer_id = {$writerId}";

        $this->em->getConnection()->executeQuery($sql);

        return ['ok' => 'ok'];
    }

    /**
     * @return array
     */
    public function getTimelineStack($offset = 0) {

        $limit = 200;
        $returnLimit = 50;

        $posts = $this->em->createQueryBuilder()
            ->select("'p' as type, post.id, post.date")
            ->from('Yasoon\Site\Entity\AuthorEntity', 'author')
            ->join('author.friends', 'friends')
            ->join('friends.posts', 'post')
            ->orderBy('post.date', 'DESC')
            ->andWhere("author.id = $this->clientId")
            ->setMaxResults($limit)
            ->getQuery()->getResult();

        $questions = $this->em->createQueryBuilder()
            ->select("'q' as type, question.id, question.date")
            ->from('Yasoon\Site\Entity\AuthorEntity', 'author')
            ->join('author.friends', 'friends')
            ->join('friends.questions', 'question')
            ->where('question.isInBlank = 0')
            ->andWhere('question.answer IS NOT NULL')
            ->andWhere("author.id = $this->clientId")
            ->orderBy('question.date', 'DESC')
            ->setMaxResults($limit)
            ->getQuery()->getResult();

        $blank = $this->em->createQueryBuilder()
            ->select("'b' as type, author.id, question.date")
            ->from('Yasoon\Site\Entity\AuthorEntity', 'author')
            ->join('author.friends', 'friends')
            ->join('friends.questions', 'question')
            ->where('question.isInBlank = 1')
            ->andWhere("author.id = $this->clientId")
            ->orderBy('question.date', 'DESC')
            ->setMaxResults($limit)
            ->getQuery()->getResult();

        $blanks = [];
        foreach ($blank as $key => $question) {
            if (in_array($question['id'], $blanks)) {
                unset($blank[$key]);
            }
            $blanks[] = $question['id'];
        }

        $timeline = array_merge($posts, $questions, $blank);
        usort($timeline, function($a, $b) {
            return $a['date'] > $b['date'] ? 0 : 1;
        });

        $result = [];
        for ($i = $offset; $i < $offset + $returnLimit; $i++) {
            if (isset($timeline[$i])) {
                $result[] = $timeline[$i]['type'].$timeline[$i]['id'];
            }
        }
        return $result;
    }

    /**
     * @return array
     */
    public function getTimeline($map=array()) {

        $result = [];

        $postsMap = [];
        $questionsMap = [];
        $blanksMap = [];

        foreach ($map as $entry) {
            if (strpos($entry, 'p') === 0) {
                $postsMap[] = substr($entry, 1);
            } else if (strpos($entry, 'q') === 0) {
                $questionsMap[] = substr($entry, 1);
            } else if (strpos($entry, 'b') === 0) {
                $blanksMap[] = substr($entry,1);
            }
        }

        $posts = [];
        $questions = [];
        $blanks = [];


        if (!empty($postsMap)) {
            $qb  = $this->em->createQueryBuilder();
            $posts = $qb->select("'p' as type, post.id, post.caption, post.preview as text, post.date,
                author.id as authorId, author.name as authorName, author.img as authorImg")
                ->from('Yasoon\Site\Entity\PostEntity', 'post')
                ->join('post.author', 'author')
                ->where($qb->expr()->in('post.id', $postsMap))
                ->getQuery()->getResult();
        }

        if (!empty($questionsMap)) {
            $qb  = $this->em->createQueryBuilder();
            $questions = $qb->select("'q' as type, question.id, question.caption, question.answer as text, question.date,
                author.id as authorId, author.name as authorName, author.img as authorImg")
                ->from('Yasoon\Site\Entity\QuestionEntity', 'question')
                ->join('question.author', 'author')
                ->where($qb->expr()->in('question.id', $questionsMap))
                ->getQuery()->getResult();
        }

        if (!empty($blanksMap)) {
            $qb = $this->em->createQueryBuilder();
            $blanks = $qb->select("'b' as type, author.id as authorId,author.id as id, author.interviewCaption as caption,
            'Вопросы, составленные по интервью' as text, author.name as authorName, author.img as authorImg, max(questions.date) as date")
                ->from('Yasoon\Site\Entity\AuthorEntity', 'author')
                ->join('author.questions', 'questions')
                ->andWhere($qb->expr()->in('author.id', $blanksMap))
                ->andWhere('questions.isInBlank = 1')
                ->getQuery()->getResult();
            foreach ($blanks as $key => $blank) {
                $blanks[$key]['date'] = new \DateTime($blank['date']);
            }
        }

        $entries = array_merge($posts, $questions, $blanks);
        if (!$entries) {
            return [];
        }
        foreach ($entries as $entry) {
            $result[array_search($entry['type'].$entry['id'], $map)] = [
                'id' => $entry['id'],
                'caption'=> $entry['caption'],
                'text' => $entry['text'],
                'authorName' => $entry['authorName'],
                'authorId'   => $entry['authorId'],
                'authorImg'  => $entry['authorImg'],
                'type'       => $entry['type'],
                'date'       => $entry['date']->format('d/m/Y')
            ];
        }
        return $result;
    }

    public function getAdminTimelineStack($offset = 0) {
        $limit = 200;
        $returnLimit = 50;

        $qb  = $this->em->createQueryBuilder();
        $posts = $qb->select("'p' as type, post.id, post.caption, post.preview as text, post.date,
                author.id as authorId, author.name as authorName, author.img as authorImg")
            ->from('Yasoon\Site\Entity\PostEntity', 'post')
            ->join('post.author', 'author')
            ->orderBy('post.date', 'DESC')
            ->setMaxResults($limit)
            ->getQuery()->getResult();

        $qb  = $this->em->createQueryBuilder();
        $questions = $qb->select("'q' as type, question.id, question.caption, question.answer as text, question.date,
                author.id as authorId, author.name as authorName, author.img as authorImg")
            ->from('Yasoon\Site\Entity\QuestionEntity', 'question')
            ->join('question.author', 'author')
            ->orderBy('question.date', 'DESC')
            ->setMaxResults($limit)
            ->andWhere('question.isInBlank = 0')
            ->getQuery()->getResult();

        $qb  = $this->em->createQueryBuilder();
        $blanks = $qb->select("'q' as type, question.id, question.caption, question.answer as text, question.date,
                author.id as authorId, author.name as authorName, author.img as authorImg")
            ->from('Yasoon\Site\Entity\QuestionEntity', 'question')
            ->join('question.author', 'author')
            ->orderBy('question.date', 'DESC')
            ->setMaxResults($limit)
            ->andWhere('question.isInBlank = 1')
            ->getQuery()->getResult();


        foreach ($blanks as $key => $question) {
            if (in_array($question['id'], $blanks)) {
                unset($blanks[$key]);
            }
            $blanks[] = $question['id'];
        }

        $timeline = array_merge($posts, $questions, $blanks);
        usort($timeline, function($a, $b) {
            return $a['date'] > $b['date'] ? 0 : 1;
        });

        $result = [];
        for ($i = $offset; $i < $offset + $returnLimit; $i++) {
            if (isset($timeline[$i])) {
                $result[] = $timeline[$i]['type'].$timeline[$i]['id'];
            }
        }

        return $result;

    }


}