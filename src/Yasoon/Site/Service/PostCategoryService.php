<?php
/**
 * Author: Mihail Parandiy <parandiy.mihail@gmail.com>
 * Date: 29/01/14
 */



namespace Yasoon\Site\Service;

use JMS\DiExtraBundle\Annotation as DI;
use Symfony\Component\Security\Core\Exception\AccessDeniedException;
use Yasoon\Site\Entity\CategoryEntity;
use Yasoon\Site\Entity\PostCategoryEntity;
use Yasoon\Site\Entity\PostEntity;

error_reporting(E_ALL);

/**
 * @DI\Service("yasoon.service.postcategory")
 */
class PostCategoryService extends AbstractApiService {

    /**
     * @var \Symfony\Component\Security\Core\SecurityContextInterface
     *
     * @DI\Inject("security.context")
     */
    public  $securityContext;

    
    
    
    /**
     * @param $categoryId
     * @param $page
     * @param $itemsPerPage
     * @return array
     */
    public function getPostsByCategory($categoryId, $page, $itemsPerPage)
    {
        try {
            $offset = ($page*$itemsPerPage)-$itemsPerPage;
            
            $category = $this->em->getRepository('Yasoon\Site\Entity\PostCategoryEntity')
                ->createQueryBuilder('c');
            if($categoryId != 0)
            {
                $category->where('c.category_id = :cat_id')->setParameter('cat_id', $categoryId);
            }
            $category->groupBy('c.post_id');
            
            $category->leftJoin('c.post', 'p');
            
            $clone = clone $category;
            $all = $clone->orderBy('p.id', 'DESC')->getQuery()->getResult();
            $count_all = count($all);

            if($count_all < ($offset+$itemsPerPage))
            {
                //$itemsPerPage = ($count_all-$offset)-1;
            }
            //echo ' '.$count_all.' '.$offset.' '.$itemsPerPage.' ..'.($offset+$itemsPerPage).'.. ';
            
            
            if($count_all < 0)
            {
                $itemsPerPage = 0;
                $count_all = 0;
            }
            elseif($count_all == 0)
            {
                $itemsPerPage = 1;
                $count_all = 1;
                //echo 'test';
            }
            
            
            $results_postsDateSort = $category->setMaxResults($itemsPerPage)->setFirstResult($offset)->orderBy('p.date', 'DESC')->getQuery()->getResult();
            $results_postsRateSort = $category->setMaxResults($itemsPerPage)->setFirstResult($offset)->orderBy('p.likes', 'DESC')->getQuery()->getResult();
            $postsDateSort = [];
            $postsRateSort = [];
            foreach($results_postsDateSort as $i => $v)
            {
                try {
                //echo $i.' ';
                $post_categories = $results_postsDateSort[$i]->getPost()->getCategory();
                foreach($post_categories as $pc)
                {
                    $tags[] = $pc->getCategoryId();
                }
                $postsDateSort[] = ['id'          => $results_postsDateSort[$i]->getPost()->getId(),
                            'authorid'    => $results_postsDateSort[$i]->getPost()->getAuthorId(),
                            'autorName'   => $results_postsDateSort[$i]->getPost()->getAuthor()->getName(),
                            'tags'        => $tags,
                            'title'       => $results_postsDateSort[$i]->getPost()->getCaption(),
                            'description' => $results_postsDateSort[$i]->getPost()->getPreview(),
                            'text'        => $results_postsDateSort[$i]->getPost()->getText(),
                            'publishDate' => $results_postsDateSort[$i]->getPost()->getDate()->format('d/m/Y'),
                            'post_likes'  => $results_postsDateSort[$i]->getPost()->getLikes()];
                unset($tags);
                
                $post_categories = $results_postsRateSort[$i]->getPost()->getCategory();
                foreach($post_categories as $pc)
                {
                    $tags[] = $pc->getCategoryId();
                }
                $postsRateSort[] = ['id'          => $results_postsRateSort[$i]->getPost()->getId(),
                            'authorid'    => $results_postsRateSort[$i]->getPost()->getAuthorId(),
                            'autorName'   => $results_postsRateSort[$i]->getPost()->getAuthor()->getName(),
                            'tags'        => $tags,
                            'title'       => $results_postsRateSort[$i]->getPost()->getCaption(),
                            'description' => $results_postsRateSort[$i]->getPost()->getPreview(),
                            'text'        => $results_postsRateSort[$i]->getPost()->getText(),
                            'publishDate' => $results_postsRateSort[$i]->getPost()->getDate()->format('d/m/Y'),
                            'post_likes'  => $results_postsRateSort[$i]->getPost()->getLikes()];
                unset($tags);
                
                
                } catch(\Exception $e) {
                    $count_all--;
                }
            }
        } catch(\Exception $e) {
            return ['error' => true, 'errorText' => $e->getMessage()];
        }
        
        $result = ['dateSort'   => $postsDateSort,
                   'rateSort'   => $postsRateSort,
                   'postsCount' => $count_all];
        
        return $result;
    }
    
    
    
