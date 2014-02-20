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
 * @ORM\Table(name="interview_question")
 * @ORM\Entity
 */
class InterviewQuestionEntity
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
     * @var integer
     *
     * @ORM\Column(name="interview_id", type="integer", nullable=false)
     */
    protected $interviewId;

    /**
     * @var PostEntity
     *
     * @ORM\ManyToOne(targetEntity="InterviewEntity")
     * @ORM\JoinColumn(name="interview_id", referencedColumnName="id")
     */
    protected $interview;


    /**
     * @var string
     *
     * @ORM\Column(name="text", type="string", nullable=false)
     */
    protected $text;

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
     * @param string $text
     * @return $this
     */
    public function setText($text)
    {
        $this->text =  $text;
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
     * @param string $interview
     * @return $this
     */
    public function setInterview($interview)
    {
        $this->interview =  $interview;
        return $this;
    }

    /**
     * @return \Yasoon\Site\Entity\InterviewEntity
     */
    public function getInterview()
    {
        return $this->interview;
    }
}