<?php
/**
 * Author: Fedor Avetisov <cousenavi@gmail.com>
 * Date: 5/27/13
 */

namespace Yasoon\Site\Tests\Controller;

use Yasoon\Site\Tests\TestCase;

class PostControllerTest extends TestCase {

    private function url($shortUrl) {
        return "/api/question/$shortUrl";
    }

    /** @test */
    public function addAction() {
        $model = ['authorId' => 1, 'postId' => 13, 'text' => 123];

        $this->request('POST', $this->url('add'), ['model' => $model])->assertSuccess();
    }
}