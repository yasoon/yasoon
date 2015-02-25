<?php
/**
 * Author: Mihail Parandiy <parandiy.mihail@gmail.com>
 * Date: 5/22/13
 */
namespace Yasoon\Site\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Author
 *
 * @ORM\Table(name="review_likes")
 * @ORM\Entity
 */
class ReviewLikesEntity
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
     * @var string $user_ip
     *
     * @ORM\Column(name="user_ip", type="string", nullable=false)
     */
    protected $user_ip;

    /**
     * @var int $post_id
     *
     * @ORM\Column(name="review_id", type="integer", nullable=false)
     */
    protected $review_id;



    /**
     * @var \DateTime $last_date
     *
     * @ORM\Column(name="last_date", type="datetime", nullable=false)
     */
    protected $last_date;

    /**
     * @var int $count_likes
     *
     * @ORM\Column(name="count_likes", type="integer", nullable=false)
     */
    protected $count_likes;
    
    
    /**
     * @var PostEntity
     *
     * @ORM\ManyToOne(targetEntity="ReviewEntity")
     * @ORM\JoinColumn(name="review_id", referencedColumnName="id")
     */
    protected $review;
    

    
    
    /**
     * @param $review
     * @return $this
     */
    public function setReview($review)
    {
        $this->review = $review;
        return $this;
    }

    /**
     * @return \Yasoon\Site\Entity\ReviewEntity
     */
    public function getReview()
    {
        return $this->review;
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
     * @return int
     */
    public function getAuthorId()
    {
        return $this->authorId;
    }


    /**
     * @param $count_likes
     * @return $this
     */
    public function setCountLikes($count_likes)
    {
        $this->count_likes = $count_likes;
        return $this;
    }

    /**
     * @return int
     */
    public function getCountLikes()
    {
        return $this->count_likes;
    }

    /**
     * @param $last_date
     * @return $this
     */
    public function setLastDate($last_date)
    {
        $this->last_date = $last_date;
        return $this;
    }

    /**
     * @return \DateTime
     */
    public function getLastDate()
    {
        return $this->last_date;
    }

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
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @param $review_id
     * @return $this
     */
    public function setReviewId($review_id)
    {
        $this->review_id = $review_id;
        return $this;
    }

    /**
     * @return int
     */
    public function getReviewtId()
    {
        return $this->review_id;
    }


    /**
     * @param string $user_ip
     * @return $this
     */
    public function setUserIp($user_ip)
    {
        $this->user_ip =  $user_ip;
        return $this;
    }

    /**
     * @return string
     */
    public function getUserIp()
    {
        return $this->user_ip;
    }
}