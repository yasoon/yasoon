<?php
/**
 * Author: Fedor Avetisov <cousenavi@gmail.com>
 * Date: 5/27/13
 */

namespace Yasoon\Site\EventListener;

use Symfony\Component\HttpKernel\Event\GetResponseEvent;

/**
 * @Service
 * @Tag("kernel.event_listener", attrubutes = {"event"="kernel.response", "method"= "onKernelResponse"}
 */
class ResponseListener {

    public function onKernelResponse(GetResponseEvent $event) {
        $test = 1;
    }
}