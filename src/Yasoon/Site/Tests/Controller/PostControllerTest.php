<?php
/**
 * Author: Fedor Avetisov <cousenavi@gmail.com>
 * Date: 5/27/13
 */

namespace Yasoon\Site\Tests\Controller;

use Yasoon\Site\Tests\TestCase;

class PostControllerTest extends TestCase {

    private function url($shortUrl) {
        return "/api/post/$shortUrl";
    }

    /** @test */
    public function addAction() {
        $model = ['caption' => 'test', 'preview' => 'preview', 'text' => 'text', 'authorId' => 1];

        $this->request('POST', $this->url('add'), ['model' => $model])->assertSuccess();
    }
}