<?php

namespace Yasoon\Site\Controller;

/**
 * This code has been auto-generated by the JMSDiExtraBundle.
 *
 * Manual changes to it will be lost.
 */
class TestController__JMSInjector
{
    public static function inject($container) {
        $instance = new \Yasoon\Site\Controller\TestController();
        $instance->_em = $container->get('doctrine.orm.default_entity_manager', 1);
        $instance->securityContext = $container->get('security.context', 1);
        $instance->container = $container;
        return $instance;
    }
}
