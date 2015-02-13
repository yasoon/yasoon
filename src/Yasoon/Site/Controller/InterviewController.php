<?php
/**
 * Author: Mihail Parandiy <parandiy.mihail@gmail.com>
 * Date: 5/22/13
 */

namespace Yasoon\Site\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use JMS\DiExtraBundle\Annotation as DI;
use Yasoon\Site\Service\InterviewService;
use Yasoon\Site\Service\ImageService;

/**
 * Class InterviewController
 *
 * @Route("/api/interview")
 * @package Yasoon\Site\Controller
 */
class InterviewController {

    /**
     * @var InterviewService
     *
     * @DI\Inject("yasoon.service.interview")
     */
    private $service;
    
    /**
     * @var ImageService
     *
     * @DI\Inject("yasoon.service.image")
     */
    private $imageService;
    
    /**
     * @Route("/questions/{interviewId}", requirements={"interviewId" = "\d+"})
     * @Method({"GET"})
     *
     */
    public function questions($interviewId) {
        $result = $this->service->getQuestions($interviewId);

        return  $result;
    }
    
    /**
     * @Route("/get_answers/{questionId}")
     * @Method({"GET"})
     */
    public function get_answers($questionId) {
        $result = $this->service->getAnswers($questionId);

        return  $result;
    }
    
    /**
     * @Route("/get_interviews")
     * @Method({"GET"})
     */
    public function get_interview() {
        $result = $this->service->getInterviews();

        return  $result;
    }
    
    /**
     * @Route("/get_interviews_admin")
     * @Method({"GET"})
     */
    public function get_interview_admin() {
        $result = $this->service->getInterviewsAdmin();

        return  $result;
    }
    
     /**
     * @Route("/get_interview_buttons")
     * @Method({"GET"})
     */
    public function get_interview_buttons() {
        $result = $this->service->getInterviewsButtons();

        return  $result;
    }
    
    /**
     * @Route("/get_interviews_lego/{interviewId}")
     * @Method({"GET"})
     */
    public function get_interview_lego($interviewId) {
        $result = $this->service->getInterviewsLego($interviewId);

        return  $result;
    }
    
    /**
     * @Route("/get_interviews_all")
     * @Method({"GET"})
     */
    public function get_interviews_all() {
        $result = $this->service->getInterviewsAll();

        return  $result;
    }
    
    /**
     * @Route("/get_interviews_lego_best")
     * @Method({"GET"})
     */
    public function get_interviews_lego_best() {
        $result = $this->service->getInterviewsLegoBest();

        return  $result;
    }
    
    /**
     * @Route("/get_moderator_interviews/{authorId}")
     * @Method({"GET"})
     */
    public function get_moderator_interviews($authorId) {
        $result = $this->service->getInterviewsModerator($authorId);

        return  $result;
    }
    
    /**
     * @Route("/get_interviews_by_type/{typeId}")
     * @Method({"GET"})
     */
    public function get_interviews_by_type($typeId) {
        $result = $this->service->getInterviewsByType($typeId);

        return  $result;
    }
    
    /**
     * @Route("/save_interview")
     * @Method({"POST"})
     */
    public function save_interview(Request $request) {
        $data = $request->request->get('interview');
        /*$data = ['interview' => ['id' => 1,
                                 'name' => 'rerere',
                                 'questions' => [['id' => 1, 'text' => 'testtt11'],
                                                 ['id' => 2, 'text' => 'ffffff22']
                                                ]
                                 ]
                ];*/
        $result = $this->service->saveInterview($data);
        return  $result;
    }
    
    
    /**
     * @Route("/save_interview_lego")
     * @Method({"POST"})
     */
    public function save_interview_lego(Request $request) {
        $answersIds = $request->request->get('answers');
        $interviewId = $request->request->get('interviewId');
        $questionId = $request->request->get('questionId');

        $result = $this->service->saveInterviewLego($interviewId, $questionId, $answersIds);

        return  $result;
    }
    
    /**
     * @Route("/save_interview_description")
     * @Method({"POST"})
     */
    public function save_interview_description(Request $request) {
        $description = $request->request->get('description');
        $interviewId = $request->request->get('interviewId');

        $result = $this->service->saveInterviewDescription($interviewId, $description);

        return  $result;
    }
    
    /**
     * @Route("/remove_interview_lego")
     * @Method({"POST"})
     */
    public function remove_interview_lego(Request $request) {
        $interviewId = $request->request->get('interviewId');
        $questionId = $request->request->get('questionId');
        
        $result = $this->service->removeInterviewLego($interviewId, $questionId);

        return  $result;
    }

    /**
     * @Route("/delete_interviews")
     * @Method({"POST"})
     */
    public function delete_interview(Request $request) {
        $interview_id = $request->request->get('id');
        $result = $this->service->deleteInterview($interview_id);
        return $result;
    }
    
     /**
     * @Route("/get_moderators/{interviewId}")
     * @Method({"GET"})
     */
    public function get_moderators($interviewId) {
        $result = $this->service->getModerators($interviewId);
        return $result;
    }
    
        /**
     * @Route("/upload_interview_image/{interviewId}")
     * @Method({"FILES|POST"})
     */
    public function uploadInterviewImage(Request $request, $interviewId)
    {

        $fileSource = array();
        /** @var UploadedFile[] $files */
        $files = $request->files->get('files');

        $path  = '/upload/interviews/';
        $absolutePath = $request->server->get('DOCUMENT_ROOT') . "/upload/interviews";

        $file = $files[0];

        $fileInfo    = $file->move($absolutePath, $file->getClientOriginalName());
        $resultImage = $this->imageService->resizeImage($fileInfo, $absolutePath . '/', '200', '200');
        sleep(1);
        $resultPreviewImage = $this->imageService->resizeImage($fileInfo, $absolutePath . '/', '1020', '487');

        $fileSource['file_name'] = $resultImage;
        $fileSource['dir']       = $path;

        $oldImage = $this->service->setInterviewImg($resultImage, $resultPreviewImage, $interviewId);
        // удаляем оригинальное и старое изображение
        unlink($absolutePath  . '/' . $fileInfo->getFilename());
        if (!empty($oldImage) && $oldImage['oldImage'] != '' && file_exists($absolutePath  . '/' . $oldImage['oldImage'])) {
            unlink($absolutePath  . '/' . $oldImage['oldImage']);
        }
        
        if (!empty($oldImage) && $oldImage['oldPreviewImage'] != '' && file_exists($absolutePath  . '/' . $oldImage['oldPreviewImage'])) {
            unlink($absolutePath  . '/' . $oldImage['oldPreviewImage']);
        }

        return new Response(json_encode($fileSource));
    }
}