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
        $entity = new QuestionEntity();
        $entity->setDate(new \DateTime());
        $entity->setText($model['question']);
        $entity->setAskAuthorId($model['author_id']);
        $entity->setAuthorId($authorId);
        $entity->setNotified(0);

        $entity->setAuthorAsk($this->em->getReference('Yasoon\Site\Entity\AuthorEntity', $authorId));
        $entity->setAuthor($this->em->getReference('Yasoon\Site\Entity\AuthorEntity', $model['author_id']));

        $this->em->persist($entity);
        $this->em->flush();

        $askAuthorId = $entity->getAskAuthorId();              
        $askAuthor = $this->em->getRepository('Yasoon\Site\Entity\AuthorEntity')->find($askAuthorId);
        
        $result = [
            'id'        => $entity->getId(),
            'authorId'      => $entity->getAuthorId(),
            'ask_author_name'  => $askAuthor->getName(),
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
            $question->setAnswer($model['questionAnswerText']);

            $this->em->merge($question);
            $this->em->flush();

            $friends = $this->em->getRepository('Yasoon\Site\Entity\AuthorEntity')->find($authorId)->getWriters();
            foreach($friends as $friend)
            {
                $aa = $question->getId();
                try {
                    $answerTimelineEntity = (new AnswerTimelineEntity())
                        ->setQuestionId($question->getId())
                        ->setAuthorId($friend->getId())
                        ->setQuestion($question);

                    $this->em->merge($answerTimelineEntity);
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
        return ['error' => false, 'errorText' => ''];
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
        if (!is_int($authorId)) {
            return ['error' => true, 'errorText' => 'accessDenied'];
        }
        $answersTimeline = $this->em->createQueryBuilder()
            ->select('p')
            ->from('Yasoon\Site\Entity\AnswerTimelineEntity', 'p')
            ->where("p.authorId = :authorId")
            ->setParameter('authorId',$authorId)
            ->getQuery()->getResult();
        if (count($answersTimeline) > 0) {
            $result = [];
            foreach($answersTimeline as $answerTimeline)
            {
                $askAuthorId = $answerTimeline->getQuestion()->getAuthorId();              
                $askAuthor = $this->em->getRepository('Yasoon\Site\Entity\AuthorEntity')->find($askAuthorId);
                $result[] = [
                    'id'        => $answerTimeline->getQuestion()->getId(),
                    'authorId'      => $answerTimeline->getQuestion()->getAuthorId(),
                    'ask_author_name'  => $askAuthor,
                    'date'      => $answerTimeline->getQuestion()->getDate()->format('d/m/Y'),
                    'question'  => $answerTimeline->getQuestion()->getText(),
                    'answer'    => $answerTimeline->getQuestion()->getAnswer()
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

    public function getAnswerTimelineCount() {
        $authorId = (int) $this->securityContext->getToken()->getUsername();
        if (!is_int($authorId)) {
            return ['error' => true, 'errorText' => 'accessDenied'];
        }
        $answersTimelineCount = $this->em->createQueryBuilder()
            ->select('count(p.id)')
            ->from('Yasoon\Site\Entity\AnswerTimelineEntity', 'p')
            ->where("p.authorId = :authorId")
            ->setParameter('authorId',$authorId)
            ->getQuery()->getSingleScalarResult();
        return $answersTimelineCount;
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
            ->andWhere("p.ask_authorId = :ask_authorId")
            ->setParameter('ask_authorId',$authorId)
            ->getQuery()->getResult();


        foreach ($questions as $question) {
            $askAuthorId = $question->getAuthorId();              
            $askAuthor = $this->em->getRepository('Yasoon\Site\Entity\AuthorEntity')->find($askAuthorId);
            $result[] = [
                'id'            => $question->getId(),
                'text'          => $question->getText(),
                'answerText'    => $question->getAnswer(),
                'ask_author_name' => $askAuthor->getName(),
                'author_id' => $question->getAuthorId(),
                'date'          => $question->getDate()->format('d/m/Y')
            ];
        }
        return [
            'error'       => false,
            'result'      => $result
        ];
    }

    public function getNewAnswersCount() {
        $authorId = (int) $this->securityContext->getToken()->getUsername();
        if (!is_int($authorId)) {
            return ['error' => true, 'errorText' => 'accessDenied'];
        }
        $questions_count = $this->em->createQueryBuilder()
            ->select('count(p.id)')
            ->from('Yasoon\Site\Entity\QuestionEntity', 'p')
            ->where("p.notified  != 1")
            ->andWhere("p.answer IS NOT NULL")
            ->andWhere("p.ask_authorId = :ask_authorId")
            ->setParameter('ask_authorId',$authorId)
            ->getQuery()->getSingleScalarResult();
        return $questions_count;
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

    public function getUnansweredQuestions() {
        try {
            $authorId = (int)$this->securityContext->getToken()->getUsername();
            if (!is_int($authorId)) {
                return ['error' => true, 'errorText' => 'accessDenied'];
            }
            $questions = $this->em->createQueryBuilder()
                ->select('q')
                ->from('Yasoon\Site\Entity\QuestionEntity', 'q')
                ->where('q.authorId = :author_id ')
                ->andWhere('q.answer IS NULL')
                ->setParameter('author_id', $authorId)
                ->getQuery()->getResult();
            $result['error'] = false;
            $result['result'] = [];
            foreach ($questions as $question) {
                $askAuthorId = $question->getAskAuthorId();              
                $askAuthor = $this->em->getRepository('Yasoon\Site\Entity\AuthorEntity')->find($askAuthorId);
                $result['result'][] = [
                    'id'            => $question->getId(),
                    'text'          => $question->getText(),
                    'ask_author_name' => $askAuthor->getName(),
                    'date'          => $question->getDate()->format('d/m/Y')
                ];
            }

        } catch (\Exception $e) {
            return ['error' => true, 'errorText' => $e->getMessage()];
        }
        return $result;
    }

}