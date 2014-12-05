<?php
/**
 * Author: Fedor Avetisov <cousenavi@gmail.com>
 * Date: 5/22/13
 */
namespace Yasoon\Site\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * PostCategory
 *
 * @ORM\Table(name="post_answer")
 * @ORM\Entity
 */
class PostAnswerEntity
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
     * @var int $post_id
     *
     * @ORM\Column(name="post_id", type="integer", nullable=false)
     */
    protected $post_id;

    /**
     * @var int $question_id
     *
     * @ORM\Column(name="question_id", type="integer", nullable=false)
     */
    protected $question_id;

    /**
     * @var string
     *
     * @ORM\Column(name="answer", type="string", nullable=false)
     */
    protected $answer;
    
    /**
     * @var string
     *
     * @ORM\Column(name="lego", type="string", columnDefinition="ENUM(0, 1)")
     */
    protected $lego;

    /**
     * @var PostEntity
     *
     * @ORM\ManyToOne(targetEntity="PostEntity")
     * @ORM\JoinColumn(name="post_id", referencedColumnName="id")
     */
    protected $post;

    /**
     * @var InterviewQuestionEntity
     *
     * @ORM\ManyToOne(targetEntity="InterviewQuestionEntity")
     * @ORM\JoinColumn(name="question_id", referencedColumnName="id")
     */
    protected $question;

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
     * @param \Yasoon\Site\Entity\InterviewQuestionEntity $question
     * @return $this
     */
    public function setQuestion($question)
    {
        $this->question = $question;
        return $this;
    }

    /**
     * @return \Yasoon\Site\Entity\InterviewQuestionEntity
     */
    public function getQuestion()
    {
        return $this->question;
    }

    /**
     * @param int $post_id
     * @return $this
     */
    public function setPostId($post_id)
    {
        $this->post_id = $post_id;
        return $this;
    }

    /**
     * @return int
     */
    public function getPostId()
    {
        return $this->post_id;
    }

    /**
     * @param int $question_id
     * @return $this
     */
    public function setQuestionId($question_id)
    {
        $this->question_id = $question_id;
        return $this;
    }

    /**
     * @return int
     */
    public function getQuestionId()
    {
        return $this->question_id;
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
     * @param string $status
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
}