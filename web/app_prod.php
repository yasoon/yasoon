<?php
ini_set('display_errors',1);
ini_set('display_startup_errors',1);
error_reporting(-1);

use Symfony\Component\HttpFoundation\Request;

$loader = require_once __DIR__.'/../app/autoload.php';

require_once __DIR__.'/../app/AppKernel.php';

$kernel = new AppKernel('prod', true);
Request::enableHttpMethodParameterOverride();
$request = Request::createFromGlobals();
$response = $kernel->handle($request);
$response->send();
$kernel->terminate($request, $response);
