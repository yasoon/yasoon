<?php
/**
 * Author: Fedor Avetisov <cousenavi@gmail.com>
 * Date: 5/27/13
 */
namespace Yasoon\Site\EventListener;

use Symfony\Component\DependencyInjection\Container;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpKernel\Event\GetResponseEvent;

use JMS\DiExtraBundle\Annotation as DI;
use Symfony\Component\Security\Core\SecurityContextInterface;

/**
 * @DI\Service
 */
class ResponseListener
{
    const USER_HEADER_NAME = 'author-id';

    const ACCESS_ANONYMOUS = 'ANON';

    const ACCESS_ADMIN = 'ADMIN';

    const ACCESS_AUTHOR = 'US';

    const ACCESS_READER = 'THEM';

    /**
     * Service container to get security context from
     * (if this context ever exist)
     *
     * @var Container
     */
    private $container;

    /**
     * @DI\InjectParams({
     *     "container" = @DI\Inject("service_container")
     * })
     */
    public function __construct(Container $container)
    {
        $this->container = $container;
    }

    /**
     * @DI\Observe("kernel.view", priority = 255)
     */
    public function onKernelView(GetResponseEvent $event)
    {
        $responseData = $event->getControllerResult();

        if ($responseData instanceof Response) {
            return;
        }

        $response = new JsonResponse($responseData);
        $securityContext = $this->container->get('security.context');
        if ($securityContext) {

            $authorId = $securityContext->getToken()->getUsername();

            $response->headers->set(self::USER_HEADER_NAME, $authorId);
        }

        $event->setResponse($response);
    }
}