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
use Yasoon\Site\Service\PostService;
use Yasoon\Site\Service\QuestionService;
use Yasoon\Site\Service\AllfService;
use Yasoon\Site\Entity\AuthorEntity;
use Symfony\Component\Security\Core\Authentication\Token\UsernamePasswordToken;

error_reporting(E_ALL);
/**
 * Class SocialAuthController
 *
 * @Route("/socauth")
 * @package Yasoon\Site\Controller
 */
class SocialAuthController {
    
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
     * @Route("/test")
     * @Method({"GET"})
     *
     * @return array
     */
    public function test()
    {
        header('Content-type: text/html');
        ?>
        <!DOCTYPE html>
        <html>
            <head></head>
            <body>
                <div id="login_button" onclick="vk_login();">login vkontakte</div>
                <div id="login_button" onclick="fb_login();">login facebook</div>
                
                <script language="javascript">
                    function vk_login()
                    {
                        window.open('/test/test/vkontakte',
                                    '',
                                    'top=100,left=100,width=700,height=400,scrollbars=no,location=no,toolbar=no,directories=no,status=yes,menubar=no,resizable=yes');
                    }
                    
                    function fb_login()
                    {
                        window.open('/test/test/facebook',
                                    '',
                                    'top=100,left=100,width=700,height=400,scrollbars=no,location=no,toolbar=no,directories=no,status=yes,menubar=no,resizable=yes');
                    }
                </script>
            </body>
        </html>
        <?php     
        
        exit;
    }
    
