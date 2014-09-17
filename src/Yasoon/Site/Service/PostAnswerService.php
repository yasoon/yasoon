<?php

namespace Yasoon\Site\Service;

use JMS\DiExtraBundle\Annotation as DI;
use Yasoon\Site\Entity\PostAnswerEntity;


error_reporting(E_ALL);

/**
 * @DI\Service("yasoon.service.postAnswer")
 */
class PostAnswerService extends AbstractApiService {

    /**
     * @param array $answers
     * @return array
     * @throws \Symfony\Component\Security\Core\Exception\AccessDeniedException
     */
    public function saveInterviewAnswers(array $answers){

        $questionId = 1;
        $postId = 786;
        $postAnswerObject = (new PostAnswerEntity())
            ->setAnswer("New TEXT!")
            ->setPostId($postId)
            ->setQuestionId($questionId);

        $postAnswerObject->setPost($this->em->getReference('Yasoon\Site\Entity\PostEntity', $postId));
        $postAnswerObject->setQuestion($this->em->getReference('Yasoon\Site\Entity\QuestionEntity', $questionId));

        $this->em->persist($postAnswerObject);
        $this->em->flush();
    }


}