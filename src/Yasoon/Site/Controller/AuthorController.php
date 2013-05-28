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
    public function removeAction(Request $request) {
        $model = $request->request->get('model');

        $id = $this->service->delete($model);

        return ['id' => $id];
    }

    /**
     * @Route("/get_posts_list/{authorId}, requirements={"authorId" = "\d+"})
     * @Method({"GET"})
     *
     * @return array
     */
    public function getPostsList()
    {
        $result = [];

        return $result;
    }

    /**
     * @Route("/get_post/{postId}", requirements={"postId" = "\d+"})
     * @Method({"GET"})
     *
     */
    public function getPost()
    {
        $result = [];

        return $result;
    }

    /**
     * @Route("get_blank/{authorId}, requirements={"authorId" = "\d+"})
     * @Method({"GET"})
     */
    public function getBlank()
    {
        $result = [];

        return $result;
    }

    /**
     * @Route("get_post_questions/{postId}", requirements={"postId" = "\d+"})
     * @Method({"GET"})
     */
    public function getPostQuestions()
    {
        $result = [];

        return $result;
    }

    /**
     * @Route("get_author_questions/{authorId}, requirements={"authorId" = "\d+"})
     * @Method({"GET"})
     */
    public function getAuthorQuestions()
    {
        $result = [];

        return $result;
    }

}