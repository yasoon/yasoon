<?php
/**
 * Author: Fedor Avetisov <cousenavi@gmail.com>
 * Date: 5/22/13
 */
use Symfony\Component\HttpFoundation\Request;

$loader = require_once __DIR__.'/../vendor/autoload.php';

require_once __DIR__.'/../app/AppKernel.php';

$kernel = new AppKernel('dev', true);
Request::enableHttpMethodParameterOverride();
$request = Request::createFromGlobals();
$response = $kernel->handle($request);
$response->send();
$kernel->terminate($request, $response);
