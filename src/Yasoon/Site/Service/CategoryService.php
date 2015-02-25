<?php
/**
 * Author: Mihail Parandiy <parandiy.mihail@gmail.com>
 * Date: 29/01/14
 */



namespace Yasoon\Site\Service;

use JMS\DiExtraBundle\Annotation as DI;
use Symfony\Component\Security\Core\Exception\AccessDeniedException;
use Yasoon\Site\Entity\CategoryEntity;


error_reporting(0);

/**
 * @DI\Service("yasoon.service.category")
 */
class CategoryService extends AbstractApiService {

    /**
     * @var \Symfony\Component\Security\Core\SecurityContextInterface
     *
     * @DI\Inject("security.context")
     */
    public  $securityContext;

    
    /**
     * @param 
     * @return array
     */
    public function getCategoryList() {
        
        /** @var CategoryEntity[] $categories */
        $categories = $this->em->getRepository('Yasoon\Site\Entity\CategoryEntity')->findBy([], ['name' => 'asc']);

        
        $result = [];
        foreach($categories as $cat)
        {
            $result[] = [
                'id' => $cat->getId(),
                'name' => $cat->getName(),
                'description' => $cat->getDescription()
            ];
        }
        return $result;
    }
    
    public function getAllByText($text) {
        
        $result = ['error' => true, 'errorText' => 'Нет совпадений'];
        
        $searchResults = $this->em->getRepository('Yasoon\Site\Entity\CategoryEntity')
                ->createQueryBuilder('c')
                ->where('c.path LIKE :text')
                ->setParameter('text', '%'.$text.'%')
                ->getQuery()
                ->getResult();
        
        $categories = [];
        foreach ($searchResults as $searchResult) {
            $id = $searchResult->getId();
            $last = $this->em->getRepository('Yasoon\Site\Entity\CategoryEntity')->findBy(array('parent' => $id));
            if (empty($last)) {
                $string = $searchResult->getPath();
                $string1 = rtrim($string, ",");
                $string2 = str_replace($text,'<b>'.$text.'</b>', $string1);
                $categories[] =  array('id' => $id, 'text' => $string2);
            } 
        }
        
        if (!empty($categories)) {
            $result = ['error' => false, 'result' => $categories];
        }
        
        return $result;
    }
    
    public function getById($id) {
        $result = ['error' => true, 'errorText' => 'Данная категория отсутствует. Выберите другую или попробуйте позже!'];
        
        $category = $this->em->getRepository('Yasoon\Site\Entity\CategoryEntity')->find($id);
        if (!empty($category)) {
            $types = [];
            $review_types = $this->em->getRepository('Yasoon\Site\Entity\ReviewTypesEntity')->findAll();
            foreach ($review_types as $type) {
                $types[] = array('id' => $type->getId(), 'name' => $type->getName());
            }
            if (!empty($types)) {
                $result = ['error' => false, 'result' => array('categoryId' => $category->getId(),'category' => $category->getTitle(), 'types' => $types)];
            }
        }
        
        return $result;
    }
}