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
use HWI\Bundle\OAuthBundle\Security\Core\User\FOSUBUserProvider as BaseClass;

/**
 * Class AuthorFacebookRepository
 * 
 */
class AuthorFacebookRepository extends BaseClass
{

    /**
     * @var \Doctrine\ORM\EntityManager
     *
     * @DI\Inject("doctrine.orm.default_entity_manager")
     */
    public $_em;
    
    /**
     * {@inheritDoc}
     */
    public function connect(UserInterface $user, UserResponseInterface $response)
    {
        $property = $this->getProperty($response);
        $username = $response->getUsername();
 
        //on connect - get the access token and the user ID
        $service = $response->getResourceOwner()->getName();
 
        $setter = 'set'.ucfirst($service);
        $setter_id = $setter.'Id';
        $setter_token = $setter.'AccessToken';
 
        //we "disconnect" previously connected users
        if (null !== $previousUser = $this->userManager->findUserBy(array($property => $username))) {
            $previousUser->$setter_id(null);
            $previousUser->$setter_token(null);
            $this->userManager->updateUser($previousUser);
        }
 
        //we connect current user
        $user->$setter_id($username);
        $user->$setter_token($response->getAccessToken());
 
        $this->userManager->updateUser($user);
    }
    
    //protected $session, $doctrine, $admins;
    
    public function loadUserByOAuthUserResponse(UserResponseInterface $response)
    {
        //$doctrine = $em = $this->getEntityManager();
        //echo 'fsfd';
        //print_r($doctrine);
        //die;
        try {
            $userdata = $response->getResponse();
            $fbid = $userdata['id'];
            $name = $userdata['name'];
            $email = $userdata['email'];
            print_r($userdata);
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
            }
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