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
        /** @var BlankQuestionEntity[] $allQuestions  */
        $allQuestions = $this->em->getRepository('Yasoon\Site\Entity\BlankQuestionEntity')
            ->findBy([], ['place' => 'asc']);

        $result = [];
        foreach ($allQuestions as $question) {
            $result[] = [
                'id' => $question->getId(),
                'text' => $question->getText(),
                'place' => $question->getPlace()
            ];
        }

        return $result;
    }

    /**
     * @param array $model
     * @return array
     */
    public function add(array $model) {
        /** @var BlankQuestionEntity $question  */
        $question = (new BlankQuestionEntity())->setText($model['text'])->setPlace($model['place']);

        $this->em->persist($question);
        $this->em->flush();

        return [
          'id' => $question->getId(),
          'text' => $question->getText(),
          'place' => $question->getPlace()
        ];
    }

    /**
     * @param array $model
     * @return array
     */
    public function update(array $model) {
        /** @var BlankQuestionEntity $question  */
        $question = $this->em->getRepository('Yasoon\Site\Entity\BlankQuestionEntity')->find($model['id']);

        $question->setText($model['text']);

        $this->em->merge($question);
        $this->em->flush();

        $result = [
            'id'       => $question->getId(),
            'text'     => $question->getText(),
            'place' => $question->getPlace()
        ];

        return $result;

    }

    /**
     * @param array $model
     * @return array
     */
    public function delete(array $model) {
        $question = $this->em->getRepository('Yasoon\Site\Entity\BlankQuestionEntity')->find($model['id']);

        $this->em->remove($question);
        $this->em->flush();

        $result = [
          'id' => $model['id']
        ];

        return $result;
    }

    /**
     * @param array $map
     * @return array
     */
    public function updatePlaces(array $map) {
        $values = [];
        foreach ($map as $place => $id) {
            $place = (int)$place + 1;
            $id =    (int)$id;
            $values[] = "('$id', '$place')";
        }
        $sql = 'INSERT INTO blank_question (id, place) VALUES  '.implode(',', $values).
        'ON DUPLICATE KEY UPDATE place=VALUES(place)';

        $this->em->getConnection()->executeQuery($sql);

        return ['ok' => 'ok'];
    }

}