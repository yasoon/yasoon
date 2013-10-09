CREATE DATABASE  IF NOT EXISTS `yasoon` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `yasoon`;
-- MySQL dump 10.13  Distrib 5.5.32, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: yasoon
-- ------------------------------------------------------
-- Server version	5.5.32-0ubuntu0.12.10.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subscribed` tinyint(1) DEFAULT NULL,
  `description` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `job` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dream` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `interest` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publication_date` datetime DEFAULT NULL,
  `img` varchar(45) COLLATE utf8_unicode_ci DEFAULT 'avatar.jpg',
  `interview_caption` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `homepage` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `salt` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Битовая маска. 1 - читатель, 2 - писатель, 4- админ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'Автор Тестовый','test@test.com',0,'я тестовый чувак','тестер','продавец','фермер','2013-01-01 10:00:00','avatar','Как я  стал тестовым чуваком','',NULL,NULL,1),(2,'Второй Автор','test@test.com',0,'ещё один тестовый автор','дворник','дворник','дворник','2013-01-01 10:00:00','a1','Моё интервью с заголовком','',NULL,NULL,1),(4,'ФёдорАветисов','cousenavi@gmail.com',NULL,NULL,NULL,NULL,NULL,'2013-01-01 10:00:00','pig',NULL,'750f0025588d52b275327e25fec351a8',NULL,NULL,1),(5,'dsadasd','a@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'7815696ecbf1c96e6894b779456d330e',NULL,NULL,1),(6,'asdfsdf','asd@asqw.ru',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'e332a76c29654fcb7f6e6b31ced090c7',NULL,NULL,1),(7,'asdfasdf','asd@asd.qwe',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'912ec803b2ce49e4a541068d495ab570',NULL,NULL,1),(8,'asdfasdf','cds@asd.ru',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'912ec803b2ce49e4a541068d495ab570',NULL,NULL,1),(9,'asdfasdf','cd@asd.ru',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'912ec803b2ce49e4a541068d495ab570',NULL,NULL,1),(10,'asdfasdf','cdq@asd.ru',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'912ec803b2ce49e4a541068d495ab570',NULL,NULL,1),(11,'sdfasdf','asdf@aq.eq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'f0357a3f154bc2ffe2bff55055457068',NULL,NULL,1),(12,'hithere','_cousenavi@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'a358a0145bc744aebcf75bf07d124292',NULL,NULL,1),(13,'adsfadsf','qwe@asad.ru',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4c745565b4e32fb5fa5e3bc7aa57adc3',NULL,NULL,1),(14,'adsfadsf','qwe@asad.ruq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4c745565b4e32fb5fa5e3bc7aa57adc3',NULL,NULL,1),(15,'adsfadsf','qwe@asads.ru',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4c745565b4e32fb5fa5e3bc7aa57adc3',NULL,NULL,1),(16,'фф','a@as.ru',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'6d1bd1aa1f32499e4ec69dc8dce2cc5b',NULL,NULL,1),(17,'ФёдорТест','q@q.ru',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'62318aca2ef2e809a13623715a8aaff4',NULL,NULL,1),(18,'cfvxcvxcv','csd@sd.ru',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'d9729feb74992cc3482b350163a1a010',NULL,NULL,1),(19,'ФёдорТест','cousdf@test.ru',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'a358a0145bc744aebcf75bf07d124292',NULL,NULL,1),(20,'ca','t@asd.ru',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'76d80224611fc919a5d54f0ff9fba446',NULL,NULL,1),(21,'asdasdf','q@a.ru',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'d4b2758da0205c1e0aa9512cd188002a',NULL,NULL,1),(22,'tete','t@re.ey',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'3603da3f8296440daf21ff40e77a01e3',NULL,NULL,1),(23,'test','asd@asd.ru',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'a8f5f167f44f4964e6c998dee827110c',NULL,NULL,1),(24,'ываи','as@asd.ru',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9fd293304edcbcbec1ba4ed21a61fc39',NULL,NULL,1),(25,'Фёдор','123@asd.qw',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'24c6aa74f058c1ab7f1c9c656d35394b',NULL,NULL,1),(26,'asdf','as@a.qw',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'06ae4ade0a540aab8f2872901f5f4c8c',NULL,NULL,1),(27,'sadf','asd@as.er',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'7815696ecbf1c96e6894b779456d330e',NULL,NULL,1),(28,'dsf','dfg@as.ey',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'eff7d5dba32b4da32d9a67a519434d3f',NULL,NULL,1),(29,'asd','sd@asdqww.ru',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'37b940a05b4dc8a651c58e6f999d812b',NULL,NULL,1),(30,'kj','kjh@po.ru',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1772adca85f0c50f154e2e0d4aacaa40',NULL,NULL,1),(31,'asdf','asdf@asd.qw',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'912ec803b2ce49e4a541068d495ab570',NULL,NULL,1),(32,'выа','cas@asdq.qw',NULL,NULL,'asdf',NULL,NULL,NULL,NULL,NULL,'912ec803b2ce49e4a541068d495ab570','asd',NULL,1),(33,'dfs','dsf@asd.rt',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'822050d9ae3c47f54bee71b85fce1487',NULL,NULL,1),(34,'dsf','zas@as.ry',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'d9729feb74992cc3482b350163a1a010',NULL,NULL,1),(35,'sdfg','sdfg@as.ru',NULL,NULL,'asd',NULL,NULL,NULL,NULL,NULL,'05c12a287334386c94131ab8aa00d08a','ds',NULL,1),(36,'sa','as@aw.ry',NULL,NULL,'asd',NULL,NULL,'2013-08-28 12:52:37',NULL,NULL,'af7ffc2a629a1c258336fde8a1f71e0a','qw',NULL,1);
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blank_question`
--

