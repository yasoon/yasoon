<?php
/**
 * Author: Mihail Parandiy <parandiy.mihail@gmail.com>
 * Date: 5/26/13
 */



namespace Yasoon\Site\Service;

use JMS\DiExtraBundle\Annotation as DI;
use Symfony\Component\Security\Core\Exception\AccessDeniedException;
use Yasoon\Site\Entity\AuthorEntity;
//use Yasoon\Site\Entity\PostAnswerEntity;
use Yasoon\Site\Entity\PostEntity;
use Yasoon\Site\Entity\PostOfTheDayEntity;
use Yasoon\Site\Entity\QuestionEntity;
use Yasoon\Site\Entity\InterviewEntity;
use Yasoon\Site\Entity\InterviewQuestionEntity;

error_reporting(E_ALL);

/**
 * @DI\Service("yasoon.service.interview")
 */
class InterviewService extends AbstractApiService {

    /**
     * @var \Symfony\Component\Security\Core\SecurityContextInterface
     *
     * @DI\Inject("security.context")
     */
    public  $securityContext;
    
    
    
    /**
     * @param $interviewId
     * @return array
     */
    public function getQuestions($interviewId) {

        $result = [];

        /** @var QuestionEntity[] $questions */
        $questions = $this->em->createQueryBuilder()
            ->select('q')
            ->from('Yasoon\Site\Entity\InterviewQuestionEntity', 'q')
            ->where("q.interviewId = $interviewId")
            ->getQuery()->getResult();


        foreach ($questions as $question) {
            $result[] = [
                'question_id'         => $question->getId(),
                'interview_id' => $question->getInterviewId(),
                'question' => $question->getText()
            ];
        }

        return $result;
    }
    
    /**
     * @param $questionId
     * @return array
     */
    public function getAnswers($questionId)
    {
        try {
            $answers = $this->em->createQueryBuilder()
                ->select('pa')
                ->from('Yasoon\Site\Entity\PostAnswerEntity', 'pa')
                ->where("pa.question_id = '$questionId'")
                ->getQuery()->getResult();
            $data = [];
            foreach($answers as $answer)
            {
                $data[] = ['answer' => $answer->getAnswer()];
            }
                
            return $data;
        } catch(\Exception $e) {
            return ['error' => true, 'errorText' => $e->getMessage()];
        }
    }
    
    /**
     * @return array
     */
    public function getInterviews()
    {
        $result = [];
        $interviews = $this->em->createQueryBuilder()
            ->select('i')
            ->from('Yasoon\Site\Entity\InterviewEntity', 'i')
            ->getQuery()->getResult();
        
        $i = 0;
        foreach($interviews as $interview)
        {
            $result[$i] = [ 'id' => $interview->getId(),
                            'name' => $interview->getName(),
                            'order' => $interview->getOrder(),
                            'status' => $interview->getStatus()];
                         
            $questions = $interview->getQuestions();
            foreach($questions as $question)
            {
                $result[$i]['questions'][] = ['id' => $question->getId(), 'text' => $question->getText()];
            }
            
            $i++;
        }

        return $result;
    }
    
    /**
     * @return array
     */
    public function getInterviewsButtons()
    {
        $result = [];
        $interviews = $this->em->createQueryBuilder()
            ->select('i')
            ->from('Yasoon\Site\Entity\InterviewEntity', 'i')
            ->where('i.status = :status')
            ->orderBy('i.order', 'ASC')
            ->setParameter('status', 'visible')
            ->getQuery()->getResult();
        
        $i = 0;
        foreach($interviews as $interview)
        {
            $result[$interview->getId()] = $interview->getName();

            $i++;
        }

        return $result;
    }
    
    /**
     * @param $data
     * @return array
     */
    public function saveInterview($data)
    {
        if(isset($data['id']))
        {
            $interview = $this->em->getRepository('Yasoon\Site\Entity\InterviewEntity')->find($data['id']);
        }
        else
        {
            $interview = (new InterviewEntity())->setName($data['name']);
            $this->em->persist($interview);
            $this->em->flush();
        }
            if($interview)
            {
                $interview->setName($data['name']);
                
                $questions = [];
                foreach($data['questions'] as $question)
                {
                    if(isset($question['id']))
                    {
                        $questions[] = $this->em->getRepository('Yasoon\Site\Entity\InterviewQuestionEntity')->find($question['id'])->setText($question['text']);
                    }
                    else
                    {
                        $new = (new InterviewQuestionEntity())->setInterviewId($interview->getId())->setText($question['text'])->setInterview($interview);
                        $this->em->persist($new);
                        $questions[] = $new;
                    }
                }
                $exist_questons = $interview->getQuestions();
                if($exist_questons)
                {
                    foreach($exist_questons as $eq)
                    {
                        if(!in_array($eq, $questions))
                        {
                            $this->em->remove($eq);
                        }
                    }
                }
                
                $interview->setQuestions($questions);
                
                $this->em->merge($interview);
                $this->em->flush();
            }
        return $data;
    }
    
    
    /**
     * @param $id
     * @return array
     */
    public function deleteInterview($id)
    {
        try {
            $interview = $this->em->getRepository('Yasoon\Site\Entity\InterviewEntity')->find($id);
            
            $questions = $interview->getQuestions();
            foreach($questions as $q)
            {
                $post_questions_q = $this->em->getRepository('Yasoon\Site\Entity\PostAnswerEntity')->findBy(array('question_id' => $q->getId()));
                foreach($post_questions_q as $pqq)
                {
                    $this->em->remove($pqq);
                    $this->em->flush();
                }
                $this->em->remove($q);
                $this->em->flush();
            }
            $post_questions = $this->em->getRepository('Yasoon\Site\Entity\PostAnswerEntity')->findBy(array('post_id' => $id));
            foreach($post_questions as $pq)
            {
                $this->em->remove($pq);
                $this->em->flush();
            }
            
            $this->em->remove($interview);
            $this->em->flush();
            
            return ['error' => false, 'id' => $id];
        } catch(\Exception $e) {
            return ['error' => true, 'errorText' => $e->getMessage()];
        }
    }
}

?>