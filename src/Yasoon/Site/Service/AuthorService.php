<?php
/**
 * Author: Fedor Avetisov <cousenavi@gmail.com>
 * Date: 5/26/13
 */

namespace Yasoon\Site\Service;

use JMS\DiExtraBundle\Annotation as DI;
use Yasoon\Site\Entity\AuthorEntity;

/**
 * @DI\Service("yasoon.author.service")
 */
class AuthorService extends AbstractApiService {

    public function add(array $model) {
        $entity = (new AuthorEntity())
            ->setName($model['name']);

        parent::add($entity);
    }

    public function update(array $model) {
        $entity = (new AuthorEntity())
            ->setId($model['id'])
            ->setName($model['name']);

        parent::update($entity);
    }

    public function delete(array $model) {
        $entity = (new AuthorEntity())
            ->setId($model['id']);

        parent::delete($entity);
    }
}