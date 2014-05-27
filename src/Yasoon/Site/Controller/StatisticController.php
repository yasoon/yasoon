<?php
/**
 * Author: Mihail Parandiy <parandiy.mihail@gmail.com>
 * Date: 5/22/13
 */

namespace Yasoon\Site\Controller;

use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use JMS\DiExtraBundle\Annotation as DI;
use Symfony\Component\Security\Core\SecurityContextInterface;
use Yasoon\Site\Entity\AuthorEntity;
use Symfony\Component\Security\Core\Authentication\Token\UsernamePasswordToken;
use Yasoon\Site\Service\PostService;
use Yasoon\Site\Service\QuestionService;

error_reporting(E_ALL);
/**
 * Class StatisticController
 *
 * @Route("/statistic")
 * @package Yasoon\Site\Controller
 */
class StatisticController {
    
    /**
     * @var \Doctrine\ORM\EntityManager
     *
     * @DI\Inject("doctrine.orm.default_entity_manager")
     */
    public $_em;
    

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
     * @var PostService
     *
     * @DI\Inject("yasoon.service.post")
     */
    private $post_service;

    /**
     * @var QuestionService
     *
     * @DI\Inject("yasoon.service.question")
     */
    private $question_service;
    
    /**
     * @Route("/getNewUsers")
     * @Method({"GET"})
     *
     * @return array
     */
    public function getNewUsers()
    {
        $result = [];
        
        $date = getdate();
        $time = mktime(0,0,0,$date['mon'], $date['mday'], $date['year']);
        $author_date = date('Y-m-d H:i:s', $time);
        
        $data = $this->_em->getRepository('Yasoon\Site\Entity\AuthorEntity')->createQueryBuilder('a')
                    ->where("a.publicationDate > '$author_date'")
                    ->getQuery()->getResult();
                    
        foreach($data as $d)
        {
            $result[] = ['id' => $d->getId(), 'email' => $d->getEmail(), 'date' => $d->getPublicationDate()->format('Y-m-d H:i:s')];
        }
        
        return $result;
    }
    
    
    
    /**
     * @Route("/getPassUsers")
     * @Method({"GET"})
     *
     * @return array
     */
    public function getPassUsers()
    {
        $result = [];
        
        $date = getdate();
        $time = mktime(0,0,0,$date['mon'], $date['mday'], $date['year']);
        $author_date = date('Y-m-d H:i:s', $time);
        
        $data = $this->_em->getRepository('Yasoon\Site\Entity\AuthorChangedPassEntity')->createQueryBuilder('a')
                    ->where("a.last_date > '$author_date'")
                    ->getQuery()->getResult();
                    
        foreach($data as $d)
        {
            $result[] = ['id' => $d->getAuthor()->getId(), 'email' => $d->getAuthor()->getEmail(), 'date' => $d->getAuthor()->getPublicationDate()->format('Y-m-d H:i:s')];
        }
        
        return $result;
    }
    
    
    /**
     * @Route("/getCountStatistic")
     * @Method({"GET"})
     *
     * @return array
     */
    public function getCountStatistic()
    {
        $data_users = $this->_em->getRepository('Yasoon\Site\Entity\AuthorEntity')->createQueryBuilder('a')->getQuery()->getResult();
        $data_posts = $this->_em->getRepository('Yasoon\Site\Entity\PostEntity')->createQueryBuilder('p')->getQuery()->getResult();
        $data_posts_answers = $this->_em->getRepository('Yasoon\Site\Entity\PostAnswerEntity')->createQueryBuilder('pa')->getQuery()->getResult();
        $data_questions = $this->_em->getRepository('Yasoon\Site\Entity\QuestionEntity')->createQueryBuilder('q')->getQuery()->getResult();
        $data_questions_answered = $this->_em->getRepository('Yasoon\Site\Entity\QuestionEntity')->createQueryBuilder('q')->where('q.answer != \'\'')->getQuery()->getResult();
        
        return ['count_users' => count($data_users),
                'count_posts' => count($data_posts),
                'count_post_answers' => count($data_posts_answers),
                'count_questions' => count($data_questions),
                'count_questions_answered' => count($data_questions_answered)];
    }

    /**
     * @Route("/get_user_notification")
     * @Method({"GET"})
     *
     * @return array
     */
    public function getUserNotifications()
    {
        $result['posts_timeline'] = $this->post_service->getTimeline();
        $result['answers_timeline'] = $this->question_service->getAnswerTimeline();
        $result['new_answers'] = $this->question_service->getNewAnswers();
        return $result;
    }

    /**
     * @Route("/get_user_notification_count")
     * @Method({"GET"})
     *
     * @return array
     */
    public function getUserNotificationsCount()
    {
        $result['posts_timeline_count'] = $this->post_service->getTimelineCount();
        $result['answers_timeline_count'] = $this->question_service->getAnswerTimelineCount();
        $result['new_answers_count'] = $this->question_service->getNewAnswersCount();
        return $result;
    }
}