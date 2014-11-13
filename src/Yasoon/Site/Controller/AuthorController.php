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
use Symfony\Component\Security\Core\SecurityContextInterface;
use Yasoon\Site\Service\AuthorService;
use Yasoon\Site\Service\ImageService;

error_reporting(0);

/**
 * Class AuthorController
 *
 * @Route("/api/author")
 * @package Yasoon\Site\Controller
 */
class AuthorController {

    /**
     * @var AuthorService
     *
     * @DI\Inject("yasoon.service.author")
     */
    private $service;

    /**
     * @var ImageService
     *
     * @DI\Inject("yasoon.service.image")
     */
    private $imageService;
    
    
    /**
     * @Route("/setFriends")
     * @Method({"POST"})
     *
     * @return array
     */
    public function setFriends(Request $request) {
        $author = $request->request->get('authorId');
        $friend = $request->request->get('friend');
        
        $result = $this->service->setFriends($author, $friend);
        
        return $result;
    }
    
    /**
     * @Route("/setQuestion")
     * @Method({"POST"})
     *
     * @return array
     */
    public function setQuestion(Request $request) {
        $question = $request->request->all();
        $result = $this->service->setQuestion($question);
        
        return $result;
    }
    
    
    /**
     * @Route("/saveQuestionAnswer")
     * @Method({"POST"})
     *
     * @return array
     */
    public function saveQuestionAnswer(Request $request) {
         $req_array = $request->request->all();
        /*$result = [];
        
        $method = $request->getMethod();
        switch($method)
        {
            case 'DELETE' :
                $array = $request->request->all();
                if($array['type'] == 'delete')
                {
                    $result = $this->service->deleteQuestion($array['id']);
                }
            break;
            case 'PUT' :
                $array = $request->request->all();
                $result = $this->service->answerQuestion($array);
            break;
        }
        */
        
        //$req_array = ['type' => 'answer', 'id' => 54, 'authorId' => 91, 'questionAnswerText' => 'fdfdfd'];

        if( $req_array['type'] == 'answer' )
            $result = $this->service->answerQuestion($req_array);

        if( $req_array['type'] == 'delete' )
            $result = $this->service->deleteQuestion($req_array['id']);


        return $result;
    }

    /**
     * @Route("/get_short_info/{authorId}", requirements={"authorId" = "\d+"})
     * @Method({"GET"})
     *
     * @param $authorId
     *
     * @return array
     */
    public function getShortInfoAction($authorId) {

        $result = $this->service->getShortInfo($authorId);

        return $result;
    }

    /**
     * @Route("/getShortUserData")
     * @Method({"GET"})
     *
     * @return array
     */
    public function getShortUserDataAction() {
        $result = $this->service->getPrivateInfo();

        return $result;
    }

    /**
     * @Route("/clearTimeline")
     * @Method({"POST"})
     */
    public function clearTimeline(Request $request){
        $req_arr = $request->request->all();
        //$req_array = array( 'type' => 'questions', 'authorId' => 63 );
        $result = $this->service->clearTimeline($req_arr);

        return $result;
    }

    /**
     * @Route("/get_status_info")
     *
     * @Method({"GET"})
     */
    public function getStatusInfoAction()
    {
        $result = $this->service->getStatusInfo();

        return $result;
    }

    /**
     * @Route("/get_posts/{authorId}", requirements={"authorId" = "\d+"})
     * @Method({"GET"})
     *
     * @param $authorId
     * @return array
     */
    public function getPostsAction($authorId)
    {
        $result = $this->service->getPosts($authorId);

        return $result;
    }
    
    

    /**
     * @Route("/getAuthorInfo")
     * @Method({"POST"})
     */
    public function getAuthorInfo(Request $request)
    {
        $authors_id = $request->request->get('author_id');
        
        if(!is_array($authors_id))
        {
            $authors_id = [$authors_id];
        }
        
        $result = $this->service->getAuthorsInfoByIds($authors_id);
        
        return $result;
    }
    

