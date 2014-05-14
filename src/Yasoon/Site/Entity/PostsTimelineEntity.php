<?php
/**
 * Author: Fedor Avetisov <cousenavi@gmail.com>
 * Date: 5/22/13
 */

namespace Yasoon\Site\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Author
 *
 * @ORM\Table(name="posts_timeline")
 * @ORM\Entity
 */
class PostsTimelineEntity
{
    /**
     * @var integer $id
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    protected $id;

    /**
     * @var int $authorId
     *
     * @ORM\Column(name="author_id", type="integer", nullable=false)
     */
    protected $authorId;

    /**
     * @var int $postId
     *
     * @ORM\Column(name="post_id", type="integer", nullable=false)
     */
    protected $postId;

    /**
     * @param $postId
     * @return $this
     */
    public function setPostId($postId)
    {
        $this->postId = $postId;
        return $this;
    }

    /**
     * @return \Yasoon\Site\Entity\AuthorEntity
     */
    public function getPostId()
    {
        return $this->postId;
    }

    /**
     * @param $authorId
     * @return $this
     */
    public function setAuthorId($authorId)
    {
        $this->authorId = $authorId;
        return $this;
    }

    /**
     * @return \Yasoon\Site\Entity\AuthorEntity
     */
    public function getAuthorId()
    {
        return $this->authorId;
    }


}