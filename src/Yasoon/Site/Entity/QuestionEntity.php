<?php

namespace Yasoon\Site\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Author
 *
 * @ORM\Table(name="post")
 * @ORM\Entity
 */
class QuestionEntity
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
     * @var string $text
     *
     * @ORM\Column(name="text", type="string", nullable=false)
     */
    protected $text;

    /**
     * @var int $authorId
     *
     * @ORM\Column(name="author_id", type="integer", nullable=false)
     */
    protected $authorId;

    /**
     * @var AuthorEntity
     *
     * @ORM\ManyToOne(targetEntity="AuthorEntity")
     * @ORM\JoinColumn(name="author_id", referencedColumnName="id")
     */
    protected $author;

    /**
     * PostId can be null. If so, it's a common question to author, not for a post
     *
     * @var int $postId
     *
     * @ORM\Column(name="post_id", type="integer", nullable=true)
     */
    protected $postId;

    /**
     * @var PostEntity $post
     *
     * @ORM\ManyToOne(targetEntity="PammAccount")
     * @ORM\JoinColumn(name="post_id", referencedColumnName="id")
     */
    protected $post;

    /**
     * @var \DateTime $date
     *
     * @ORM\Column(name="date", type="datetime", nullable=false)
     */
    protected $date;

    /**
     * @var boolean $isInBlank
     *
     * @ORM\Column(name="is_in_blank", type="boolean", nullable=false)
     */
    protected $isInBlank;
}