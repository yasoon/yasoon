<?php
/**
 * Author: Fedor Avetisov <cousenavi@gmail.com>
 * Date: 5/26/13
 */

namespace Yasoon\Site\Service;

use JMS\DiExtraBundle\Annotation as DI;
use Symfony\Component\Security\Core\Exception\AccessDeniedException;
use Yasoon\Site\Entity\AuthorEntity;
use Yasoon\Site\Entity\BlankQuestionEntity;
use Yasoon\Site\Entity\PostEntity;
use Yasoon\Site\Entity\QuestionEntity;

/**
 * @DI\Service("yasoon.service.blank_question")
 */
class BlankQuestionService extends AbstractApiService {

    /**
     * @var \Symfony\Component\Security\Core\SecurityContextInterface
     *
     * @DI\Inject("security.context")
     */
    public  $securityContext;


    /**
     *
     * @return array
     */
    public function getAll() {

        $this->checkAdminAccess();

        /** @var BlankQuestionEntity[] $allQuestions  */
        $allQuestions = $this->em->getRepository('Yasoon\Site\Entity\BlankQuestionEntity')
            ->findBy([], ['place' => 'asc']);

        $result = [];
        foreach ($allQuestions as $question) {
            $result[] = [
                'id'   => (int)$question->getId(),
                'text' => $question->getText(),
                'place'=> (int)$question->getPlace()
            ];
        }

        return $result;
    }

    private function checkAdminAccess() {
        if (!$this->securityContext->getToken()->getRoles() || 'ROLE_ADMIN' != $this->securityContext->getToken()->getRoles()[0]->getRole()) {
            throw new AccessDeniedException();
        }
    }

    /**
     * @param array $model
     * @return array
     */
    public function add(array $model) {

        $this->checkAdminAccess();

        $place =$this->em->getConnection()->executeQuery('select max(place) as place from blank_question ')
            ->fetch()['place'];

        /** @var BlankQuestionEntity $question  */
        $question = (new BlankQuestionEntity())->setText($model['text'])->setPlace(++$place);

        $this->em->persist($question);
        $this->em->flush();

        return [
          'id' => (int)$question->getId(),
          'text' => $question->getText(),
          'place' => (int)$question->getPlace()
        ];
    }

    /**
     * @param array $model
     * @return array
     */
    public function update(array $model) {

        $this->checkAdminAccess();

        /** @var BlankQuestionEntity $question  */
        $question = $this->em->getRepository('Yasoon\Site\Entity\BlankQuestionEntity')->find($model['id']);

        $question->setText($model['text']);

        $this->em->merge($question);
        $this->em->flush();

        $result = [
            'id'       => (int)$question->getId(),
            'text'     => $question->getText(),
            'place'    => (int)$question->getPlace()
        ];

        return $result;

    }

    /**
     * @param array $model
     * @return array
     */
    public function delete(array $model) {

        $this->checkAdminAccess();

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

        $this->checkAdminAccess();

        $values = [];
        foreach ($map as $place => $id) {
            $place = (int)$place;
            $id =    (int)$id;
            $values[] = "('$id', '$place')";
        }
        $sql = 'INSERT INTO blank_question (id, place) VALUES  '.implode(',', $values).
        'ON DUPLICATE KEY UPDATE place=VALUES(place)';

        $this->em->getConnection()->executeQuery($sql);

        return $map;
    }

}