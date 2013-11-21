<?php
/**
 * Global Trading Technologies Ltd.
 *
 * The following source code is PROPRIETARY AND CONFIDENTIAL. Use of
 * this source code is governed by the Global Trading Technologies Ltd. Non-Disclosure
 * Agreement previously entered between you and Global Trading Technologies Ltd.
 *
 * By accessing, using, copying, modifying or distributing this
 * software, you acknowledge that you have been informed of your
 * obligations under the Agreement and agree to abide by those obligations.
 *
 * @author Fedor Avetisov
 *
 */

namespace Yasoon\Site\Controller;

use Doctrine\ORM\NoResultException;
use Symfony\Component\CssSelector\Token;
use Symfony\Component\DependencyInjection\Container;
use Symfony\Component\DependencyInjection\ContainerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use JMS\DiExtraBundle\Annotation as DI;
use Symfony\Component\HttpFoundation\Session\Session;
use Symfony\Component\Security\Core\Authentication\Token\UsernamePasswordToken;
use Symfony\Component\Security\Core\Exception\AuthenticationCredentialsNotFoundException;
use Yasoon\Site\Repository\AuthorRepository;

/**
 * Class AuthController
 *
 * @Route("/")
 */
class AuthController
{

    /**
     * @var \Symfony\Component\Security\Core\SecurityContextInterface
     *
     * @DI\Inject("security.context")
     */
    public  $securityContext;

    /**
     * @var Container
     *
     * @DI\Inject("service_container")
     */
    public $container;

    /**
     * @var AuthorRepository
     *
     * @DI\Inject("yasoon.repository.author")
     */
    public $userProvider;

    /**
     * @var string
     */
    protected $providerKey = 'secured_area';

    protected $roles = array(
        1 => 'ROLE_USER',
        2 => 'ROLE_AUTHOR',
        4 => 'ROLE_ADMIN'
    );

    /**
     * @Route("/login")
     *
     * @Method({"POST"})
     */
    public function loginAction(Request $request) {

        $login = $request->request->get('email');
        $password = $request->request->get('password');

        try {
            $user = $this->userProvider->loadUserByUsername($login);
        } catch (NoResultException $e) {
            throw new AuthenticationCredentialsNotFoundException();
        }
        if ($user->getPassword() != md5($password)) {
            throw new AuthenticationCredentialsNotFoundException();
        }

        $token = new UsernamePasswordToken((string) $user->getId(), $password, $this->providerKey, $user->getRoles());

        $this->securityContext->setToken($token);

        /** @var Session $session */
        $session = $this->container->get('request')->getSession();
        $session->set('_security_secured_area', serialize($token));
        $this->container->get('request')->setSession($session);

        return [
            'id' => $user->getId()
            ];
    }


    /**
     * @Route("/logout")
     *
     * @Method({"GET"})
     */
    public function logoutAction() {

        $this->container->get('request')->getSession()->invalidate();

        return ['ok' => 'ok'];
    }

}