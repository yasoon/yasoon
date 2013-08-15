<?php
/**
 * Author: Fedor Avetisov <cousenavi@gmail.com>
 * Date: 5/22/13
 */

namespace Yasoon\Site\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use JMS\DiExtraBundle\Annotation as DI;
use Yasoon\Site\Service\QuestionService;

/**
 * Class QuestionController
 *
 * @Route("/api/question")
 * @package Yasoon\Site\Controller
 */
class QuestionController {

    /**
     * @var QuestionService
     *
     * @DI\Inject("yasoon.service.question")
     */
    private $service;

    /**
     * @Route("/add")
     *
     * @Method({"POST"})
     */
    public function addAction(Request $request) {
        $model = $request->request->get('model');

        return $this->service->add($model);
    }

    /**
     * @Route("/add_interview")
     *
     * @Method({"POST"})
     */
    public function addInterviewAction(Request $request) {
        $model = $request->request->get('model');

        return $this->service->addInterview($model);
    }

    /**
     * @Route("/set_interview_caption")
     *
     * @Method({"POST"})
     */
    public function setInterviewCaption(Request $request) {
        $model = $request->request->get('model');

        return $this->service->setInterviewCaption($model);
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
        $model = $request->request->get('model');

        return $this->service->update($model);
    }

    /**
     * @Route("/delete")
     * @Method({"POST"})
     *
     * @param Request $request
     * @return array
     */
    public function removeAction(Request $request) {
        $model = $request->request->get('model');

        return $this->service->delete($model);
    }

}