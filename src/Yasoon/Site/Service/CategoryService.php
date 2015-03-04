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
    public function getCategoryList($lvl = 1) {
        
        /** @var CategoryEntity[] $categories */
        $categories = $this->em->getRepository('Yasoon\Site\Entity\CategoryEntity')->findBy(['level' => $lvl]);

        $result = [];
        foreach($categories as $cat)
        {
            $result[] = [
                'id'            => $cat->getId(),
                'name'          => $cat->getTitle(),
                'description'   => $cat->getDescription(),
                'parentId'      => $cat->getParent()
            ];
        }
        
        return $result;
    }
    
    public function getAllByText($text) 
    {
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
    
    public function getCategoryListById($id) 
    { 
        $result = ['error' => true, 'errorText' => 'Нет совпадений'];
        
        $category = $this->em->getRepository('Yasoon\Site\Entity\CategoryEntity')->find($id);
        
        if (!empty($category)) {
            
            $lvl = $category->getLevel() + 1;
            $searchResults = $this->em->getRepository('Yasoon\Site\Entity\CategoryEntity')
                ->createQueryBuilder('c')
                ->where('c.path LIKE :path')
                ->andWhere('c.level = :level')
                ->setParameter('path', '%'.$category->getPath().'%')
                ->setParameter('level', $lvl)
                ->orderBy('c.path', 'ASC')
                ->getQuery()
                ->getResult();

            $parentId = $category->getParentId() == null ? 0 : $category->getParentId();
            $categories['parent'] = array(
                    'id'            => $id, 
                    'name'          => $category->getTitle(), 
                    'parentId'      => $parentId, 
                    'type'          => 'parent');
            foreach ($searchResults as $searchResult) {
                $categories['categories'][] =  array(
                    'id'            => $searchResult->getId(), 
                    'name'          => $searchResult->getTitle(), 
                    'description'   => $searchResult->getDescription(),
                    'type'          => 'child');
            }
            
            $lvlOld = $category->getLevel();

            $path = explode(",", $category->getPath());
            $searchCategories = $this->em->getRepository('Yasoon\Site\Entity\CategoryEntity')
                ->createQueryBuilder('c')
                ->where('c.path LIKE :path')
                ->andWhere('c.level < :level')
                ->setParameter('path', '%'.$path[0].'%')
                ->setParameter('level', $lvlOld)
                ->orderBy('c.path', 'DESC')
                ->getQuery()
                ->getResult();
            
            $categoryPath = [];
            
            $categoryPath[] = array(
                'id' => $category->getId(),
                'name' => $category->getTitle()
            );
            foreach ($searchCategories as $key => $oneCategory) {
                
                if (($key > 0 && $oneCategory->getId() == $searchCategories[$key-1]->getParentId())
                    || $oneCategory->getId() == $category->getParentId()) {
                    
                    $categoryPath[] = array(
                        'id' => $oneCategory->getId(),
                        'name' => $oneCategory->getTitle()
                    );
                }
            }

            $result = ['error' => false, 'result' => $categories, 'path' => array_reverse($categoryPath)];

        }
        return $result;
    }
    
}