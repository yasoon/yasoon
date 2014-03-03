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
use Yasoon\Site\Service\AuthorService;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use Export\ExcelBundle\Services\Export;
use PHPExcel;

 error_reporting( 0 );

/**
 * Class AdminController
 *
 * @Route("/admin")
 * @package Yasoon\Site\Controller
 */
class AdminController extends Controller {

    /**
     * @var AuthorService
     *
     * @DI\Inject("yasoon.service.author")
     */
    private $authorservice;
    
    /**
     * @var PostService
     *
     * @DI\Inject("yasoon.service.post")
     */
    private $postservice;
    

    /**
     * @var ContentService
     *
     * @DI\Inject("yasoon.service.interview")
     */
    private $interviewservice;
    

    /**
     * @var ContentService
     *
     * @DI\Inject("yasoon.service.content")
     */
    private $service;

    /**
     * @var \Symfony\Component\Security\Core\SecurityContextInterface
     *
     * @DI\Inject("security.context")
     */
    public  $securityContext;

    
    public function isAdmin()
    {
        $roles = $this->securityContext->getToken()->getRoles();
        foreach($roles as $role)
        {
            if($role->getRole() == 'ROLE_ADMIN')
            {
                return true;
            }
        }
        return false;
    }
    
    
    /**
     *
     * Proxy for security firewall
     *
     * @Route("/")
     *
     * @return array
     */
    public function indexAction()
    {
        if(!$this->isAdmin())
        {
            header('Location: /#404', true, 307);
            die();
            return ['error' => true, 'errorText' => 'accessDenied'];
        }
        $content =  json_encode([[
                'id' => '1',
                'description' => '2',
                'text' => '3' 
            ]]);


        $html = <<<HTML

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Yasoon</title>
<!--<link href="css/common.css" rel="stylesheet"/>-->
<link rel="stylesheet" href="../frontend/css/reset.css" type="text/css" media="screen" />
<link rel="stylesheet" href="../frontend/css/fonts.css" type="text/css" media="screen" />
<link rel="stylesheet" href="../frontend/css/forms.css" type="text/css" media="screen" />
<link rel="stylesheet" href="../frontend/css/style.css" type="text/css" media="screen" />
<link rel="stylesheet" href="../frontend/css/media.css" type="text/css" media="screen" />
<link rel="stylesheet" href="../frontend/css/loader.css" type="text/css" media="screen" />
<link rel="stylesheet" href="../frontend/css/redactor.css" type="text/css" media="screen" />
<!-- <link rel="stylesheet" href="../css/fix.css" type="text/css" media="screen" /> -->

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no" />
<link rel="stylesheet" href="../frontend/css/media.css" type="text/css" media="screen" />

<script src="../frontend/js/require.js" type="text/javascript"></script>
<script src="../frontend/api/adminConfig.js" type="text/javascript"></script>
<!-- <script>

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
  </script> -->
</head>
</html>
<body>
    <div class="main_block">
     <div class="barrier"></div>
     <header></header>
   <section class="page_content"></section>
   <section class="reserve_block"></section>
  </div>
  <footer>
   <div class="inside">
    <div class="left aus">© 2013 yasoon</div>
    <nav>
     <a href="">About us</a>
     <a href="">Contact us</a>
    </nav>
    <div class="clearfix"></div>
   </div>
  </footer>
</body>

HTML;
        return new Response($html);
    }
    
    
    /**
     * @Route("/getUsers/{page}/{items}")
     * @Method({"GET"})
     *
     * @return array
     */
    public function getUsers($page, $items)
    {
        if(!$this->isAdmin())
        {
            return ['error' => true, 'errorText' => 'accessDenied'];
        }
        
        $users = $this->authorservice->get_all($page, $items);
        
        return $users;
    }
    
    /**
     * @Route("/deleteUser")
     * @Method({"POST"})
     *
     * @return array
     */
    public function deleteUser(Request $request)
    {
        if(!$this->isAdmin())
        {
            return ['error' => true, 'errorText' => 'accessDenied'];
        }
        
        $id = $request->request->get('id');
        
        $result = $this->authorservice->deleteUser($id);
        
        return $result;
    }
    
    /**
     * @Route("/get_posts/{page}/{items}")
     * @Method({"GET"})
     *
     * @return array
     */
    public function get_posts($page, $items)
    {
        if(!$this->isAdmin())
        {
            return ['error' => true, 'errorText' => 'accessDenied'];
        }
        
        $result = $this->postservice->get_all($page, $items);
        
        return $result;
    }
    
    
    /**
     * @Route("/deleteInterview")
     * @Method({"POST"})
     *
     * @return array
     */
    public function deleteInterview(Request $request)
    {
        if(!$this->isAdmin())
        {
            return ['error' => true, 'errorText' => 'accessDenied'];
        }
        
        $id = $request->request->get('id');
        
        $result = $this->interviewservice->deleteInterview($id);
        
        return $result;
    }
    
