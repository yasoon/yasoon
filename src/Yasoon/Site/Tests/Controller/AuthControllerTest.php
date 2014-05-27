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

namespace Yasoon\Site\Tests\Controller;


use JMS\DiExtraBundle\Tests\Functional\BaseTestCase;
use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;
use Symfony\Component\HttpFoundation\Response;


require_once __DIR__.'/../../../../../app/AppKernel.php';
class AuthControllerTest extends WebTestCase{

    /**
     * @var Response
     */
    protected $response;

    public static function createKernel()
    {
        return new \AppKernel('test', true);
    }

    public function request($method, $url, $parameters = []) {
        $client = static::createClient();
        $client->request($method, $url, $parameters);
        $this->response = $client->getResponse();
        return $this;
    }

    public function assertSuccess() {
        if ($this->response->getStatusCode() != 200) {
            $this->fail($this->response->getContent());
        }
        return $this;
    }

    /**
     * @test
     */
    public function login()
    {
        $this->request('POST', 'login', ['email' => 'cousenavi@gmail.com', 'password' => 'Ckfdfnhele123']);
    }
}