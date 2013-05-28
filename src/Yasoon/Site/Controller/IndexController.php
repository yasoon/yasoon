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
  <title>Mobile invest testing app</title>
</head>
<body>
</div>
</body>
</html>


HTML;
        return new Response($html);
    }

}