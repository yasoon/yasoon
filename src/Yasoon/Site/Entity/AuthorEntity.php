<?php

namespace Yasoon\Site\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Author
 *
 * @ORM\Table(name="author")
 * @ORM\Entity
 */
class AuthorEntity
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
     * @var string $name
     *
     * @ORM\Column(name="name", type="string", nullable=false)
     */
    protected $name;


    /**
     * @var string $email
     *
     * @ORM\Column(name="email", type="string", nullable=false)
     */
    protected $email;

    /**
     * @var bool $subscribed
     *
     * @ORM\Column(name="subscribed", type="string", nullable=false)
     */
    protected $subscribed;

    /**
     * @var string $description
     *
     * @ORM\Column(name="description", type="string", nullable=false)
     */
    protected $description;

    /**
     * @var \DateTime $publicationDate
     *
     * @ORM\Column(name="publication_date", type="datetime", nullable=false)
     */
    protected $publicationDate;

    /**
     * @var string $job
     *
     * @ORM\Column(name="job", type="string", nullable=true)
     */
    protected $job;

    /**
     * @var string $dream
     *
     * @ORM\Column(name="dream", type="string", nullable=true)
     */
    protected $dream;

    /**
     * @var string $interest
     *
     * @ORM\Column(name="interest", type="string", nullable=true)
     */
    protected $interest;

    /**
     * @var PostEntity[]
     *
     * @ORM\OneToMany(targetEntity="PostEntity", mappedBy="author")
     */
    protected $posts;


    /**
     * @var QuestionEntity[]
     *
     * @ORM\OneToMany(targetEntity="QuestionEntity", mappedBy="author")
     */
    protected $questions;

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
     * @param $name
     * @return $this
     */
    public function setName($name)
    {
        $this->name = $name;
        return $this;
    }

    /**
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * @param $posts
     * @return $this
     */
    public function setPosts($posts)
    {
        $this->posts = $posts;
        return $this;
    }

    /**
     * @return PostEntity[]
     */
    public function getPosts()
    {
        return $this->posts;
    }

    /**
     * @param string $description
     * @return $this
     */
    public function setDescription($description)
    {
        $this->description = $description;
        return $this;
    }

    /**
     * @return string
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * @param string $dream
     * @return $this
     */
    public function setDream($dream)
    {
        $this->dream = $dream;
        return $this;
    }

    /**
     * @return string
     */
    public function getDream()
    {
        return $this->dream;
    }

    /**
     * @param string $email
     * @return $this
     */
    public function setEmail($email)
    {
        $this->email = $email;
        return $this;
    }

    /**
     * @return string
     */
    public function getEmail()
    {
        return $this->email;
    }

    /**
     * @param string $interest
     * @return $this
     */
    public function setInterest($interest)
    {
        $this->interest = $interest;
        return $this;
    }

    /**
     * @return string
     */
    public function getInterest()
    {
        return $this->interest;
    }

    /**
     * @param string $job
     * @return $this
     */
    public function setJob($job)
    {
        $this->job = $job;
        return $this;
    }

    /**
     * @return string
     */
    public function getJob()
    {
        return $this->job;
    }

    /**
     * @param \DateTime $publicationDate
     * @return $this
     */
    public function setPublicationDate($publicationDate)
    {
        $this->publicationDate = $publicationDate;
        return $this;
    }

    /**
     * @return \DateTime
     */
    public function getPublicationDate()
    {
        return $this->publicationDate;
    }

    /**
     * @param \Yasoon\Site\Entity\QuestionEntity[] $questions
     * @return $this
     */
    public function setQuestions($questions)
    {
        $this->questions = $questions;
        return $this;
    }

    /**
     * @return \Yasoon\Site\Entity\QuestionEntity[]
     */
    public function getQuestions()
    {
        return $this->questions;
    }

    /**
     * @param boolean $subscribed
     * @return $this
     */
    public function setSubscribed($subscribed)
    {
        $this->subscribed = $subscribed;
        return $this;
    }

    /**
     * @return boolean
     */
    public function getSubscribed()
    {
        return $this->subscribed;
    }




}