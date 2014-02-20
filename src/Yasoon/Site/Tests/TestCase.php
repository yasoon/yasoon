<?php
/**
 * Author: Fedor Avetisov <cousenavi@gmail.com>
 * Date: 5/27/13
 */

namespace Yasoon\Site\Tests;


use Symfony\Bundle\FrameworkBundle\Tests\Functional\WebTestCase;
use Symfony\Bundle\SecurityBundle\Tests\Functional\AppKernel;
use Symfony\Component\BrowserKit\Cookie;
use Symfony\Component\BrowserKit\Response;

require_once __DIR__.'/../../../../app/AppKernel.php';

class TestCase extends WebTestCase{



    /**
     * @var Response
     */
    protected  $response = null;

    /**
     * @var bool
     */
    protected  $responseRecieved = false;

    public static function createKernel()
    {
        return new \AppKernel('test', true);
    }

    /**
     * @param $method
     * @param $route
     * @param array $parameters
     * @return $this
     */
    public function request($method, $route, array $parameters = []) {

        $client = static::createClient();
        $cookie = new Cookie('PHPSESSID', '6ntij4s3l9aer380ni0gihuoo2', 0, '/', 'localhost', false, true);
        $client->getCookieJar()->set($cookie);
        $client->request($method, $route, $parameters);


        $this->response = $client->getResponse();

        $this->responseRecieved = true;

        return $this;
    }

    /**
     * @return $this
     */
    public function assertSuccess() {
        $this->assertEquals(200, $this->response->getStatusCode());

        return $this;
    }
}