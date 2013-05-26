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
     *
     * @return Response
     */
    public function indexAction() {

        $html = <<<HTML
index page
HTML;
        return new Response($html);
    }

}