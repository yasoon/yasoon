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
     * @var InterviewService
     *
     * @DI\Inject("yasoon.service.interview")
     */
    private $interview_service;
    
    const KEYWORDS_CONTENT_ID = 80;
    const DESCRIPTION_CONTENT_ID = 81;
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
        $keyWords = $this->content_service->getTextById(IndexController::KEYWORDS_CONTENT_ID);
        $description = $this->content_service->getTextById(IndexController::DESCRIPTION_CONTENT_ID);
        $response = implode(
            '', 
            [
                $this->_initDocType(),
                $this->_initHead($keyWords, $description),
                $this->_initBody($category, $content)
            ]
        );

        return new Response($response);
    }

     public function facebookAction(Request $request) 
     {
         $postId = $request->get('id');
         $post = $this->service->getPost(array($postId));
         $keyWords = $this->content_service->getTextById(IndexController::KEYWORDS_CONTENT_ID);
         $html = "<!DOCTYPE html>
                <html>
                <head>
                    <meta name='title' content='".$post[0]['title']."' />
                    <meta name='description' content='".$post[0]['description']."' />
                    <meta name='keywords' content='".$keyWords."' />
                    <meta property='og:type' content='article'>
                    <meta property='og:url' content='https://yasoon.ru/social/post/".$postId."' />
                    <meta property='og:title' content='".$post[0]['title']."' />
                    <meta property='og:description' content='".$post[0]['description']."' />
                    <meta property='og:image' content='http://yasoon.ru/frontend/img/logo.jpg' />
                    <meta property='og:image:secure_url' content='https://yasoon.ru/frontend/img/logo.jpg' />
                    <meta property='og:image:type' content='image/jpeg' />
                    <meta property='og:image:width' content='400' />
                    <meta property='og:image:height' content='300' />
                    <script type='text/javascript' src='//code.jquery.com/jquery-latest.min.js' ></script>
                    <script type='text/javascript'>
                        $(document).ready(function(){
                            setTimeout(function(){
                               window.location.href = 'https://yasoon.ru/#/post/".$postId."'
                            },1);
                        });
                    </script>
                </head>
                </html>"
                ;

        return new Response($html);
     }
     
     public function interviewsocialAction(Request $request) 
     {
         $keyWords = $this->content_service->getTextById(IndexController::KEYWORDS_CONTENT_ID);
         $interviewId = $request->get('id');
         $interview = $this->interview_service->getInterviewById($interviewId);

         $html = "<!DOCTYPE html>
                <html>
                <head>
                    <meta name='title' content='".$interview[0]['title']."' />
                    <meta name='description' content='".$interview[0]['description']."' />
                    <meta name='keywords' content='".$keyWords."' />
                    <meta property='og:type' content='article'>
                    <meta property='og:url' content='https://yasoon.ru/social/interview/".$interviewId."' />
                    <meta property='og:title' content='".$interview[0]['title']."' />
                    <meta property='og:description' content='".$interview[0]['description']."' />
                    <meta property='og:image' content='http://yasoon.ru/web/upload/interviews/".$interview[0]['lego_img']."' />
                    <meta property='og:image:secure_url' content='https://yasoon.ru/web/upload/interviews/".$interview[0]['lego_img']."' />
                    <meta property='og:image:type' content='image/jpeg' />
                    <meta property='og:image:width' content='400' />
                    <meta property='og:image:height' content='300' />
                    <script type='text/javascript' src='//code.jquery.com/jquery-latest.min.js' ></script>
                    <script type='text/javascript'>
                        $(document).ready(function(){
                            setTimeout(function(){
                               window.location.href = 'https://yasoon.ru/#/interview/".$interviewId."'
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
    public function _initHead($keyWords, $description)
    {
        return "<head>
                    <meta charset='utf-8'>
                    <title>Yasoon</title>
                    <meta name='keywords' content='".$keyWords."' />
                    <meta name='viewport' content='width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no' />
                    <link href='/frontend/img/logo.jpg' rel='image_src' />
                    <link href='/frontend/img/favicon.ico' rel='shortcut icon' type='image/x-icon' />
                    <link rel='stylesheet' href='/frontend/css/source.css' type='text/css' media='screen' />
                    <meta name='description' content='".$description."'>
                    <!--[if IE]><script src='/frontend/js/vendor/html5shiv.js'></script><![endif]-->
                    <script type='text/javascript' src='/frontend/js/vendor/require.js' data-main='/frontend/js/main.min.js'></script>
                    <script type='text/javascript' src='https://vk.com/js/api/share.js?90' charset='windows-1251'></script>
                    <script>
                      (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                      (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                      m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
                      })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

                      ga('create', 'UA-53635352-1', 'auto');

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
    public function _initBody($category, $content)
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
                            <div class='left aus'>© yasoon</div>
                            <div class='social-links-footer'>
                            <a class='ws' href='https://vk.com/yasoon'></a>
                            <a class='wf' href='https://www.facebook.com/pages/Yasoon/153967808144954'></a>
                            </div>
                            <nav>
                                <a href='/#/about'>О нас</a>
                                <a href='/#/rules'>Правила</a>
                            </nav>
                            <div class='clearfix'></div>
                        </div>
                    </footer>
                    <script>
                        window.config = {
                            category: ".json_encode($category).",
                            content: ".json_encode($content).",
                            userId: false
                        }
                    </script>
                </body>
            </html>";
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