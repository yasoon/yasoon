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
use Yasoon\Site\Service\CategoryService;

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
        $category = $this->category_service->getCategoryList();
        $content = $this->content_service->getAllContent(0);

        $html = $this->render_template('D:\OpenServer\domains\yasoon\src\Yasoon\Site\View\index.php', array('category' => $category, 'content' => $content));

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