<?php
/**
 * Author: Mihail Parandiy <parandiy.mihail@gmail.com>
 * Date: 5/02/14
 */
namespace Yasoon\Site\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * PostCategory
 *
 * @ORM\Table(name="post_category")
 * @ORM\Entity
 */
class PostCategoryEntity
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
     * @var int $category_id
     *
     * @ORM\Column(name="category_id", type="integer", nullable=false)
     */
    protected $category_id;

    /**
     * @var PostEntity
     *
     * @ORM\ManyToOne(targetEntity="PostEntity")
     * @ORM\JoinColumn(name="post_id", referencedColumnName="id")
     */
    protected $post;

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
     * @param int $category_id
     * @return $this
     */
    public function setCategoryId($category_id)
    {
        $this->category_id = $category_id;
        return $this;
    }

    /**
     * @return int
     */
    public function getCategoryId()
    {
        return $this->category_id;
    }



}