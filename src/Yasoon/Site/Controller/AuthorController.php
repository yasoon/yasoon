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
use Yasoon\Site\Service\AuthorService;

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
    public function deleteAction(Request $request) {
        $model = $request->request->get('model');

        $id = $this->service->delete($model);

        return ['id' => $id];
    }

    /**
     * @Route("/get_posts_list/{authorId}", requirements={"authorId" = "\d+"})
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
     * @Route("get_questions_list/{authorId}", requirements={"authorId" = "\d+"})
     * @Method({"GET"})
     */
    public function getQuestionsAction($authorId)
    {
        $result = $this->service->getQuestions($authorId);

        return $result;
    }


    /**
     * @Route("get_blank/{authorId}", requirements={"authorId" = "\d+"})
     * @Method({"GET"})
     */
    public function getBlankAction($authorId)
    {
        $result = $this->service->getBlank($authorId);

        return $result;
    }


}