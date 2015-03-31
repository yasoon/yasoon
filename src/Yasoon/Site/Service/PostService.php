<?php
/**
 * Author: Fedor Avetisov <cousenavi@gmail.com>
 * Date: 5/26/13
 */



namespace Yasoon\Site\Service;

use JMS\DiExtraBundle\Annotation as DI;
use Symfony\Component\HttpFoundation\Session\Session;
use Symfony\Component\Config\Definition\Exception\Exception;
use Symfony\Component\Security\Core\Exception\AccessDeniedException;
use Yasoon\Site\Entity\AuthorEntity;
use Yasoon\Site\Entity\PostEntity;
use Yasoon\Site\Entity\ReviewEntity;
use Yasoon\Site\Entity\PostCategoryEntity;
use Yasoon\Site\Entity\PostAnswerEntity;
use Yasoon\Site\Entity\PostLikesEntity;
use Yasoon\Site\Entity\ReviewLikesEntity;
use Yasoon\Site\Entity\PostOfTheDayEntity;
use Yasoon\Site\Entity\QuestionEntity;
use Yasoon\Site\Entity\TimelineEntity;
use Yasoon\Site\Entity\PostsTimelineEntity;
use Yasoon\Site\Entity\ReviewTypeRelationsEntity;
use Symfony\Component\Debug\Debug;

//Debug::enable();

error_reporting(0);

/**
 * @DI\Service("yasoon.service.post")
 */
class PostService extends AbstractApiService {

    /**
     * @var \Symfony\Component\Security\Core\SecurityContextInterface
     *
     * @DI\Inject("security.context")
     */
    public  $securityContext;


    /**
     * @var AllfService
     *
     * @DI\Inject("yasoon.service.allf")
     */
    public $allf;


    /**
     * @param array $post
     * @return array
     * @throws \Symfony\Component\Security\Core\Exception\AccessDeniedException
     */
    public function addPost(array $post, $url) {
        $authorId = (int) $this->securityContext->getToken()->getUsername();
        if (!is_int($authorId)) {
            throw new AccessDeniedException();
        }

        $place = $this->em->createQueryBuilder()->select('max(post.place) as place')
            ->from('Yasoon\Site\Entity\PostEntity', 'post')->where("post.authorId = $authorId")->getQuery()->getSingleResult()['place'];

        //echo $post['questionList'][1]['id'];
        //die;
        try {
            /** @var $postEntity PostEntity */
            $postEntity = (new PostEntity())
                ->setCaption($post['title'])
                ->setPreview($post['description'])
                ->setPreviewImg($url)
                ->setText('')
                ->setPlace((int)$place)
                ->setAuthorId($authorId)
                ->setInterviewId($post['interviewId'])
                ->setDate(new \DateTime())
                ->setLikes(0)
                ->setVisits(0);
            $postEntity->setAuthor($this->em->getReference('Yasoon\Site\Entity\AuthorEntity', $authorId));
            $postEntity->setInterview($this->em->getReference('Yasoon\Site\Entity\InterviewEntity', $post['interviewId']));
            $this->em->persist($postEntity);
            $this->em->flush();

            $post_id = $postEntity->getId();

            if(isset($post['category']) && count($post['category']) > 0)
            {
                foreach($post['category'] as $category)
                {
                    $postCategoryEntity = (new PostCategoryEntity())
                        ->setPostId($post_id)
                        ->setCategoryId($category*1);
                    $postCategoryEntity->setPost($postEntity);

                    $this->em->persist($postCategoryEntity);
                    $this->em->flush();
                }
            }

            # Считывание массива $post['text'] и добавление ответов в таблицу answer_question
            if(isset($post['text']) && count($post['text']) > 0)
            {
                $i = 0; // счетчик для индекса массива $post['interviewQuestions']
                foreach($post['text'] as $quest)
                {
                    $postAnswerEntity = (new PostAnswerEntity())
                        ->setPostId($post_id)
                        ->setQuestionId($post['interviewQuestions'][$quest['id']]['question_id']*1)
                        ->setAnswer($quest['text'])
                        ->setLego('0');
                    $postAnswerEntity->setPost($postEntity);
                    $postAnswerEntity->setQuestion($this->em->getReference('Yasoon\Site\Entity\InterviewQuestionEntity',
                        $post['interviewQuestions'][$quest['id']]['question_id']*1));

                    $this->em->persist($postAnswerEntity);
                    $this->em->flush();
                    $i++;
                }
            }

            $friends = $this->em->getRepository('Yasoon\Site\Entity\AuthorEntity')->find($authorId)->getWriters();


            foreach($friends as $friend)
            {
                try {
                    $postTimelineEntity = (new PostsTimelineEntity())
                        ->setPostId($post_id)
                        ->setAuthorId($friend->getId());

                    $this->em->persist($postTimelineEntity);
                    $this->em->flush();
                } catch(Exception $e) {
                    return ['error' => true, 'errorText' => $e->getMessage()];
                }
            }

            /*$data = ['id' => 'post_'.$postEntity->getId(),
                     'url' => 'http://'.$_SERVER['HTTP_HOST'].'/#post/'.$postEntity->getId(),
                     'image' => '',
                     'subtype' => 'post',
                     'sumtext' => trim(strip_tags($postEntity->getPreview())).' ' .trim(strip_tags($postEntity->getText())),
                     'tags' => '"Posts"',
                     'body' => trim(strip_tags($postEntity->getText())),
                     'date' => date('Y-m-d\TH:i:s', $postEntity->getDate()->getTimestamp()),
                     'title' => trim( strip_tags($postEntity->getCaption()))];

            $this->allf->indexistoQueryAdd($data);*/

        } catch(\Exception $e) {
            return ['error' => true, 'errorText' => $e->getMessage()];
        }

        $result = ['error' => false, 'postId' => $postEntity->getId()];

        return $result;

    }
    
