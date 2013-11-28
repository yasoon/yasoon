<?php
/**
 * Author: Fedor Avetisov <cousenavi@gmail.com>
 * Date: 5/22/13
 */

namespace Yasoon\Site\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Security\Core\Exception\AccessDeniedException;
use Yasoon\Site\Service\FriendsService;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use JMS\DiExtraBundle\Annotation as DI;
/**
 * Class FriendsController
 * @Route("/api/friends")
 */
class FriendsController {

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
     * @Route("/timeline_stack")
     *
     * @Method({"POST"})
     */
    public function getTimelineStackAction(Request $request) {
        $offset = $request->request->get('offset');

        $result = $this->service->getTimelineStack($offset);

        return $result;
    }

    /**
     * @Route("/admin_timeline_stack")
     *
     * @Method({"POST"})
     */
    public function getAdminTimelineStackAction(Request $request) {
        $offset = $request->request->get('offset');

        try {
            $result = $this->service->getAdminTimelineStack($offset);
        } catch (AccessDeniedException $e) {
            return new Response('', 302);
        }

        return $result;
    }

    /**
     * @Route("/timeline")
     *
     * @Method({"POST"})
     */
    public function getTimelineAction(Request $request) {


        $map = $request->request->get('map');

        $result = $this->service->getTimeLine($map);

        return $result;
    }
}