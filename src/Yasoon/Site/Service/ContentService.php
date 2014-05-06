<?php
/**
 * Author: Fedor Avetisov <cousenavi@gmail.com>
 * Date: 5/26/13
 */

namespace Yasoon\Site\Service;

use JMS\DiExtraBundle\Annotation as DI;
use Yasoon\Site\Entity\AuthorEntity;
use Yasoon\Site\Entity\ContentEntity;
use Yasoon\Site\Entity\ContentTagsEntity;
use Yasoon\Site\Entity\PostEntity;
use Yasoon\Site\Entity\QuestionEntity;

/**
 * @DI\Service("yasoon.service.content")
 */
class ContentService extends AbstractApiService {

    /**
     * @var \Symfony\Component\Security\Core\SecurityContextInterface
     *
     * @DI\Inject("security.context")
     */
    public  $securityContext;

    /**
     * @param array $model
     * @return array
     */
    public function editRow(array $model) {

        $this->checkAdminAccess();

        /** @var ContentEntity $entity */
        $entity = $this->em->getRepository('Yasoon\Site\Entity\ContentEntity')->find($model['id']);

        $entity->setDescription($model['description'])->setText($model['text'])->setTagId($model['tagId']);

        $this->em->merge($entity);
        $this->em->flush();

        return [
            'id' => $entity->getId(),
            'description' => $entity->getDescription(),
            'text' => $entity->getText(),
            'tagId' => $entity->getTagId()
        ];
    }
    
    /**
     * @param array $model
     * @return array
     */
    public function addRow(array $model) {

        $this->checkAdminAccess();

        /** @var ContentEntity $entity */
        $entity = (new ContentEntity())->setDescription($model['description'])->setText($model['text'])->setTagId($model['tagId']);

        $this->em->persist($entity);
        $this->em->flush();

        return [
            'id' => $entity->getId(),
            'description' => $entity->getDescription(),
            'text' => $entity->getText(),
            'tagId' => $entity->getTagId()
        ];
    }

    /**
     * @return array
     */
    public function getAllContent($tagId) {

        $result = [];

        $entities = $this->em->getRepository('Yasoon\Site\Entity\ContentEntity');

        if($tagId != '0')
        {
            $entities = $entities->findBy(array('tagId' => $tagId));
        }
        else
        {
            $entities = $entities->findAll();
        }
        

        foreach ($entities as $entity) {
            $result[] = [
                'id' => $entity->getId(),
                'description' => $entity->getDescription(),
                'text' => $entity->getText(),
                'tagId' => $entity->getTagId() 
            ];
        }

        return $result;
    }
    
    /**
     * @param array $id
     * @return array
     */
    public function deleteRow($id)
    {
        try {
            $entity = $this->em->getRepository('Yasoon\Site\Entity\ContentEntity')->find($id);
            $this->em->remove($entity);
            $this->em->flush();
            
            return ['id' => $id];
        } catch(\Exception $e) {
            return ['error' => true, 'errorText' => $e->getMessage()];
        }
    }
    
    
    /**
     * @return array
     */
    public function getAllTags() {

        $result = [];

        $entities = $this->em->getRepository('Yasoon\Site\Entity\ContentTagsEntity')->findAll();

        foreach ($entities as $entity) {
            $result[] = [
                'id' => $entity->getId(),
                'name' => $entity->getName(),
                'value' => $entity->getValue()
            ];
        }

        return $result;
    }
    
    
    /**
     * @param array $model
     * @return array
     */
    public function addTag(array $model) {

        $this->checkAdminAccess();

        /** @var ContentTagsEntity $entity */
        $entity = (new ContentTagsEntity())->setName($model['name'])->setValue($model['value']);

        $this->em->persist($entity);
        $this->em->flush();

        return [
            'id' => $entity->getId(),
            'name' => $entity->getName(),
            'value' => $entity->getValue()
        ];
    }
    
    

    /**
     * @param array $model
     * @return array
     */
    public function editTag(array $model) {

        $this->checkAdminAccess();

        /** @var ContentEntity $entity */
        $entity = $this->em->getRepository('Yasoon\Site\Entity\ContentTagsEntity')->find($model['id']);

        $entity->setName($model['name'])->setValue($model['value']);

        $this->em->merge($entity);
        $this->em->flush();

        return [
            'id' => $entity->getId(),
            'name' => $entity->getName(),
            'value' => $entity->getValue()
        ];
    }
    
    
    /**
     * @param array $id
     * @return array
     */
    public function deleteTag($id)
    {
        try {
            $entity = $this->em->getRepository('Yasoon\Site\Entity\ContentTagsEntity')->find($id);
            $this->em->remove($entity);
            $this->em->flush();
            
            return ['id' => $id];
        } catch(\Exception $e) {
            return ['error' => true, 'errorText' => $e->getMessage()];
        }
    }
}
