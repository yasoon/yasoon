<?php
/**
 * Author: Fedor Avetisov <cousenavi@gmail.com>
 * Date: 5/26/13
 */

namespace Yasoon\Site\Service;

use Doctrine\ORM\EntityManager;
use JMS\DiExtraBundle\Annotation as DI;

use Doctrine\Tests\Common\Annotations\Ticket\Doctrine\ORM\Entity;
use Symfony\Component\Security\Core\Exception\AccessDeniedException;

abstract class AbstractApiService {

    /**
     * @DI\Inject("doctrine.orm.entity_manager")
     *
     * @var EntityManager
     */
    public $em;

    public function isAdmin() {
        return in_array('ROLE_ADMIN', $this->securityContext->getToken()->getRoles());
    }

    public function checkAdminAccess()
    {
        if (!$this->isAdmin()) {
            throw new AccessDeniedException();
        }
    }

    protected function getAccessLevel($authorId)
    {
        if ($authorId == (int) $this->securityContext->getToken()->getUsername()) {
            $access = 'USER';
        } else if ($this->securityContext->getToken()->getUsername() === "0") {
            $access = 'ADMIN';
        } else {
            $access = 'ANON';
        }

        return $access;
    }
}