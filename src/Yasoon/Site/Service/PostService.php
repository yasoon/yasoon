<?php
/**
 * Author: Fedor Avetisov <cousenavi@gmail.com>
 * Date: 5/26/13
 */



namespace Yasoon\Site\Service;

use JMS\DiExtraBundle\Annotation as DI;
use Symfony\Component\Config\Definition\Exception\Exception;
use Symfony\Component\Security\Core\Exception\AccessDeniedException;
use Yasoon\Site\Entity\AuthorEntity;
use Yasoon\Site\Entity\PostEntity;
use Yasoon\Site\Entity\PostCategoryEntity;
use Yasoon\Site\Entity\PostAnswerEntity;
use Yasoon\Site\Entity\PostLikesEntity;
use Yasoon\Site\Entity\PostOfTheDayEntity;
use Yasoon\Site\Entity\QuestionEntity;
use Yasoon\Site\Entity\TimelineEntity;
use Yasoon\Site\Entity\PostsTimelineEntity;

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
    public function addPost(array $post) {

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
                        ->setQuestionId($post['interviewQuestions'][$i]['question_id']*1)
                        ->setAnswer($quest['text']);
                    $postAnswerEntity->setPost($postEntity);
                    $postAnswerEntity->setQuestion($this->em->getReference('Yasoon\Site\Entity\InterviewQuestionEntity',
                        $post['interviewQuestions'][$i]['question_id']*1));

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
                $result['result'][] = [
                    'id' => $post->getId(),
                    'authorId' => $post->getAuthorId(),
                    'authorName' => $post->getAuthor()->getName(),
                    'avatarImg' => $authorImg,
                    'title' => $post->getCaption(),
                    'description' => $post->getPreview(),
                    'text' => $post->getText(),
                    'publishDate' => $post->getDate()->format('d/m/Y'),
                    'post_likes' => $post->getLikes()
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
    public function updatePost(array $dataPost) {
        $authorId = (int) $this->securityContext->getToken()->getUsername();
        /** @var PostEntity $post */
        $post = $this->em->getRepository('Yasoon\Site\Entity\PostEntity')->find($dataPost['id']);

        if ($post->getAuthorId() != $authorId && !$this->allf->isAdmin()) {
            return ['error' => true, 'errorText' => 'accessDenied'];
        }
        try {
            $post->setCaption($dataPost['title'])
                ->setPreview($dataPost['description'])
                ->setText('')
                ->setDate(new \DateTime());

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
                            ->setAnswer($ql['text']);
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
                            ->setAnswer($ql['text']);
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
                'title'       => $post->getCaption(),
                'description' => $post->getPreview(),
                'text'        => /*$post->getText(),*/ $questionAnswerArray,
                'publishDate' => $post->getDate()->format('d/m/Y'),
                'post_likes'  => $post->getLikes()
            ];
        }

//        $access = $this->getAccessLevel($post->getAuthorId());
//
//        return ['access' => $access, 'data' => $result];

        return $result;
    }

    /**
     * @param $postId
     * @return array
     */
    public function getPosts($postId) {

        /** @var PostEntity $post */
        $posts = $this->em->createQueryBuilder()
            ->select('p')
            ->from('Yasoon\Site\Entity\PostEntity', 'p')
            ->where('p.id IN('.implode(',', $postId).')')
            ->getQuery()->getResult();

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
                'id'          => $post->getId(),
                'authorId'    => $post->getAuthorId(),
                'authorName'  => $post->getAuthor()->getName(),
                'tags'        => $pcats,
                'title'       => $post->getCaption(),
                'description' => $post->getPreview(),
                'text'        => $post->getText(), // $questionAnswerArray,
                'publishDate' => $post->getDate()->format('d/m/Y'),
                'post_likes'  => $post->getLikes()
            ];
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
                    'postId'          => $post->getId(),
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
            $result[] = [
                'authorName' => $post->getAuthor()->getName(),
                'authorId'   => $post->getAuthor()->getId(),
                'caption'    => $post->getCaption(),
                'preview'    => $post->getPreview(),
                'id'         => $post->getId()
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
        $from_date = date('Y-m-d H:i:s', $time);
        $to_date = date('Y-m-d H:i:s', ($time+86400));

        try {
            $dayentity = $this->em->getRepository('Yasoon\Site\Entity\PostOfTheDayEntity')
                ->createQueryBuilder('pd')
                ->where("(pd.assignedDatetime > '".$from_date."' AND pd.assignedDatetime < '$to_date')")
                ->orderBy('pd.assignedDatetime', 'DESC')
                ->getQuery()
                ->getResult();

            $questionAnswerArray = $this->em->createQueryBuilder()
                ->select('pa.question_id, iq.text, pa.answer')
                ->from('Yasoon\Site\Entity\PostAnswerEntity', 'pa')
                ->innerJoin('Yasoon\Site\Entity\InterviewQuestionEntity', 'iq', 'WITH', 'pa.question_id = iq.id')
                ->where('pa.post_id = :idPost')
                ->setParameter('idPost', $dayentity[0]->getPost()->getId())
                ->getQuery()->getResult();

            if(count($dayentity) > 0)
            {
                $tags = $this->em->getRepository('Yasoon\Site\Entity\PostCategoryEntity')->createQueryBuilder('c')
                    ->leftJoin('c.post', 'p')
                    ->where('c.post_id = '.$dayentity[0]->getPost()->getId())
                    ->orderBy('p.date', 'desc')->getQuery()->getResult();
                $pcats = [];
                foreach($tags as $tag)
                {
                    $pcats[] = $tag->getCategoryId();
                }

                return ['id'          => $dayentity[0]->getPost()->getId(),
                        'authorId'    => $dayentity[0]->getPost()->getAuthorId(),
                        'avatarImg'   => $dayentity[0]->getPost()->getAuthor()->getImg(),
                        'authorName'  => $dayentity[0]->getPost()->getAuthor()->getName(),
                        'authorBio'   => $dayentity[0]->getPost()->getAuthor()->getInterest(),
                        'tags'        => $pcats,
                        'title'       => $dayentity[0]->getPost()->getCaption(),
                        'description' => $dayentity[0]->getPost()->getPreview(),
                        'text'        => $questionAnswerArray,
                        'publishDate' => $dayentity[0]->getPost()->getDate()->format('d/m/Y'),
                        'post_likes'  => $dayentity[0]->getPost()->getLikes()];
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
        if (!is_int($authorId)) {
            $authorId = 0;
            $user_ip = $_SERVER['REMOTE_ADDR'];
        }
        else
        {
            $user_ip = '0';
        }

        try {
            $post_like = $this->em->getRepository('Yasoon\Site\Entity\PostLikesEntity')
                ->createQueryBuilder('l')
                ->where("(l.authorId = ".$authorId." OR l.user_ip = '$user_ip') AND l.post_id = $postId")
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

        return ['count' => $result_likes];
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
            ->orderBy('q.date', 'desc')->getQuery()->getResult();
        foreach($questions as $question)
        {
            $aquestions[] = ['id' => $question->getId(),
                             'authorId' => $question->getAuthorId(),
                             'ask_authorId' => $question->getAskAuthorId(),
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
