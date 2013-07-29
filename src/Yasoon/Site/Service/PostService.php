<?php
/**
 * Author: Fedor Avetisov <cousenavi@gmail.com>
 * Date: 5/26/13
 */

namespace Yasoon\Site\Service;

use JMS\DiExtraBundle\Annotation as DI;
use Yasoon\Site\Entity\AuthorEntity;
use Yasoon\Site\Entity\PostEntity;
use Yasoon\Site\Entity\PostOfTheDayEntity;
use Yasoon\Site\Entity\QuestionEntity;

/**
 * @DI\Service("yasoon.service.post")
 */
class PostService extends AbstractApiService {

    /**
     * @param array $model
     * @return array
     */
    public function add(array $model) {

        $authorId = 1; //@TODO получать из сесии

        $place = $this->em->createQueryBuilder()->select('max(post.place) as place')
            ->from('Yasoon\Site\Entity\PostEntity', 'post')->where("post.authorId = $authorId")->getQuery()->getSingleResult()['place'];

        /** @var $postEntity PostEntity */
        $postEntity = (new PostEntity())
            ->setCaption($model['caption'])
            ->setPreview($model['preview'])
            ->setText($model['text'])
            ->setPlace($place)
            ->setAuthorId($authorId)
            ->setCategoryId($model['categoryId'])
            ->setDate(new \DateTime())
            ->setLikes(0)
            ->setVisits(0);

        $postEntity->setAuthor($this->em->getReference('Yasoon\Site\Entity\AuthorEntity', $authorId));

        $this->em->persist($postEntity);
        $this->em->flush();

        $result = [
            'id'       => $postEntity->getId(),
            'caption'  => $postEntity->getCaption(),
            'preview'  => $postEntity->getPreview(),
            'text'     => $postEntity->getText(),
            'authorId' => $postEntity->getAuthorId(),
            'date'     => $postEntity->getDate()->format('Y-m-d H:i')
        ];

        return $result;

    }

    /**
     * @param array $model
     * @return array
     */
    public function update(array $model) {
        $post = $this->em->getRepository('Yasoon\Site\Entity\PostEntity')->find($model['id']);

        $post->setCaption($model['caption'])
            ->setPreview($model['preview'])
            ->setCategoryId($model['categoryId'])
            ->setText($model['text']);

        $this->em->merge($post);
        $this->em->flush();

        $result = [
            'id'         => $post->getId(),
            'caption'    => $post->getCaption(),
            'preview'    => $post->getPreview(),
            'text'       => $post->getText(),
            'authorId'   => $post->getAuthorId(),
            'date'       => $post->getDate()->format('Y-m-d H:i'),
            'categoryId' => $post->getCategoryId()
        ];

        return $result;

    }

    /**
     * @param array $model
     */
    public function delete(array $model) {
        $post = $this->em->getRepository('Yasoon\Site\Entity\PostEntity')->find($model['id']);

        $this->em->remove($post);
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
            'id'         => $post->getId(),
            'caption'    => $post->getCaption(),
            'authorId'   => $post->getAuthorId(),
            'preview'    => $post->getPreview(),
            'text'       => $post->getText(),
            'date'       => $post->getDate()->format('Y-m-d'),
            'categoryId' => $post->getCategoryId()
        ];

        return $result;
    }

    /**
     * @param $postId
     * @return array
     */
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


    /**
     * @param $offset
     * @param $limit
     *
     * @return array
     */
    public function getBestPosts($offset, $limit) {
        $result = [];

        /** @var PostEntity[] $posts */
        $posts  = $this->em->createQueryBuilder()
            ->select('post, author')
            ->from('Yasoon\Site\Entity\PostEntity', 'post')
            ->join('post.author', 'author')
            ->where('post.likes > 0')
            ->setMaxResults($limit)
            ->setFirstResult($offset)
            ->orderBy('post.likes', 'DESC')
            ->getQuery()->getResult();

        foreach ($posts as $post) {
            $result[] = [
                'authorName' => $post->getAuthor()->getName(),
                'caption'    => $post->getCaption(),
                'preview'    => $post->getPreview()
            ];
        }

        return $result;
    }

    /**
     * @return array
     */
    public function getStoryOfTheDay()
    {
//        , author.name as authorName, author.description as authorDescription
//                author.date as authorDate, post.caption  as postCaption, post.text as postText, post.likes as post,
//                count(questions.id)

        /** @var PostOfTheDayEntity $story */
        $story = $this->em->createQueryBuilder()
            ->select('story, author, post, questions')
            ->from('Yasoon\Site\Entity\PostOfTheDayEntity', 'story')
            ->join('story.post', 'post')
            ->join('post.author', 'author')
            ->leftJoin('author.questions', 'questions')
            ->orderBy('story.id', 'DESC')
            ->setMaxResults(1)
            ->getQuery()->getSingleResult();

        $result = [
          'authorId'   => $story->getPost()->getAuthor()->getId(),
          'authorName' => $story->getPost()->getAuthor()->getName(),
          'authorDescription' => $story->getPost()->getAuthor()->getDescription(),
          'authorDate' => $story->getPost()->getAuthor()->getPublicationDate()->format('d/m/Y'),
          'caption' => $story->getPost()->getCaption(),
          'text'    => $story->getPost()->getText(),
          'likes'   => $story->getPost()->getLikes(),
          'questions' => count($story->getPost()->getAuthor()->getQuestions())

        ];

        return $result;
    }

    /**
     * @param $postId
     * @return array
     */
    public function setStoryOfTheDay($postId)
    {

        $story = (new PostOfTheDayEntity())
            ->setPost($this->em->getReference('Yasoon\Site\Entity\PostEntity', $postId))
            ->setAssignedDatetime(new \DateTime());

        $this->em->persist($story);
        $this->em->flush();

        return ['ok' => 'ok'];
    }

    /**
     * @param $postId
     * @return array
     */
    public function like($postId)
    {
        return $this->addLikes($postId, 1);
    }

    /**
     * @param $postId
     * @param $likes
     * @return array
     */
    public function addLikes($postId, $likes)
    {
        /** @var PostEntity $post */
        $post = $this->em->getRepository('Yasoon\Site\Entity\PostEntity')->find($postId);
        $post->setLikes($post->getLikes() + $likes);

        $this->em->persist($post);
        $this->em->flush();

       return ['ok' => 'ok'];
    }

    /**
     * @return array
     */
    public function getAllLastWeek()
    {
        $dateTime = new \DateTime();
        $dateTime->modify('-7 day');

        /** @var PostEntity[] $posts */
        $posts = $this->em->createQueryBuilder()
            ->select('post')
            ->from('Yasoon\Site\Entity\PostEntity', 'post')
            ->where('post.date > '.$dateTime->format('Y-m-d'))
            ->getQuery()->getResult();

        $result = [];
        foreach ($posts as $post) {
            $result[] = [
                'id' => $post->getId(),
                'likes' => $post->getLikes(),
                'caption' => $post->getCaption(),
                'preview' => $post->getPreview(),
                'authorName' => $post->getAuthor()->getName(),
                'date' => $post->getDate()->format('d/m/Y')
            ];
        }

        return $result;

    }

}