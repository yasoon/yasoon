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


    protected $clientId;

    public function __construct() {
        $this->clientId = 1; //@TODO получать из security context
    }

    protected  function addEntity($entity) {
        $this->em->persist($entity);
        $this->em->flush();
    }

    protected function updateEntity(Entity $entity) {
        $this->em->merge($entity);
        $this->em->flush();
    }

    protected function deleteEntity(Entity $entity) {
        $this->em->remove($entity);
        $this->em->flush();
    }
}