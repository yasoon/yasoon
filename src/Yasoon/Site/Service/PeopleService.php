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
 * @DI\Service("yasoon.service.people")
 */
class PeopleService extends AbstractApiService {

    /**
     * @param int $categoryId
     * @return array
     */
    public function getAuthors($categoryId = 0) {

        $qb = $this->em->createQueryBuilder()
            ->select('post.preview, author.name, author.id as authorId, post.likes')
            ->from('Yasoon\Site\Entity\PostEntity', 'post')
            ->join('post.author', 'author');

        if ($categoryId) {
            $qb->where("post.categoryId = $categoryId");
        }

        $rows = $qb->getQuery()->getResult();

        $authors = [
        ];

        foreach ($rows as $row) {
            if (!isset($authors[$row['authorId']])) {
                $authors[$row['authorId']] = [
                    'topPostLikes'   => $row['likes'],
                    'topPostPreview' => $row['preview'],
                    'name'           => $row['name'],
                    'likes'          => $row['likes'],
                    'posts'          => 1
                ];
            } else {
                $authors[$row['authorId']]['likes'] += $row['likes'];
                $authors[$row['authorId']]['posts']++;
                if ($authors[$row['authorId']]['topPostLikes']   < $row['likes']) {
                    $authors[$row['authorId']]['topPostLikes']   = $row['likes'];
                    $authors[$row['authorId']]['topPostPreview'] = $row['preview'];
                }
            }
        }

        $result = [];
        foreach ($authors as $id => $author) {
            $result[] = array_merge($author, ['id' => $id]);
        }

        return $result;
    }



}