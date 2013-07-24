<?php
/**
 * Author: Fedor Avetisov <cousenavi@gmail.com>
 * Date: 5/22/13
 */

namespace Yasoon\Site\Controller;
use Yasoon\Site\Service\FriendsService;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use JMS\DiExtraBundle\Annotation as DI;
/**
 * Class FriendsController
 * @Route("/api/friends")
 */
class FriendsController {

    const TIMELINE_LIMIT = 10;

    /**
     * @var FriendsService
     *
     * @DI\Inject("yasoon.service.friends")
     */
    private $service;


    /**
     * @Route("/add/{writerId}", requirements={"writerId" = "\d+"})
     *
     * @Method({"GET"})
     */
    public function addAction($writerId) {
        $result = $this->service->addFriend($writerId);

        return $result;
    }

    /**
     * @Route("/delete/{writerId}", requirements={"writerId" = "\d+"})
     *
     * @Method({"GET"})
     */
    public function deleteAction($writerId) {
        $result = $this->service->deleteFriend($writerId);

        return $result;
    }

    /**
     * @Route("/timeline/{offset}", requirements={"offset" = "\d+"})
     *
     * @Method({"GET"})
     */
    public function getTimelineAction($offset) {

        $result = $this->service->getTimeLine($offset, self::TIMELINE_LIMIT);

        return $result;
    }
}