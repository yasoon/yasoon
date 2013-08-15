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

        return $this->service->add($model);
    }

    /**$id =
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
    public function deleteAction(Request $request) {
        $model = $request->request->get('model');

        return $this->service->delete($model);
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

}