    /**
     * @param array $post
     * @return array
     * @throws \Symfony\Component\Security\Core\Exception\AccessDeniedException
     */
    public function addReview($data) {
        $review = [];
        parse_str($data, $review);
        $authorId = (int) $this->securityContext->getToken()->getUsername();
        if (!is_int($authorId)) {
            throw new AccessDeniedException();
        }
        
        

        try {
            $review['question1'] = empty($review['question1']) ? 0 : $review['question1'];
            $review['question2'] = empty($review['question2']) ? 0 : $review['question2'];
            
            if (!empty($review['reviewId'])) {
                $reviewEntity = $this->em->getRepository('Yasoon\Site\Entity\ReviewEntity')->find($review['reviewId']);
                $reviewEntity->setTitle($review['title'])
                    ->setText($review['text'])
                    ->setDescription($review['description'])
                    ->setExpert($review['expert'])
                    ->setQuestion1($review['question1'])
                    ->setQuestion2($review['question2'])
                    ->setProspects($review['prospects'])
                    ->setRating($review['rating']);
                $this->em->persist($reviewEntity);
                $this->em->flush();
            } else {
                /** @var $reviewEntity ReviewEntity */
                $status = $authorId == 0 ? 'draft' : 'saved';
                $reviewEntity = (new ReviewEntity())
                    ->setTitle($review['title'])
                    ->setText($review['text'])
                    ->setDescription($review['description'])
                    ->setCategoryId($review['category-id'])
                    ->setAuthorId($authorId)
                    ->setStatus($status)
                    ->setDate(new \DateTime())
                    ->setExpert($review['expert'])
                    ->setQuestion1($review['question1'])
                    ->setQuestion2($review['question2'])
                    ->setProspects($review['prospects'])  
                    ->setRating($review['rating'])
                    ->setLikes(0)
                    ->setVisits(0);
                $reviewEntity->setAuthor($this->em->getReference('Yasoon\Site\Entity\AuthorEntity', $authorId));
                $this->em->persist($reviewEntity);
                $this->em->flush();

                $review_id = $reviewEntity->getId();

                if ($status == 'draft') {
                    $session = new Session();

                    // set and get session attributes
                    $session->set('reviewStatus', $review_id);
                }
                //$friends = $this->em->getRepository('Yasoon\Site\Entity\AuthorEntity')->find($authorId)->getWriters();


//                foreach($friends as $friend)
//                {
//                    try {
//                        $reviewTimelineEntity = (new ReviewsTimelineEntity())
//                            ->setReviewId($review_id)
//                            ->setAuthorId($friend->getId());
//
//                        $this->em->persist($reviewTimelineEntity);
//                        $this->em->flush();
//                    } catch(Exception $e) {
//                        return ['error' => true, 'errorText' => $e->getMessage()];
//                    }
//                }
            }     
            $isDeleted = $this->em->createQueryBuilder()
                ->delete()
                ->from('Yasoon\Site\Entity\ReviewTypeRelationsEntity', 'rtr')
                ->where('rtr.reviewId  = :id')
                ->setParameter("id", $reviewEntity->getId())
                ->getQuery()->execute();
            
            foreach($review['review-type'] as $typeId) {


                $reviewTypeEntity = new ReviewTypeRelationsEntity();
                $reviewTypeEntity->setReviewId($reviewEntity->getId());
                $reviewTypeEntity->setTypeId($typeId);
                $this->em->persist($reviewTypeEntity);
                $this->em->flush();

            }
            
        } catch(\Exception $e) {
            return ['error' => true, 'errorText' => $e->getMessage()];
        }

        $result = ['error' => false, 'reviewId' => $reviewEntity->getId()];

        return $result;

    }

    /**
     * @return array
     */
    public function getTimeline() {
        $authorId = (int) $this->securityContext->getToken()->getUsername();
        if (!is_int($authorId)) {
            return ['error' => true, 'errorText' => 'accessDenied'];
        }
        $posts_timeline = $this->em->createQueryBuilder()
            ->select('pt')
            ->from('Yasoon\Site\Entity\PostsTimelineEntity', 'pt')
            ->where('pt.authorId = :author_id ')
            ->setParameter('author_id',$authorId)
            ->getQuery()->getResult();
        $posts_id = array();
        foreach ($posts_timeline as $post_timeline) {
            $posts_id[] = $post_timeline->getPostId();
        }
        if (count($posts_id) > 0) {
            $posts = $this->em->createQueryBuilder()
                ->select('p')
                ->from('Yasoon\Site\Entity\PostEntity', 'p')
                ->where('p.id IN (:posts_id)')
                ->setParameter('posts_id',$posts_id)
                ->getQuery()->getResult();
            $result['error'] = false;
            foreach ($posts as $post) {
                if ($post->getAuthor()->getImg()) {
                    $authorImg = '/upload/avatar/' . $post->getAuthor()->getImg();
                } else {
                    $authorImg = null;
                }
                
                $post_answers = $this->em->getRepository('Yasoon\Site\Entity\PostAnswerEntity')->findBy(array('post_id' => $post->getId()));
                $strLength = 0;
                foreach ($post_answers as $answer) {
                   $strLength += strlen(strip_tags($answer->getAnswer()));
                }        
                $timeToRead = round($strLength/4200);
                
                $result['result'][] = [
                    'id' => $post->getId(),
                    'authorId' => $post->getAuthorId(),
                    'authorName' => $post->getAuthor()->getName(),
                    'avatarImg' => $authorImg,
                    'title' => $post->getCaption(),
                    'description' => $post->getPreview(),
                    'text' => $post->getText(),
                    'publishDate' => $post->getDate()->format('d/m/Y'),
                    'post_likes' => $post->getLikes(),
                    'timeToRead'  => $timeToRead
                    
                ];
            }
        } else {
            $result = [
                'error' => false,
                'result' => "NOT_FOUND"
            ];
        }
        return $result;
    }

    /**
     * @return array
     */
    public function getTimelineCount() {
        $authorId = (int) $this->securityContext->getToken()->getUsername();
        if (!is_int($authorId)) {
            return ['error' => true, 'errorText' => 'accessDenied'];
        }
        $posts_timeline_count = $this->em->createQueryBuilder()
            ->select('count(pt.id)')
            ->from('Yasoon\Site\Entity\PostsTimelineEntity', 'pt')
            ->where('pt.authorId = :author_id ')
            ->setParameter('author_id',$authorId)
            ->getQuery()->getSingleScalarResult();
        return $posts_timeline_count;

    }
    
    /**
     * @return array
     */
    public function getNewPosts() 
    {
       $authorId = (int) $this->securityContext->getToken()->getUsername();
        if (!is_int($authorId)) {
            return ['error' => true, 'errorText' => 'accessDenied'];
        }
        
        $posts_timeline = $this->em->getRepository('Yasoon\Site\Entity\FriendsEntity')->findBy(array('readerId' => $authorId));
        if (count($posts_timeline) > 0) {
            $postsTimeline = array();
            foreach ($posts_timeline as $post_timeline) {
                $postsTimeline[] = $post_timeline->getWriterId();

            }
            if (count($postsTimeline) > 0) {

                $posts = $this->em->createQueryBuilder()
               ->select('p')
               ->from('Yasoon\Site\Entity\PostEntity', 'p')
               ->where('p.authorId IN (:writer_id)')
               ->orderBy('p.date', 'DESC')
               ->setParameter('writer_id', $postsTimeline)
               ->getQuery()->getResult();

                $result['error'] = false;
                foreach ($posts as $post) {
                    if ($post->getAuthor()->getImg()) {
                        $authorImg = '/upload/avatar/' . $post->getAuthor()->getImg();
                    } else {
                        $authorImg = null;
                    }

                    $post_answers = $this->em->getRepository('Yasoon\Site\Entity\PostAnswerEntity')->findBy(array('post_id' => $post->getId()));
                    $strLength = 0;
                    foreach ($post_answers as $answer) {
                       $strLength += strlen(strip_tags($answer->getAnswer()));
                    }        
                    $timeToRead = round($strLength/4200);

                    $result['result'][] = [
                        'id' => $post->getId(),
                        'authorId' => $post->getAuthorId(),
                        'authorName' => $post->getAuthor()->getName(),
                        'avatarImg' => $authorImg,
                        'title' => $post->getCaption(),
                        'description' => $post->getPreview(),
                        'text' => $post->getText(),
                        'publishDate' => $post->getDate()->format('d/m/Y'),
                        'post_likes' => $post->getLikes(),
                        'timeToRead'  => $timeToRead

                    ];
                }
            
            } else {
                $result = [
                    'error' => false,
                    'result' => "NOT_FOUND"
                ];
            }
        }else {
            $result = [
                'error' => false,
                'result' => "NOT_FOUND"
            ];
        }
        return $result;
    }

