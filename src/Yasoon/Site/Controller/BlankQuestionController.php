<?php
/**
 * Author: Fedor Avetisov <cousenavi@gmail.com>
 * Date: 6/1/13
 */

namespace Yasoon\Site\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use JMS\DiExtraBundle\Annotation as DI;
use Symfony\Component\HttpFoundation\Request;
use Yasoon\Site\Service\BlankQuestionService;

;
/**
 * Class BlankQurstionController
 * @Route("/api/blank_question")
 * @package Yasoon\Site\Controller
 */
class BlankQuestionController {


    /**
     * @var \Symfony\Component\Security\Core\SecurityContextInterface
     *
     * @DI\Inject("security.context")
     */
    private $securityContext;



    /**
     * @Route("/get_blank")
     *
     * @Method({"GET"})
     */
    public function getBlankAction() {
        return $this->service->getAll();
    }

    /**
     * @Route("/add")
     *
     * @Method({"POST"})
     */
    public function addAction(Request $request) {
        $model = $request->request->get('model');


        return $this->service->add($model);
    }

    /**
     * @Route("/update")
     * @Method({"POST"})
     *
     * @param Request $request
     *
     * @return array
     */
    public function updateAction(Request $request) {
        $model = $request->request->get('model');

        return $this->service->update($model);
    }

    /**
     * @Route("/delete")
     * @Method({"POST"})
     *
     * @param Request $request
     * @return array
     */
    public function removeAction(Request $request) {
        $model = $request->request->get('model');

        return $this->service->delete($model);
    }

    /**
     * @Route("/update_places")
     * @Method({"POST"})
     *
     * @param Request $request
     * @return array
     */
    public function updatePlaces(Request $request) {
        $map = $request->request->get('map');

        return $this->service->updatePlaces($map);
    }

}