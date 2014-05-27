<?php
/**
 * Author: Fedor Avetisov <cousenavi@gmail.com>
 * Date: 5/22/13
 */
namespace Yasoon\Site\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * StoryOfTheDay
 *
 * @ORM\Table(name="story_of_the_day")
 * @ORM\Entity
 */
class PostOfTheDayEntity
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
     * @var int $postId
     *
     * @ORM\Column(name="post_id", type="integer", nullable=false)
     */
    protected $postId;

    /**
     * @var PostEntity
     *
     * @ORM\OneToOne(targetEntity="PostEntity")
     * @ORM\JoinColumn(name="post_id", referencedColumnName="id")
     */
    protected $post;

    /**
     * @var \DateTime $assignedDatetime
     *
     * @ORM\Column(name="assigned", type="datetime", nullable=false)
     */
    protected $assignedDatetime;

    /**
     * @param \DateTime $assignedDatetime
     * @return $this
     */
    public function setAssignedDatetime($assignedDatetime)
    {
        $this->assignedDatetime = $assignedDatetime;
        return $this;
    }

    /**
     * @return \DateTime
     */
    public function getAssignedDatetime()
    {
        return $this->assignedDatetime;
    }

    /**
     * @param int $id
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
     * @param \Yasoon\Site\Entity\PostEntity $post
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
     * @param int $postId
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



}