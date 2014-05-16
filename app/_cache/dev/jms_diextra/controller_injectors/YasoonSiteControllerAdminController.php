<?php

namespace Yasoon\Site\Controller;

/**
 * This code has been auto-generated by the JMSDiExtraBundle.
 *
 * Manual changes to it will be lost.
 */
class AdminController__JMSInjector
{
    public static function inject($container) {
        $instance = new \Yasoon\Site\Controller\AdminController();
        $refProperty = new \ReflectionProperty('Yasoon\\Site\\Controller\\AdminController', 'authorservice');
        $refProperty->setAccessible(true);
        $refProperty->setValue($instance, $container->get('yasoon.service.author', 1));
        $refProperty = new \ReflectionProperty('Yasoon\\Site\\Controller\\AdminController', 'postservice');
        $refProperty->setAccessible(true);
        $refProperty->setValue($instance, $container->get('yasoon.service.post', 1));
        $refProperty = new \ReflectionProperty('Yasoon\\Site\\Controller\\AdminController', 'interviewservice');
        $refProperty->setAccessible(true);
        $refProperty->setValue($instance, $container->get('yasoon.service.interview', 1));
        $refProperty = new \ReflectionProperty('Yasoon\\Site\\Controller\\AdminController', 'service');
        $refProperty->setAccessible(true);
        $refProperty->setValue($instance, $container->get('yasoon.service.content', 1));
        $instance->securityContext = $container->get('security.context', 1);
        return $instance;
    }
}