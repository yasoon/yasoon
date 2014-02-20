<?php
namespace Yasoon\Site\Controller;
use Symfony\Component\HttpFoundation\Request;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use JMS\DiExtraBundle\Annotation as DI;
/**
 * Class ContentController
 *
 * @Route("/api/content")
 * @package Yasoon\Site\Controller
 */
class ContentController {

    /**
     * @var \Symfony\Component\Security\Core\SecurityContextInterface
     *
     * @DI\Inject("security.context")
     */
    private $securityContext;
    
    /**
     * @var ContentService
     *
     * @DI\Inject("yasoon.service.content")
     */
    private $service;


    /**
     * @Route("/get_all")
     *
     * @Method({"GET"})
     */
    public function getAllContent() {
        $result = $this->service->getAllContent();

        return $result;
    }

    /**
     * @Route("/edit")
     *
     * @Method({"POST"})
     */
    public function editRow(Request $request) {
        $model = $request->request->get('model');

        $result = $this->service->editRow($model);

        return $result;
    }

    /**
     * @Route("/add")
     *
     * @Method({"POST"})
     */
    public function addRow(Request $request) {
        $model = $request->request->get('model');

        $result = $this->service->addRow($model);

        return $result;
    }

    /**
     * @Route("/delete")
     *
     * @Method({"POST"})
     */
    public function deleteRow(Request $request) {
        $id = $request->request->get('id');

        $result = $this->service->deleteRow($id);

        return $result;
    }
}