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
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\CssSelector\Token;
use Symfony\Component\DependencyInjection\Container;
use Symfony\Component\DependencyInjection\ContainerInterface;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use JMS\DiExtraBundle\Annotation as DI;
use Symfony\Component\HttpFoundation\Session\Session;
use Symfony\Component\Security\Core\Authentication\Token\UsernamePasswordToken;
use Symfony\Component\Security\Core\Exception\AuthenticationCredentialsNotFoundException;
use Yasoon\Site\Repository\AuthorRepository;

use Symfony\Component\Security\Core\SecurityContext;

/**
 * Class AuthController
 *
 * @Route("/")
 */
class AuthController extends Controller
{
    /**
     * @Route("/login_check", name="login_check")
     *
     * @Method({"POST"})
     */
    public function loginCheckAction(Request $request)
    {
        return ['error' => true];
    }

    /**
     * @Route("/login", name="login")
     */
    public function loginAction(Request $request)
    {
        header('Content-type: text/html');
        
        $request = $this->getRequest();
        $session = $request->getSession();
        
        $error = $request->attributes->get(SecurityContext::AUTHENTICATION_ERROR);
        
        if ($request->attributes->has(SecurityContext::AUTHENTICATION_ERROR)) {
            $error = $request->attributes->get(SecurityContext::AUTHENTICATION_ERROR);
        } else {
            $error = $session->get(SecurityContext::AUTHENTICATION_ERROR);
        }
        if(isset($error))
        {
            print_r($error->getMessage());
        }
        
        //print_r($this->getUser());
        echo '<form action="./login_check" method="post"><input type="text" name="email" value="" /><input type="pasword" name="password" value="" /><input type="submit" /></form>';
        exit;
        //return new RedirectResponse('/');
    }

    /**
     * @Route("/logout", name="logout")
     */
    public function logoutAction(Request $request)
    {
        return [];
    }

    /**
     * @Route("/login/fail", name="loginfail")
     */
    public function fail(Request $request)
    {
        return ['error' => true, 'errorType' => 'invalidPassword'];
    }

    /**
     * @Route("/login/facebook", name="loginfacebook")
     */
    public function login_facebook(Request $request)
    {
        print_r($request->request->All());
        return [];
    }

    /**
     * @Route("/login/facebook/fail", name="loginfacebookfail")
     */
    public function login_facebook_fail(Request $request)
    {
        return [];
    }
}