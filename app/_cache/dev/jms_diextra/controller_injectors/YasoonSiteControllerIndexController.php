<?php

namespace Yasoon\Site\Controller;

/**
 * This code has been auto-generated by the JMSDiExtraBundle.
 *
 * Manual changes to it will be lost.
 */
class IndexController__JMSInjector
{
    public static function inject($container) {
        $instance = new \Yasoon\Site\Controller\IndexController();
        $refProperty = new \ReflectionProperty('Yasoon\\Site\\Controller\\IndexController', 'service');
        $refProperty->setAccessible(true);
        $refProperty->setValue($instance, $container->get('yasoon.service.content', 1));
        return $instance;
    }
}