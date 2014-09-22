<?php
/**
 * Author: Fedor Avetisov <cousenavi@gmail.com>
 * Date: 5/22/13
 */

namespace Yasoon\Site\Controller;

use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use JMS\DiExtraBundle\Annotation as DI;
use Yasoon\Site\Service\PostService;
use Yasoon\Site\Service\PostAnswerService;
use Yasoon\Site\Service\PartnerService;
use Yasoon\Site\Service\AuthorService;
use Yasoon\Site\Service\ImageService;

error_reporting(E_ALL);

/**
 * Class PostController
 *
 * @Route("/api/post")
 * @package Yasoon\Site\Controller
 */
class PostController {

    /**
     * @var PostService
     *
     * @DI\Inject("yasoon.service.post")
     */
    private $service;

    /**
     * @var PostAnswerService
     *
     * @DI\Inject("yasoon.service.post")
     */
    private $postAnswerService;
    
    /**
     * @var PartnerService
     *
     * @DI\Inject("yasoon.service.partner")
     */
    private $partnerservice;

    /**
     * @var ImageService
     *
     * @DI\Inject("yasoon.service.image")
     */
    private $imageService;
    
    /**
     * @var PostCategoryService
     *
     * @DI\Inject("yasoon.service.postcategory")
     */
    private $postcategoryservice;
    
    /**
     * @var AuthorService
     *
     * @DI\Inject("yasoon.service.author")
     */
    private $authorservice;
    
    
    /**
     * @Route("/savePost")
     * @Method({"POST"})
     *
     * @param Request $request
     *
     * @return array
     */
    public function savePostAction(Request $request) {
        $data = $request->request->get('postData');
        return  $this->service->addPost($data);
    }



    /**
     * @Route("/add")
     *
     * @Method({"POST"})
     */
    public function addAction(Request $request) {
        $model = $request->request->get('model');
        return  $this->service->add($model);
    }

    /**
     * @Route("/getTimeline")
     *
     * @Method({"GET"})
     */
    public function getTimelineAction() {
        return $this->service->getTimeline();
    }

    /**
     * @Route("/clearTimeline")
     *
     * @Method({"GET"})
     */
    public function clearTimelineAction() {
        return $this->service->clearTimeline();
    }


    /**
     * @Route("/update")
     * @Method({"POST"})
     *
     * @param Request $request
     *
     * @return array
     */
    public function updateAction(Request $request) {
        $model = $request->request->get('postData');
        
        if(!$model)
        {
            return ['error' => true, 'errorText' => 'notFound'];
        }
        
        /*$model = ['postid' => 53,
                  'authorid' => 1,
                  'postTitle' => 'fffff',
                  'category' => [1,4,5,7],
                  'postText' => 'text text text text text',
                  'postDescription' => 'Êðàòêîå îïèñàíèå',
                  'questionList' => [['id' => 1,
                                      'text' => 'reeretfffff'],
                                      ['id' => 2,
                                      'text' => 'dfsfsf'],
                                      ['id' => 4,
                                      'text' => 'dfsfsf'],]];*/
        
        return  $this->service->updatePost($model);

    }

    /**
     * @Route("/deletePost")
     * @Method({"POST"})
     *
     * @param Request $request
     * @return array
     */
    public function deletePost(Request $request) {
        $post_id = $request->request->get('post_id');
        return $this->service->delete($post_id);
    }


    /**
     * @Route("/getPosts")
     * @Method({"POST"})
     *
     */
    public function getPostsAction(Request $request)
    {
        $postId = $request->request->get('postid');        
        if(!is_array($postId))
        {
            $postId = [$postId];
        }
        
        $result = $this->service->getPosts($postId);

        return $result;
    }

    /**
     * @Route("/getPost")
     * @Method({"POST"})
     *
     */
    public function getPostAction(Request $request)
    {
        $postId = $request->request->get('postid');
        if(!is_array($postId))
        {
            $postId = [$postId];
        }

        $result = $this->service->getPost($postId);

        return $result;
    }


    /**
     * @Route("/getPostsByDate")
     * @Method({"POST"})
     *
     */
    public function getPostsByDate(Request $request)
    {
        //$authorId = [63, 91];
        //$date = ['25/02/2014', '23/01/2014'];
        
        $data = $request->request->get('authors');      

       
        $result = $this->service->getPostsByDate($data['id'], $data['date']);
        //$result = $this->service->getPostsByDate($authorId, $date);

        return $result;
    }

