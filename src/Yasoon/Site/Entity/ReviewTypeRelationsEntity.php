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
 * @ORM\Table(name="review_types_relation")
 * @ORM\Entity
 */
class ReviewTypeRelationsEntity
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     * @ORM\Column(name="id", type="integer", nullable=false)
     *
     */
    protected $id;

    /**
     * @var int $reviewId
     *
     * @ORM\Column(name="review_id", type="integer", nullable=false)
     */
    protected $reviewId;
    
    /**
     * @var int $typeId
     *
     * @ORM\Column(name="type_id", type="integer", nullable=false)
     */
    protected $typeId;

    
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
     * 
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }


    /**
     * @param $reviewId
     * @return $this
     */
    public function setReviewId($reviewId)
    {
        $this->reviewId = $reviewId;
        return $this;
    }

    /**
     * @return int
     */
    public function getReviewId()
    {
        return $this->reviewId;
    }
    
    /**
     * @param $typeId
     * @return $this
     */
    public function setTypeId($typeId)
    {
        $this->typeId = $typeId;
        return $this;
    }

    /**
     * @return int
     */
    public function getTypeId()
    {
        return $this->typeId;
    }
}