    /**
     * @param $categoryId
     * @param $catpage
     * @return array
     */
    public function getPostsByAuthorCategory($categoryId, $page, $itemsPerPage)
    {
        try {
            $result =  [];
            $offset = ($page*$itemsPerPage)-$itemsPerPage;
            
            $authors = [];
            if($categoryId == 0)
            {
                /*$post = $this->em->getRepository('Yasoon\Site\Entity\PostEntity')->findAll();
                foreach($post as $p)
                {
                    if(!array_key_exists($p->getAuthorId(), $authors))
                    {
                        $authors[$p->getAuthorId()]['likes'] = 0;
                        $authors[$p->getAuthorId()]['posts'] = 0;
                    }
                    
                    
                    $authors[$p->getAuthorId()]['posts'] = $authors[$p->getAuthorId()]['posts'] += 1;
                    $authors[$p->getAuthorId()]['likes'] = $authors[$p->getAuthorId()]['likes'] += ($p->getLikes()*1);
                }*/
                
                $authors_data = $this->em->getRepository('Yasoon\Site\Entity\AuthorEntity')->findAll();
                foreach($authors_data as $ad)
                {
                    if(count($ad->getPosts()) == 0)
                    {
                        continue;
                    }
                    if(!array_key_exists($ad->getId(), $authors))
                    {
                        $authors[$ad->getId()]['likes'] = 0;
                        $authors[$ad->getId()]['posts'] = 0;
                    }
                    
                    $authors[$ad->getId()]['likes'] = 0;
                    $posts = $ad->getPosts();
                    foreach ($posts as $p)
                    {
                        $authors[$ad->getId()]['likes'] = $authors[$ad->getId()]['likes'] += ($p->getLikes()*1);
                    }
                    
                    $authors[$ad->getId()]['posts'] = count($posts);
                }
            }
            else
            {
                $category = $this->em->getRepository('Yasoon\Site\Entity\PostCategoryEntity')
                    ->createQueryBuilder('c')
                    ->where('c.category_id = :cat_id')
                    ->setParameter('cat_id', $categoryId)
                    ->leftJoin('c.post', 'p')
                    ->getQuery()
                    ->getResult();
                foreach($category as $cat)
                {
                    if(!array_key_exists($cat->getPost()->getAuthorId(), $authors))
                    {
                        $authors[$cat->getPost()->getAuthorId()]['likes'] = 0;
                        $authors[$cat->getPost()->getAuthorId()]['posts'] = 0;
                    }
                    
                    
                    $authors[$cat->getPost()->getAuthorId()]['posts'] = $authors[$cat->getPost()->getAuthorId()]['posts'] += 1;
                    $authors[$cat->getPost()->getAuthorId()]['likes'] = $authors[$cat->getPost()->getAuthorId()]['likes'] += ($cat->getPost()->getLikes()*1);
                }
            }
            arsort($authors);
            
            $limit = $offset+$itemsPerPage;
            
            $i = 0;
            foreach($authors as $k => $v)
            {
                $i++;
                if($i > $offset && $i <= $limit)
                {
                    $result[$k] = $authors[$k];
                }
            }
        } catch(\Exception $e) {
            return ['error' => true, 'errorText' => $e->getMessage()];
        }
        
        return array('count_all' => count($authors), 'result' =>$result);
    }
}