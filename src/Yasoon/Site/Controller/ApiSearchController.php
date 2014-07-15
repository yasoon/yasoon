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
use Yasoon\Site\Mail\Sender;

error_reporting(E_ALL);
/**
 * Class ApiSearchController
 *
 * @Route("/api/search")
 * @package Yasoon\Site\Controller
 */
class ApiSearchController {
    
    /**
     * @var PostService
     *
     * @DI\Inject("yasoon.service.post")
     */
    private $postservice;
    
    /**
     * @var AuthorService
     *
     * @DI\Inject("yasoon.service.author")
     */
    private $service;
    
    /**
     * @var QuestionService
     *
     * @DI\Inject("yasoon.service.question")
     */
    private $questionservice;
    
    /**
     * @var AllfService
     *
     * @DI\Inject("yasoon.service.allf")
     */
    private $allf;
    
    /**
     * @var Sender
     *
     * @DI\Inject("yasoon.mail.sender")
     */
    public $mailer;
    
    
    /**
     * @Route("/get")
     * @Method({"GET"})
     *
     * @return array
     */
    public function get(Request $request) {
        
        $posts = $this->postservice->getAllPosts();
        foreach($posts as $post)
        {
            $data = ['id' => 'post_'.$post->getId(),
                     'url' => 'http://'.$_SERVER['HTTP_HOST'].'/#post/'.$post->getId(),
                     'image' => '',
                     'subtype' => 'post',
                     'sumtext' => trim(strip_tags($post->getPreview())).' ' .trim(strip_tags($post->getText())),
                     'tags' => '"Posts"',
                     'body' => trim(strip_tags($post->getText())),
                     'date' => date('Y-m-d\TH:i:s', $post->getDate()->getTimestamp()),
                     'title' => trim( strip_tags($post->getCaption()))];
            
            $this->allf->indexistoQueryAdd($data);
        }
        
        
        $authors = $this->service->getAllAuthors();
        foreach($authors as $author)
        {
            $data = ['id' => 'author_'.$author->getId(),
                     'url' => 'http://'.$_SERVER['HTTP_HOST'].'/#author/'.$author->getId().'/posts',
                     'image' => '',
                     'subtype' => 'users',
                     'sumtext' => trim( strip_tags($author->getDescription()) ).' ' .trim( strip_tags($author->getInterest()) ),
                     'tags' => '"Authors"',
                     'body' => trim( strip_tags($author->getDescription()) ),
                     'date' => date('Y-m-d\TH:i:s', $author->getPublicationDate()->getTimestamp() ),
                     'title' => trim( strip_tags($author->getName()))];
                     
            $this->allf->indexistoQueryAdd($data);
        }
        
        $questions = $this->questionservice->getQuestionsToSearch();
        foreach($questions as $question)
        {
            $data = ['id' => 'questions_'.$question->getId(),
                     'url' => 'http://'.$_SERVER['HTTP_HOST'].'/#author/'.$question->getAuthorId().'/questions',
                     'image' => '',
                     'subtype' => 'questions',
                     'sumtext' => trim( strip_tags($question->getAnswer()) ),
                     'tags' => '"Questions"',
                     'body' => trim( strip_tags($question->getAnswer()) ),
                     'date' => date('Y-m-d\TH:i:s', $question->getDate()->getTimestamp() ),
                     'title' => trim( strip_tags($question->getText()))];
            
            $this->allf->indexistoQueryAdd($data);
        }
        
        return [];
    }
    
    /**
     * @Route("/test")
     * @Method({"GET"})
     *
     * @return array
     */
    public function test()
    {
        header('Content-type: text/html');
             
        echo '<!DOCTYPE HTML>
             <html>
                <head>
                </head>
                <body>
                    <script type="text/javascript" src="/frontend/js/vendor/require.js" data-main="/frontend/js/main.min.js"></script>
                    <script async="true" type="text/javascript" src="http://servant.indexisto.com/files/searchbox/searchbox.nocache.js?type=edit"></script>
                    <input autocomplete="off"  autocorrect="off" id="indx_srchbox_52f4b86e273ed3396a6c05fb" placeholder="Start typing" style="outline-color: transparent; box-sizing: content-box; outline: none;background: #FFF url(http://servant.indexisto.com/files/searchbox/search_icon_21px.png) no-repeat scroll 6px center;border: 2px solid rgb(255, 151, 18);border-radius: 5px;width: 202px;padding: 0 0 0 31px;height: 32px;line-height: 23px;color: #abaaaa;font-family: Arial;font-size: 18px;" type="text" />
                </body>
             </html>';
        exit;
    }
    
    
    /**
     * @Route("/actiontest")
     * @Method({"GET"})
     *
     * @return array
     */
    public function actiontest()
    {
        //$this->mailer->send('parandiy.mihail@gmail.com', 'kkkkkkkk', 'vddgfgfg');
        /*$data = json_encode(['_id' => 'post_84']);
        $batchDataBody = '[' . $data . ']';
        $response = $this->allf->indexistoQueryDelete($batchDataBody);
        echo $response;
        return [];*/
    }
}