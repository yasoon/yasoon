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
use Symfony\Component\Security\Core\Exception\AccessDeniedException;
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

        return  $this->service->add($model);
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

        return  $this->service->update($model);

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

    /**
     * @Route("/get_daystory", requirements={"postId" = "\d+"})
     * @Method({"GET"})
     */
    public function getStoryOfTheDayAction()
    {
        $result = $this->service->getStoryOfTheDay();

        return $result;
    }

    /**
     * @Route("/set_daystory/{postId}", requirements={"postId" = "\d+"})
     * @Method({"GET"})
     */
    public function setStoryOfTheDayAction($postId)
    {
        $result = $this->service->setStoryOfTheDay($postId);

        return $result;
    }

    /**
     * @Route("/like/{postId}", requirements={"postId" = "\d+"})
     * @Method({"GET"})
     */
    public function like($postId)
    {
        $result = $this->service->like($postId);

        return $result;
    }

    /**
     * @Route("/add_likes/{postId}", requirements={"postId" = "\d+"})
     * @Method({"POST"})
     */
    public function addLikes(Request $request)
    {
        $postId = $request->attributes->get('postId');
        $likes = $request->request->get('likes');

        $result = $this->service->addLikes($postId, $likes);

        return $result;
    }
    /**
     * @Route("/get_all_last_week")
     * @Method({"GET"})
     */
    public function getLastWeekPosts()
    {
        try {
            $result = $this->service->getAllLastWeek();
        } catch (AccessDeniedException $e) {
            return new Response('', 403);
        }

        return $result;
    }

    /**
     * @Route("/get_best_posts")
     * @Method({"GET"})
     */
    public function getBestPosts()
    {
        $result = $this->service->getBestPosts(0, 20);

        return $result;
    }


}