<?php

namespace Yasoon\Site\Repository;


use Doctrine\ORM\EntityRepository;
use HWI\Bundle\OAuthBundle\Security\Core\User\EntityUserProvider;
use Symfony\Component\Security\Core\Exception\UnsupportedUserException;
use Symfony\Component\Security\Core\Exception\UsernameNotFoundException;
use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Component\Security\Core\User\UserProviderInterface;
use JMS\DiExtraBundle\Annotation as DI;
use Yasoon\Site\Entity\AuthorEntity;
use Symfony\Component\HttpFoundation\JsonResponse;
use HWI\Bundle\OAuthBundle\Security\Core\User\OAuthUserProvider;
use HWI\Bundle\OAuthBundle\OAuth\Response\UserResponseInterface;

/**
 * Class AuthorVkontakteRepository
 * 
 * @DI\Service("yasoon.repository.vkontakte")
 */
class AuthorVkontakteRepository extends OAuthUserProvider
{

    /**
     * @var \Doctrine\ORM\EntityManager
     *
     * @DI\Inject("doctrine.orm.default_entity_manager")
     */
    public $_em;
    
    //protected $session, $doctrine, $admins;
    public function __construct(/*$session, $doctrine, $service_container*/)
    {
        /*$this->session = $session;
        $this->doctrine = $doctrine;
        $this->container = $service_container;*/
    }
    public function loadUserByUsername($username)
    {
        /*$qb = $this->doctrine->getManager()->createQueryBuilder();
        $qb->select('u')
            ->from('Yasoon\Site\Entity\AuthorEntity', 'u')
            ->where('u.facebookId = :fid')
            ->setParameter('fid', $username)
            ->setMaxResults(1);
        $result = $qb->getQuery()->getResult();
        if (count($result)) {
            return $result[0];
        } else {
            return new User();
        }*/
        return false;
        echo 'fsfd';
        die;
    }
    public function loadUserByOAuthUserResponse(UserResponseInterface $response)
    {
        try {
            $userdata = $response->getResponse();
            print_r($userdata);
            die;
            /*$fbid = $userdata['id'];
            $name = $userdata['name'];
            $email = $userdata['email'];
            
            $user =  $this->_em->createQueryBuilder()
                ->select('u')
                ->from('Yasoon\Site\Entity\AuthorEntity', 'u')
                ->where('u.facebookId = :fbid')
                ->setParameter('fbid', $fbid)
                ->getQuery()->getSingleResult();
                
            if (!is_object($user)) {
                $user = (new AuthorEntity())
                    ->setName($name)
                    ->setEmail('')
                    ->setPassword('')
                    ->setSubscribed(1)
                    ->setFacebookId($fbid)
                    ->setPublicationDate(new \DateTime())
                    ->setRole(1);
                    
                $this->_em->persist($user);
                $this->_em->flush();
            }*/
        } catch (\Exception $e) {
            return ['error' => true, 'errorText' => $e->getMessage()];
        }
        //$user = $this->_em->getRepository('Yasoon\Site\Entity\AuthorEntity')->find(41);
        //print_r($user->getName());
    
        return $user;
    }
    public function supportsClass($class)
    {
        return true;
    }
}