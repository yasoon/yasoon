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
     * @Route("/get_private_info")
     * @Method({"GET"})
     *
     * @return array
     */
    public function getPrivateInfoAction() {
        $result = $this->service->getPrivateInfo();

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
        $author = $request->request->get('author');

        return $this->service->register($author);
    }

    /**
     * @Route("/editinfo")
     * @Method({"POST"})
     */
    public function editInfo(Request $request)
    {
        $author = $request->request->get('author');

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
     * @Route("/upload_user_image")
     * @Method({"FILES|POST"})
     */
    public function uploadUserImage(Request $request)
    {
        $fileSource = array();
        /** @var UploadedFile[] $files */
        $files = $request->files->get('files');
        $path  = 'upload/';

        foreach ($files as $key => $file) {
            $fileInfo    = $file->move($request->server->get('DOCUMENT_ROOT') . "/../frontend_src/upload", $file->getClientOriginalName());
            $resultImage = $this->imageService->resizeImage($fileInfo->getFilename(), $path);
            // удаляем старое изображение
            unlink($path . $fileInfo->getFilename());
            $fileSource[$key]['file_name'] = $resultImage;
            $fileSource[$key]['dir']       = $path;
        }

        return $fileSource;
    }
}