    /**
     * @param $post_id
     * @throws \Symfony\Component\Security\Core\Exception\AccessDeniedException
     */
    public function clearTimeline()
    {
        try {
            $authorId = (int)$this->securityContext->getToken()->getUsername();
            if (!is_int($authorId)) {
                return ['error' => true, 'errorText' => 'accessDenied'];
            }
            $posts_timeline = $this->em->createQueryBuilder()
                ->select('pt')
                ->from('Yasoon\Site\Entity\PostsTimelineEntity', 'pt')
                ->where('pt.authorId = :author_id ')
                ->setParameter('author_id', $authorId)
                ->getQuery()->getResult();
            foreach ($posts_timeline as $post_timeline) {
                $this->em->remove($post_timeline);
                $this->em->flush();
            }

        } catch (\Exception $e) {
            return ['error' => true, 'errorText' => $e->getMessage()];
        }
        return ['error' => false, 'errorText' => ''];
    }

    /**
     * @param array $post
     * @return array
     */
    public function updatePost(array $dataPost, $urlImg) {
        $authorId = (int) $this->securityContext->getToken()->getUsername();
        /** @var PostEntity $post */
        $post = $this->em->getRepository('Yasoon\Site\Entity\PostEntity')->find($dataPost['id']);

        if ($post->getAuthorId() != $authorId && !$this->allf->isAdmin()) {
            return ['error' => true, 'errorText' => 'accessDenied'];
        }
        try {
            $post->setCaption($dataPost['title'])
                ->setPreview($dataPost['description'])
                ->setPreviewImg($urlImg)
                ->setText('');

            $this->em->merge($post);
            $this->em->flush();

            $tags = $this->em->getRepository('Yasoon\Site\Entity\PostCategoryEntity')->createQueryBuilder('c')
                ->leftJoin('c.post', 'p')
                ->where('c.post_id = '.$post->getId())
                ->orderBy('p.date', 'desc')->getQuery()->getResult();

            foreach($tags as $tag)
            {
                $exists_tags[$tag->getCategoryId()] = $tag;
            }

            if(isset($dataPost['category']) && count($dataPost['category']) > 0)
            {
                $saved = [];
                foreach($dataPost['category'] as $category)
                {
                    if(!array_key_exists($category, $exists_tags))
                    {
                        $postCategoryEntity = (new PostCategoryEntity())
                            ->setPostId($post->getId())
                            ->setCategoryId($category*1);
                        $postCategoryEntity->setPost($post);

                        $this->em->persist($postCategoryEntity);
                        $this->em->flush();

                        $saved[$postCategoryEntity->getCategoryId()] = $postCategoryEntity->getCategoryId();
                    }
                    else
                    {
                        $saved[$category] = $category;
                    }

                }
                foreach($exists_tags as $tag)
                {
                    if(!array_key_exists($tag->getCategoryId(), $saved))
                    {
                        $this->em->remove($tag);
                        $this->em->flush();
                    }
                }
            }
            else
            {
                if(count($tags > 0))
                {
                    foreach($tags as $tag)
                    {
                        $this->em->remove($tag);
                        $this->em->flush();
                    }
                }
            }

            //$questions = $post->getAnswer();
            $questions = $this->em->getRepository('Yasoon\Site\Entity\PostAnswerEntity')->createQueryBuilder('a')
                ->leftJoin('a.post', 'p')
                ->where('a.post_id = '.$post->getId())
                ->orderBy('p.date', 'desc')->getQuery()->getResult();
            foreach($questions as $question)
            {
                $exists_answers[$question->getQuestionId()] = $question;
            }
            //print_r($dataPost);
            if(isset($dataPost['text']) && count($dataPost['text']) > 0)
            {
                $saved = [];
                $i = 0;
                foreach($dataPost['text'] as $ql)
                {
                    $postAnswerEntity = new PostAnswerEntity();
                    if(!array_key_exists($dataPost['interviewQuestions'][$ql['id']]['question_id'], $exists_answers))
                    {
                        $postAnswerEntity
                            ->setPostId($post->getId())
                            ->setQuestionId($dataPost['interviewQuestions'][$ql['id']]['question_id']*1)
                            ->setAnswer($ql['text'])
                            ->setLego('0');
                        $postAnswerEntity->setPost($post);
                        $postAnswerEntity->setQuestion($this->em->getReference('Yasoon\Site\Entity\InterviewQuestionEntity', $dataPost['interviewQuestions'][$ql['id']]['question_id']*1));

                        $this->em->persist($postAnswerEntity);
                        $this->em->flush();

                        $saved[$postAnswerEntity->getQuestionId()] = $postAnswerEntity->getQuestionId();
                    }
                    else
                    {
                        $postAnswerEntity
                            ->setPostId($post->getId())
                            ->setQuestionId($dataPost['interviewQuestions'][$ql['id']]['question_id']*1)
                            ->setAnswer($ql['text'])
                            ->setLego('0');
                        $postAnswerEntity->setPost($post);
                        $postAnswerEntity->setQuestion($this->em->getReference('Yasoon\Site\Entity\InterviewQuestionEntity', $dataPost['interviewQuestions'][$ql['id']]['question_id']*1));

                        $this->em->persist($postAnswerEntity);
                        $this->em->flush();

                        $saved[$ql['id']] = $ql['id'];
                    }
                    $i++;

                }
                foreach($exists_answers as $ans)
                {
                    if(!array_key_exists($ans->getQuestionId(), $saved))
                    {
                        $this->em->remove($ans);
                        $this->em->flush();
                    }
                }
            }
            else
            {
                if(count($questions > 0))
                {
                    foreach($questions as $question)
                    {
                        $this->em->remove($question);
                        $this->em->flush();
                    }
                }
            }


            $data = ['id' => 'post_'.$post->getId(),
                     'url' => 'http://'.$_SERVER['HTTP_HOST'].'/#post/'.$post->getId(),
                     'image' => '',
                     'subtype' => 'post',
                     'sumtext' => trim(strip_tags($post->getPreview())).' ' .trim(strip_tags($post->getText())),
                     'tags' => '"Posts"',
                     'body' => trim(strip_tags($post->getText())),
                     'date' => date('Y-m-d\TH:i:s', $post->getDate()->getTimestamp()),
                     'title' => trim( strip_tags($post->getCaption()))];

            $this->allf->indexistoQueryAdd($data);


        } catch(\Exception $e) {
            return ['error' => true, 'errorText' => $e->getMessage()];
        }

        return ['error' => false, 'postId' => $dataPost['id']];

    }

