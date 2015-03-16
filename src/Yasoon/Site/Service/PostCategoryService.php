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
use Yasoon\Site\Entity\ReviewEntity;

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
    public function getPostsByCategory($categoryId, $page, $itemsPerPage, $sort)
    {
        $daysLimit = $this->em->getRepository('Yasoon\Site\Entity\ContentEntity')->find(74);
        $dateTime = new \DateTime('-'.$daysLimit->getText().' day');
        try {
            $offset = ($page*$itemsPerPage)-$itemsPerPage;
            
            $minLikesCount = $this->em->getRepository('Yasoon\Site\Entity\ContentEntity')->find(75);
            $daysLimit = $this->em->getRepository('Yasoon\Site\Entity\ContentEntity')->find(74);
            $dateTime = new \DateTime('-'.$daysLimit->getText().' day');
            
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
            if (!empty($all)) {
                 if ($sort == 'dateSort') {
                     if ($minLikesCount->getText() == '0') {
                         $all = $clone
                           ->andWhere('p.date >= :dateTime')
                           ->setParameter('dateTime', $dateTime)
                           ->orderBy('p.id', 'DESC')
                           ->getQuery()->getResult();
                     } else {
                        $all = $clone->andWhere('p.likes >= :likes')
                           ->andWhere('p.date >= :dateTime')
                           ->setParameter('dateTime', $dateTime)
                           ->setParameter('likes', (int) $minLikesCount->getText())
                           ->orderBy('p.id', 'DESC')
                           ->getQuery()->getResult();
                     }
                 }
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
                
                $results_postsSort = null;
                if ($sort == 'dateSort') {
                    $results_postsSort = $category
                        ->setMaxResults($itemsPerPage)
                        ->setFirstResult($offset)
                        ->andWhere('p.likes >= :likes')
                        ->andWhere('p.date >= :dateTime')
                        ->setParameter('dateTime', $dateTime)
                        ->setParameter('likes', (int) $minLikesCount->getText())
                        ->orderBy('p.date', 'DESC')
                        ->getQuery()
                        ->getResult();
                } else {
                    $results_postsSort = $category
                        ->setMaxResults($itemsPerPage)
                        ->setFirstResult($offset)
                        ->orderBy('p.likes', 'DESC')
                        ->getQuery()
                        ->getResult();
                }
                $postsSort = [];
                foreach($results_postsSort as $i => $v)
                { 
                    if (!empty($results_postsSort[$i]->getPost())) {
                        $post = $results_postsSort[$i]->getPost();
                        try {
                        
                            //echo $i.' ';
                            $post_categories = $post->getCategory();
                            $id = $post->getId();

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
                                $interviewName = $post->getInterview()->getName();
                            } 
                            $timeToRead = round($strLength/4200);

                            foreach($post_categories as $pc)
                            {
                                $tags[] = $pc->getCategoryId();
                            }
                            $user = 'user';
                            $role = $post->getAuthor()->getRole();
                            if ($role == 4) {
                                $user = 'admin';
                            }
                            $postsSort[] = ['id'    => $id,
                                        'authorId'      => $post->getAuthorId(),
                                        'authorName'    => $post->getAuthor()->getName(),
                                        'tags'          => $tags,
                                        'title'         => $post->getCaption(),
                                        'description'   => $post->getPreview(),
                                        'text'          => $post->getText(),
                                        'publishDate'   => $post->getDate()->format('d/m/Y'),
                                        'post_likes'    => $post->getLikes(),
                                        'timeToRead'    => $timeToRead,
                                        'avatarImg'     => $post->getAuthor()->getImage(),
                                        'interview_name'=> $interviewName,
                                        'interview_id'  => $post->getInterview()->getId(),
                                        'previewPostImg'=> $post->getPreviewImg(),
                                        'user'          => $user,
                                        'type'          => 'post'];
                        
                            unset($tags);
                        } catch(\Exception $e) {
                            $count_all--;
                        }
                    }
                
                }
                
                
            }
            
            $reviews = $this->getReviews($categoryId, $itemsPerPage, $offset, $sort, $minLikesCount, $dateTime);
            $allResults =[];
            if (!empty($postsSort) ) {
                if (!empty($reviews)) {
                    $allResults = array_merge($postsSort, $reviews);
                } else {
                    $allResults = $postsSort;
                }
            } else {
                if (!empty($reviews)) {
                    $allResults = $reviews;
                    $count_all = count($reviews);
                } else {
                    return ['error' => true, 'errorText' => 'Нет отзывов и интервью по этой тематике']; 
                }
            }
            
            $name = 'publishDate';
            usort($allResults, function ($a, $b) use(&$name){
                return $a[$name] - $b[$name];
            });
        } catch(\Exception $e) {
            //return ['error' => true, 'errorText' => $e->getMessage()];
        }
        
        $result = ['error' => false, $sort   => $allResults,
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
    
    protected function getReviews($categoryId,$itemsPerPage, $offset, $sort, $minLikesCount, $dayLimit)
    {
        if ($categoryId == 0) {
            $categoriesAll = $this->em->getRepository('Yasoon\Site\Entity\CategoryEntity')->findAll();
        } else {
            $category = $this->em->getRepository('Yasoon\Site\Entity\CategoryEntity')->find($categoryId);

            $categoriesAll = $this->em->getRepository('Yasoon\Site\Entity\CategoryEntity')
                    ->createQueryBuilder('c')
                    ->where('c.path LIKE :text')
                    ->setParameter('text', '%'.$category->getPath().'%')
                    ->getQuery()
                    ->getResult();
        }
        $categories =[];
        foreach ($categoriesAll as $categoryOne) {
            $categories[] = $categoryOne->getId();  
        }

        $results_reviewsSort = null;
        if ($sort == 'dateSort') {
            $results_reviewsSort =  $this->em->createQueryBuilder()
                ->select('p')
                ->from('Yasoon\Site\Entity\ReviewEntity', 'p')
                ->setMaxResults($itemsPerPage)
                ->setFirstResult($offset)
                ->where('p.categoryId IN (:categories)')
                ->andWhere('p.date >= :dateTime')
                ->andWhere('p.likes >= :likes')
                ->setParameter('categories', $categories)
                ->setParameter('dateTime', $dayLimit)
                ->setParameter('likes', (int) $minLikesCount->getText())
                ->orderBy('p.date', 'DESC')
                ->getQuery()
                ->getResult();
        } else {
            $results_reviewsSort =$this->em->createQueryBuilder()
                ->select('p')
                ->from('Yasoon\Site\Entity\ReviewEntity', 'p')
                ->setMaxResults($itemsPerPage)
                ->setFirstResult($offset)
                ->where('p.categoryId IN (:categories)')
                ->setParameter('categories', $categories)
                ->orderBy('p.likes', 'DESC')
                ->getQuery()
                ->getResult();
        }
        $reviewsSort = [];
        foreach($results_reviewsSort as $review)
        { 
            $category = $this->em->getRepository('Yasoon\Site\Entity\CategoryEntity')
                    ->find($review->getCategoryId());
            if (!empty($category)) {
                $types = [];
                $review_types = $this->em->getRepository('Yasoon\Site\Entity\ReviewTypesEntity')
                        ->findAll();
                foreach ($review_types as $type) {
                    $reviewType = $this->em->getRepository('Yasoon\Site\Entity\ReviewTypeRelationsEntity')
                            ->findOneBy(array('reviewId' => $review->getId(), 'typeId' => $type->getId()));
                    $selectedValue = !empty($reviewType) ? "selected" : "";
                    $types[] = array('id' => $type->getId(), 'name' => $type->getName(), 'selected' => $selectedValue);
                }

                $reviewsSort[] = [
                    'id'            => $review->getId(),
                    'authorId'      => $review->getAuthorId(),
                    'authorName'    => $review->getAuthor()->getName(),
                    'avatarImg'     => $review->getAuthor()->getImage(),
                    'title'         => $review->getTitle(),
                    'description'   => $review->getDescription(),
                    'rating'        => $review->getRating(),
                    'publishDate'   => $review->getDate()->format('d/m/Y'),
                    'expert'        => $review->getExpert(),
                    'category'      => $category->getTitle(),
                    'categoryId'    => $category->getId(),
                    'question1'     => $review->getQuestion1(),
                    'question2'     => $review->getQuestion2(),
                    'prospects'     => $review->getProspects(),
                    'types'         => $types,
                    'post_likes'    => $review->getLikes(),
                    'type'          => 'review'
                ];
            }
        }
        
        return $reviewsSort;
    }
    
}