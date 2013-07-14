<?php

namespace Yasoon\Site\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Author
 *
 * @ORM\Table(name="question")
 * @ORM\Entity
 */
class QuestionEntity
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
     * @var string $text
     *
     * @ORM\Column(name="caption", type="string", nullable=false)
     */
    protected $caption;

    /**
     * @var int $authorId
     *
     * @ORM\Column(name="author_id", type="integer", nullable=false)
     */
    protected $authorId;

    /**
     * @var AuthorEntity
     *
     * @ORM\ManyToOne(targetEntity="AuthorEntity")
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
     * @var boolean $isInBlank
     *
     * @ORM\Column(name="is_in_blank", type="boolean", nullable=false)
     */
    protected $isInBlank;

    /**
     * @var string
     *
     * @ORM\Column(name="answer", type="string", nullable=false)
     */
    protected $answer;

    /**
     * @var int
     *
     * @ORM\Column(name="place", type="integer", nullable=false)
     *
     */
    protected $place;

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
     * @param $isInBlank
     * @return $this
     */
    public function setIsInBlank($isInBlank)
    {
        $this->isInBlank = $isInBlank;
        return $this;
    }

    /**
     * @return boolean
     */
    public function getIsInBlank()
    {
        return $this->isInBlank;
    }

    /**
     * @param $post
     * @return $this
     */
    public function setPost($post)
    {
        $this->post = $post;
        return $this;
    }

    /**
     * @return \Yasoon\Site\Entity\PostEntity
     */
    public function getPost()
    {
        return $this->post;
    }

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
     * @return int
     */
    public function getPostId()
    {
        return $this->postId;
    }

    /**
     * @param $text
     * @return $this
     */
    public function setCaption($text)
    {
        $this->caption = $text;
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
     * @param string $answer
     * @return $this
     */
    public function setAnswer($answer)
    {
        $this->answer =  $answer;
        return $this;
    }

    /**
     * @return string
     */
    public function getAnswer()
    {
        return $this->answer;
    }

    /**
     * @param int $place
     *
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

}