<?php
/**
 * Author: Fedor Avetisov <cousenavi@gmail.com>
 * Date: 5/23/13
 */


$loader = require_once(__DIR__.'/../vendor/autoload.php');

use Doctrine\Common\Annotations\AnnotationRegistry;

AnnotationRegistry::registerLoader(function($class) use ($loader) {
    $loader->loadClass($class);
    return class_exists($class, false);
});

//AnnotationRegistry::registerPrefix('PHPExcel', __DIR__.'/../vendor/bundles/Export/ExcelBundle/Library/phpExcel/Classes');

$vendorDir = __DIR__.'/../vendor/';

AnnotationRegistry::registerFile( __DIR__.'/../vendor/doctrine/orm/lib/Doctrine/ORM/Mapping/Driver/AnnotationDriver.php');

AnnotationRegistry::registerAutoloadNamespaces(
    ['Sensio\\Bundle\\FrameworkExtraBundle' =>  __DIR__.'/../vendor/sensio/framework-extra-bundle/']);