    /**
     * @param $post_id
     * @throws \Symfony\Component\Security\Core\Exception\AccessDeniedException
     */
    public function delete($post_id) {
        try {
            $authorId = (int) $this->securityContext->getToken()->getUsername();
            if (!is_int($authorId)) {
                return ['error' => true, 'errorText' => 'accessDenied'];
            }

            $post = $this->em->getRepository('Yasoon\Site\Entity\PostEntity')->find($post_id);

            if(!$post)
            {
                return ['error' => true, 'errorText' => 'notFound'];
            }

            if ($post->getAuthorId() != $authorId && !$this->allf->isAdmin()) {
                return ['error' => true, 'errorText' => 'accessDenied'];
            }

            $this->em->remove($post);
            $this->em->flush();

            $categories = $this->em->getRepository('Yasoon\Site\Entity\PostCategoryEntity')
                ->createQueryBuilder('c')
                ->where('c.post_id = '.$post_id)
                ->getQuery()->getResult();
            foreach($categories as $category)
            {
                $this->em->remove($category);
                $this->em->flush();
            }

            $questions = $this->em->getRepository('Yasoon\Site\Entity\PostAnswerEntity')
                ->createQueryBuilder('a')
                ->where('a.post_id = '.$post_id)
                ->getQuery()->getResult();
            foreach($questions as $question)
            {
                $this->em->remove($question);
                $this->em->flush();
            }

            $post_like = $this->em->getRepository('Yasoon\Site\Entity\PostLikesEntity')
                ->createQueryBuilder('l')
                ->where('l.post_id = '.$post_id)
                ->getQuery()->getResult();

            foreach($post_like as $like)
            {
                $this->em->remove($like);
                $this->em->flush();
            }

            $friends = $this->em->getRepository('Yasoon\Site\Entity\AuthorEntity')->find($authorId)->getWriters();

            foreach($friends as $friend)
            {
                $timeline =  $this->em->createQueryBuilder()
                    ->select('t')
                    ->from('Yasoon\Site\Entity\TimelineEntity', 't')
                    ->where('t.author_id = :aid')
                    ->setParameter('aid', $friend->getId())
                    ->getQuery()->getResult();
                if (count($timeline) < 1 || !is_object($timeline[0])) {
                    $timeline = (new TimelineEntity())
                        ->setAuthorId($friend->getId())
                        ->setPostsCount('0')
                        ->setQuestionsCount('0')
                        ->setAnswersCount('0');

                    $this->em->persist($timeline);
                    $this->em->flush();
                }
                else
                {
                    if($timeline[0]->getPostsCount() > 0)
                    {
                        $timeline[0]->setPostsCount(($timeline[0]->getPostsCount()*1) - 1);
                        $this->em->merge($timeline[0]);
                        $this->em->flush();
                    }
                }
            }

            $data = json_encode(['_id' => 'post_'.$post_id]);
            $batchDataBody = '[' . $data . ']';
            $this->allf->indexistoQueryDelete($batchDataBody);

        } catch(\Exception $e) {
            return ['error' => true, 'errorText' => $e->getMessage()];
        }
        return ['error' => false, 'errorText' => ''];
    }
    
     /**
     * @param $review_id
     * @throws \Symfony\Component\Security\Core\Exception\AccessDeniedException
     */
    public function deleteReview($review_id) {
        try {
            $authorId = (int) $this->securityContext->getToken()->getUsername();
            if (!is_int($authorId)) {
                return ['error' => true, 'errorText' => 'accessDenied'];
            }

            $review = $this->em->getRepository('Yasoon\Site\Entity\ReviewEntity')->find($review_id);

            if(!$review)
            {
                return ['error' => true, 'errorText' => 'notFound'];
            }

            if ($review->getAuthorId() != $authorId && !$this->allf->isAdmin()) {
                return ['error' => true, 'errorText' => 'accessDenied'];
            }

            $this->em->remove($review);
            $this->em->flush();

            $review_like = $this->em->getRepository('Yasoon\Site\Entity\ReviewLikesEntity')
                ->createQueryBuilder('l')
                ->where('l.review_id = '.$review_id)
                ->getQuery()->getResult();

            foreach($review_like as $like)
            {
                $this->em->remove($like);
                $this->em->flush();
            }

//            $friends = $this->em->getRepository('Yasoon\Site\Entity\AuthorEntity')->find($authorId)->getWriters();
//
//            foreach($friends as $friend)
//            {
//                $timeline =  $this->em->createQueryBuilder()
//                    ->select('t')
//                    ->from('Yasoon\Site\Entity\TimelineEntity', 't')
//                    ->where('t.author_id = :aid')
//                    ->setParameter('aid', $friend->getId())
//                    ->getQuery()->getResult();
//                if (count($timeline) < 1 || !is_object($timeline[0])) {
//                    $timeline = (new TimelineEntity())
//                        ->setAuthorId($friend->getId())
//                        ->setPostsCount('0')
//                        ->setQuestionsCount('0')
//                        ->setAnswersCount('0');
//
//                    $this->em->persist($timeline);
//                    $this->em->flush();
//                }
//                else
//                {
//                    if($timeline[0]->getPostsCount() > 0)
//                    {
//                        $timeline[0]->setPostsCount(($timeline[0]->getPostsCount()*1) - 1);
//                        $this->em->merge($timeline[0]);
//                        $this->em->flush();
//                    }
//                }
//            }

            $data = json_encode(['_id' => 'review_'.$review_id]);
            $batchDataBody = '[' . $data . ']';
            $this->allf->indexistoQueryDelete($batchDataBody);

        } catch(\Exception $e) {
            return ['error' => true, 'errorText' => $e->getMessage()];
        }
        return ['error' => false, 'errorText' => ''];
    }

    public function getPost($postId) {

        /** @var PostEntity $post */
        $posts = $this->em->createQueryBuilder()
            ->select('p')
            ->from('Yasoon\Site\Entity\PostEntity', 'p')
            ->where('p.id IN('.implode(',', $postId).')')
            ->getQuery()->getResult();


        $questionAnswerArray = $this->em->createQueryBuilder()
                    ->select('pa.question_id, iq.text, pa.answer')
                    ->from('Yasoon\Site\Entity\PostAnswerEntity', 'pa')
                    ->innerJoin('Yasoon\Site\Entity\InterviewQuestionEntity', 'iq', 'WITH', 'pa.question_id = iq.id')
                    ->where('pa.post_id = :idPost')
                    ->setParameter('idPost', $postId)
                    ->getQuery()->getResult();
        foreach($posts as $post)
        {
            $visits = $post->getVisits();
            $visits++;
            
            $tags = $this->em->getRepository('Yasoon\Site\Entity\PostCategoryEntity')->createQueryBuilder('c')
                ->leftJoin('c.post', 'p')
                ->where('c.post_id = '.$post->getId())
                ->orderBy('p.date', 'desc')->getQuery()->getResult();
            $pcats = [];
            foreach($tags as $tag)
            {
                $pcats[] = $tag->getCategoryId();
            }
            $result[] = [
                'id'          => $post->getId(),
                'authorId'    => $post->getAuthorId(),
                'authorName'  => $post->getAuthor()->getName(),
                'tags'        => $pcats,
                'interviewId' => $post->getInterviewId(),
                'interviewTitle' => $post->getInterview()->getName(),
                'title'       => $post->getCaption(),
                'description' => $post->getPreview(),
                'text'        => /*$post->getText(),*/ $questionAnswerArray,
                'publishDate' => $post->getDate()->format('d/m/Y'),
                'post_likes'  => $post->getLikes()
            ];
            
            $postSave = $post->setVisits($visits);
            $this->em->merge($postSave);
            $this->em->flush();
        }

//        $access = $this->getAccessLevel($post->getAuthorId());
//
//        return ['access' => $access, 'data' => $result];

        return $result;
    }
    
