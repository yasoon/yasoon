<?php
/**
 * Author: Fedor Avetisov <cousenavi@gmail.com>
 * Date: 5/22/13
 */
namespace Yasoon\Site\Entity;

use JMS\DiExtraBundle\Annotation as DI;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\Role;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * Author
 *
 * @ORM\Table(name="author")
 * @ORM\Entity
 *
 * @DI\Service("yasoon.entity.author")
 */
class AuthorEntity implements UserInterface, \Serializable
{
    private $roles = [
      1 => 'ROLE_USER',
      2 => 'ROLE_AUTHOR',
      4 => 'ROLE_ADMIN'
    ];

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
     * @ORM\Column(name="description", type="string", nullable=true)
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
     * @var string $img
     *
     * @ORM\Column(name="img", type="string", nullable=true)
     */
    protected $img;


    /**
     * @var string $homepage
     *
     * @ORM\Column(name="homepage", type="string", nullable=true)
     */
    protected $homepage;

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
     * @var AuthorEntity[]
     *
     * @ORM\ManyToMany(targetEntity="AuthorEntity")
     * @ORM\JoinTable(name="friends",
     *      joinColumns={@ORM\JoinColumn(name="reader_id", referencedColumnName="id")},
     *      inverseJoinColumns={@ORM\JoinColumn(name="writer_id", referencedColumnName="id", unique=true)})
     */
    protected $friends;

    /**
     * @var string
     *
     * @ORM\Column(name="interview_caption", type="string", nullable=true)
     */
    protected $interviewCaption;

    /**
     * @var string
     *
     * @ORM\Column(name="password", type="string", nullable=true)
     */
    protected $password;

    /**
     * @var string
     *
     * @ORM\Column(name="salt", type="string", nullable=false)
     */
    protected $salt;

    /**
     * @var int
     *
     * @ORM\Column(name="role", type="integer", nullable=false)
     */
    protected $role;

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

    /**
     * @param string $interviewCaption
     * @return $this
     */
    public function setInterviewCaption($interviewCaption)
    {
        $this->interviewCaption = $interviewCaption;
        return $this;
    }

    /**
     * @return string
     */
    public function getInterviewCaption()
    {
        return $this->interviewCaption;
    }

    /**
     * @param string $password
     * @return $this
     */
    public function setPassword($password)
    {
        $this->password = $password;
        return $this;
    }

    /**
     * @return string
     */
    public function getPassword()
    {
        return $this->password;
    }

    /**
     * @param string $homepage
     */
    public function setHomepage($homepage)
    {
        $this->homepage = $homepage;
    }

    /**
     * @return string
     */
    public function getHomepage()
    {
        return $this->homepage;
    }

    /**
     * @param string $img
     */
    public function setImg($img)
    {
        $this->img = $img;
    }

    /**
     * @return string
     */
    public function getImg()
    {
        return $this->img;
    }

    /**
     * @param string $salt
     */
    public function setSalt($salt)
    {
        $this->salt = $salt;
    }

    /**
     * @return string
     */
    public function getSalt()
    {
        return $this->salt;
    }


    /**
     * Returns the roles granted to the user.
     *
     * <code>
     * public function getRoles()
     * {
     *     return array('ROLE_USER');
     * }
     * </code>
     *
     * Alternatively, the roles might be stored on a ``roles`` property,
     * and populated in any number of different ways when the user object
     * is created.
     *
     * @return Role[] The user roles
     */
    public function getRoles()
    {
//        $roles  = [];
//        foreach ($this->roles as  $role => $bit) {
//            if ($this->role & $bit) {
//                $roles[] = $role;
//            }
//        }
//
//        return $roles;

        return [$this->role];
    }

    /**
     * Returns the username used to authenticate the user.
     *
     * @return string The username
     */
    public function getUsername()
    {
        return $this->getName();
    }

    /**
     * Removes sensitive data from the user.
     *
     * This is important if, at any given point, sensitive information like
     * the plain-text password is stored on this object.
     *
     * @return void
     */
    public function eraseCredentials()
    {
        // TODO: Implement eraseCredentials() method.
    }

    /**
     * @see \Serializable::serialize()
     */
    public function serialize()
    {
        return serialize(array(
            $this->id,
        ));
    }

    /**
     * @see \Serializable::unserialize()
     */
    public function unserialize($serialized)
    {
        list (
            $this->id,
            ) = unserialize($serialized);
    }

    /**
     * @param int $role
     */
    public function setRole($role)
    {
        $this->role = $role;
        return $this;
    }
}