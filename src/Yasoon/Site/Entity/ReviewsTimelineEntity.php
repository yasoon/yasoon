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
 * @ORM\Table(name="reviews_timeline")
 * @ORM\Entity
 */
class ReviewsTimelineEntity
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
     * @ORM\Column(name="review_id", type="integer", nullable=false)
     */
    protected $reviewId;

    /**
     * @param $id
     * @return $this
     */
    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    /**
     * @return \Yasoon\Site\Entity\AuthorEntity
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @param $reviewId
     * @return $this
     */
    public function setReviewtId($reviewId)
    {
        $this->reviewId = $reviewId;
        return $this;
    }

    /**
     * @return \Yasoon\Site\Entity\AuthorEntity
     */
    public function getReviewId()
    {
        return $this->reviewId;
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