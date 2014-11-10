<?php
/**
 * Author: Fedor Avetisov <cousenavi@gmail.com>
 * Date: 5/22/13
 */

namespace Yasoon\Site\Controller;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use JMS\DiExtraBundle\Annotation as DI;
use Yasoon\Site\Service\ContentService;
use Yasoon\Site\Service\CategoryService;
use Yasoon\Site\Service\PostService;
use Yasoon\Site\Entity\PostEntity;

class IndexController {
    /**
     * @var CategoryService
     *
     * @DI\Inject("yasoon.service.category")
     */
    private $category_service;

    /**
     * @var ContentService
     *
     * @DI\Inject("yasoon.service.content")
     */
    private $content_service;

    /**
     * @var PostService
     *
     * @DI\Inject("yasoon.service.post")
     */
    private $service;
    
    /**
     * @Route("/")
     *
     * @return Response
     */
    public function indexAction() {

        //$content = str_replace("\\n", "\\\\n", json_encode($this->service->getAllContent()));
        /*$content =  json_encode([[
                'id' => '1',
                'description' => '2',
                'text' => '3' 
            ]]);*/

        // the URI being requested (e.g. /about) minus any query parameters
       
        $category = $this->category_service->getCategoryList();
        $content = $this->content_service->getAllContent(0);
        
        $response = implode(
            '', 
            [
                $this->_initDocType(),
                $this->_initHead($category, $content),
                $this->_initBody()
            ]
        );

        return new Response($response);
    }

     public function facebookAction(Request $request) 
     {
         $postId = $request->get('id');
         $post = $this->service->getPost(array($postId));
         $html = "<!DOCTYPE html>
                <html>
                <head>
                    
                    <meta property='og:type' content='article'>
                    <meta property='og:url' content='http://yasoon.ru:8090/%23/post/".$postId."'>
                    <meta property='og:title' content='".$post[0]['title']."'>
                    <meta property='og:description' content='".$post[0]['description']."'>
                    <script type='text/javascript' src='//code.jquery.com/jquery-latest.min.js' ></script>
                    <script type='text/javascript'>
                        $(document).ready(function(){
                            setTimeout(function(){
                               window.location.href = 'http://yasoon.ru:8090/#/post/".$postId."'
                            },1);
                        });
                    </script>
                </head>
                </html>"
                ;

        return new Response($html);
     }
     
    public function render_template($path, array $args)
    {
        extract($args);
        ob_start();
        require $path;
        $html = ob_get_clean();

        return $html;
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
     * Set Doctype
     *
     * 
     *
     * @return html
     */
    public function _initDocType()
    {
        return "<!DOCTYPE html>
                <html>";
    }
    
    /**
     *
     * Set Head
     *
     * 
     *
     * @return Head
     */
    public function _initHead($category, $content)
    {
        
        return "<head>
                    <meta charset='utf-8'>
                    <title>Yasoon</title>
                    <meta name='viewport' content='width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no' />
                    <link href='/frontend/img/favicon.ico' rel='shortcut icon' type='image/x-icon' />
                    <link rel='stylesheet' href='/frontend/css/source.css' type='text/css' media='screen' />
                    <meta name='description' content='Создание и продвижение Вашего личного профессионального бренда.'>
                    <script>
                        window.config = {
                            category: ".json_encode($category).",
                            content: ".json_encode($content).",
                            userId: false
                        }
                    </script>
                    <script type='text/javascript' src='/frontend/js/vendor/require.js' data-main='/frontend/js/main.min.js'></script>
                    <script type='text/javascript' src='http://vk.com/js/api/share.js?90' charset='windows-1251'></script>
                    <script>
                      (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                      (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                      m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
                      })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

                      ga('create', 'UA-53635352-1', 'auto');
                      ga('send', 'pageview');

                    </script>
                    
                </head>";
    }
    
    /**
     *
     * Set body
     *
     * 
     *
     * @return body
     */
    public function _initBody()
    {
        return "<body>
                    <header id='header'></header>
                    <div class='wrap'>
                        <div class='main_block'>
                            <section class='page_content'></section>
                        </div>
                    </div>
                    <footer>
                        <div class='inside'>
                            <div class='left aus'>© 2013-2015 yasoon</div>
                            <nav>
                                <a href='/#/about'>О нас</a>
                                <a href='/#/digest'>Дайджест</a>
                            </nav>
                            <div class='clearfix'></div>
                        </div>
                    </footer>
                    
                </body>
            ";
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