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
use Yasoon\Site\Service\PeopleService;

/**
 * Class PeopleController
 *
 * @Route("/api/people")
 * @package Yasoon\Site\Controller
 */
class PeopleController {

    /**
     * @var PeopleService
     *
     * @DI\Inject("yasoon.service.people")
     */
    private $service;


    /**
     * @Route("/get_authors/{categoryId}", requirements={"categoryId" = "\d+"})
     * @Method({"GET"})
     */
    public function getAuthorsAction($categoryId)
    {
        $result = $this->service->getAuthors($categoryId);

        return $result;
    }

    /**
     * @Route("/get_posts_date/{categoryId}", requirements={"categoryId" = "\d+"})
     * @Method({"GET"})
     */
    public function getPostsByDateAction($categoryId)
    {
        $result = $this->service->getPostsByDate($categoryId);

        return $result;
    }

    /**
     * @Route("/get_posts_rating/{categoryId}", requirements={"categoryId" = "\d+"})
     * @Method({"GET"})
     */
    public function getPostsByRatingAction($categoryId)
    {
        $result = $this->service->getPostsByRating($categoryId);

        return $result;
    }

    /**
     * @Route("/get_about_info")
     * @Method({"GET"})
     */
    public function getAboutInfoAction()
    {
        $result = $this->service->getAboutInfo();

        return $result;
    }

    /**
     * @Route("/search_post_by_date/{text}")
     * @Method({"GET"})
     */
    public function searchPostByDateAction($text)
    {
        $result = $this->service->getPostsByDate(0, $text);

        return $result;
    }

    /**
     * @Route("/search_post_by_rating/{text}")
     * @Method({"GET"})
     */
    public function searchPostByRatingAction($text)
    {
        $result = $this->service->getPostsByRating(0, $text);

        return $result;
    }

    /**
     * @Route("/search_author/{text}")
     * @Method({"GET"})
     */
    public function searchAuthorAction($text)
    {
        $result = $this->service->getAuthors(0, $text);

        return $result;
    }
}