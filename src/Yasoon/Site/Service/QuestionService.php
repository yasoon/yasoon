<?php
/**
 * Author: Fedor Avetisov <cousenavi@gmail.com>
 * Date: 5/26/13
 */

namespace Yasoon\Site\Service;

use JMS\DiExtraBundle\Annotation as DI;
use Symfony\Component\Security\Core\Exception\AccessDeniedException;
use Yasoon\Site\Entity\AuthorEntity;
use Yasoon\Site\Entity\PostEntity;
use Yasoon\Site\Entity\QuestionEntity;
use Yasoon\Site\Entity\AnswerTimelineEntity;

error_reporting(E_ALL);
/**
 * @DI\Service("yasoon.service.question")
 */
class QuestionService extends AbstractApiService {

    /**
     * @var \Symfony\Component\Security\Core\SecurityContextInterface
     *
     * @DI\Inject("security.context")
     */
    public  $securityContext;

    /**
     * @param array $model
     * @return array
     */
    public function add(array $model) {

        $authorId = (int) $this->securityContext->getToken()->getUsername();
        if (!is_int($authorId)) {
            return ['error' => true, 'errorText' => 'accessDenied'];
        }

        $entity = (new QuestionEntity())
            ->setDate(new \DateTime())
            ->setText($model['question'])
            ->setAskAuthorId($model['ask_author_id'])
            ->setAuthorId($authorId)
            ->setNotified(0);

        $entity->setAuthor($this->em->getReference('Yasoon\Site\Entity\AuthorEntity', $authorId));
        $entity->setAuthorAsk($this->em->getReference('Yasoon\Site\Entity\AuthorEntity', $model['ask_author_id']));

        $this->em->persist($entity);
        $this->em->flush();

        $result = [
            'id'        => $entity->getId(),
            'authorId'      => $entity->getAuthorId(),
            'ask_author_id'  => $entity->getAskAuthorId(),
            'date'      => $entity->getDate()->format('d/m/Y'),
            'question'  => $entity->getText()
        ];

        return $result;

    }

    /**
     * @param $model
     * @return array
     */
    public function setInterviewCaption($model)
    {
        $authorId = (int) $this->securityContext->getToken()->getUsername();

        /** @var AuthorEntity  $entity */
        $entity = $this->em->getRepository('Yasoon\Site\Entity\AuthorEntity')->find($authorId);

        $entity->setInterviewCaption($model['interviewCaption']);

        $this->em->merge($entity);
        $this->em->flush();

        return [
          'authorId' => $entity->getId(),
          'interviewCaption' => $entity->getInterviewCaption()
        ];
    }

    /**
     * @param array $model
     * @return array
     */
    public function addInterview(array $model) {

        $authorId = (int) $this->securityContext->getToken()->getUsername();

        $place =$this->em->getConnection()
            ->executeQuery("select max(place) as place from question where author_id = $this->clientId and is_in_blank=1")
            ->fetch()['place'];

        $entity = (new QuestionEntity())
            ->setCaption($model['caption'])
            ->setAnswer(isset($model['answer'])? $model['answer'] : '')
            ->setDate(new \DateTime())
            ->setIsInBlank(true)
            ->setAuthorId($this->clientId)
            ->setPlace($place);

        $entity->setAuthor($this->em->getReference('Yasoon\Site\Entity\AuthorEntity', $authorId));

        $this->em->persist($entity);
        $this->em->flush();

        $result = [
            'id'       => $entity->getId(),
            'caption'  => $entity->getCaption(),
            'date'     => $entity->getDate()->format('d/m/Y'),
            'authorId' => $entity->getAuthorId(),
            'answer'   => $entity->getAnswer(),
            'place'    => $entity->getPlace()
        ];

        return $result;

    }

    /**
     * @param array $model
     * @return array
     */
    public function addAnswer(array $model) {
        $authorId = (int) $this->securityContext->getToken()->getUsername();
        $question = $this->em->getRepository('Yasoon\Site\Entity\QuestionEntity')->find($model['id']);
        if ($question->getAuthorId() != $authorId) {
            return ['error' => true, 'errorText' => 'accessDenied'];
        }
        try {
            $question->setAnswer($model['answer']);

            $this->em->merge($question);
            $this->em->flush();

            $friends = $this->em->getRepository('Yasoon\Site\Entity\AuthorEntity')->find($authorId)->getWriters();
            foreach($friends as $friend)
            {
                try {
                    $answerTimelineEntity = (new AnswerTimelineEntity())
                        ->setQuestionId($question->getId())
                        ->setAuthorId($friend->getId());

                    $this->em->persist($answerTimelineEntity);
                    $this->em->flush();
                } catch(Exception $e) {
                    return ['error' => true, 'errorText' => $e->getMessage()];
                }
            }
        } catch(\Exception $e) {
            return ['error' => true, 'errorText' => $e->getMessage()];
        }
        return [
            'error' => false
        ];
    }

    /**
     * @param array $model
     * @return array
     */
    public function update(array $model) {

        $authorId = (int) $this->securityContext->getToken()->getUsername();

        /** @var QuestionEntity $entity */
        $entity = $this->em->getRepository('Yasoon\Site\Entity\QuestionEntity')->find($model['id']);

        if ($entity->getAuthorId() != $authorId) {
            throw new AccessDeniedException();
        }

        $entity->setCaption($model['caption'])
            ->setAnswer($model['answer']);

        $this->em->merge($entity);
        $this->em->flush();

        $result = [
            'id'       => $entity->getId(),
            'caption'  => $entity->getCaption(),
            'answer'   => $entity->getAnswer(),
            'authorId' => $entity->getAuthorId(),
            'date'     => $entity->getDate()->format('d/m/Y'),
        ];

        return $result;

    }