    /**
     * @Route("/get_questions")
     * @Method({"POST"})
     */
    public function getQuestionsAction(Request $request)
    {
        $map = $request->request->get('map');

        $result = $this->service->getQuestions($map);

        return $result;
    }

    /**
     * @Route("/get_questions_stack/{authorId}", requirements={"authorId" = "\d+"})
     * @Method({"POST"})
     */
    public function getQuestionsStackAction(Request $request)
    {
        $authorId = $request->attributes->get('authorId');
        $offset = $request->request->get('offset');

        $result = $this->service->getQuestionsStack($authorId, $offset);

        return $result;
    }

    /**
     * @Route("/update_questions_places/{authorId}", requirements={"authorId" = "\d+"})
     * @Method({"POST"})
     *
     * @param Request $request
     * @return array
     */
    public function updateQuestionsPlaces(Request $request)
    {
        $map = $request->request->get('map');

        return $this->service->updateQuestionsPlaces($map);
    }

    /**
     * @Route("/update_posts_places/{authorId}", requirements={"authorId" = "\d+"})
     * @Method({"POST"})
     *
     * @param Request $request
     * @return array
     */
    public function updatePostsPlaces(Request $request)
    {
        $map = $request->request->get('map');

        return $this->service->updatePostsPlaces($map);
    }

    /**
     * @Route("/get_blank/{authorId}", requirements={"authorId" = "\d+"})
     * @Method({"GET"})
     */
    public function getBlankAction($authorId)
    {
        $result = $this->service->getBlank($authorId);

        return $result;
    }

    /**
     * @Route("/register")
     * @Method({"POST"})
     */
    public function register(Request $request)
    {
        $name = $request->request->get('name');
        $email = $request->request->get('email');
        $password = $request->request->get('password');
        $subscribed = $request->request->get('subscribed');
        
        if (!isset($subscribed) || empty($subscribed) || $subscribed !='on') {
            $subscribed = false;
        } else {
            $subscribed = true;
        }
        
        $params = ['name'       => $name,
                   'email'      => $email,
                   'password'   => $password,
                   'subscribed' => $subscribed];

        return $this->service->register($params);
    }
    
    /**
     * @Route("/send_mail")
     * @Method({"GET"})
     */
    public function send_mail(Request $request)
    {
        $result = $this->service->send_email();
        print_r($result);
        die;
        return [];
    }

    /**
     * @Route("/editinfo")
     * @Method({"POST"})
     */
    public function editInfo(Request $request)
    {
        $author = $request->request->all();

        return $this->service->editinfo($author);
    }

    /**
     * @Route("/notify")
     * @Method({"POST"})
     */
    public function notify(Request $request)
    {
        $email = $request->request->get('email');

        return $this->service->notify($email);
    }

    /**
     * @Route("/change_pass/{email}/{hash}")
     * @Method({"GET"})
     */
    public function change_pass($email, $hash)
    {
        return $this->service->change_pass($email, $hash);
    }

    /**
     * @Route("/upload_user_image")
     * @Method({"FILES|POST"})
     */
    public function uploadUserImage(Request $request)
    {
        $fileSource = array();
        /** @var UploadedFile[] $files */
        $files = $request->files->get('files');
        $path  = '/upload/avatar/';
        $absolutePath = $request->server->get('DOCUMENT_ROOT') . "/upload/avatar";

        $file = $files[0];

        $fileInfo    = $file->move($absolutePath, $file->getClientOriginalName());
        $resultImage = $this->imageService->resizeImage($fileInfo, $absolutePath . '/');

        $fileSource['file_name'] = $resultImage;
        $fileSource['dir']       = $path;

        $oldImage = $this->service->setAvatarAuthor($resultImage);
        // удаляем оригинальное и старое изображение
        unlink($absolutePath  . '/' . $fileInfo->getFilename());
        if (!empty($oldImage)) {
            unlink($absolutePath  . '/' . $oldImage);
        }

        return new Response(json_encode($fileSource));
    }

    /**
     * @Route("/save")
     * @Method({"POST"})
     */
    public function save(Request $request) {
        $model = $request->request->get('model');
        return  $this->service->save($model);
    }
}