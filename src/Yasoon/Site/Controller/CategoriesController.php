<?php
/**
 * Author: Mihail Parandiy <parandiy.mihail@gmail.com>
 * Date: 30/01/14
 */

namespace Yasoon\Site\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use JMS\DiExtraBundle\Annotation as DI;
use Yasoon\Site\Service\CategoryService;

/**
 * Class CategoriesController
 *
 * @Route("/api/category")
 * @package Yasoon\Site\Controller
 */
class CategoriesController {

    /**
     * @var CategoryService
     *
     * @DI\Inject("yasoon.service.category")
     */
    private $service;
    

    /**
     * @Route("/get_CategoryList")
     *
     * @Method({"GET"})
     */
    public function categoryListAction(Request $request) {
        $result = $this->service->getCategoryList();
        return $result;
    }
}