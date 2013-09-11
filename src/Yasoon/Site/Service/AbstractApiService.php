<?php
/**
 * Author: Fedor Avetisov <cousenavi@gmail.com>
 * Date: 5/26/13
 */

namespace Yasoon\Site\Service;

use Doctrine\ORM\EntityManager;
use JMS\DiExtraBundle\Annotation as DI;

use Doctrine\Tests\Common\Annotations\Ticket\Doctrine\ORM\Entity;

abstract class AbstractApiService {

    /**
     * @DI\Inject("doctrine.orm.entity_manager")
     *
     * @var EntityManager
     */
    public $em;

    protected function getAccessLevel($authorId)
    {
        if ($authorId == $this->securityContext->getToken()->getUsername()) {
            $access = 'USER';
        } else if ($this->securityContext->getToken()->getUsername() === "0") {
            $access = 'ADMIN';
        } else {
            $access = 'ANON';
        }

        return $access;
    }
}