    /**
     * @Route("/excel_users")
     * @Method({"GET"})
     *
     * @return array
     */
    public function excel_users()
    {
        if(!$this->isAdmin())
        {
            return ['error' => true, 'errorText' => 'accessDenied'];
        }
        
        error_reporting( 0 );
        
        $users = $this->authorservice->get_all();
        
        
        $options = array(
            'coordinates' => array(
                'x' => 0,
                'y' => 1,
            ),
            'labels' => array(
                'bold'       => true,
                'size'       => 18,
                'color'      => '#000000',
                'fill'       => '#FFFFFF',
                'height'     => 30,
                'wrap'       => false,
                'horizontal' => 'center',
            ),
            'zebra' => array(
                'color' => '#FF0000',
            ),
            'return' => true,
        );
        
        
        $labels = array(
            'id' => 'ID',
            'name'   => 'Name',
            'email'  => 'E-mail',
            'date' => 'Date',
            'reg_from' => 'Register From',
        );
        
        $data = [];
        foreach($users as $user)
        {
            $data[] = ['id' => $user['id'],
                       'name' => $user['name'],
                       'email' => $user['email'],
                       'date' => $user['date_reg'],
                       'reg_from' => $user['reg_from']];
        }
        

        $phpExcelObject = $this->get('export.excel');
        $phpExcelObject->createSheet();
        $phpExcelObject->setNameOfSheet('Users '.date('Y-m-d'));
        $phpExcelObject->writeTable($data, $labels, $options);
        $phpExcelObject->writeExport('users');
        
        return ['file_xls' => $_SERVER['HTTP_HOST'].'/web/users.xls'];
    }
    
    /**
     * @Route("/csv_users")
     * @Method({"GET"})
     *
     * @return array
     */
    public function csv_users()
    {
        if(!$this->isAdmin())
        {
            return ['error' => true, 'errorText' => 'accessDenied'];
        }
        
        $users = $this->authorservice->get_all();
        
        $result = '';
        foreach($users as $user)
        {
            $data = [$user['id'], $user['name'], $user['email'], $user['date_reg'], 'reg_from' => $user['reg_from']];
            $result .= implode(',', $data)."\n";
        }
        return ['result' => $result];
    }
    
    /**
     * @Route("/excel_email_users")
     * @Method({"GET"})
     *
     * @return array
     */
    public function excel_email_users()
    {
        if(!$this->isAdmin())
        {
            return ['error' => true, 'errorText' => 'accessDenied'];
        }
        
        error_reporting( 0 );
        
        $users = $this->authorservice->get_all_subscribed();
        
        $options = array(
            'coordinates' => array(
                'x' => 0,
                'y' => 1,
            ),
            'labels' => array(
                'bold'       => true,
                'size'       => 18,
                'color'      => '#000000',
                'fill'       => '#FFFFFF',
                'height'     => 30,
                'wrap'       => false,
                'horizontal' => 'center',
            ),
            'zebra' => array(
                'color' => '#FF0000',
            ),
            'return' => true,
        );
        
        
        $labels = array(
            'id' => 'ID',
            'name'   => 'Name',
            'email'  => 'E-mail',
            'date' => 'Date',
            'reg_from' => 'Register From'
        );
        
        $data = [];
        foreach($users as $user)
        {
            $data[] = ['id' => $user['id'],
                       'name' => $user['name'],
                       'email' => $user['email'],
                       'date' => $user['date_reg'],
                       'reg_from' => $user['reg_from']];
        }
        

        $phpExcelObject = $this->get('export.excel');
        $phpExcelObject->createSheet();
        $phpExcelObject->setNameOfSheet('Users '.date('Y-m-d'));
        $phpExcelObject->writeTable($data, $labels, $options);
        $phpExcelObject->writeExport('users_subscribed');
        
        return ['file_xls' => $_SERVER['HTTP_HOST'].'/web/users_subscribed.xls'];
    }
    
    
    
    
    /**
     * @Route("/csv_users_email")
     * @Method({"GET"})
     *
     * @return array
     */
    public function csv_users_email()
    {
        if(!$this->isAdmin())
        {
            return ['error' => true, 'errorText' => 'accessDenied'];
        }
        
        $users = $this->authorservice->get_all_subscribed();
        
        $result = '';
        foreach($users as $user)
        {
            $data = [$user['id'], $user['name'], $user['email'], $user['date_reg'], 'reg_from' => $user['reg_from']];
            $result .= implode(',', $data)."\n";
        }
        return ['result' => $result];
    }
    
    
    /**
     * @Route("/get_admins")
     * @Method({"GET"})
     *
     * @return array
     */
    public function get_admins()
    {
        if(!$this->isAdmin())
        {
            return ['error' => true, 'errorText' => 'accessDenied'];
        }
        
        $users = $this->authorservice->get_all_admins();
        return $users;
    }
    
    
    /**
     * @Route("/set_admin")
     * @Method({"POST"})
     *
     * @return array
     */
    public function set_admin(Request $request)
    {
        if(!$this->isAdmin())
        {
            return ['error' => true, 'errorText' => 'accessDenied'];
        }
        
        $id = $request->request->get('id');
        $result = $this->authorservice->set_admin($id);
        return $result;
    }
}
