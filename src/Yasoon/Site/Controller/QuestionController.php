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
     * @Route("/addAnswer")
     *
     * @Method({"POST"})
     */
    public function addAnswerAction(Request $request) {
        $model = $request->request->get('model');

        return $this->service->addAnswer($model);
    }


    /**
     * @Route("/get_new_answers")
     * @Method({"GET"})
     *
     */
    public function getNewAnswers() {
        return $this->service->getNewAnswers();
    }

    /**
     * @Route("/answer_notified")
     * @Method({"POST"})
     */
    public function answerNotified(Request $request) {
        $question_ids = $request->request->get('question_ids');
        if (!is_array($question_ids)) {
            $question_ids = [$question_ids];
        }
        return $this->service->questionAnswerNitified($question_ids);
    }

    /**
     * @Route("/get_answer_timeline")
     * @Method({"GET"})
     *
     */
    public function getAnswerTimeline() {
        return $this->service->getAnswerTimeline();
    }

    /**
     * @Route("/clear_answer_timeline")
     * @Method({"GET"})
     *
     */
    public function clearAnswerTimeline() {
        return $this->service->claerAnswerTimeline();
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

    /**
     * @Route("/get_unanswered_question")
     * @Method({"GET"})
     */
    public function getUnansweredQuestionsAction() {
        return $this->service->getUnansweredQuestions();
    }

}