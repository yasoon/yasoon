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
 * Class AuthorRepository
 * @package Yasoon\Site\Repository
 *
 * @DI\Service("yasoon.repository.author")
 */
class AuthorRepository extends OAuthUserProvider implements UserProviderInterface
{
    /**
     * @var array
     */
    protected $properties;

    /**
     * @var mixed
     */
    protected $repository;

    /**
     * @var \Doctrine\ORM\EntityManager
     *
     * @DI\Inject("doctrine.orm.default_entity_manager")
     */
    public $_em;



    public function __construct()
    {

    }

    /**
     * Loads the user for the given username.
     *
     * This method must throw UsernameNotFoundException if the user is not
     * found.
     *
     * @param string $email The username
     *
     * @return AuthorEntity
     *
     * @see UsernameNotFoundException
     *
     * @throws UsernameNotFoundException if the user is not found
     *
     */
    public function loadUserByUsername($email)
    {
        $user =  $this->_em->createQueryBuilder()
            ->select('u')
            ->from('Yasoon\Site\Entity\AuthorEntity', 'u')
            ->where('u.name = :username OR u.email = :email')
            ->setParameter('username', $email)
            ->setParameter('email', $email)
            ->getQuery()->getResult();
        if (count($user) == 0) {
            $response = new JsonResponse(['error' => true, 'errorType' => 'nouser'], 200);
            $response->send();
            die;
        }
        
        return $user[0];
    }
    
    /**
     * Loads the user for the given id.
     *
     * This method must throw UsernameNotFoundException if the user is not
     * found.
     *
     * @param string $email The username
     *
     * @return AuthorEntity
     *
     * @see UsernameNotFoundException
     *
     * @throws UsernameNotFoundException if the user is not found
     *
     */
    public function loadUserById($id)
    {
        $user =  $this->_em->createQueryBuilder()
            ->select('u')
            ->from('Yasoon\Site\Entity\AuthorEntity', 'u')
            ->where('u.id = :id')
            ->setParameter('id', $id)
            ->getQuery()->getSingleResult();
            
        if (!$user) {
            throw new UsernameNotFoundException(sprintf('No user with id "%s" was found.', $id));
        }
        
        return $user;
    }

    /**
     * Refreshes the user for the account interface.
     *
     * It is up to the implementation to decide if the user data should be
     * totally reloaded (e.g. from the database), or if the UserInterface
     * object can just be merged into some internal array of users / identity
     * map.
     * @param UserInterface $user
     *
     * @return UserInterface
     *
     * @throws UnsupportedUserException if the account is not supported
     */
    public function refreshUser(UserInterface $user)
    {
        return $this->loadUserById($user->getId());
    }

    /**
     * Whether this provider supports the given user class
     *
     * @param string $class
     *
     * @return Boolean
     */
    public function supportsClass($class)
    {
        return true;
    }
}