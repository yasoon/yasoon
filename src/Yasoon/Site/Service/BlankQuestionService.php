<?php
/**
 * Author: Fedor Avetisov <cousenavi@gmail.com>
 * Date: 5/26/13
 */

namespace Yasoon\Site\Service;

use JMS\DiExtraBundle\Annotation as DI;
use Yasoon\Site\Entity\AuthorEntity;
use Yasoon\Site\Entity\BlankQuestionEntity;
use Yasoon\Site\Entity\PostEntity;
use Yasoon\Site\Entity\QuestionEntity;

/**
 * @DI\Service("yasoon.service.blank_question")
 */
class BlankQuestionService extends AbstractApiService {

    /**
     *
     * @return array
     */
    public function getAll() {
        $allQuestions = $this->em->getRepository('Yasoon\Site\Entity\BlankQuestionEntity')->findAll();

        $result = [];
        foreach ($allQuestions as $question) {
            $result[] = [
                'id' => $question->getId(),
                'text' => $question->getText()
            ];
        }

        return $result;
    }

    /**
     * @param array $model
     * @return array
     */
    public function add(array $model) {
        $question = (new BlankQuestionEntity())->setText($model['text']);

        $this->em->persist($question);
        $this->em->flush();

        return [
          'id' => $question->getId(),
          'text' => $question->getText()
        ];
    }

    /**
     * @param array $model
     * @return array
     */
    public function update(array $model) {
        $question = $this->em->getRepository('Yasoon\Site\Entity\BlankQuestionEntity')->find($model['id']);

        $question->setText($model['text']);

        $this->em->merge($question);
        $this->em->flush();

        $result = [
            'id'       => $question->getId(),
            'text'     => $question->getText()
        ];

        return $result;

    }

    /**
     * @param array $model
     */
    public function delete(array $model) {
        $post = $this->em->getRepository('Yasoon\Site\Entity\BlankQuestionEntity')->find($model['id']);

        $this->em->remove($post);
        $this->em->flush();
    }
}