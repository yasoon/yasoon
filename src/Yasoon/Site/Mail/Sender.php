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
use Swift_Message;
use Swift_Mailer;
use Swift_MailTransport;
use Swift_SmtpTransport;

error_reporting(E_ALL);
/**
 * @DI\Service("yasoon.mail.sender")
 */
class Sender
{
    /**
     * @var Swift_Mailer
     *
     * @DI\Inject("mailer")
     */
    public $swiftMailer;

    /**
     * @param string $email
     * @param string $text
     * @return int
     */
    public function send($email, $subject, $text)
    {
        $message = Swift_Message::newInstance()
          ->setFrom('info@yasoon.ru')
          ->setTo($email)
          ->setSubject($subject)
          ->setBody($text)
        ;
        $transport = Swift_MailTransport::newInstance();
//        $transport = Swift_SmtpTransport::newInstance('smtp.yasoon.ru')
//            ->setUsername('info@yasoon.ru')
//            ->setPassword('YasoonMailPa55w0rd')
//            ;
        $mailer = new Swift_Mailer($transport);
        return $mailer->send($message);
        
        //$mailer->send($message);
        //die;
    }
}
