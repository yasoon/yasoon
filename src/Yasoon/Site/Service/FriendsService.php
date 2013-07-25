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
    public function getTimeline($offet, $limit) {
        $result = [];

        $posts = $this->em->createQueryBuilder()
            ->select("'post' as type, post.id, post.caption, post.preview, post.date, author.id as authorId, author.name as authorName, author.img as authorImg")
            ->from('Yasoon\Site\Entity\AuthorEntity', 'author')
            ->join('author.friends', 'friends')
            ->join('friends.posts', 'post')
            ->orderBy('post.date', 'DESC')
            ->andWhere("author.id = $this->clientId")
            ->setFirstResult($offet)
            ->setMaxResults($limit)
            ->getQuery()->getResult();

        $questions = $this->em->createQueryBuilder()
            ->select("'question' as type, question.id, question.caption, question.answer, question.date, author.id as authorId, author.name as authorName, author.img as authorImg")
            ->from('Yasoon\Site\Entity\AuthorEntity', 'author')
            ->join('author.friends', 'friends')
            ->join('friends.questions', 'question')
            ->where('question.isInBlank = 0')
            ->andWhere('question.answer IS NOT NULL')
            ->andWhere("author.id = $this->clientId")
            ->orderBy('question.date', 'DESC')
            ->setFirstResult($offet)
            ->setMaxResults($limit)
            ->getQuery()->getResult();

        $blank = $this->em->createQueryBuilder()
            ->select("'blank' as type, question.answer, question.date, author.id as authorId, author.name as authorName, author.img as authorImg")
            ->from('Yasoon\Site\Entity\AuthorEntity', 'author')
            ->join('author.friends', 'friends')
            ->join('friends.questions', 'question')
            ->where('question.isInBlank = 1')
            ->andWhere("author.id = $this->clientId")
            ->orderBy('question.date', 'DESC')
            ->setFirstResult($offet)
            ->setMaxResults(1)
            ->getQuery()->getResult();

        $timeline = array_merge($posts, $questions, $blank);
        usort($timeline, function($a, $b) {
            return $a['date'] > $b['date'] ? 0 : 1;
        });

        $timelineSize = count($timeline);
        for ($i = 0; $i < $limit && $i < $timelineSize; $i++) {

            $line = $timeline[$i];
            $result[] = [
                'id'         => isset($line['id']) ? $line['id'] : 'blank',
                'caption'    => isset($line['caption']) ? $line['caption']  : 'Интервью',
                'text'       => isset($line['preview'])    ? $line['preview']     : $line['answer'],
                'authorName' => $line['authorName'],
                'authorId'   => $line['authorId'],
                'authorImg'  => $line['authorImg'],
                'type'       => $line['type'],
                'date'       => $line['date']->format('d/m/Y')
            ];
        }

        return $result;
    }



}