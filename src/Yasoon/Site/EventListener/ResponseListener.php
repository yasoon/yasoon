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
    const ACCESS_HEADER_NAME = 'access';

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
        $token = $securityContext->getToken();
        $userId = $token->getUsername();
        if ($userId != 'anon.') {
            if (in_array('ROLE_ADMIN', array_map(function($role){ return $role->getRole(); }, $token->getRoles()))) {
                $access = self::ACCESS_ADMIN;
            } else {
                if ( array_key_exists('ownerId', $responseData) && $responseData['ownerId'] == $userId) {
                    $response->headers->set('owner-id', $responseData['ownerId']);
                    $access = self::ACCESS_AUTHOR;
                } else {
                    $access = self::ACCESS_READER;
                }
            }
        } else {
            $access = self::ACCESS_ANONYMOUS;
        }

        $roles = "";
        foreach ($token->getRoles() as $role){
            $roles = $roles . ", ". $role->getRole();
        }

        $response->headers->set('user-id', $userId);
        $response->headers->set('roles', $roles);
        $response->headers->set(self::ACCESS_HEADER_NAME, $access);

        $event->setResponse($response);
    }
}