    public function getReview($reviewId) {

        $result = ['error' => true, 'errorText' => 'Категория отсутствует или была удалена!'];
        /** @var PostEntity $post */
        $reviews = $this->em->createQueryBuilder()
            ->select('r')
            ->from('Yasoon\Site\Entity\ReviewEntity', 'r')
            ->where('r.id IN('.implode(',', $reviewId).')')
            ->getQuery()->getResult();

        foreach($reviews as $review)
        {
            $visits = $review->getVisits();
            $visits++;
            
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
                $description = $review->getDescription() != null ? $review->getDescription() : '';
                $textLength = strlen(strip_tags($review->getText()));
                $timeToRead = round($textLength/4200);
                $timeRead = $timeToRead > 0 ? $timeToRead : 1;
                $reviewData[] = [
                    'id'            => $review->getId(),
                    'authorId'      => $review->getAuthorId(),
                    'authorName'    => $review->getAuthor()->getName(),
                    'title'         => $review->getTitle(),
                    'text'          => $review->getText(),
                    'timeToRead'    => $timeRead,
                    'description'   => $description,
                    'rating'        => $review->getRating(),
                    'publishDate'   => $review->getDate()->format('d/m/Y'),
                    'expert'        => $review->getExpert(),
                    'category'      => $category->getTitle(),
                    'categoryId'    => $category->getId(),
                    'question1'     => $review->getQuestion1(),
                    'question2'     => $review->getQuestion2(),
                    'prospects'     => $review->getProspects(),
                    'types'         => $types,
                    'post_likes'    => $review->getLikes()
                ];

                $reviewSave = $review->setVisits($visits);
                $this->em->merge($reviewSave);
                $this->em->flush();
                
                $result = ['error' => false, 'result' => $reviewData, 'categoryId' => $category->getId()];
            } 
        }