    /**
     * @Route("/vkontakte")
     * @Method({"GET"})
     *
     * @return array
     */
    public function testvk()
    {
        
        $APP_ID = 4185052;
        $APP_SECRET = 'o1SzMFfXxLZTJqByVsVh';
        $REDIRECT_URI = 'http://yasoon.mnb-t.com/socauth/vkontakte';
        $PERMISSIONS = 'offline';
        $API_VERSION = '5.5';
        if(!isset($_GET['code']))
        {
            header("Location: https://oauth.vk.com/authorize?client_id=".$APP_ID."&scope=".$PERMISSIONS."&redirect_uri=".$REDIRECT_URI."&response_type=code&v=".$API_VERSION);
            exit();
        }
        
        $code = $_GET['code'];
        
        /** ��������� ������ � ������� ����������� **/
        $request_url = 'https://oauth.vk.com/access_token?client_id='.$APP_ID.'&client_secret='.$APP_SECRET.'&code='.$code.'&redirect_uri='.$REDIRECT_URI;
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($curl, CURLOPT_URL, $request_url);
        $response = curl_exec($curl);
        curl_close($curl);
        
        $result = json_decode($response);
        $token = $result->access_token;
        $uid = $result->user_id;
        
        $response = $this->sendRequest('getProfiles', array('uids' => $uid, 'fields' => 'uid,first_name,last_name,city,country,contacts,photo_medium,screen_name'), $token);
        
        try {
            $new_user = false;
            $user =  $this->_em->createQueryBuilder()
                    ->select('u')
                    ->from('Yasoon\Site\Entity\AuthorEntity', 'u')
                    ->where('u.vkontakteId = :vkid')
                    ->setParameter('vkid', $response['response'][0]['uid'])
                    ->getQuery()->getResult();
            
            if (count($user) < 1 || !is_object($user[0])) {
                $name = $response['response'][0]['first_name'].' '.$response['response'][0]['last_name'];
                $user = (new AuthorEntity())
                    ->setName($name)
                    ->setEmail('')
                    ->setHomepage('http://vk.com/'.$response['response'][0]['screen_name'])
                    ->setPassword('')
                    ->setSubscribed(1)
                    ->setVkontakteId($response['response'][0]['uid'])
                    ->setPublicationDate(new \DateTime())
                    ->setRegFrom(2)
                    ->setRole(1);
                    
                $url  = $response['response'][0]['photo_medium'];
                $path = $_SERVER['DOCUMENT_ROOT'].'/upload/avatar/'.$user->getId().'.jpg';
                
                $ch = curl_init($url);
                $fp = fopen($path, 'wb');
                curl_setopt($ch, CURLOPT_FILE, $fp);
                curl_setopt($ch, CURLOPT_HEADER, 0);
                curl_exec($ch);
                curl_close($ch);
                fclose($fp);
                
                $user->setImg($user->getId().'.jpg');
                    
                $this->_em->persist($user);
                $this->_em->flush();
                $new_user = true;
            }
            else
            {
                $user = $user[0];
            }
        
            $token = new UsernamePasswordToken((string) $user->getId(), $user->getPassword(), "secured_area", ['ROLE_USER']);

            $this->securityContext->setToken($token);
    
            /** @var Session $session */
            $session = $this->container->get('request')->getSession();
            $session->set('_security_secured_area', serialize($token));
            $this->container->get('request')->setSession($session);
        } catch (\Exception $e) {
            return ['error' => true, 'errorText' => $e->getMessage()];
        }
        
        header('Content-type: text/html');
        if($new_user)
        {
        ?>
        <script>
            window.opener.location.href='/#editprofile';
            window.opener.$('.barrier').fadeOut(500);
            window.close();
        </script>
        <?php
        }
        else
        {
        ?>
        <script>
            window.opener.location.href='/#author/<?php echo $user->getId() ?>/posts';
            window.opener.$('.barrier').fadeOut(500);
            window.close();
        </script>
        <?php
        }
        exit;
    }
    
    
    /**
     * @Route("/facebook")
     * @Method({"GET"})
     *
     * @return array
     */
    public function testfb(Request $request)
    {
        $URL_OAUTH = 'https://www.facebook.com/dialog/oauth';
        $URL_ACCESS_TOKEN = 'https://graph.facebook.com/oauth/access_token';
        $APP_ID = 589499367792551;
        $APP_SECRET = '5acc9a9066680b897b5a4aedc3de575a';
        $URL_CALLBACK = 'http://yasoon.mnb-t.com/socauth/facebook';
        $URL_GET_ME = 'https://graph.facebook.com/me';

        if(!isset($_GET['code']))
        {
            $_SESSION['state'] = md5(uniqid(rand(), TRUE)); 
            $link = $URL_OAUTH.'?client_id='.$APP_ID.'&redirect_uri='.urlencode($URL_CALLBACK)."&state=".$_SESSION['state'];
            
            header("Location: $link");
            die;
        }
        
        $request_url = $URL_ACCESS_TOKEN.'?client_id='.$APP_ID.'&redirect_uri='.urlencode($URL_CALLBACK).
        '&client_secret='.$APP_SECRET.'&code='.$_GET['code'];
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($curl, CURLOPT_URL, $request_url);
        $response = curl_exec($curl);
        curl_close($curl);
        $tokenInfo = null;
        parse_str($response, $tokenInfo);
        
        if (count($tokenInfo) > 0 && isset($tokenInfo['access_token']))
        {
            $request_url = $URL_GET_ME.'?access_token='.$tokenInfo['access_token'].'&locale=ru_RU';
            $curl = curl_init();
            curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
            curl_setopt($curl, CURLOPT_URL, $request_url);
            $response = curl_exec($curl);
            curl_close($curl);
            $userInfo = json_decode($response);
            
            $user =  $this->_em->createQueryBuilder()
                ->select('u')
                ->from('Yasoon\Site\Entity\AuthorEntity', 'u')
                ->where('u.facebookId = :fbid')
                ->setParameter('fbid', $userInfo->id)
                ->getQuery()->getResult();
            if (count($user) < 1 || !is_object($user[0])) {
                $name = $userInfo->name;
                $user = (new AuthorEntity())
                    ->setName($name)
                    ->setEmail('')
                    ->setPassword('')
                    ->setHomepage($userInfo->link)
                    ->setSubscribed(1)
                    ->setFacebookId($userInfo->id)
                    ->setPublicationDate(new \DateTime())
                    ->setRegFrom(1)
                    ->setRole(1);
                    
                
                $enc = urlencode('SELECT current_location, pic_big FROM user WHERE uid IN ('.$userInfo->id.')');
                $request_url = 'https://graph.facebook.com/fql?q='.$enc.'&access_token='.$tokenInfo['access_token'].'&locale=ru_RU';
                $curl = curl_init();
                curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
                curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
                curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
                curl_setopt($curl, CURLOPT_URL, $request_url);
                $response = curl_exec($curl);
                curl_close($curl);
                $userCountry = json_decode($response);
                
                $url  = str_replace('https:', 'http:', $userCountry->data[0]->pic_big);
                $path = $_SERVER['DOCUMENT_ROOT'].'/upload/avatar/'.$user->getId().'.jpg';
                
                $ch = curl_init($url);
                $fp = fopen($path, 'wb');
                curl_setopt($ch, CURLOPT_FILE, $fp);
                curl_setopt($ch, CURLOPT_HEADER, 0);
                curl_exec($ch);
                curl_close($ch);
                fclose($fp);
                
                $user->setImg($user->getId().'.jpg');
                    
                $this->_em->persist($user);
                $this->_em->flush();
            }
            else
            {
                $user = $user[0];
            }
        
            $token = new UsernamePasswordToken((string) $user->getId(), $user->getPassword(), "secured_area", ['ROLE_USER']);

            $this->securityContext->setToken($token);
    
            /** @var Session $session */
            $session = $this->container->get('request')->getSession();
            $session->set('_security_secured_area', serialize($token));
            $this->container->get('request')->setSession($session);
        }
        
        header('Content-type: text/html');
        if($new_user)
        {
        ?>
        <script>
            window.opener.location.href='/#editprofile';
            window.opener.$('.barrier').fadeOut(500);
            window.close();
        </script>
        <?php
        }
        else
        {
        ?>
        <script>
            window.opener.location.href='/#author/<?php echo $user->getId() ?>/posts';
            window.opener.$('.barrier').fadeOut(500);
            window.close();
        </script>
        <?php
        }
        exit;
    }
    
    public function sendRequest($method, $parameters = array(), $token = false)
    {
        $pline = '';
        if(count($parameters) > 0)
        {
            foreach($parameters as $k => $v)
            {
                $pline .= $k.'='.$v.'&';
            }
        }
        
        $pline = rtrim($pline, '&');
        
        $url = 'https://api.vk.com/method/'.$method.'?'.$pline;
        if($token != false)
        {
            $url .= '&access_token='.$token;
        }
        
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($curl, CURLOPT_URL, $url);
        $response = curl_exec($curl);
        curl_close($curl);
        
        return json_decode($response, true);
    }
    
    /**
     * @Route("/my_test")
     * @Method({"GET"})
     *
     * @return array
     */
    public function my_tests()
    {
        
        
        //$this->_em->merge($friends);
        //$this->_em->flush();
    }
}