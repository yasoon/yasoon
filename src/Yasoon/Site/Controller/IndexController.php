<?php
/**
 * Author: Fedor Avetisov <cousenavi@gmail.com>
 * Date: 5/22/13
 */

namespace Yasoon\Site\Controller;

use Symfony\Component\HttpFoundation\Response;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;

class IndexController {

    /**
     * @Route("/")
     *
     * @return Response
     */
    public function indexAction() {

        $html = <<<HTML

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Yasoon</title>
<link href="css/common.css" rel="stylesheet"/>
<script src='js/lib/requirejs-2.1.6.js'></script>
  <script>

JST = {}
  // Configure the AMD module loader
  requirejs.config({
    // The path where your JavaScripts are located
    baseUrl: './js/',
    // Specify the paths of vendor libraries
    paths: {
      jquery: 'lib/jquery-2.0.1.min',
      jqueryui: 'lib/jquery-ui-1.10.3.custom.min',
      underscore: 'lib/underscore-1.4.4.min',
      backbone: 'lib/backbone-1.0.0.min',
      handlebars: 'lib/handlebars-runtime-1.0.0.rc.4',
      chaplin: 'lib/chaplin-0.9.0',
      JST: 'templates_compiled/combined'
    },
    // Underscore and Backbone are not AMD-capable per default,
    // so we need to use the AMD wrapping of RequireJS
    shim: {
      underscore: {
        exports: '_'
      },
      backbone: {
        deps: ['underscore', 'jquery'],
        exports: 'Backbone'
      },
      handlebars: {
        exports: 'Handlebars'
      },
      JST: {
        deps: ['handlebars'],
        exports: 'JST'
      },
      'jqueryui.sortable': ['jqueryui']
    }
    // For easier development, disable browser caching
    // Of course, this should be removed in a production environment
    , urlArgs: 'bust=' +  (new Date()).getTime()
  });

  //add some templates helper
  require(['handlebars'], function(Handlebars) {

  });

  // Bootstrap the application
  require(['application'], function(Application) {
    (new Application).initialize();
  });
  </script>
</head>
<body>
<div id = "top"></div>
<div id = "left"></div>
<div id = "center"></div>
</body>
</html>


HTML;
        return new Response($html);
    }

}