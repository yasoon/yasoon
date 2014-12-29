<?php
/**
 * Author: Mihail Parandiy <parandiy.mihail@gmail.com>
 * Date: 29/01/14
 */



namespace Yasoon\Site\Service;

use JMS\DiExtraBundle\Annotation as DI;
use Symfony\Component\Security\Acl\Exception\Exception;
use Symfony\Component\Security\Core\Exception\AccessDeniedException;
use Yasoon\Site\Entity\CategoryEntity;
use Yasoon\Site\Entity\PostCategoryEntity;
use Yasoon\Site\Entity\PostEntity;
use Yasoon\Site\Entity\PostAnswerEntity;

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
                $id = $results_postsDateSort[$i]->getPost()->getId();
                
                $post_answers = $this->em->getRepository('Yasoon\Site\Entity\PostAnswerEntity')->findBy(array('post_id' => $id));
                $strLength = 0;
                $interviewLego = 0;
                foreach ($post_answers as $answer) {
                   $strLength += strlen(strip_tags($answer->getAnswer()));
                   if ($answer->getLego() > 0) {
                       $interviewLego++;
                   }
                }
                $interviewName = '';
                if ($interviewLego > 0) {
                    $interviewName = $results_postsDateSort[$i]->getPost()->getInterview()->getName();
                } 
                $timeToRead = round($strLength/4200);
                
                foreach($post_categories as $pc)
                {
                    $tags[] = $pc->getCategoryId();
                }
                $postsDateSort[] = ['id'    => $id,
                            'authorId'      => $results_postsDateSort[$i]->getPost()->getAuthorId(),
                            'authorName'    => $results_postsDateSort[$i]->getPost()->getAuthor()->getName(),
                            'tags'          => $tags,
                            'title'         => $results_postsDateSort[$i]->getPost()->getCaption(),
                            'description'   => $results_postsDateSort[$i]->getPost()->getPreview(),
                            'text'          => $results_postsDateSort[$i]->getPost()->getText(),
                            'publishDate'   => $results_postsDateSort[$i]->getPost()->getDate()->format('d/m/Y'),
                            'post_likes'    => $results_postsDateSort[$i]->getPost()->getLikes(),
                            'timeToRead'    => $timeToRead,
                            'avatarImg'     => $results_postsDateSort[$i]->getPost()->getAuthor()->getImage(),
                            'interview_name'=> $interviewName,
                            'interview_id'=> $results_postsDateSort[$i]->getPost()->getInterview()->getId()];
                unset($tags);
                
                $post_categories = $results_postsRateSort[$i]->getPost()->getCategory();
                
                $id_Rate = $results_postsRateSort[$i]->getPost()->getId();
                
                $post_answers_Rate = $this->em->getRepository('Yasoon\Site\Entity\PostAnswerEntity')->findBy(array('post_id' => $id_Rate));
                $strLength_Rate = 0;
                $interviewLegoRate = 0;
                foreach ($post_answers_Rate as $answer_rate) {
                   $strLength_Rate += strlen(strip_tags($answer_rate->getAnswer()));
                   if ($answer_rate->getLego() > 0) {
                       $interviewLegoRate++;
                   }
                }
                
                $interviewNameRate = '';
                if ($interviewLegoRate > 0) {
                    $interviewNameRate = $results_postsRateSort[$i]->getPost()->getInterview()->getName();
                } 
                $timeToReadRate = round($strLength_Rate/4200);
                foreach($post_categories as $pc)
                {
                    $tags[] = $pc->getCategoryId();
                }
                $postsRateSort[] = ['id'    => $id_Rate,
                            'authorId'      => $results_postsRateSort[$i]->getPost()->getAuthorId(),
                            'authorName'    => $results_postsRateSort[$i]->getPost()->getAuthor()->getName(),
                            'tags'          => $tags,
                            'title'         => $results_postsRateSort[$i]->getPost()->getCaption(),
                            'description'   => $results_postsRateSort[$i]->getPost()->getPreview(),
                            'text'          => $results_postsRateSort[$i]->getPost()->getText(),
                            'publishDate'   => $results_postsRateSort[$i]->getPost()->getDate()->format('d/m/Y'),
                            'post_likes'    => $results_postsRateSort[$i]->getPost()->getLikes(),
                            'timeToRead'    => $timeToReadRate,
                            'avatarImg'     => $results_postsRateSort[$i]->getPost()->getAuthor()->getImage(),
                            'interview_name'=> $interviewName,
                            'interview_id'=> $results_postsRateSort[$i]->getPost()->getInterview()->getId()];
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
                foreach ($category as $cat) {
                    try {
                        $post_author = $cat->getPost()->getAuthorId();
                        if (!array_key_exists($post_author, $authors)) {
                            $authors[$post_author]['likes'] = 0;
                            $authors[$post_author]['posts'] = 0;
                        }

                        $authors[$post_author]['posts'] = $authors[$post_author]['posts'] += 1;
                        $authors[$post_author]['likes'] = $authors[$post_author]['likes'] += ($cat->getPost()->getLikes() * 1);

                    } catch (\Exception $e) {

                    }
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