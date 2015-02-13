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
use Yasoon\Site\Entity\InterviewModerator;
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
     * 
     * limit for lego interviews best
     */
    
    const INTERVIEW_LEGO_BEST_LIMIT = 3;
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
                $lego = $answer->getLego() == '1' ? 'checked' : '';
                $post = $this->em->getRepository('Yasoon\Site\Entity\PostEntity')->findOneBy(array('id' => $answer->getPostId()));
                if (!empty($post)) {
                    $authorId = $answer->getPost()->getAuthor()->getId();
                    $author = $this->em->getRepository('Yasoon\Site\Entity\AuthorEntity')->find($authorId);
                    if (!empty($author)) {
                    $data[] = ['answer' => $answer->getAnswer(),'id' => $answer->getId(), 
                        'authorName' => $author->getName(), 'avatarImg' => $author->getImage(), 
                        'lego' => $lego];
                    }
                }
            }
                
            return $data;
        } catch(\Exception $e) {
            return ['error' => true, 'errorText' => $e->getMessage()];
        }
    }
    
    /**
     * @return array
     */
    public function getInterviewsAdmin()
    {
        $result = [];
        $interviews = $this->em->createQueryBuilder()
            ->select('i')
            ->from('Yasoon\Site\Entity\InterviewEntity', 'i')
            ->getQuery()->getResult();
        
        $options = [];
        $interviewTypes = $this->em->getRepository('Yasoon\Site\Entity\InterviewTypeEntity')->findAll();
        foreach ($interviewTypes as $type) {
            $options[] = array('id' => $type->getId(), 'type' => $type->getType());
        }
        
        $i = 0;
        foreach($interviews as $interview)
        {
            $result[$i] = [ 'id' => $interview->getId(),
                            'name' => $interview->getName(),
                            'order' => $interview->getOrder(),
                            'status' => $interview->getStatus(),
                            'options' => $options];
                         
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
    public function getInterviews()
    {
        $result = [];
        $interviews = $this->em->createQueryBuilder()
            ->select('i')
            ->from('Yasoon\Site\Entity\InterviewEntity', 'i')
            ->getQuery()->getResult();
        
        foreach($interviews as $interview)
        {
            $result[$interview->getId()] = [ 'id' => $interview->getId(),
                            'name' => $interview->getName(),
                            'order' => $interview->getOrder(),
                            'status' => $interview->getStatus()];
                         
            $questions = $interview->getQuestions();
            foreach($questions as $question)
            {
                $result[$interview->getId()]['questions'][] = ['id' => $question->getId(), 'text' => $question->getText()];
            }
            
        }

        return $result;
    }
    
     /**
      * @return array
      */
    public function getInterviewsAll()
    {
        $result = [];
        $interviews = $this->em->createQueryBuilder()
            ->select('i')
            ->from('Yasoon\Site\Entity\InterviewEntity', 'i')
            ->getQuery()->getResult();
        
        foreach($interviews as $interview)
        {
            $result[] = [   'id' => $interview->getId(),
                            'name' => $interview->getName(),
                            'interviewImg' => $interview->getImg(),
                            'description' => $interview->getDescription()
                        ];
        }

        return $result;
    }
    
    /**
      * @return array
      */
    public function getInterviewsLegoBest()
    {
        $answer = ['error' => true, 'errorText' => 'Истории не сформированы'];
        
        $result = [];
        
        $interviews = $this->em->getRepository('Yasoon\Site\Entity\InterviewEntity')
            ->findBy(
                array('lego' => '1'),
                array('position' => 'ASC'),
                InterviewService::INTERVIEW_LEGO_BEST_LIMIT
            );
        
        foreach($interviews as $interview)
        {
            $questions = $interview->getQuestions();
            $strLength = 0;
            $posts = [];
            
            foreach ($questions as $question) {
                $answers = $this->em->getRepository('Yasoon\Site\Entity\PostAnswerEntity')->findBy(array('question_id' => $question->getId(), 'lego' => '1'));
                
                foreach ($answers as $answer) {
                    $posts[] = $answer->getPostId();
                    $strLength += strlen(strip_tags($answer->getAnswer()));
                }      
            }
            $timeRead = round($strLength/4200);
            $timeToRead = $timeRead > 1 ? $timeRead : 1;
            
            $posts = array_unique($posts);
            if (!empty($posts)) {
                $likesQuery = $this->em->createQueryBuilder()
                        ->select('sum(pl.count_likes)')
                        ->from('Yasoon\Site\Entity\PostLikesEntity', 'pl')
                        ->where('pl.post_id IN (:posts)')
                        ->setParameter('posts', $posts)
                        ->getQuery()->getSingleScalarResult();

                $likes = $likesQuery == null ? 0 : $likesQuery;
                $speakers = $this->em->createQueryBuilder()
                        ->select('count(distinct p.authorId)')
                        ->from('Yasoon\Site\Entity\PostEntity', 'p')
                        ->where('p.id IN (:posts)')
                        ->setParameter('posts', $posts)
                        ->getQuery()->getSingleScalarResult();

                $result[] = [   'id' => $interview->getId(),
                                'name' => $interview->getName(),
                                'image' => $interview->getImg(),
                                'likes' => $likes,
                                'speakers' => $speakers,
                                'timeToRead' => $timeToRead
                            ];
            } 
        }
        $options = [];
        $interviewTypes = $this->em->getRepository('Yasoon\Site\Entity\InterviewTypeEntity')->findAll();
        foreach ($interviewTypes as $type) {
            $options[] = array('id' => $type->getId(), 'type' => $type->getType());
        }
        if (!empty($result)) {
            $answer = ['error' => false, 'interviews' => $result, 'options' => $options];
        } 
        
        return $answer;
    }
    
     /**
      * @return array
      */
    public function getInterviewsModerator($authorId)
    {
        $answer = ['error' => true, 'errorText' => 'Нет модерируемых потоков!'];
        
        $result = [];
        $interviewsId = [];
        
        $interviewsModerate = $this->em->getRepository('Yasoon\Site\Entity\InterviewModeratorEntity')->findBy(array('authorId' => $authorId));
        foreach ($interviewsModerate as $interviewModerate) {
            $interviewsId[] = (int)$interviewModerate->getInterview();
        }
        if (!empty($interviewsId)) {
            $interviews = $this->em->getRepository('Yasoon\Site\Entity\InterviewEntity', 'i')->findBy(
               array('id' => $interviewsId)
             );
            if (!empty($interviews)) {
                foreach($interviews as $interview)
                {
                    $questions = $interview->getQuestions();
                    $strLength = 0;
                    $posts = [];

                    foreach ($questions as $question) {
                        $answers = $this->em->getRepository('Yasoon\Site\Entity\PostAnswerEntity')->findBy(array('question_id' => $question->getId(), 'lego' => '1'));

                        foreach ($answers as $answer) {
                            $posts[] = $answer->getPostId();
                            $strLength += strlen(strip_tags($answer->getAnswer()));
                        }      
                    }
                    $timeRead = round($strLength/4200);
                    $timeToRead = $timeRead > 1 ? $timeRead : 1;

                    $posts = array_unique($posts);
                    if (!empty($posts)) {
                        $likesQuery = $this->em->createQueryBuilder()
                                ->select('sum(pl.count_likes)')
                                ->from('Yasoon\Site\Entity\PostLikesEntity', 'pl')
                                ->where('pl.post_id IN (:posts)')
                                ->setParameter('posts', $posts)
                                ->getQuery()->getSingleScalarResult();

                        $likes = $likesQuery == null ? 0 : $likesQuery;
                        $speakers = $this->em->createQueryBuilder()
                                ->select('count(distinct p.authorId)')
                                ->from('Yasoon\Site\Entity\PostEntity', 'p')
                                ->where('p.id IN (:posts)')
                                ->setParameter('posts', $posts)
                                ->getQuery()->getSingleScalarResult();

                        $result[] = [   'id' => $interview->getId(),
                                        'name' => $interview->getName(),
                                        'image' => $interview->getImg(),
                                        'likes' => $likes,
                                        'speakers' => $speakers,
                                        'timeToRead' => $timeToRead
                                    ];
                    } 
                } 
            }

            if (!empty($result)) {
                $answer = ['error' => false, 'interviews' => $result];
            } 
        }
        return $answer;
    }
    
     /**
      * @return array
      */
    public function getInterviewsByType($typeId = null)
    {
        $answer = ['error' => true, 'errorText' => 'Истории не сформированы'];
        
        $result = [];
        $interviews = [];
        
        if ($typeId != null && $typeId != 0) {
        $interviews = $this->em->getRepository('Yasoon\Site\Entity\InterviewEntity')
            ->findBy(
                array('lego' => '1', 'type_id' => $typeId)
            );
        } else {
            $interviews = $this->em->getRepository('Yasoon\Site\Entity\InterviewEntity')
            ->findBy(
                array('lego' => '1')
            );
        }
        foreach($interviews as $interview)
        {
            $questions = $interview->getQuestions();
            $strLength = 0;
            $posts = [];
            
            foreach ($questions as $question) {
                $answers = $this->em->getRepository('Yasoon\Site\Entity\PostAnswerEntity')->findBy(array('question_id' => $question->getId(), 'lego' => '1'));
                
                foreach ($answers as $answer) {
                    $posts[] = $answer->getPostId();
                    $strLength += strlen(strip_tags($answer->getAnswer()));
                }      
            }
            $timeRead = round($strLength/4200);
            $timeToRead = $timeRead > 1 ? $timeRead : 1;
            
            $posts = array_unique($posts);
            if (!empty($posts)) {
                $likesQuery = $this->em->createQueryBuilder()
                        ->select('sum(pl.count_likes)')
                        ->from('Yasoon\Site\Entity\PostLikesEntity', 'pl')
                        ->where('pl.post_id IN (:posts)')
                        ->setParameter('posts', $posts)
                        ->getQuery()->getSingleScalarResult();

                $likes = $likesQuery == null ? 0 : $likesQuery;
                $speakers = $this->em->createQueryBuilder()
                        ->select('count(distinct p.authorId)')
                        ->from('Yasoon\Site\Entity\PostEntity', 'p')
                        ->where('p.id IN (:posts)')
                        ->setParameter('posts', $posts)
                        ->getQuery()->getSingleScalarResult();

                $result[] = [   'id' => $interview->getId(),
                                'name' => $interview->getName(),
                                'image' => $interview->getImg(),
                                'likes' => $likes,
                                'speakers' => $speakers,
                                'timeToRead' => $timeToRead
                            ];
            } 
        }
        if (!empty($result)) {
            $answer = ['error' => false, 'interviews' => $result];
        } 
        
        return $answer;
    }

    /**
     * @return array
     */
    public function getInterviewsLego($interviewId)
    {
        if (!empty($interviewId)) {
            $interview = $this->em->getRepository('Yasoon\Site\Entity\InterviewEntity')->findOneBy(array('id' => $interviewId, 'lego' => '1'));

            if (!empty($interview)) {
                $questions = $interview->getQuestions();
                $description = $interview->getDescription();
                $interviewQuestions = array();
                foreach ($questions as $question) {
                    $questionId = $question->getId();
                    $answers = $this->em->getRepository('Yasoon\Site\Entity\PostAnswerEntity')->findBy(array('question_id' => $questionId, 'lego' => '1'));
                   
                    $questionAnswers = array();
                    
                        foreach ($answers as $answer) { 
                            $postId = $answer->getPostId();
                            $post = $this->em->getRepository('Yasoon\Site\Entity\PostEntity')->findOneBy(array('id' => $postId));
                            if (!empty($post)) {
                            
                            $author = $post->getAuthor();
                            $title = $post->getPreview() != '' ? $post->getPreview() : $post->getCaption();
                            $questionAnswers[] =    [
                                                        'text' => $answer->getAnswer(),
                                                        'authorId' => $author->getId(),
                                                        'authorName' => $author->getName(),
                                                        'authorJob' => $author->getJob(),
                                                        'avatarImg' => $author->getImg(),
                                                        'postTitle' => $title,
                                                        'postId' => $postId,
                                                        'post_likes'  => $post->getLikes()
                                                    ];
                            }
                        }
                    
                        if (!empty($questionAnswers)) {
                            $interviewQuestions[] = [
                                                        'questionId' => $questionId,
                                                        'questionText' => $question->getText(),
                                                        'answers' => $questionAnswers
                                                    ];
                        }
                    
                }
                
                $result =   [
                                'interviewId' => $interviewId,
                                'questions' => $interviewQuestions,
                                'interviewTitle' => $interview->getName(),
                                'interviewImg' => $interview->getImg(),
                                'previewImg' => $interview->getPreviewImg(),
                                'interviewDescription' => $description
                            ];
                
                return ['error' => false, 'interviewData' => $result];
            } else {
                return ['error' => true, 'errorText' => 'Данное интервью не сформировано'];
            }
        
            
        } else {
            return ['error' => true, 'errorText' => 'Данное интервью не сформировано'];
        }
        return array(0 => array('text' => 'first q', 'answers' => array(0 => array('text' => 'answer 1'), 1 => array('text' => 'answer 2'))));
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
            $result[$interview->getOrder()] = ['name' => $interview->getName(), 'id' => $interview->getId()];

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
            $interview = (new InterviewEntity())->setName($data['name'])->setOrder($data['order'])->setStatus($data['status'])->setLego('0')->setPosition(0)->setPreviewImg('')->setImg('');
            $this->em->persist($interview);
            $this->em->flush();
        }
            if($interview)
            {
                $interview->setTypeId($data['type']);
                $interview->setName($data['name']);
                $interview->setOrder($data['order']);
                $interview->setStatus($data['status']);
                $interview->setImg('');
                $interview->setPreviewImg('');
                
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
     * @param $answersIds, $interviewId
     * @return array
     */
    public function saveInterviewLego($interviewId, $questionId, $answersIds)
    {
        if (empty($answersIds)){
            return ['error' => true, 'errorText' => 'Необходимо выбрать ответы на данный вопрос'];
        } else {
            try {
                $interview = $this->em->getRepository('Yasoon\Site\Entity\InterviewEntity')->find($interviewId);
                $lego = $interview->getLego();
                
                $maxPosition = $this->em->createQueryBuilder()
                    ->select('max(i.position)')
                    ->from('Yasoon\Site\Entity\InterviewEntity', 'i')
                    ->where('i.lego = :lego')
                    ->setParameter('lego', '1')
                    ->getQuery()->getSingleScalarResult();
                
                if ($lego == 0) {
                    $interview->setLego('1');
                    $interview->setPosition($maxPosition + 1);
                    $this->em->persist($interview);
                    $this->em->flush();
                } 

                $answers = $this->em->getRepository('Yasoon\Site\Entity\PostAnswerEntity')->findBy(array('question_id' => $questionId));
                
                foreach ($answers as $answer) {

                    if (in_array($answer->getId(), $answersIds)){   
                        $answer->setLego('1');
                        $this->em->persist($answer);
                        $this->em->flush();
                    } else {
                        $answer->setLego('0');
                        $this->em->persist($answer);
                        $this->em->flush();
                    } 
                }
                
                return ['error' => false, 'message' => 'Ответы на данный вопрос сохранены'];
                
            } catch(\Exception $e) {
                return ['error' => true, 'errorText' => $e->getMessage()];
            }
        }
    }
    
    /**
     * @param $interviewId, $description
     * @return array
     */
    public function saveInterviewDescription($interviewId, $description)
    {
        if (empty($interviewId)){
            return ['error' => true, 'errorText' => 'Ошибка с номером интервью, попробуйте позже!'];
        } else {
            try {
                $interview = $this->em->getRepository('Yasoon\Site\Entity\InterviewEntity')->find($interviewId);
                
                $interview->setDescription($description);
                
                $this->em->persist($interview);
                $this->em->flush();
                
                return ['error' => false, 'message' => 'Описание интервью успешно сохранено'];
                
            } catch(\Exception $e) {
                return ['error' => true, 'errorText' => $e->getMessage()];
            }
        }
    }
    
    
    /**
     * @param $questionId, $interviewId
     * @return array
     */
    
    public function removeInterviewLego($interviewId, $questionId)
    {
        try {
             $answers = $this->em->getRepository('Yasoon\Site\Entity\PostAnswerEntity')->findBy(array('question_id' => $questionId));
             foreach ($answers as $answer) {
                $answer->setLego('0');
                $this->em->persist($answer);
                $this->em->flush();
            }

            $interview = $this->em->getRepository('Yasoon\Site\Entity\InterviewEntity')->find($interviewId);
            
            $questions = $interview->getQuestions();
            $qids = array();
            foreach ($questions as $question) {
                $qids[] = $question->getId();
            }

            $countOfAnswers = $this->em->createQueryBuilder()
                    ->select('count(pa.id)')
                    ->from('Yasoon\Site\Entity\PostAnswerEntity', 'pa')
                    ->where('pa.question_id IN (:questionsId)')
                    ->andWhere('pa.lego = :lego')
                    ->setParameter('questionsId', $qids)
                    ->setParameter('lego', '1')
                    ->getQuery()->getSingleScalarResult();
            
            if ($countOfAnswers == 0) {
                
                $interview->setLego('0');
                $interview->setPosition(0);
                
                return ['error' => false, 'message' => 'Вы удалили все ответы из интервью, теперь оно не доступно по ссылке!'];
            }
            
            return ['error' => false, 'message' => 'Ответы для данного вопроса удалены'];

        } catch (\Exception $e) {
            return ['error' => true, 'errorText' => $e->getMessage()];
        }
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
    
    public function setInterviewImg($imageName, $previewImage, $id)
    {

        /** @var AuthorEntity $entity */
        $entity = $this->em->getRepository('Yasoon\Site\Entity\InterviewEntity')
            ->find($id);

        $oldImage = $entity->getImg();
        $oldPreviewImage = $entity->getPreviewImg();
        
        $entity->setImg($imageName);
        $entity->setPreviewImg($previewImage);

        $this->em->merge($entity);
        $this->em->flush();

        return array('oldImage' => $oldImage, 'oldPreviewImage' => $oldPreviewImage);
    }
    
    public function getInterviewById($interviewId)
    {
        $entity = $this->em->getRepository('Yasoon\Site\Entity\InterviewEntity')
            ->find($interviewId);
        
        $result = [];
        
        $result[] = [
            'title' => $entity->getName(),
            'description' => $entity->getDescription(),
            'lego_img' => $entity->getImg()
        ];
        
        return $result;
    }
    
    public function getModerators($interviewId)
    {
        $moderIds = [];
        $moderatorIds = $this->em->createQueryBuilder()
                    ->select('im.authorId')
                    ->from('Yasoon\Site\Entity\InterviewModeratorEntity', 'im')
                    ->where('im.interview_id = :interviewId')
                    ->setParameter('interviewId', $interviewId)
                    ->getQuery()->getResult();
        foreach ($moderatorIds as $moderator) {
            $moderIds[] = $moderator['authorId'];
        }
        if (!empty ($moderIds)) {
            $moderators = $this->em->getRepository('Yasoon\Site\Entity\AuthorEntity')->findBy(array('id' => $moderIds));
            
            $result = [];
            foreach ($moderators as $moderator) {
                $result[] = [
                    'id' => $moderator->getId(),
                    'name'    => $moderator->getName(),
                    'avatarImg'     => $moderator->getImage()
                ];
            }
            
            return ['error' => false, 'result' => $result];
        }
        
        return ['error' => true, 'errorText' => 'Нет модераторов'];
    }
    
}

?>