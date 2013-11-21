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

    private $adminIds = array(
        43,
        56,
        57
    );

    protected function getAccessLevel($authorId)
    {
        if ($authorId == (int) $this->securityContext->getToken()->getUsername()) {
            $access = 'USER';
        } else if (array_key_exists((int) $this->securityContext->getToken()->getUsername(), $this->adminIds)) {
            $access = 'ADMIN';
        } else {
            $access = 'ANON';
        }

        return $access;
    }
}