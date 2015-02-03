<?php
namespace Yasoon\Site\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use JMS\DiExtraBundle\Annotation as DI;
use Yasoon\Site\Service\ImageService;
/**
 * Class ContentController
 *
 * @Route("/api/content")
 * @package Yasoon\Site\Controller
 */
class ContentController {

    /**
     * @var \Symfony\Component\Security\Core\SecurityContextInterface
     *
     * @DI\Inject("security.context")
     */
    private $securityContext;
    
    /**
     * @var ContentService
     *
     * @DI\Inject("yasoon.service.content")
     */
    private $service;
    
    /**
     * @var ImageService
     *
     * @DI\Inject("yasoon.service.image")
     */
    private $imageService;


    /**
     * @Route("/get_all/{tagId}", defaults={"tagId" = 0})
     *
     * @Method({"GET"})
     */
    public function getAllContent($tagId) {
        $result = $this->service->getAllContent($tagId);

        return $result;
    }

    /**
     * @Route("/edit")
     *
     * @Method({"POST"})
     */
    public function editRow(Request $request) {
        $model = $request->request->get('model');

        $result = $this->service->editRow($model);

        return $result;
    }

    /**
     * @Route("/add")
     *
     * @Method({"POST"})
     */
    public function addRow(Request $request) {
        $model = $request->request->get('model');

        $result = $this->service->addRow($model);

        return $result;
    }

    /**
     * @Route("/delete")
     *
     * @Method({"POST"})
     */
    public function deleteRow(Request $request) {
        $id = $request->request->get('id');

        $result = $this->service->deleteRow($id);

        return $result;
    }
    
    /**
     * @Route("/get_all_tags")
     *
     * @Method({"GET"})
     */
    public function getAllTags() {
        $result = $this->service->getAllTags();

        return $result;
    }
    

    /**
     * @Route("/add_tag")
     *
     * @Method({"POST"})
     */
    public function addTag(Request $request) {
        $model = $request->request->get('tag');
        
        $result = $this->service->addTag($model);

        return $result;
    }
    

    /**
     * @Route("/edit_tag")
     *
     * @Method({"POST"})
     */
    public function editTag(Request $request) {
        $model = $request->request->get('tag');
        
        $result = $this->service->editTag($model);

        return $result;
    }
    

    /**
     * @Route("/delete_tag")
     *
     * @Method({"POST"})
     */
    public function deleteTag(Request $request) {
        $id = $request->request->get('id');

        $result = $this->service->deleteTag($id);

        return $result;
    }
    
    /**
     * @Route("/get_big_images")
     *
     * @Method({"GET"})
     */
    public function getBigImages() {
        
        $result = $this->service->getBigImages();

        return $result;
    }
    
    /**
     * @Route("/upload_content_image/{contentId}")
     * @Method({"FILES|POST"})
     */
    
    public function uploadContentImage(Request $request, $contentId) {
        
        $fileSource = [];
        /** @var UploadedFile[] $files */
        $files = $request->files->get('files');
        
        $absolutePath = $request->server->get('DOCUMENT_ROOT') . "/upload/content";
        
        $file = $files[0];
        $imageSize = getimagesize($file);

        $fileInfo    = $file->move($absolutePath, $file->getClientOriginalName());
        $resultImage = $this->imageService->resizeImage($fileInfo, $absolutePath . '/', $imageSize[0], $imageSize[1]);
        
        $savedUrl = $this->service->editTextById($contentId, '/content/'.$resultImage);
        
        unlink($absolutePath  . '/' . $fileInfo->getFilename());
        
        $fileSource['file_name']    = $savedUrl['text'];
        $fileSource['contentId']   = $contentId;

        return new Response(json_encode($fileSource));
    }
    
}