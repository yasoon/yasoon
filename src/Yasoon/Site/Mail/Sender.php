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

namespace Yasoon\Site\Mail;

use JMS\DiExtraBundle\Annotation as DI;

/**
 * @DI\Service("yasoon.mail.sender")
 */
class Sender
{
    /**
     * @param string $email
     * @param string $text
     */
    public function send($email, $text)
    {
        file_put_contents(__DIR__.'/../../../../app/logs/mail.log', "Email to $email.\n $text");
    }
}