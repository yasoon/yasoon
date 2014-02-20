<?php

namespace Yasoon\Site\Handler;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Security\Core\SecurityContext;
use Symfony\Component\Security\Http\Authentication\DefaultAuthenticationSuccessHandler;
use Symfony\Component\Security\Core\Authentication\Token\TokenInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\JsonResponse;


/**
 * Handler that performs custom actions on authentication success.
 * Works only for AJAX (XmlHttp) requests
 *
 * @author elgris
 */
class AuthenticationSuccessHandler extends DefaultAuthenticationSuccessHandler
{
    /**
     * @var \Symfony\Component\Security\Core\SecurityContextInterface
     */
    private $securityContext;

    /**
     * Initialize handler
     *
     * @param SecurityContext $securityContext
     */
    public function __construct(SecurityContext $securityContext, $em)
    {
        $this->securityContext = $securityContext;
        $this->em = $em;
    }

    /**
     * @param Request        $request
     * @param TokenInterface $token
     *
     * @return Response
     */
    public function onAuthenticationSuccess(Request $request, TokenInterface $token)
    {
        //if ($request->isXmlHttpRequest()) {
            // in case of successful authentication, user must be in the context
            $user = $this->securityContext->getToken()->getUser();
            $id = $user->getId();
            $name = $user->getName();
            $email = $user->getEmail();
            $avatarimg = $user->getImg();
            $shortBio = $user->getInterviewCaption();
            $profession = $user->getJob();
            $self_link = $user->getHomepage();
            $interest = $user->getInterest();
            $last_publish_date = $user->getName();
            $dreamProfession = $user->getDream();
            
            $post = $this->em->getRepository('Yasoon\Site\Entity\PostEntity')->createQueryBuilder('p')
            ->leftJoin('p.author', 'a')
            ->where('a.id = '.$id)->setMaxResults(1)->setFirstResult(0)
            ->orderBy('p.date', 'desc')->getQuery()->getResult();
            if($post)
            {
                $post_date = $post[0]->getDate()->format('d/m/Y');
            }
            else
            {
                $post_date = null;
            }
            //$user->getPosts()->findAll();
            
            $userdata = ['id' => $id,
                         'name' => $name,
                         'email' => $email,
                         'avatarimg' => $avatarimg,
                         'shortBio' => $shortBio,
                         'profession' => $profession,
                         'self_link' => $self_link,
                         'interest' => $interest,
                         'last_publish_date' => $post_date,
                         'dreamProfession' => $dreamProfession];

            return new JsonResponse(['error' => 'false', 'userData' => $userdata], 200);
        //}

        return parent::onAuthenticationSuccess($request, $token);
    }
}