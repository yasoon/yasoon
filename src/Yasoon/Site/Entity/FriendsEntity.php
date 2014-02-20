<?php
/**
 * Author: Mihail Parandiy <parandiy.mihail@gmail.com>
 * Date: 10/02/14
 */
namespace Yasoon\Site\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Author
 *
 * @ORM\Table(name="friends")
 * @ORM\Entity
 */
class FriendsEntity
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
     * @ORM\Column(name="writer_id", type="integer", nullable=false)
     */
    protected $writerId;

    /**
     * @var integer
     *
     * @ORM\Column(name="reader_id", type="integer", nullable=false)
     */
    protected $readerId;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="date_write", type="datetime", nullable=true)
     */
    protected $date_write;
    
    
    /**
     * @var AuthorEntity[] $reader
     *
     * @ORM\OneToMany(targetEntity="AuthorEntity",  mappedBy="author")
     * @ORM\JoinColumn(name="id", referencedColumnName="reader_id")
     */
    protected $reader;
    
    /**
     * @var AuthorEntity[] $writer
     *
     * @ORM\OneToMany(targetEntity="AuthorEntity",  mappedBy="friends")
     * @ORM\JoinColumn(name="id", referencedColumnName="writer_id")
     */
    protected $writer;
    
    /**
     * @param $reader
     * @return $this
     */
    public function setReader($reader)
    {
        $this->reader = $reader;
        return $this;
    }

    /**
     * @return \Yasoon\Site\Entity\AuthorEntity
     */
    public function getReader()
    {
        return $this->reader;
    }
    
    /**
     * @param $writer
     * @return $this
     */
    public function setWriter($writer)
    {
        $this->writer = $writer;
        return $this;
    }

    /**
     * @return \Yasoon\Site\Entity\AuthorEntity
     */
    public function getWriter()
    {
        return $this->writer;
    }


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
     * @return int
     */
    public function getDateWrite()
    {
        return $this->date_write;
    }

    /**
     * @param $date_write
     * @return $this
     */
    public function setDateWrite($date_write)
    {
        $this->date_write = $date_write;
        return $this;
    }

    /**
     * @param $writerId
     * @return $this
     */
    public function setWriterId($writerId)
    {
        $this->writerId = $writerId;
        return $this;
    }

    /**
     * @return int
     */
    public function getWriterId()
    {
        return $this->writerId;
    }

    /**
     * @param $readerId
     * @return $this
     */
    public function setReaderId($readerId)
    {
        $this->readerId = $readerId;
        return $this;
    }

    /**
     * @return int
     */
    public function getReaderId()
    {
        return $this->readerId;
    }
}