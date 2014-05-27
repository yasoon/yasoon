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
    protected $roles = [
      'ROLE_READER' => 1,
      'ROLE_AUTHOR' => 2,
      'ROLE_ADMIN'  => 4
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
     * @var \DateTime $date_change
     *
     * @ORM\Column(name="date_change", type="datetime", nullable=true)
     */
    protected $date_change;

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
     * @var AuthorEntity[]
     *
     * @ORM\ManyToMany(targetEntity="AuthorEntity")
     * @ORM\JoinTable(name="friends",
     *      joinColumns={@ORM\JoinColumn(name="writer_id", referencedColumnName="id")},
     *      inverseJoinColumns={@ORM\JoinColumn(name="reader_id", referencedColumnName="id", unique=true)})
     */
    protected $writers;

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
     * @var int
     *
     * @ORM\Column(name="reg_from", type="integer", nullable=true)
     */
    protected $reg_from;
    
    

    /**
     * @var string
     *
     * @ORM\Column(name="newpass", type="string", nullable=true)
     */
    protected $newpass;
    
    
    
    /**
     * @var string
     *
     * @ORM\Column(name="facebook_id", type="string", length=50, unique=true, nullable=true)
     */
    protected $facebookId;
    
    
    /**
     * @var string
     *
     * @ORM\Column(name="vkontakte_id", type="string", length=50, unique=true, nullable=true)
     */
    protected $vkontakteId;
    

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
     * @param $facebookId
     * @return $this
     */
    public function setFacebookId($facebookId)
    {
        $this->facebookId = $facebookId;
        return $this;
    }

    /**
     * @return string
     */
    public function getFacebookId()
    {
        return $this->facebookId;
    }
    
    /**
     * @param $vkontakteId
     * @return $this
     */
    public function setVkontakteId($vkontakteId)
    {
        $this->vkontakteId = $vkontakteId;
        return $this;
    }

    /**
     * @return string
     */
    public function getVkontakteId()
    {
        return $this->vkontakteId;
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
     * @param \DateTime $date_change
     * @return $this
     */
    public function setDateChange($date_change)
    {
        $this->date_change = $date_change;
        return $this;
    }

    /**
     * @return \DateTime
     */
    public function getDateChange()
    {
        return $this->date_change;
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
     * @return \Yasoon\Site\Entity\AuthorEntity[]
     */
    public function getFriends()
    {
        return $this->friends;
    }

    /**
     * @param \Yasoon\Site\Entity\AuthorEntity[] $friends
     * @return $this
     */
    public function setFriends($friends)
    {
        $this->friends = $friends;
        return $this;
    }
    
    
    /**
     * @return \Yasoon\Site\Entity\AuthorEntity[]
     */
    public function getWriters()
    {
        return $this->writers;
    }

    /**
     * @param \Yasoon\Site\Entity\AuthorEntity[] $writers
     * @return $this
     */
    public function setWriters($writers)
    {
        $this->writers = $writers;
        return $this;
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
        return $this;
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
     * @param string $newpass
     */
    public function setNewpass($newpass)
    {
        $this->newpass = $newpass;
    }

    /**
     * @return string
     */
    public function getNewpass()
    {
        return $this->newpass;
    }
    
    

    /**
     * @param $reg_from
     * @return $this
     */
    public function setRegFrom($reg_from)
    {
        $this->reg_from = $reg_from;
        return $this;
    }

    /**
     * @return int
     */
    public function getRegFrom()
    {
        return $this->reg_from;
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
        $roles  = [];
        foreach ($this->roles as  $role => $bit) {
            if ($this->role & $bit) {
                $roles[] = $role;
            }
        }

        return $roles;
    }

    /**
     * Returns the username used to authenticate the user.
     * In current case, user's ID really identifies the user.
     * @todo change it to email in future?
     *
     * @return string The username
     */
    public function getUsername()
    {
        return $this->getId();
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

    /**
     * @return int
     */
    public function getRole()
    {
        return $this->role;
    }

    /**
     * The equality comparison should neither be done by referential equality
     * nor by comparing identities (i.e. getId() === getId()).
     *
     * However, you do not need to compare every attribute, but only those that
     * are relevant for assessing whether re-authentication is required.
     *
     * @param UserInterface $user
     * @return Boolean
     */
    public function equals(UserInterface $user){
        return ($this->getUsername() === $user->getUsername());
    }
}