        return $result;
    }

    /**
     * @param $postId
     * @return array
     */
    
    public function getPosts($postId, $authorId = '') {

        /** @var PostEntity $post */
        
        if (!empty($postId) && $postId[0] != null) {
            $posts = $this->em->createQueryBuilder()
                ->select('p')
                ->from('Yasoon\Site\Entity\PostEntity', 'p')
                ->where('p.id IN('.implode(',', $postId).')')
                ->orderBy('p.date', 'DESC')
                ->getQuery()->getResult();
            
            foreach($posts as $key => $post)
            {
                if ($key == 0) {
                    $authorId = $post->getAuthorId();
                }
                $tags = $this->em->getRepository('Yasoon\Site\Entity\PostCategoryEntity')->createQueryBuilder('c')
                    ->leftJoin('c.post', 'p')
                    ->where('c.post_id = '.$post->getId())
                    ->orderBy('p.date', 'desc')->getQuery()->getResult();
                $pcats = [];
                foreach($tags as $tag)
                {
                    $pcats[] = $tag->getCategoryId();
                }

                $post_answers = $this->em->getRepository('Yasoon\Site\Entity\PostAnswerEntity')->findBy(array('post_id' => $post->getId()));

                $strLength = 0;
                $interviewLego = 0;
                foreach ($post_answers as $answer) {
                   $strLength += strlen(strip_tags($answer->getAnswer()));
                   if ($answer->getLego() > 0) {
                       $interviewLego++;
                   }
                }        
                $timeToRead = round($strLength/4200);

                $interviewName = '';
                if ($interviewLego > 0) {
                    $interviewName = $post->getInterview()->getName();
                } 

                $results_posts[] = [
                    'id'            => $post->getId(),
                    'authorId'      => $post->getAuthorId(),
                    'authorName'    => $post->getAuthor()->getName(),
                    'tags'          => $pcats,
                    'title'         => $post->getCaption(),
                    'description'   => $post->getPreview(),
                    'text'          => $post->getText(), // $questionAnswerArray,
                    'publishDate'   => $post->getDate()->format('d/m/Y'),
                    'dateSort'      => $post->getDateTimeStamp(),
                    'post_likes'    => $post->getLikes(),
                    'timeToRead'    => $timeToRead,
                    'interview_name'=> $interviewName,
                    'interview_id'  => $post->getInterview()->getId(),
                    'previewPostImg'=> $post->getPreviewImg(),
                    'type'          => 'post'
                ];
            }
        }
        if ($authorId != '' && $authorId != 0) {
            $results_reviews = $this->em->createQueryBuilder()
                ->select('r')
                ->from('Yasoon\Site\Entity\ReviewEntity', 'r')
                ->where('r.authorId = :id')
                ->setParameter('id', $authorId)
                ->orderBy('r.date', 'DESC')
                ->getQuery()
                ->getResult();

            $reviews = [];
            foreach($results_reviews as $review) { 
                $rcategory = $this->em->getRepository('Yasoon\Site\Entity\CategoryEntity')
                        ->find($review->getCategoryId());
                if (!empty($rcategory)) {
                    $types = [];
                    $review_types = $this->em->getRepository('Yasoon\Site\Entity\ReviewTypesEntity')
                            ->findAll();
                    foreach ($review_types as $type) {
                        $reviewType = $this->em->getRepository('Yasoon\Site\Entity\ReviewTypeRelationsEntity')
                                ->findOneBy(array('reviewId' => $review->getId(), 'typeId' => $type->getId()));
                        $selectedValue = !empty($reviewType) ? "selected" : "";
                        $types[] = array('id' => $type->getId(), 'name' => $type->getName(), 'selected' => $selectedValue);
                    }
                    $description = $review->getDescription() != null ? $review->getDescription() : '';
                    $textLength = strlen(strip_tags($review->getText()));
                    $timeToRead = round($textLength/4200);
                    $timeRead = $timeToRead > 0 ? $timeToRead : 1;
                    
                    $reviews[] = [
                        'id'            => $review->getId(),
                        'authorId'      => $review->getAuthorId(),
                        'authorName'    => $review->getAuthor()->getName(),
                        'avatarImg'     => $review->getAuthor()->getImage(),
                        'title'         => $review->getTitle(),
                        'timeToRead'    => $timeRead,
                        'description'   => $description,
                        'rating'        => $review->getRating(),
                        'publishDate'   => $review->getDate()->format('d/m/Y'),
                        'dateSort'      => $review->getDateTimeStamp(),
                        'expert'        => $review->getExpert(),
                        'category'      => $rcategory->getTitle(),
                        'categoryId'    => $rcategory->getId(),
                        'question1'     => $review->getQuestion1(),
                        'question2'     => $review->getQuestion2(),
                        'prospects'     => $review->getProspects(),
                        'types'         => $types,
                        'post_likes'    => $review->getLikes(),
                        'type'          => 'review'
                    ];
                }
            }
        }
        
        if (!empty($results_posts) ) {
            if (!empty($reviews)) {
                $result = array_merge($results_posts, $reviews);
                usort($result, function($a, $b) {
                    if ($a['dateSort'] == $b['dateSort']) {
                        return 0;
                    }
                    return ($a['dateSort'] < $b['dateSort']) ? -1 : 1;
                });
            } else {
                $result = $results_posts;
            }
        } else {
            if (!empty($reviews)) {
                $result = $reviews;
            }
        }


//        $access = $this->getAccessLevel($post->getAuthorId());
//
//        return ['access' => $access, 'data' => $result];

        return $result;
    }



    /**
     * @param $authorId
     * @return array
     */
    public function getPostsByDate($authorId, $date)
    {

        try {
            $time = date('Y-m-d H:i:s', strtotime(str_replace('/', '-', $date)));

            $where_arr = [];
            $where_str = '';
            foreach($authorId as $k => $v)
            {
                $time = date('Y-m-d H:i:s', strtotime(str_replace('/', '-', $date[$k])));
                //$where_arr[] = "(p.authorId = $v AND p.date >= '$time')";
                $where_arr[] = "(p.authorId = $v)";
            }
            $where_str = implode(' OR ', $where_arr);
            //return $where_arr;

            /** @var PostEntity $post */

            $posts = $this->em->createQueryBuilder()
                ->select('p')
                ->from('Yasoon\Site\Entity\PostEntity', 'p')
                ->where($where_str)
                ->getQuery()->getResult();

            if(count($posts) < 1)
            {
                return [];
            }

            foreach($posts as $post)
            {
                $tags = $this->em->getRepository('Yasoon\Site\Entity\PostCategoryEntity')->createQueryBuilder('c')
                    ->leftJoin('c.post', 'p')
                    ->where('c.post_id = '.$post->getId())
                    ->orderBy('p.date', 'desc')->getQuery()->getResult();
                $pcats = [];
                foreach($tags as $tag)
                {
                    $pcats[] = $tag->getCategoryId();
                }
                $result[] = [
                    'postId'      => $post->getId(),
                    'authorId'    => $post->getAuthorId(),
                    'avatarImg'   => $post->getAuthor()->getImg(),
                    'authorName'  => $post->getAuthor()->getName(),
                    'tags'        => $pcats,
                    'title'       => $post->getCaption(),
                    'description' => $post->getPreview(),
                    'text'        => $post->getText(),
                    'publishDate' => $post->getDate()->format('d/m/Y'),
                    'post_likes'  => $post->getLikes()
                ];
            }
        } catch(\Exception $e) {
            return ['error' => true, 'errorText' => $e->getMessage()];
        }
        return $result;
    }


    /**
     * @return array
     */
    public function get_all($page, $items)
    {
        $offset = ($page*$items)-$items;

        $adata = [];

        /** @var PostEntity $post */
        $posts = $this->em->createQueryBuilder()
            ->select('p')
            ->from('Yasoon\Site\Entity\PostEntity', 'p')
            ->setMaxResults($items)
            ->setFirstResult($offset)
            ->getQuery()->getResult();

        foreach($posts as $post)
        {
            $post_answers = [];
            $answers = $post->getAnswer();
            if($answers)
            {
                foreach($answers as $answer)
                {
                    $post_answers[] = ['id' => $answer->getId(),
                                       'question_id' => $answer->getQuestion()->getId(),
                                       'question_name' => $answer->getQuestion()->getText(),
                                       'answer' => $answer->getAnswer()];
                }
            }

            $adata[] = ['id' => $post->getId(),
                        'author_id' => $post->getAuthor()->getId(),
                        'author_name' => $post->getAuthor()->getName(),
                        'caption' => $post->getCaption(),
                        'publishDate' => $post->getDate()->format('d/m/Y'),
                        'likes' => $post->getLikes(),
                        'preview' => $post->getPreview(),
                        'text' => $post->getText(),
                        'answers' => $post_answers];
        }

        return $adata;
    }


    /**
     * @param $postId
     * @return array
     */
    public function getEditPost($postId) {
        $result = [];

        $posts = $this->em->createQueryBuilder()
            ->select('p')
            ->from('Yasoon\Site\Entity\PostEntity', 'p')
            ->where('p.id = '.$postId)
            ->getQuery()->getSingleResult();

        $categories = $posts->getCategory();
        $tags = [];
        foreach($categories as $cat)
        {
            $tags[] = $cat->getCategoryId();
        }

        $questions = $posts->getAnswer();
        //$tags = [];
        $answers = [];
        foreach($questions as $question)
        {
            $answers[] = ['id' => $question->getQuestionId(),
                          'question' => $question->getQuestion()->getText(),
                          'text' => $question->getAnswer()];
        }

        $result = ['authorId' => $posts->getAuthorId(),
                   'authorName' => $posts->getAuthor()->getName(),
                   'postTitle' => $posts->getCaption(),
                   'category' => $tags,
                   'questionList' => $answers,
                   'postDescription' => $posts->getPreview()
                   ];
        return $result;
    }

    /**
     * @param $postId
     * @return array
     */
    public function getQuestions($postId) {

        $result = [];

        /** @var QuestionEntity[] $questions */
        $questions = $this->em->createQueryBuilder()
            ->select('question, answer')
            ->from('Yasoon\Site\Entity\QuestionEntity', 'question')
            ->join('question.answer', 'answer')
            ->where("question.postId = $postId")
            ->getQuery()->getResult();
        print_r($questions);

        foreach ($questions as $question) {
            $result[] = [
                'id'         => $question->getId(),
                'text'       => $question->getCaption(),
                'answerText' => $question->getAnswer()->getText(),
            ];
        }

//        $access = $this->getAccessLevel($this->securityContext->getToken()->getUsername());
//
//        return ['access' => $access, 'data' => $result];

        return $result;
    }


    /**
     * @param $offset
     * @param $limit
     *
     * @return array
     */
    public function getBestPosts($offset, $limit) {
        $result = [];

        /** @var PostEntity[] $posts */
        $posts  = $this->em->createQueryBuilder()
            ->select('post, author')
            ->from('Yasoon\Site\Entity\PostEntity', 'post')
            ->join('post.author', 'author')
            ->where('post.likes > 0')
            ->setMaxResults($limit)
            ->setFirstResult($offset)
            ->orderBy('post.likes', 'DESC')
            ->getQuery()->getResult();

        foreach ($posts as $post) {
            
            $post_answers = $this->em->getRepository('Yasoon\Site\Entity\PostAnswerEntity')->findBy(array('post_id' => $post->getId()));
            $strLength = 0;
            foreach ($post_answers as $answer) {
               $strLength += strlen(strip_tags($answer->getAnswer()));
            }        
            $timeToRead = round($strLength/4200);
                
            $result[] = [
                'authorName' => $post->getAuthor()->getName(),
                'authorId'   => $post->getAuthor()->getId(),
                'caption'    => $post->getCaption(),
                'preview'    => $post->getPreview(),
                'id'         => $post->getId(),
                'avatarImg'  => $post->getAuthor()->getImage(),
                'timeToRead' => $timeToRead,
                'user'       => $post->getAuthor()->getRole() == 4 ? 'admin' : 'user'
            ];
        }

        return $result;
    }

    /**
     * @return array
     */
    public function getStoryOfTheDay()
    {
        error_reporting(E_ALL);
        /** @var PostOfTheDayEntity $story */
        /*$story = $this->em->createQueryBuilder()
            ->select('story, author, post, questions')
            ->from('Yasoon\Site\Entity\PostOfTheDayEntity', 'story')
            ->join('story.post', 'post')
            ->join('post.author', 'author')
            ->leftJoin('author.questions', 'questions')
            ->orderBy('story.id', 'DESC')
            ->setMaxResults(1)
            ->getQuery()->getSingleResult();

        $result = [
          'id' => $story->getPost()->getId(),
          'autorId'   => $story->getPost()->getAuthor()->getId(),
          'authorName' => $story->getPost()->getAuthor()->getName(),
          'authorDescription' => $story->getPost()->getAuthor()->getDescription(),
          'authorAvatar' => $story->getPost()->getAuthor()->getImg(),
          'publishDate' => $story->getPost()->getAuthor()->getPublicationDate()->format('d/m/Y'),
          'title' => $story->getPost()->getCaption(),
          'text'    => $story->getPost()->getText(),
          'post_likes'   => $story->getPost()->getLikes(),
          'questions' => count($story->getPost()->getAuthor()->getQuestions())
        ];*/
        $date = getdate();
        $time = mktime(0,0,0,$date['mon'], $date['mday'], $date['year']);
        //$from_date = date('Y-m-d H:i:s', $time);
        $to_date = date('Y-m-d H:i:s', ($time+864000));

        try {
            $dayentity = $this->em->getRepository('Yasoon\Site\Entity\PostOfTheDayEntity')
                ->createQueryBuilder('pd')
                ->orderBy('pd.assignedDatetime', 'DESC')
                ->getQuery()
                ->getResult();

            if(count($dayentity) > 0)
            {
                
                $questionAnswerArray = $this->em->createQueryBuilder()
                    ->select('pa.question_id, iq.text, pa.answer')
                    ->from('Yasoon\Site\Entity\PostAnswerEntity', 'pa')
                    ->innerJoin('Yasoon\Site\Entity\InterviewQuestionEntity', 'iq', 'WITH', 'pa.question_id = iq.id')
                    ->where('pa.post_id = :idPost')
                    ->setParameter('idPost', $dayentity[0]->getPost()->getId())
                    ->getQuery()->getResult();
                
                $tags = $this->em->getRepository('Yasoon\Site\Entity\PostCategoryEntity')->createQueryBuilder('c')
                    ->leftJoin('c.post', 'p')
                    ->where('c.post_id = '.$dayentity[0]->getPost()->getId())
                    ->orderBy('p.date', 'desc')->getQuery()->getResult();
                $pcats = [];
                foreach($tags as $tag)
                {
                    $pcats[] = $tag->getCategoryId();
                }
                
                $questions = $this->em->getRepository('Yasoon\Site\Entity\QuestionEntity')->createQueryBuilder('q')
                    ->leftJoin('q.author', 'a')
                    ->where('a.id = '.$dayentity[0]->getPost()->getAuthorId())
                    ->orderBy('q.date', 'desc')->getQuery()->getResult();
                $aquestions = [];
                $answer_count = 0;
                foreach($questions as $question)
                {
                    $aquestions[] = $question->getId();
                    if($question->getAnswer() != '')
                    {
                        $answer_count++;
                    }
                }

                return ['id'          => $dayentity[0]->getPost()->getId(),
                        'authorId'    => $dayentity[0]->getPost()->getAuthorId(),
                        'avatarImg'   => $dayentity[0]->getPost()->getAuthor()->getImg(),
                        'authorName'  => $dayentity[0]->getPost()->getAuthor()->getName(),
                        'authorBio'  => $dayentity[0]->getPost()->getAuthor()->getInterest(),
                        'tags'        => $pcats,
                        'title'       => $dayentity[0]->getPost()->getCaption(),
                        'description' => $dayentity[0]->getPost()->getPreview(),
                        'text'        => $questionAnswerArray,
                        'publishDate' => $dayentity[0]->getPost()->getDate()->format('d/m/Y'),
                        'post_likes'  => $dayentity[0]->getPost()->getLikes(),
                        'answer_count' => $answer_count];
            }

            return ['error' => 'true', 'errorText' => 'storyNotAssigned'];
        } catch(\Exception $e) {
            return ['error' => true, 'errorText' => $e->getMessage()];
        }

        return $result;
    }

    /**
     * @param $postId
     * @return array
     */
    public function setStoryOfTheDay($postId)
    {
        $this->checkAdminAccess();
        try {
            $date = getdate();
            $time = mktime(0,0,0,$date['mon'], $date['mday'], $date['year']);
            $from_date = date('Y-m-d H:i:s', $time);
            $to_date = date('Y-m-d H:i:s', ($time+86400));

            $dayentity = $this->em->getRepository('Yasoon\Site\Entity\PostOfTheDayEntity')
                ->createQueryBuilder('pd')
                ->where("(pd.assignedDatetime > '".$from_date."' AND pd.assignedDatetime < '$to_date') AND pd.postId = $postId")
                ->getQuery()
                ->getResult();
            if(count($dayentity) > 0)
            {
                return ['error' => 'true', 'errorText' => 'storyAssigned'];
            }

            $story = (new PostOfTheDayEntity())
                ->setPost($this->em->getReference('Yasoon\Site\Entity\PostEntity', $postId))
                ->setAssignedDatetime(new \DateTime());

            $this->em->persist($story);
            $this->em->flush();

            return ['error' => 'false', 'postId' => $story->getPost()->getId()];
        } catch(\Exception $e) {
            return ['error' => true, 'errorText' => $e->getMessage()];
        }
    }

    /**
     * @param $postId
     * @return array
     */
    public function like($postId, $type)
    {
        $authorId = $this->securityContext->getToken()->getUsername();
        
        if ($authorId == 'anon.') {
            $authorId = 0;
            $user_ip = $_SERVER['REMOTE_ADDR'];
        }
        else
        {
            $authorId = $authorId*1;
            $user_ip = '0';
        }
        
        try {
            $post_like = $this->em->getRepository('Yasoon\Site\Entity\PostLikesEntity')
                ->createQueryBuilder('l')
                ->where("(l.authorId = ".$authorId." AND l.user_ip = '$user_ip') AND l.post_id = $postId")
                ->getQuery()
                ->getResult();


            if(count($post_like) < 1)
            {
                /*if((time() - $post_like[0]->getLastDate()->getTimestamp()) < 86400)
                {
                    return ['error' => true, 'errorText' => 'timeLimit'];
                }*/
                $PostLikesEntity = new PostLikesEntity();
                $PostLikesEntity->setAuthorId($authorId);

                $PostLikesEntity->setUserIp($user_ip);

                $PostLikesEntity->setPostId($postId);
                $PostLikesEntity->setAuthorId($authorId);
                $PostLikesEntity->setLastDate(new \DateTime());
                $PostLikesEntity->setPostId($postId);
                $PostLikesEntity->setCountLikes(1);
                $PostLikesEntity->setPost($this->em->getReference('Yasoon\Site\Entity\PostEntity', $postId));

                $PostLikesEntity->getPost()->setLikes(($PostLikesEntity->getPost()->getLikes()*1) + 1);

                $this->em->persist($PostLikesEntity);
                $this->em->flush();

                $result_likes = $PostLikesEntity->getPost()->getLikes();
            }
            else
            {
                if((time() - $post_like[0]->getLastDate()->getTimestamp()) < 86400)
                {
                    if($user_ip != '0')
                    {
                        $errtext = 'userLiked';
                    }
                    else
                    {
                        $errtext = 'timeLimit';
                    }
                    return ['error' => true, 'errorText' => $errtext];
                }
                $post_like[0]->setCountLikes(($post_like[0]->getCountLikes()*1) + 1);
                $post_like[0]->setLastDate(new \DateTime());

                $post_like[0]->getPost()->setLikes(($post_like[0]->getPost()->getLikes()*1) + 1);

                $this->em->persist($post_like[0]);
                $this->em->flush();

                $result_likes = $post_like[0]->getPost()->getLikes();
            }
        } catch(\Exception $e) {
            return ['error' => true, 'errorText' => $e->getMessage()];
        }

        return ['count' => $result_likes, 'postId' => $postId];
    }
    
    /**
     * @param $reviewId
     * @return array
     */
    public function likeReview($reviewId, $type)
    {
        $authorId = $this->securityContext->getToken()->getUsername();
        
        if ($authorId == 'anon.') {
            $authorId = 0;
            $user_ip = $_SERVER['REMOTE_ADDR'];
        }
        else
        {
            $authorId = $authorId*1;
            $user_ip = '0';
        }
        
        try {
            $review_like = $this->em->getRepository('Yasoon\Site\Entity\ReviewLikesEntity')
                ->createQueryBuilder('rl')
                ->where("(rl.authorId = ".$authorId." AND rl.user_ip = '$user_ip') AND rl.review_id = $reviewId")
                ->getQuery()
                ->getResult();


            if(count($review_like) < 1)
            {
                /*if((time() - $post_like[0]->getLastDate()->getTimestamp()) < 86400)
                {
                    return ['error' => true, 'errorText' => 'timeLimit'];
                }*/
                $entity = new ReviewLikesEntity();
                $entity->setAuthorId($authorId);

                $entity->setUserIp($user_ip);

                $entity->setReviewId($reviewId);
                $entity->setAuthorId($authorId);
                $entity->setLastDate(new \DateTime());
                $entity->setCountLikes(1);
                $entity->setReview($this->em->getReference('Yasoon\Site\Entity\ReviewEntity', $reviewId));

                $entity->getReview()->setLikes(($entity->getReview()->getLikes()*1) + 1);

                $this->em->persist($entity);
                $this->em->flush();

                $result_likes = $entity->getReview()->getLikes();
            }
            else
            {
                if((time() - $review_like[0]->getLastDate()->getTimestamp()) < 86400)
                {
                    if($user_ip != '0')
                    {
                        $errtext = 'userLiked';
                    }
                    else
                    {
                        $errtext = 'timeLimit';
                    }
                    return ['error' => true, 'errorText' => $errtext];
                }
                $review_like[0]->setCountLikes(($post_like[0]->getCountLikes()*1) + 1);
                $review_like[0]->setLastDate(new \DateTime());

                $review_like[0]->getReview()->setLikes(($review_like[0]->getReview()->getLikes()*1) + 1);

                $this->em->persist($review_like[0]);
                $this->em->flush();

                $result_likes = $review_like[0]->getReview()->getLikes();
            }
        } catch(\Exception $e) {
            return ['error' => true, 'errorText' => $e->getMessage()];
        }

        return ['count' => $result_likes, 'postId' => $reviewId];
    }

    /**
     * @param $postId
     * @param $likes
     * @return array
     */
    public function addLikes($postId, $likes)
    {
        /** @var PostEntity $post */
        $post = $this->em->getRepository('Yasoon\Site\Entity\PostEntity')->find($postId);
        $post->setLikes($post->getLikes() + $likes);

        $this->em->persist($post);
        $this->em->flush();

       return ['ok' => 'ok'];
    }

    /**
     * @return array
     */
    public function getAllLastWeek()
    {
        $dateTime = new \DateTime();
        $dateTime->modify('-7 day');

        /** @var PostEntity[] $posts */
        $posts = $this->em->createQueryBuilder()
            ->select('post')
            ->from('Yasoon\Site\Entity\PostEntity', 'post')
            ->where('post.date > '.$dateTime->format('Y-m-d'))
            ->getQuery()->getResult();

        $result = [];
        foreach ($posts as $post) {
            $result[] = [
                'id' => $post->getId(),
                'likes' => $post->getLikes(),
                'caption' => $post->getCaption(),
                'preview' => $post->getPreview(),
                'authorName' => $post->getAuthor()->getName(),
                'date' => $post->getDate()->format('d/m/Y')
            ];
        }

        return $result;
    }


    public function getQuestionsByIds($ids)
    {

        $aquestions = [];

        $questions = $this->em->getRepository('Yasoon\Site\Entity\QuestionEntity')->createQueryBuilder('q')
            ->where('q.id IN('.implode(',', $ids).')')
            ->getQuery()->getResult();
        foreach($questions as $question)
        {
            $aquestions[] = ['id' => $question->getId(),
                             'authorId' => $question->getAuthorId(),
                             'ask_authorId' => $question->getAskAuthorId(),
                             'ask_avatarImg'  => $question->getAuthorAsk()->getImg(),
                             'ask_authorName' => $question->getAuthorAsk()->getName(),
                             'ask_authorProf' => $question->getAuthorAsk()->getJob(),
                             'authorName' => $question->getAuthor()->getName(),
                             'authorProf' => $question->getAuthor()->getJob(),
                             'questionText' => $question->getText(),
                             'questionAnswerText' => $question->getAnswer(),
                             'hasAnswer' => ($question->getAnswer() != '') ? true : false,
                             'publishDate' => $question->getDate()->format('d/m/Y'),
                             'avatarImg'  => $question->getAuthor()->getImg()];
        }
        return $aquestions;
    }
}