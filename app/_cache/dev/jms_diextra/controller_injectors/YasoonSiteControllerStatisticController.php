<?php

namespace Yasoon\Site\Controller;

/**
 * This code has been auto-generated by the JMSDiExtraBundle.
 *
 * Manual changes to it will be lost.
 */
class StatisticController__JMSInjector
{
    public static function inject($container) {
        $instance = new \Yasoon\Site\Controller\StatisticController();
        $instance->_em = $container->get('doctrine.orm.default_entity_manager', 1);
        $instance->securityContext = $container->get('security.context', 1);
        $instance->container = $container;
        return $instance;
    }
}
