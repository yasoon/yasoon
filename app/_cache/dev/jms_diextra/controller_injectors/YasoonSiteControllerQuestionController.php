<?php

namespace Yasoon\Site\Controller;

/**
 * This code has been auto-generated by the JMSDiExtraBundle.
 *
 * Manual changes to it will be lost.
 */
class QuestionController__JMSInjector
{
    public static function inject($container) {
        $instance = new \Yasoon\Site\Controller\QuestionController();
        $refProperty = new \ReflectionProperty('Yasoon\\Site\\Controller\\QuestionController', 'service');
        $refProperty->setAccessible(true);
        $refProperty->setValue($instance, $container->get('yasoon.service.question', 1));
        return $instance;
    }
}