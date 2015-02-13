<?php
/**
 * Author: 
 * Date: 5/22/13
 */
namespace Yasoon\Site\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Author
 *
 * @ORM\Table(name="interview_moderator")
 * @ORM\Entity
 */
class InterviewModeratorEntity
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     * @ORM\Column(name="interview_id", type="integer", nullable=false)
     *
     */
    protected $interview_id;

    /**
     * @var int $authorId
     *
     * @ORM\Column(name="author_id", type="integer", nullable=false)
     */
    protected $authorId;

    
    /**
     * @param $interview_id
     * @return $this
     */
    public function setInterview($interview_id)
    {
        $this->interview_id = $interview_id;
        return $this;
    }

    /**
     * 
     * @return int
     */
    public function getInterview()
    {
        return $this->interview_id;
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
}