    /**
     * @param array $model
     * @throws \Symfony\Component\Security\Core\Exception\AccessDeniedException
     */
    public function delete(array $model) {
        $authorId = (int) $this->securityContext->getToken()->getUsername();

        /** @var QuestionEntity $question */
        $question = $this->em->getRepository('Yasoon\Site\Entity\QuestionEntity')->find($model['id']);

        if ($question->getAuthorId() != $authorId) {
            throw new AccessDeniedException();
        }

        $this->em->remove($question);
        $this->em->flush();
    }

    /**
     * @param $postId
     * @return array
     */
    public function getPost($postId) {

        /** @var PostEntity $post */
        $post = $this->em->getRepository('Yasoon\Site\Entity\PostEntity')->find($postId);
        $result = [
            'id'      => $post->getId(),
            'caption' => $post->getCaption(),
            'authorId'=> $post->getAuthorId(),
            'ownerId' => $post->getAuthorId(),
            'preview' => $post->getPreview(),
            'text'    => $post->getText(),
            'date'    => $post->getDate()->format('d/m/Y'),
        ];

//        $access = $this->getAccessLevel($post->getAuthorId());
//
//        return ['access' => $access, 'data' => $result];
    }

    public function getQuestions($postId) {

        $result = [];

        /** @var QuestionEntity[] $questions */
        $questions = $this->em->createQueryBuilder()
            ->select('question, answer')
            ->from('Yasoon\Site\Entity\QuestionEntity', 'question')
            ->join('question.answer', 'answer')
            ->where("question.postId = $postId")
            ->getQuery()->getResult();


        foreach ($questions as $question) {
            $result[] = [
                'id'         => $question->getId(),
                'text'       => $question->getCaption(),
                'answerText' => $question->getAnswer()->getText()
            ];
        }

        return $result;
    }

    public function getQuestionsToSearch() {

        /** @var QuestionEntity[] $questions */
        $questions = $this->em->createQueryBuilder()
            ->select('question')
            ->from('Yasoon\Site\Entity\QuestionEntity', 'question')
            ->getQuery()->getResult();
            
        return $questions;
    }

    public function getAnswerTimeline() {
        $authorId = (int) $this->securityContext->getToken()->getUsername();
        $answers = $this->em->createQueryBuilder()
            ->select('p')
            ->from('Yasoon\Site\Entity\QuestionEntity', 'p')
            ->where("p.authorId = :authorId")
            ->setParameter('authorId',$authorId)
            ->getQuery()->getResult();
        if (count($answers) > 0) {
            $result = [];
            foreach($answers as $answer)
            {
                $result[] = [
                    'id'        => $answer->getId(),
                    'authorId'      => $answer->getAuthorId(),
                    'ask_author_id'  => $answer->getAskAuthorId(),
                    'date'      => $answer->getDate()->format('d/m/Y'),
                    'question'  => $answer->getText(),
                    'answer'    => $answer->getAnswer()
                ];
            }

            return [
                'error'       => false,
                'result'      => $result
            ];
        } else {
            return [
                'error' => false,
                'result' => 'NOT_FOUND'
            ];
        }
    }

    public function getNewAnswers() {
        $authorId = (int) $this->securityContext->getToken()->getUsername();
        if (!is_int($authorId)) {
            return ['error' => true, 'errorText' => 'accessDenied'];
        }
        $result = [];

        $questions = $this->em->createQueryBuilder()
            ->select('p')
            ->from('Yasoon\Site\Entity\QuestionEntity', 'p')
            ->where("p.notified  != 1")
            ->andWhere("p.answer IS NOT NULL")
            ->andWhere("p.authorId = :authorId")
            ->setParameter('authorId',$authorId)
            ->getQuery()->getResult();

        foreach ($questions as $question) {
            $result[] = [
                'id'            => $question->getId(),
                'text'          => $question->getText(),
                'answerText'    => $question->getAnswer(),
                'ask_author_id' => $question->getAskAuthorId(),
                'date'          => $question->getDate()->format('d/m/Y')
            ];
        }
        return $result;
    }

    public function questionAnswerNitified($question_ids) {
        $authorId = (int) $this->securityContext->getToken()->getUsername();
        if (!is_int($authorId)) {
            return ['error' => true, 'errorText' => 'accessDenied'];
        }
        $qb = $this->em->createQueryBuilder();
        $q = $qb->update('Yasoon\Site\Entity\QuestionEntity', 'u')
            ->set('u.notified', 1)
            ->where('u.id IN('.implode(',', $question_ids).')')
            ->andWhere('u.authorId = :authorId')
            ->setParameter('authorId', $authorId)
            ->getQuery();
        $p = $q->execute();
        return ['error' => false, 'errorText' => ''];
    }

    public function claerAnswerTimeline() {
        try {
            $authorId = (int)$this->securityContext->getToken()->getUsername();
            if (!is_int($authorId)) {
                return ['error' => true, 'errorText' => 'accessDenied'];
            }
            $answers_timeline = $this->em->createQueryBuilder()
                ->select('ate')
                ->from('Yasoon\Site\Entity\AnswerTimelineEntity', 'ate')
                ->where('ate.authorId = :author_id ')
                ->setParameter('author_id', $authorId)
                ->getQuery()->getResult();
            foreach ($answers_timeline as $answer_timeline) {
                $this->em->remove($answer_timeline);
                $this->em->flush();
            }

        } catch (\Exception $e) {
            return ['error' => true, 'errorText' => $e->getMessage()];
        }
        return ['error' => false, 'errorText' => ''];
    }

}