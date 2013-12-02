<?php
/**
 * Author: Fedor Avetisov <cousenavi@gmail.com>
 * Date: 5/22/13
 */

namespace Yasoon\Site\Controller;

use Symfony\Component\HttpFoundation\Response;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use JMS\DiExtraBundle\Annotation as DI;
use Yasoon\Site\Service\ContentService;

class IndexController {


    /**
     * @var ContentService
     *
     * @DI\Inject("yasoon.service.content")
     */
    private $service;

    /**
     * @Route("/")
     *
     * @return Response
     */
    public function indexAction() {

        $content = str_replace("\\n", "\\\\n", json_encode($this->service->getAllContent()));


        $html = <<<HTML

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Yasoon</title>
<!--<link href="css/common.css" rel="stylesheet"/>-->
<link rel="stylesheet" href="css/reset.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/fonts.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/forms.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/style.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/media.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/fix.css" type="text/css" media="screen" />

<script src='js/lib/requirejs-2.1.8.js'></script>

<script src='js/lib/jquery-2.0.1.min.js'></script>
<script src='js/lib/respond.min.js'></script>

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
      'jquery.ui.widget': 'lib/jquery.ui.widget',
      jqueryupload: 'lib/jquery.fileupload',
      jqueryuploadiframetransport: 'lib/jquery.iframe-transport',
      underscore: 'lib/underscore-min-1.5.2',
      backbone: 'lib/backbone-1.0.0.min',
      handlebars: 'lib/handlebars-runtime-1.0.0',
      chaplin: 'lib/chaplin-min',
      JST: 'templates_compiled/combined',
      tinyEditor: 'lib/tiny.editor',
      categories: 'categories',
      sitefunctions: 'site/functions',
      bootstrap_wysiwyg : 'lib/bootstrap-wysiwyg',
      jquery_hotkeys : 'lib/jquery.hotkeys',
      helper : 'lib/helper',
      bootstrap : 'lib/bootstrap.min'
    },
    // Underscore and Backbone are not AMD-capable per default,
    // so we need to use the AMD wrapping of RequireJS
    shim: {
      underscore: {
        exports: '_'
      },
      categories: {
        exports: 'categories'
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
      'jqueryui.sortable': ['jqueryui'],
      'tinyEditor': {
        exports: 'TINY'
      }
    }
    // For easier development, disable browser caching
    // Of course, this should be removed in a production environment
//    , urlArgs: 'bust=' +  (new Date()).getTime()
  });

  //add some templates helper
  require(['handlebars'], function(Handlebars) {

  });

  // Bootstrap the application
  require(['application', 'routes'], function(Application, routes) {
    new Application({controllerSuffix: '-controller', routes: routes, pushState: false})
  });

  var managedContent = JSON.parse('$content');
  </script>
</head>
</html>
<body>
</body>

HTML;
        return new Response($html);
    }

    /**
     *
     * Proxy for security firewall
     *
     * @Route("/admin")
     *
     * @return Response
     */
    public function adminAction()
    {
        return $this->indexAction();
    }

}