<?php

namespace Proxies\__CG__\Yasoon\Site\Entity;

/**
 * THIS CLASS WAS GENERATED BY THE DOCTRINE ORM. DO NOT EDIT THIS FILE.
 */
class PostEntity extends \Yasoon\Site\Entity\PostEntity implements \Doctrine\ORM\Proxy\Proxy
{
    private $_entityPersister;
    private $_identifier;
    public $__isInitialized__ = false;
    public function __construct($entityPersister, $identifier)
    {
        $this->_entityPersister = $entityPersister;
        $this->_identifier = $identifier;
    }
    /** @private */
    public function __load()
    {
        if (!$this->__isInitialized__ && $this->_entityPersister) {
            $this->__isInitialized__ = true;

            if (method_exists($this, "__wakeup")) {
                // call this after __isInitialized__to avoid infinite recursion
                // but before loading to emulate what ClassMetadata::newInstance()
                // provides.
                $this->__wakeup();
            }

            if ($this->_entityPersister->load($this->_identifier, $this) === null) {
                throw new \Doctrine\ORM\EntityNotFoundException();
            }
            unset($this->_entityPersister, $this->_identifier);
        }
    }

    /** @private */
    public function __isInitialized()
    {
        return $this->__isInitialized__;
    }

    
    public function setAuthor($author)
    {
        $this->__load();
        return parent::setAuthor($author);
    }

    public function getAuthor()
    {
        $this->__load();
        return parent::getAuthor();
    }

    public function setCategory($category)
    {
        $this->__load();
        return parent::setCategory($category);
    }

    public function getCategory()
    {
        $this->__load();
        return parent::getCategory();
    }

    public function setAnswer($answer)
    {
        $this->__load();
        return parent::setAnswer($answer);
    }

    public function getAnswer()
    {
        $this->__load();
        return parent::getAnswer();
    }

    public function setAuthorId($authorId)
    {
        $this->__load();
        return parent::setAuthorId($authorId);
    }

    public function getAuthorId()
    {
        $this->__load();
        return parent::getAuthorId();
    }

    public function setDate($date)
    {
        $this->__load();
        return parent::setDate($date);
    }

    public function getDate()
    {
        $this->__load();
        return parent::getDate();
    }

    public function setId($id)
    {
        $this->__load();
        return parent::setId($id);
    }

    public function getId()
    {
        if ($this->__isInitialized__ === false) {
            return (int) $this->_identifier["id"];
        }
        $this->__load();
        return parent::getId();
    }

    public function setPreview($preview)
    {
        $this->__load();
        return parent::setPreview($preview);
    }

    public function getPreview()
    {
        $this->__load();
        return parent::getPreview();
    }

    public function setText($text)
    {
        $this->__load();
        return parent::setText($text);
    }

    public function getText()
    {
        $this->__load();
        return parent::getText();
    }

    public function setCaption($caption)
    {
        $this->__load();
        return parent::setCaption($caption);
    }

    public function getCaption()
    {
        $this->__load();
        return parent::getCaption();
    }

    public function setPlace($place)
    {
        $this->__load();
        return parent::setPlace($place);
    }

    public function getPlace()
    {
        $this->__load();
        return parent::getPlace();
    }

    public function setCategoryId($categoryId)
    {
        $this->__load();
        return parent::setCategoryId($categoryId);
    }

    public function getCategoryId()
    {
        $this->__load();
        return parent::getCategoryId();
    }

    public function setLikes($likes)
    {
        $this->__load();
        return parent::setLikes($likes);
    }

    public function getLikes()
    {
        $this->__load();
        return parent::getLikes();
    }

    public function setVisits($visits)
    {
        $this->__load();
        return parent::setVisits($visits);
    }

    public function getVisits()
    {
        $this->__load();
        return parent::getVisits();
    }


    public function __sleep()
    {
        return array('__isInitialized__', 'id', 'preview', 'text', 'authorId', 'date', 'caption', 'place', 'likes', 'visits', 'author', 'category', 'answer');
    }

    public function __clone()
    {
        if (!$this->__isInitialized__ && $this->_entityPersister) {
            $this->__isInitialized__ = true;
            $class = $this->_entityPersister->getClassMetadata();
            $original = $this->_entityPersister->load($this->_identifier);
            if ($original === null) {
                throw new \Doctrine\ORM\EntityNotFoundException();
            }
            foreach ($class->reflFields as $field => $reflProperty) {
                $reflProperty->setValue($this, $reflProperty->getValue($original));
            }
            unset($this->_entityPersister, $this->_identifier);
        }
        
    }
}