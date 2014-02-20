<?php
/**
 * Author: Fedor Avetisov <cousenavi@gmail.com>
 * Date: 5/27/13
 */

namespace Yasoon\Site\Tests\Controller;

use Yasoon\Site\Tests\TestCase;

class BlankQuestionControllerTest extends TestCase {

    private function url($shortUrl) {
        return "/api/blank_question/$shortUrl";
    }

    /** @test */
    public function cycleAction() {
        $model = ['text' => 'test'];

        $this->request('POST', $this->url('add'), ['model' => $model])->assertSuccess();

        $model['id'] = json_decode($this->response->getContent())->id;

        $this->request('POST', $this->url('update'), ['model' => $model])->assertSuccess();

        $this->request('POST', $this->url('delete'), ['model' => $model])->assertSuccess();
    }

}