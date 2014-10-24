<?php
/**
 * Author: Fedor Avetisov <cousenavi@gmail.com>
 * Date: 5/22/13
 */

umask(0000); // This will let the permissions be 0777

use Symfony\Component\HttpFoundation\Request;

ini_set('display_errors', 'On');
$loader = require_once __DIR__.'/../app/autoload.php';

require_once __DIR__.'/../app/AppKernel.php';

date_default_timezone_set ( 'Europe/Moscow' );


$kernel = new AppKernel('dev', true);
Request::enableHttpMethodParameterOverride();
$request = Request::createFromGlobals();
$response = $kernel->handle($request);
$response->send();
$kernel->terminate($request, $response);
