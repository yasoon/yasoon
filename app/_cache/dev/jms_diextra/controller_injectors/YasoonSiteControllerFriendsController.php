<?php

namespace Yasoon\Site\Controller;

/**
 * This code has been auto-generated by the JMSDiExtraBundle.
 *
 * Manual changes to it will be lost.
 */
class FriendsController__JMSInjector
{
    public static function inject($container) {
        $instance = new \Yasoon\Site\Controller\FriendsController();
        $refProperty = new \ReflectionProperty('Yasoon\\Site\\Controller\\FriendsController', 'service');
        $refProperty->setAccessible(true);
        $refProperty->setValue($instance, $container->get('yasoon.service.friends', 1));
        return $instance;
    }
}
