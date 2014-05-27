<?php
/**
 * Author: Mihail Parandiy <parandiy.mihail@gmail.com>
 * Date: 29/01/14
 */
namespace Yasoon\Site\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Author
 *
 * @ORM\Table(name="partners")
 * @ORM\Entity
 */
class PartnerEntity
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
     * @var string $partnerBgImg
     *
     * @ORM\Column(name="partnerBgImg", type="string", nullable=false)
     */
    protected $partnerBgImg;

    /**
     * @var string $parnterText
     *
     * @ORM\Column(name="parnterText", type="string", nullable=false)
     */
    protected $parnterText;

    /**
     * @var string $parnterLink
     *
     * @ORM\Column(name="parnterLink", type="string", nullable=false)
     */
    protected $parnterLink;

    

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
     * @param $partnerBgImg
     * @return $this
     */
    public function setPartnerBgImg($partnerBgImg)
    {
        $this->partnerBgImg = $partnerBgImg;
        return $this;
    }

    /**
     * @return string
     */
    public function getPartnerBgImg()
    {
        return $this->partnerBgImg;
    }
    
    /**
     * @param $parnterText
     * @return $this
     */
    public function setParnterText($parnterText)
    {
        $this->parnterText = $parnterText;
        return $this;
    }

    /**
     * @return string
     */
    public function getParnterText()
    {
        return $this->parnterText;
    }
    
    /**
     * @param $parnterLink
     * @return $this
     */
    public function setParnterLink($parnterLink)
    {
        $this->parnterLink = $parnterLink;
        return $this;
    }

    /**
     * @return string
     */
    public function getParnterLink()
    {
        return $this->parnterLink;
    }
}