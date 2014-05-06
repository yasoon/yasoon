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

        //$content = str_replace("\\n", "\\\\n", json_encode($this->service->getAllContent()));
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
    <meta name="viewport" content="width=device-width, initial-scale=0.6, user-scalable=yes" />

    <link rel="stylesheet" href="/frontend/css/source.css" type="text/css" media="screen" />
    <script src="/frontend/js/vendor/require.js" data-main="/frontend/js/main.min.js" type="text/javascript"></script>
</head>
</html>
<body>
    <header id="header"></header>
    <div class="wrap">
        <div class="main_block">
            <section class="page_content"></section>
        </div>
    </div>
    <footer>
        <div class="inside">
            <div class="left aus">© 2013 yasoon</div>
            <nav>
                <a href="/about">О нас</a>
                <a href="/digest">Дайджест</a>
            </nav>
            <div class="clearfix"></div>
        </div>
    </footer>
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
    
    /**
     *
     * Proxy for security firewall
     *
     * @Route("/test_user")
     *
     * @return Response
     */
    public function testAction()
    {
        
        header('Content-type: text/html');
        
        /*echo '<form action="./api/author/register" method="post">
                 <input type="text" name="username" value="" />
                 <input type="text" name="email" value="" />
                 <input type="pasword" name="password" value="" />
                 <input type="checkbox" name="subscribe" value="on" />
                 <input type="submit" />
             </form>';*/
             
        echo '<form action="./login_check" method="post">
                 <input type="text" name="email" value="" />
                 <input type="pasword" name="password" value="" />
                 <input type="submit" />
             </form>';
        exit;
    }
}