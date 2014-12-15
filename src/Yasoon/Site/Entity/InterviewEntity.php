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
 * @ORM\Table(name="interview")
 * @ORM\Entity
 */
class InterviewEntity
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
     * @var string
     *
     * @ORM\Column(name="name", type="string", nullable=false)
     */
    protected $name;
    
    /**
     * @var string
     *
     * @ORM\Column(name="status", type="string", columnDefinition="ENUM('visible', 'invisible')")
     */
    protected $status;
    
    /**
     * @var string
     *
     * @ORM\Column(name="lego", type="string", columnDefinition="ENUM(0, 1)")
     */
    protected $lego;
    
    /**
     * @var integer $order
     *
     * @ORM\Column(name="`order`", type="integer", nullable=false)
     */
    protected $order;
    
    /**
     * @var integer
     *
     * @ORM\Column(name="position", type="integer", nullable=false)
     */
    protected $position;
    
    /**
     * @var string
     *
     * @ORM\Column(name="lego_img", type="string")
     */
    protected $lego_img;
    
    /**
     * @var string
     *
     * @ORM\Column(name="preview_img", type="string")
     */
    protected $preview_img;
    
    /**
     * @var InterviewQuestionEntity[] $questions
     *
     * @ORM\OneToMany(targetEntity="InterviewQuestionEntity",  mappedBy="interview")
     * @ORM\JoinColumn(name="id", referencedColumnName="interview_id")
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
     * @param string $name
     * @return $this
     */
    public function setName($name)
    {
        $this->name =  $name;
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
     * @param int $order
     * @return $this
     */
    public function setOrder($order)
    {
        $this->order =  (int) $order;
        return $this;
    }

    /**
     * @return int
     */
    public function getOrder()
    {
        return $this->order;
    }
    
    /**
     * @param string $status
     * @return $this
     */
    public function setStatus($status)
    {
        $this->status =  $status;
        return $this;
    }

    /**
     * @return string
     */
    public function getStatus()
    {
        return $this->status;
    }
    
    /**
     * @param string $lego
     * @return $this
     */
    public function setLego($lego)
    {
        $this->lego =  $lego;
        return $this;
    }

    /**
     * @return string
     */
    public function getLego()
    {
        return $this->lego;
    }
    
    /**
     * @param string $lego
     * @return $this
     */
    public function setPosition($position)
    {
        $this->position =  $position;
        return $this;
    }

    /**
     * @return string
     */
    public function getPosition()
    {
        return $this->position;
    }
    
    /**
     * @param string $lego_img
     * @return $this
     */
    public function setImg($img)
    {
        $this->lego_img =  $img;
        return $this;
    }

    /**
     * @return string
     */
    public function getImg()
    {
        return $this->lego_img;
    }
    
    /**
     * @param string $preview_img
     * @return $this
     */
    public function setPreviewImg($img)
    {
        $this->preview_img =  $img;
        return $this;
    }

    /**
     * @return string
     */
    public function getPreviewImg()
    {
        return $this->preview_img;
    }
    
    /**
     * @param $category
     * @return $this
     */
    public function setQuestions($questions)
    {
        $this->questions = $questions;
        return $this;
    }

    /**
     * @return \Yasoon\Site\Entity\InterviewQuestionEntity[]
     */
    public function getQuestions()
    {
        return $this->questions;
    }
}