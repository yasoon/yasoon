<?php
/**
 * Author: Fedor Avetisov <cousenavi@gmail.com>
 * Date: 5/26/13
 */

namespace Yasoon\Site\Service;

use JMS\DiExtraBundle\Annotation as DI;
use Symfony\Component\Security\Core\Exception\AccessDeniedException;
use Yasoon\Site\Entity\AuthorEntity;
use Yasoon\Site\Entity\ContentEntity;
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


    private function checkAdminAccess() {
        if (!$this->securityContext->getToken()->getRoles() || 'ROLE_ADMIN' != $this->securityContext->getToken()->getRoles()[0]->getRole()) {
            throw new AccessDeniedException();
        }
    }

    /**
     * @param array $model
     * @return array
     */
    public function editRow(array $model) {

        $this->checkAdminAccess();

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
     * @param bool $isAdmin
     *
     * @return array
     */
    public function getAllContent($isAdmin = false) {

        if ($isAdmin) {
            $this->checkAdminAccess();
        }

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