<?php
/**
 * Author: Fedor Avetisov <cousenavi@gmail.com>
 * Date: 5/26/13
 */

namespace Yasoon\Site\Service;

use JMS\DiExtraBundle\Annotation as DI;
use Yasoon\Site\Entity\AuthorEntity;
use Yasoon\Site\Entity\ContentEntity;
use Yasoon\Site\Entity\PostEntity;
use Yasoon\Site\Entity\QuestionEntity;

/**
 * @DI\Service("yasoon.service.content")
 */
class ContentService extends AbstractApiService {

    /**
     * @param array $model
     * @return array
     */
    public function editRow(array $model) {
        /** @var ContentEntity $entity */
        $entity = $this->em->getRepository('Yasoon\Site\Entity\ContentEntity')->find($model['id']);

        $entity->setDescription($model['description'])->setText($model['text']);

        $this->em->merge($entity);
        $this->em->flush();

        return [
            'id' => $entity->getId(),
            'description' => $entity->getDescription(),
            'text' => $entity->getText()
        ];
    }

    /**
     * @return array
     */
    public function getAllContent() {
        $result = [];

        $entities = $this->em->getRepository('Yasoon\Site\Entity\ContentEntity')->findAll();

        foreach ($entities as $entity) {
            $result[] = [
                'id' => $entity->getId(),
                'description' => $entity->getDescription(),
                'text' => $entity->getText()
            ];
        }

        return $result;
    }

}