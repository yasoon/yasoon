<?php
/**
 * Author: Mihail Parandiy <parandiy.mihail@gmail.com>
 * Date: 29/01/14
 */



namespace Yasoon\Site\Service;

use JMS\DiExtraBundle\Annotation as DI;
use Symfony\Component\Security\Core\Exception\AccessDeniedException;
use Yasoon\Site\Entity\PartnerEntity;

error_reporting(E_ALL);

/**
 * @DI\Service("yasoon.service.partner")
 */
class PartnerService extends AbstractApiService {

    /**
     * @var \Symfony\Component\Security\Core\SecurityContextInterface
     *
     * @DI\Inject("security.context")
     */
    public  $securityContext;

    
    /**
     * @return array
     */
    public function getPartnerInfo() {

        /** @var PartnerEntity $partner */
        $partner = $this->em->getRepository('Yasoon\Site\Entity\PartnerEntity')->find(1);

        $result = array('partnerBgImg' => $partner->getPartnerBgImg(), // задний фон на главной
                        'parnterText' => $partner->getParnterText(), // текст на главной 
                        'parnterLink' => $partner->getParnterLink() // сылка насайт партнера
                        );
        return $result;
    }
}