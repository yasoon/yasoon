<?php
/**
 * Author: Mihail Parandiy <parandiy.mihail@gmail.com>
 * Date: 14/02/14
 */
namespace Yasoon\Site\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Timeline
 *
 * @ORM\Table(name="timeline")
 * @ORM\Entity
 */
class TimelineEntity
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
     * @var int $author_id
     *
     * @ORM\Column(name="author_id", type="integer", nullable=false)
     */
    protected $author_id;

    /**
     * @var int $posts_count
     *
     * @ORM\Column(name="posts_count", type="integer", nullable=false)
     */
    protected $posts_count;

    /**
     * @var int $answers_count
     *
     * @ORM\Column(name="answers_count", type="integer", nullable=false)
     */
    protected $answers_count;

    /**
     * @var int $questions_count
     *
     * @ORM\Column(name="questions_count", type="integer", nullable=false)
     */
    protected $questions_count;


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
     * @param int $author_id
     * @return $this
     */
    public function setAuthorId($author_id)
    {
        $this->author_id = $author_id;
        return $this;
    }

    /**
     * @return int
     */
    public function getAuthorId()
    {
        return $this->author_id;
    }

    /**
     * @param int $posts_count
     * @return $this
     */
    public function setPostsCount($posts_count)
    {
        $this->posts_count = $posts_count;
        return $this;
    }

    /**
     * @return int
     */
    public function getPostsCount()
    {
        return $this->posts_count;
    }

    /**
     * @param int $questions_count
     * @return $this
     */
    public function setQuestionsCount($questions_count)
    {
        $this->questions_count = $questions_count;
        return $this;
    }

    /**
     * @return int
     */
    public function getQuestionsCount()
    {
        return $this->questions_count;
    }

    /**
     * @param int $answers_count
     * @return $this
     */
    public function setAnswersCount($answers_count)
    {
        $this->answers_count = $answers_count;
        return $this;
    }

    /**
     * @return int
     */
    public function getAnswersCount()
    {
        return $this->answers_count;
    }
}