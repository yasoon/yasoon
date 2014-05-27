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
     * @Route("/get_all/{tagId}", defaults={"tagId" = 0})
     *
     * @Method({"GET"})
     */
    public function getAllContent($tagId) {
        $result = $this->service->getAllContent($tagId);

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
    
    /**
     * @Route("/get_all_tags")
     *
     * @Method({"GET"})
     */
    public function getAllTags() {
        $result = $this->service->getAllTags();

        return $result;
    }
    

    /**
     * @Route("/add_tag")
     *
     * @Method({"POST"})
     */
    public function addTag(Request $request) {
        $model = $request->request->get('tag');
        
        $result = $this->service->addTag($model);

        return $result;
    }
    

    /**
     * @Route("/edit_tag")
     *
     * @Method({"POST"})
     */
    public function editTag(Request $request) {
        $model = $request->request->get('tag');
        
        $result = $this->service->editTag($model);

        return $result;
    }
    

    /**
     * @Route("/delete_tag")
     *
     * @Method({"POST"})
     */
    public function deleteTag(Request $request) {
        $id = $request->request->get('id');

        $result = $this->service->deleteTag($id);

        return $result;
    }
}