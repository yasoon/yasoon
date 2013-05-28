<?php
/**
 * Author: Fedor Avetisov <cousenavi@gmail.com>
 * Date: 5/27/13
 */

namespace Yasoon\Site\EventListener;

use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpKernel\Event\GetResponseEvent;

use JMS\DiExtraBundle\Annotation as DI;

/**
 * @DI\Service
 */
class ResponseListener {

    /**
     * @DI\Observe("kernel.view", priority = 255)
     */
    public function onKernelView(GetResponseEvent $event) {
       $responseData = $event->getControllerResult();

        if ($responseData instanceof Response) {
            return;
        }

       $event->setResponse(new JsonResponse($responseData));
    }
}