    /**
     * @Route("/getEditPost/{postId}", requirements={"postId" = "\d+"})
     * @Method({"GET"})
     *
     */
    public function getEditPost($postId)
    {
        $result = $this->service->getEditPost($postId);

        return $result;
    }

    /**
     * @Route("/get_questions/{postId}", requirements={"postId" = "\d+"})
     * @Method({"GET"})
     *
     */
    public function getQuestionsAction($postId)
    {
        $result = $this->service->getQuestions($postId);

        return $result;
    }

    /**
     * @Route("/getQuestions")
     * @Method({"POST"})
     *
     */
    public function getQuestions(Request $request)
    {
        $questionId = $request->request->get('questionid');   
             
        if(!is_array($questionId))
        {
            $questionId = [$questionId];
        }
        
        $result = $this->service->getQuestionsByIds($questionId);

        return $result;
    }

    /**
     * @Route("/get_daystory", requirements={"postId" = "\d+"})
     * @Method({"GET"})
     */
    public function getStoryOfTheDayAction()
    {
        $result = $this->service->getStoryOfTheDay();

        return $result;
    }

    /**
     * @Route("/set_daystory")
     * @Method({"POST"})
     */
    public function setStoryOfTheDayAction(Request $request)
    {
        $postId = $request->request->get('postId');
        
        $result = $this->service->setStoryOfTheDay($postId);

        return $result;
    }

    /**
     * @Route("/like/{postId}", requirements={"postId" = "\d+"})
     * @Method({"GET"})
     */
    public function like($postId)
    {
        $result = $this->service->like($postId);

        return $result;
    }

    /**
     * @Route("/add_likes")
     * @Method({"POST"})
     */
    public function addLikes(Request $request)
    {
        $data = $request->request->get('postlike');
        
        $result = [];
        
        if($data['type'] == 'add')
        {
            $result = $this->service->like($data['postId']);
        }

        return $result;
    }
    /**
     * @Route("/get_all_last_week")
     * @Method({"GET"})
     */
    public function getLastWeekPosts()
    {
        $result = $this->service->getAllLastWeek();

        return $result;
    }

    /**
     * @Route("/get_best_posts")
     * @Method({"GET"})
     */
    public function getBestPosts()
    {
        $result = $this->service->getBestPosts(0, 20);

        return $result;
    }

    /**
     * @Route("/partnerInfo")
     * @Method({"GET"})
     */
    public function partnerInfo()
    {
        $result = $this->partnerservice->getPartnerInfo();

        return $result;
    }

    /**
     * @Route("/get_categoryPosts/{catId}/{catPage}/{maxPagePosts}", requirements={"catId" = "\d+", "catPage" = "\d+", "maxPagePosts" = "\d+"})
     * @Method({"GET"})
     */
    public function get_categoryPosts($catId, $catPage, $maxPagePosts)
    {
        $result = $this->postcategoryservice->getPostsByCategory($catId, $catPage, $maxPagePosts);

        return $result;
    }

    /**
     * @Route("/get_categoryPeople/{catId}/{catPage}/{maxPagePeople}", requirements={"catId" = "\d+"})
     * @Method({"GET"})
     */
    public function get_categoryPeople($catId, $catPage, $maxPagePeople)
    {
        $qposts = $this->postcategoryservice->getPostsByAuthorCategory($catId, $catPage, $maxPagePeople);
        $author = $this->authorservice->getAuthorsByIds($qposts['result']);

        return ['peoples' => $author, 'peoplesCount' => $qposts['count_all']];
    }

    /**
     * @Route("/upload_image")
     * @Method({"FILES|POST"})
     */
    public function uploadImages(Request $request)
    {
        $fileSource = array();
        /** @var UploadedFile[] $files */
        $files = $request->files->get('file');
        $path  = '/upload/images/';
        $absolutePath = $request->server->get('DOCUMENT_ROOT') . "/upload/images";

        $file = $files;

        //return $file;

        $fileInfo    = $file->move($absolutePath, $file->getClientOriginalName());
        $resultImage = $this->imageService->saveImg($fileInfo, $absolutePath . '/');

        $fileSource['file_name'] = $resultImage;
        $fileSource['dir']       = $path;
        $fileSource['filelink']  = $path.$resultImage;

        unlink($absolutePath  . '/' . $fileInfo->getFilename());
       
        return $fileSource;
    }

}