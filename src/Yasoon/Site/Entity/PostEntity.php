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
 * @ORM\Table(name="post")
 * @ORM\Entity
 */
class PostEntity
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
     * @ORM\Column(name="preview", type="string", nullable=false)
     */
    protected $preview;
    
     /**
     * @var string $previewImg
     *
     * @ORM\Column(name="previewImg", type="string", nullable=false)
     */
    protected $previewImg;

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
     * @var int $interviewId
     *
     * @ORM\Column(name="interview_id", type="integer", nullable=false)
     */
    protected $interviewId;

    /**
     * @var AuthorEntity $author
     *
     * @ORM\ManyToOne(targetEntity="AuthorEntity",  inversedBy="posts")
     * @ORM\JoinColumn(name="author_id", referencedColumnName="id")
     */
    protected $author;

    /**
     * @var InterviewEntity $interview
     *
     * @ORM\ManyToOne(targetEntity="InterviewEntity",  inversedBy="posts")
     * @ORM\JoinColumn(name="interview_id", referencedColumnName="id")
     */
    protected $interview;

    /**
     * @var PostCategoryEntity[] $category
     *
     * @ORM\OneToMany(targetEntity="PostCategoryEntity",  mappedBy="post")
     * @ORM\JoinColumn(name="id", referencedColumnName="post_id")
     */
    protected $category;

    /**
     * @var PostAnswerEntity[] $answer
     *
     * @ORM\OneToMany(targetEntity="PostAnswerEntity",  mappedBy="post")
     * @ORM\JoinColumn(name="id", referencedColumnName="post_id")
     */
    protected $answer;

    /**
     * @var \DateTime $date
     *
     * @ORM\Column(name="date", type="datetime", nullable=false)
     */
    protected $date;

    /**
     * @var string $caption
     *
     * @ORM\Column(name="caption", type="string", nullable=false)
     */
    protected $caption;

    /**
     * @var int
     *
     * @ORM\Column(name="place", type="integer", nullable=false)
     *
     */
    protected $place;

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
     * @param $interview
     * @return $this
     */
    public function setInterview($interview)
    {
        $this->interview = $interview;
        return $this;
    }

    /**
     * @return \Yasoon\Site\Entity\InterviewEntity
     */
    public function getInterview()
    {
        return $this->interview;
    }
    
    /**
     * @param $category
     * @return $this
     */
    public function setCategory($category)
    {
        $this->category = $category;
        return $this;
    }

    /**
     * @return \Yasoon\Site\Entity\PostCategoryEntity[]
     */
    public function getCategory()
    {
        return $this->category;
    }
    
    /**
     * @param $category
     * @return $this
     */
    public function setAnswer($answer)
    {
        $this->answer = $answer;
        return $this;
    }

    /**
     * @return \Yasoon\Site\Entity\PostAnswerEntity[]
     */
    public function getAnswer()
    {
        return $this->answer;
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
     * @param $interviewId
     * @return $this
     */
    public function setInterviewId($interviewId)
    {
        $this->interviewId = $interviewId;
        return $this;
    }

    /**
     * @return int
     */
    public function getInterviewId()
    {
        return $this->interviewId;
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
     * @param $preview
     * @return $this
     */
    public function setPreview($preview)
    {
        $this->preview = $preview;
        return $this;
    }

    /**
     * @return string
     */
    public function getPreview()
    {
        return $this->preview;
    }
    
    /**
     * @param $preview
     * @return $this
     */
    public function setPreviewImg($previewImg)
    {
        $this->previewImg = $previewImg;
        return $this;
    }

    /**
     * @return string
     */
    public function getPreviewImg()
    {
        return $this->previewImg;
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
     * @param $caption
     * @return $this
     */
    public function setCaption($caption)
    {
        $this->caption = $caption;
        return $this;
    }

    /**
     * @return string
     */
    public function getCaption()
    {
        return $this->caption;
    }

    /**
     * @param int $place
     * @return $this
     */
    public function setPlace($place)
    {
        $this->place = $place;
        return $this;
    }

    /**
     * @return int
     */
    public function getPlace()
    {
        return $this->place;
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





}