<?php
/**
 * Author: Fedor Avetisov <cousenavi@gmail.com>
 * Date: 5/26/13
 */

namespace Yasoon\Site\Service;


use Yasoon\Site\Entity\AuthorEntity;

class AuthorService extends AbstractApiService {

    public function add(array $model) {
        $entity = (new AuthorEntity());

        parent::add($entity);
    }
}