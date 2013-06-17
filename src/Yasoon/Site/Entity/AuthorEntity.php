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




}