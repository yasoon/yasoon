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
 * @ORM\Table(name="reviews")
 * @ORM\Entity
 */
class ReviewEntity
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
     * @var string $preview
     *
     * @ORM\Column(name="title", type="string", nullable=false)
     */
    protected $title;

    /**
     * @var string $text
     *
     * @ORM\Column(name="text", type="string", nullable=false)
     */
    protected $text;

    /**
     * @var int $authorId
     *
     * @ORM\Column(name="author_id", type="integer", nullable=false)
     */
    protected $authorId;
    
    /**
     * @var int $categoryId
     *
     * @ORM\Column(name="category_id", type="integer", nullable=false)
     */
    protected $categoryId;

    /**
     * @var int $interviewId
     *
     * @ORM\Column(name="review_type_id", type="integer", nullable=false)
     */
    protected $reviewTypeId;

    /**
     * @var AuthorEntity $author
     *
     * @ORM\ManyToOne(targetEntity="AuthorEntity",  inversedBy="posts")
     * @ORM\JoinColumn(name="author_id", referencedColumnName="id")
     */
    protected $author;

    /**
     * @var \DateTime $date
     *
     * @ORM\Column(name="date", type="datetime", nullable=false)
     */
    protected $date;

    /**
     * @var int
     *
     * @ORM\Column(name="likes", type="integer", nullable=false)
     *
     */
    protected $likes;

    /**
     * @var int
     *
     * @ORM\Column(name="visits", type="integer", nullable=false)
     *
     */
    protected $visits;
    
    /**
     * @var int
     *
     * @ORM\Column(name="expert", type="string", columnDefinition="ENUM(0, 1)")
     *
     */
    protected $expert;
    
    /**
     * @var int
     *
     * @ORM\Column(name="rating", type="integer", nullable=false)
     *
     */
    protected $rating;

    /**
     * @param $author
     * @return $this
     */
    public function setAuthor($author)
    {
        $this->author = $author;
        return $this;
    }

    /**
     * @return \Yasoon\Site\Entity\AuthorEntity
     */
    public function getAuthor()
    {
        return $this->author;
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
     * @param $date
     * @return $this
     */
    public function setDate($date)
    {
        $this->date = $date;
        return $this;
    }

    /**
     * @return \DateTime
     */
    public function getDate()
    {
        return $this->date;
    }
    
    /**
     * @return \timestamp
     */
    public function getDateTimeStamp()
    {
        $date = $date->setTimestamp($this->date);
        return $date;
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
     * @param $title
     * @return $this
     */
    public function setTitle($title)
    {
        $this->title = $title;
        return $this;
    }

    /**
     * @return string
     */
    public function getTitle()
    {
        return $this->title;
    }

    /**
     * @param $text
     * @return $this
     */
    public function setText($text)
    {
        $this->text = $text;
        return $this;
    }

    /**
     * @return string
     */
    public function getText()
    {
        return $this->text;
    }


    /**
     * @param int $categoryId
     * @return $this
     */
    public function setCategoryId($categoryId)
    {
        $this->categoryId = $categoryId;
        return $this;
    }

    /**
     * @return int
     */
    public function getCategoryId()
    {
        return $this->categoryId;
    }

    /**
     * @param int $likes
     * @return $this
     */
    public function setLikes($likes)
    {
        $this->likes = $likes;
        return $this;
    }

    /**
     * @return int
     */
    public function getLikes()
    {
        return $this->likes;
    }

    /**
     * @param int $visits
     * @return $this
     */
    public function setVisits($visits)
    {
        $this->visits = $visits;
        return $this;
    }

    /**
     * @return int
     */
    public function getVisits()
    {
        return $this->visits;
    }
    
    /**
     * @param int $typeId
     * @return $this
     */
    public function setReviewTypeId($typeId)
    {
        $this->reviewTypeId = $typeId;
        return $this;
    }

    /**
     * @return int
     */
    public function getReviewTypeId()
    {
        return $this->reviewTypeId;
    }
    
    /**
     * @param int $rating
     * @return $this
     */
    public function setRating($rating)
    {
        $this->rating = $rating;
        return $this;
    }

    /**
     * @return int
     */
    public function getRating()
    {
        return $this->rating;
    }
    
    /**
     * @param int $expert
     * @return $this
     */
    public function setExpert($expert)
    {
        $this->expert = $expert;
        return $this;
    }

    /**
     * @return int
     */
    public function getExpert()
    {
        return $this->expert;
    }





}