DROP TABLE IF EXISTS `blank_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blank_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  `place` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blank_question`
--

LOCK TABLES `blank_question` WRITE;
/*!40000 ALTER TABLE `blank_question` DISABLE KEYS */;
INSERT INTO `blank_question` VALUES (97,'Чем вы занимаетесь?',1),(98,'Ещё вопрос',2);
/*!40000 ALTER TABLE `blank_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `id` int(11) NOT NULL,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` VALUES (0,'У нас лучшее место, чтобы читать истории и делиться вдохновением','Надпись на главной'),(1,'Что такое Ясун?  ','Заголовок страницы О нас'),(2,'Много интересного','Содержимое страницы О нас'),(3,'Узнать больше','Кнопка на главной'),(4,'mailbox@yasoon.ru','Email на странице О нас'),(5,'Не туда попали','Надпись на странице 404'),(6,'Здравствуйте, %name%! Вы зарегистрировались на сайте \\\"Ясун\\\".Ваш логин:  %email% Ваш пароль: %password%','Письмо о регистрации'),(7,'Здравствуйте, %name%! Вы просили прислать вам пароль от сайта \\\"Ясун\\\". Пароли у нас хранятся настолько надёжно, что мы сами не можем их расшифровать. Так что мы придумали вам новый : %newpass% Вы сможете поменять его на привычный в настройках аккаунта.','Письмо с напоминанием пароля'),(8,'Создайте свой профиль и напишите истории','Надпись под заголовком \\\"регистрация\\\"'),(9,'Теперь расскажите чуть больше о себе','Надпись под заголовком всё прошло успешно'),(10,'Все ваши деньги теперь принадлежат нам.','Текст пользовательского соглашения');
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friends`
--

DROP TABLE IF EXISTS `friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reader_id` int(11) NOT NULL COMMENT 'Id того, кто подписывается',
  `writer_id` int(11) NOT NULL COMMENT 'Id того, на кого подписан reader',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`reader_id`,`writer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friends`
--

LOCK TABLES `friends` WRITE;
/*!40000 ALTER TABLE `friends` DISABLE KEYS */;
INSERT INTO `friends` VALUES (1,1,0);
/*!40000 ALTER TABLE `friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `category_id` smallint(6) NOT NULL,
  `preview` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `caption` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `place` smallint(6) NOT NULL,
  `likes` int(11) NOT NULL DEFAULT '0',
  `visits` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IDX_5A8A6C8DF675F31B` (`author_id`),
  CONSTRAINT `FK_5A8A6C8DF675F31B` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (13,1,1,'я на госслужбе','test','2013-05-30 16:14:10','test1234',0,25,0),(14,1,5,'я добываю ископаемые','gfd','2013-06-17 15:03:14','sdfg',0,12,0),(15,1,3,'я в интернете','Test me please','2013-06-17 15:06:55','Test post',0,14,0),(16,2,1,'госслужба','Текст про госслужбу. Пишет второй автор. Вот так-то','2013-06-17 16:06:55','Моя служба государству',0,5,0),(17,1,10,'Я люблю пёсиков и, особенно, щеночков','Я люблю пёсиков и, особенно, щеночков','2013-07-26 11:29:56','Щеночки',0,0,0);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `caption` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `is_in_blank` tinyint(1) NOT NULL,
  `answer` text COLLATE utf8_unicode_ci,
  `place` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B6F7494EF675F31B` (`author_id`),
  CONSTRAINT `FK_B6F7494EF675F31B` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (5,1,'Как стать таким же классным?','2013-06-16 22:34:11',0,'Хрен знает.','0'),(11,1,'Ты научился ловить новые вопросы?','2013-06-16 22:48:58',0,'Да, я же классный',NULL),(12,1,'А почему счётчик постов считает ответы?','2013-06-16 22:50:20',0,'Пофиксил','0'),(15,1,'Чем вы занимаетесь?','2013-06-16 23:10:25',1,'Я прыгун в длину.','1'),(17,1,'В чём суть вашей работы?','2013-06-17 18:25:03',1,'Я прыгаю','5'),(18,1,'Чего вы добились?','2013-06-17 18:25:03',1,'Ничего. Я бездарность.','4'),(20,1,'Чому я дурак?','2013-06-18 08:54:09',1,'Сала мало ел','2'),(21,1,'Вопрос автору','2013-07-26 09:17:21',0,'Даю ответ','1'),(23,1,'Свой вопрос','2013-07-26 15:29:18',1,'Это мой вопрос, так классно!','3'),(26,1,'Вопрос с подвохом','2013-07-26 15:39:05',1,'Изящный ответ','6'),(27,9,'','2013-08-15 00:00:00',1,NULL,'1'),(28,9,'','2013-08-15 00:00:00',1,NULL,'2'),(29,9,'','2013-08-15 00:00:00',1,NULL,'3'),(30,9,'','2013-08-15 00:00:00',1,NULL,'4'),(31,9,'Чем вы занимаетесь?','2013-08-15 00:00:00',1,NULL,'1'),(32,9,'First question ','2013-08-15 00:00:00',1,NULL,'2'),(33,10,'','2013-08-15 00:00:00',1,NULL,'1'),(34,10,'','2013-08-15 00:00:00',1,NULL,'2'),(35,10,'','2013-08-15 00:00:00',1,NULL,'3'),(36,10,'','2013-08-15 00:00:00',1,NULL,'4'),(37,10,'Чем вы занимаетесь?','2013-08-15 00:00:00',1,NULL,'1'),(38,10,'First question ','2013-08-15 00:00:00',1,NULL,'2'),(39,11,'','2013-08-15 00:00:00',1,NULL,'1'),(40,11,'','2013-08-15 00:00:00',1,NULL,'2'),(41,11,'','2013-08-15 00:00:00',1,NULL,'3'),(42,11,'','2013-08-15 00:00:00',1,NULL,'4'),(43,11,'Чем вы занимаетесь?','2013-08-15 00:00:00',1,NULL,'1'),(44,11,'First question ','2013-08-15 00:00:00',1,NULL,'2'),(45,12,'Чем вы занимаетесь?','2013-08-15 00:00:00',1,NULL,'1'),(46,12,'Ещё вопрос','2013-08-15 00:00:00',1,NULL,'2'),(47,13,'Чем вы занимаетесь?','2013-08-15 00:00:00',1,NULL,'1'),(48,13,'Ещё вопрос','2013-08-15 00:00:00',1,NULL,'2'),(49,14,'Чем вы занимаетесь?','2013-08-15 00:00:00',1,NULL,'1'),(50,14,'Ещё вопрос','2013-08-15 00:00:00',1,NULL,'2'),(51,15,'Чем вы занимаетесь?','2013-08-15 00:00:00',1,NULL,'1'),(52,15,'Ещё вопрос','2013-08-15 00:00:00',1,NULL,'2'),(53,16,'Чем вы занимаетесь?','2013-08-15 00:00:00',1,NULL,'1'),(54,16,'Ещё вопрос','2013-08-15 00:00:00',1,NULL,'2'),(55,17,'Чем вы занимаетесь?','2013-08-15 00:00:00',1,NULL,'1'),(56,17,'Ещё вопрос','2013-08-15 00:00:00',1,NULL,'2'),(57,18,'Чем вы занимаетесь?','2013-08-15 00:00:00',1,NULL,'1'),(58,18,'Ещё вопрос','2013-08-15 00:00:00',1,NULL,'2'),(59,19,'Чем вы занимаетесь?','2013-08-15 00:00:00',1,NULL,'1'),(60,19,'Ещё вопрос','2013-08-15 00:00:00',1,NULL,'2'),(61,20,'Чем вы занимаетесь?','2013-08-22 00:00:00',1,NULL,'1'),(62,20,'Ещё вопрос','2013-08-22 00:00:00',1,NULL,'2'),(63,21,'Чем вы занимаетесь?','2013-08-22 00:00:00',1,NULL,'1'),(64,21,'Ещё вопрос','2013-08-22 00:00:00',1,NULL,'2'),(65,22,'Чем вы занимаетесь?','2013-08-22 00:00:00',1,NULL,'1'),(66,22,'Ещё вопрос','2013-08-22 00:00:00',1,NULL,'2'),(67,23,'Чем вы занимаетесь?','2013-08-28 00:00:00',1,NULL,'1'),(68,23,'Ещё вопрос','2013-08-28 00:00:00',1,NULL,'2'),(69,24,'Чем вы занимаетесь?','2013-08-28 00:00:00',1,NULL,'1'),(70,24,'Ещё вопрос','2013-08-28 00:00:00',1,NULL,'2'),(71,25,'Чем вы занимаетесь?','2013-08-28 00:00:00',1,NULL,'1'),(72,25,'Ещё вопрос','2013-08-28 00:00:00',1,NULL,'2'),(73,26,'Чем вы занимаетесь?','2013-08-28 00:00:00',1,NULL,'1'),(74,26,'Ещё вопрос','2013-08-28 00:00:00',1,NULL,'2'),(75,27,'Чем вы занимаетесь?','2013-08-28 00:00:00',1,NULL,'1'),(76,27,'Ещё вопрос','2013-08-28 00:00:00',1,NULL,'2'),(77,28,'Чем вы занимаетесь?','2013-08-28 00:00:00',1,NULL,'1'),(78,28,'Ещё вопрос','2013-08-28 00:00:00',1,NULL,'2'),(79,29,'Чем вы занимаетесь?','2013-08-28 00:00:00',1,NULL,'1'),(80,29,'Ещё вопрос','2013-08-28 00:00:00',1,NULL,'2'),(81,30,'Чем вы занимаетесь?','2013-08-28 00:00:00',1,NULL,'1'),(82,30,'Ещё вопрос','2013-08-28 00:00:00',1,NULL,'2'),(83,31,'Чем вы занимаетесь?','2013-08-28 00:00:00',1,NULL,'1'),(84,31,'Ещё вопрос','2013-08-28 00:00:00',1,NULL,'2'),(85,32,'Чем вы занимаетесь?','2013-08-28 00:00:00',1,NULL,'1'),(86,32,'Ещё вопрос','2013-08-28 00:00:00',1,NULL,'2'),(87,33,'Чем вы занимаетесь?','2013-08-28 00:00:00',1,NULL,'1'),(88,33,'Ещё вопрос','2013-08-28 00:00:00',1,NULL,'2'),(89,34,'Чем вы занимаетесь?','2013-08-28 00:00:00',1,NULL,'1'),(90,34,'Ещё вопрос','2013-08-28 00:00:00',1,NULL,'2'),(91,35,'Чем вы занимаетесь?','2013-08-28 00:00:00',1,NULL,'1'),(92,35,'Ещё вопрос','2013-08-28 00:00:00',1,NULL,'2'),(93,36,'Чем вы занимаетесь?','2013-08-28 00:00:00',1,NULL,'1'),(94,36,'Ещё вопрос','2013-08-28 00:00:00',1,NULL,'2');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `story_of_the_day`
--

DROP TABLE IF EXISTS `story_of_the_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `story_of_the_day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `assigned` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `story_of_the_day`
--

LOCK TABLES `story_of_the_day` WRITE;
/*!40000 ALTER TABLE `story_of_the_day` DISABLE KEYS */;
INSERT INTO `story_of_the_day` VALUES (1,13,'2013-07-17 12:41:44'),(2,15,'2013-07-17 18:06:46'),(3,16,'2013-07-17 18:45:51'),(4,13,'2013-07-17 18:53:57'),(5,16,'2013-08-15 19:20:10');
/*!40000 ALTER TABLE `story_of_the_day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timeline`
--

DROP TABLE IF EXISTS `timeline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timeline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) NOT NULL,
  `entry_type` int(11) NOT NULL COMMENT '1 - пост, 2 - вопрос 3- вопрос из интервью',
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Таблица для вывода постов, ответов и интервью, отсортированн';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timeline`
--

LOCK TABLES `timeline` WRITE;
/*!40000 ALTER TABLE `timeline` DISABLE KEYS */;
/*!40000 ALTER TABLE `timeline` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-10-09  9:05:48
