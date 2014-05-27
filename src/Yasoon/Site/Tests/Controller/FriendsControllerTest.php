<?php
/**
 * Author: Fedor Avetisov <cousenavi@gmail.com>
 * Date: 5/27/13
 */

namespace Yasoon\Site\Tests\Controller;

use Yasoon\Site\Tests\TestCase;

class FriendsControllerTest extends TestCase {

    private function url($shortUrl) {
        return "/api/friends/$shortUrl";
    }

    /** @test */
    public function addFriendAction() {
        $this->request('GET', $this->url('add/2'), [])->assertSuccess();
    }

//    /** @test */
//    public function deleteFriendAction() {
//        $this->request('GET', $this->url('delete/2'), [])->assertSuccess();
//    }

    /** @test */
    public function getTimelineAction() {
        $this->request('GET', $this->url('timeline/0'), [])->assertSuccess();
    }

}