<?php
/**
 * Author: Fedor Avetisov <cousenavi@gmail.com>
 * Date: 5/27/13
 */

namespace Yasoon\Site\Tests\Controller;

use Yasoon\Site\Tests\TestCase;

class AuthorControllerTest extends TestCase {

    private function url($shortUrl) {
        return "/api/author/$shortUrl";
    }

    /** @test */
    public function addAction() {
                $model = [];

        $this->request('POST', $this->url('add'), ['model' => $model])->assertSuccess();
    }
}