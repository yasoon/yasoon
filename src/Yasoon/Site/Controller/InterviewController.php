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
     * @Route("/get_interview_buttons")
     * @Method({"GET"})
     */
    public function get_interview_buttons() {
        $result = $this->service->getInterviewsButtons();

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
     * @Route("/delete_interviews")
     * @Method({"POST"})
     */
    public function delete_interview(Request $request) {
        $interview_id = $request->request->get('id');
        $result = $this->service->deleteInterview($interview_id);
        return $result;
    }
}