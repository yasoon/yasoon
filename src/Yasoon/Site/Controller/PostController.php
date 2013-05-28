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
use Yasoon\Site\Service\PostService;

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
     * @Route("/add")
     *
     * @Method({"POST"})
     */
    public function addAction(Request $request) {
        $model = $request->request->get('model');

        $id = $this->service->add($model);

        return ['id' => $id];
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

        $id = $this->service->update($model);

        return ['id' => $id];
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

        $id = $this->service->delete($model);

        return ['id' => $id];
    }

    /**
     * @Route("/get/{postId}", requirements={"postId" = "\d+"})
     * @Method({"GET"})
     *
     */
    public function getPostAction($postId)
    {
        $result = $this->service->getPost($postId);

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



}