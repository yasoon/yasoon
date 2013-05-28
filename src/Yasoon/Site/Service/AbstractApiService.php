<?php
/**
 * Author: Fedor Avetisov <cousenavi@gmail.com>
 * Date: 5/26/13
 */

namespace Yasoon\Site\Service;


use Doctrine\Tests\Common\Annotations\Ticket\Doctrine\ORM\Entity;

class AbstractApiService {

    /**
     * @DI\Inject("doctrine.orm.entity_manager")
     */
    protected $em;

    public function add(Entity $entity) {
        $this->em->persist($entity);
        $this->em->flush();
    }

    public function update(Entity $entity) {
        $this->em->merge($entity);
        $this->em->flush();
    }

    public function delete(Entity $entity) {
        $this->em->remove($entity);
        $this->em->flush();
    }
}