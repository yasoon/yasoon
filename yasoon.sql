CREATE DATABASE  IF NOT EXISTS `yasoon` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `yasoon`;
-- MySQL dump 10.13  Distrib 5.5.38, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: yasoon
-- ------------------------------------------------------
-- Server version	5.5.38-0ubuntu0.12.04.1

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
-- Table structure for table `answer_timeline`
--

DROP TABLE IF EXISTS `answer_timeline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer_timeline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) DEFAULT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer_timeline`
--

LOCK TABLES `answer_timeline` WRITE;
/*!40000 ALTER TABLE `answer_timeline` DISABLE KEYS */;
/*!40000 ALTER TABLE `answer_timeline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci DEFAULT '''''',
  `subscribed` tinyint(1) DEFAULT '0',
  `description` varchar(200) COLLATE utf8_unicode_ci DEFAULT '''''',
  `job` varchar(45) COLLATE utf8_unicode_ci DEFAULT '''''',
  `dream` varchar(45) COLLATE utf8_unicode_ci DEFAULT '''''',
  `interest` varchar(45) COLLATE utf8_unicode_ci DEFAULT '''''',
  `publication_date` datetime DEFAULT NULL,
  `img` varchar(45) COLLATE utf8_unicode_ci DEFAULT 'noAvatar.jpg',
  `interview_caption` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `homepage` varchar(45) COLLATE utf8_unicode_ci DEFAULT '''''',
  `salt` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Битовая маска. 1 - читатель, 2 - писатель, 4- админ',
  `newpass` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vkontakte_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reg_from` tinyint(1) DEFAULT NULL COMMENT '0 - email 1 - facebook 2 - vkontakte',
  `date_change` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (192,'admin','serpantin@inbox.ru',0,NULL,NULL,NULL,NULL,'2014-07-25 16:14:58',NULL,NULL,'e64067c3d016f2437a8a2351b2e19be2',NULL,NULL,4,NULL,NULL,NULL,0,'2014-07-25 16:14:58');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_changed_pass`
--

DROP TABLE IF EXISTS `author_changed_pass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author_changed_pass` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `last_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_changed_pass`
--

LOCK TABLES `author_changed_pass` WRITE;
/*!40000 ALTER TABLE `author_changed_pass` DISABLE KEYS */;
/*!40000 ALTER TABLE `author_changed_pass` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blank_question`
--

LOCK TABLES `blank_question` WRITE;
/*!40000 ALTER TABLE `blank_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `blank_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Безопасность','Все о безопасности'),(2,'Дизайн','Тут творчиства не занимать'),(3,'Добыча полезных ископаемых','Для тех кто любит нефть'),(4,'Интернет','нтернет он и в Африке интернет'),(5,'Искусство','Любителям искуства'),(6,'Медиа','Все начиная от фильмов и заканчивая дудками'),(7,'Музыка','Для людей с музыкальным слухом'),(8,'Наука','Ученым'),(9,'Образование','Всем кому интиресно обучение'),(10,'Право','Что бы знать хоть парочку законов'),(11,'Природа и животные','Любителям всего живого'),(12,'Программирование','Ну это святое, как не крути'),(13,'Производство','Специально для самоделкиных'),(14,'Психология и тренинги','Для тех кто любит отдыхать'),(16,'Развлечения и туризм','Для тех кто идет в ногу со временем'),(17,'Строительство и недвижимость','Про всякие машинки и телефончики'),(18,'Технологии','Все услуги которые вообще можно представить'),(19,'Транспорт и связь','Деньги, они всем нужны'),(20,'Услуги','Для тех кто любит создавать красоту из подручных предметов'),(21,'Финансы','Финансы'),(23,'Hand-made','Hand-made');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `tagId` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` VALUES (1,'<p><span style=\"color: #ffffff;\">Источник профессионального вдохновения на каждый день. <br></span></p><p><span style=\"color: #ffffff;\"><br></span></p><p><span style=\"color: #ffffff;\">Ныне это очень трудно</span><br></p>','Надпись на главной',''),(2,'<p>О нас</p>','Заголовок страницы О нас',NULL),(3,'<p><img src=\"http://i.cheltcom.ru/u/70/0247506a5611e3bf9ea8fbbcc6a54c/-/cheltcom_ru_about_us.png\"><br></p>','Содержимое страницы О нас',NULL),(4,'Узнать больше','Кнопка на главной',''),(5,'<p>mail</p>','Email на странице О нас',NULL),(6,'Здравствуйте, %name%! Вы зарегистрировались на сайте \\\"Ясун\\\".Ваш логин:  %email% Ваш пароль: %password%','Письмо о регистрации',NULL),(7,'Логин: %email%\r\nПароль: %newpass%.\r\nДля завершения восстановления пароля пройдите по ссылке: %link%','Письмо с напоминанием пароля',NULL),(8,'Создайте свой профиль и напишите истории','Надпись под заголовком \\\"регистрация\\\"',NULL),(9,'Расскажите чуть больше о себе','Надпись под заголовком всё прошло успешно',NULL),(10,'Все ваши деньги теперь принадлежат нам.','Текст пользовательского соглашения',NULL),(12,'http://google.ru','Ссылка партнера',NULL),(13,'/img/i6.jpg','Ссылка на картинку на главной',NULL),(14,'Истории людей, которые любят то, что делают','Текст под названием отрасли на странице людей и профессий',''),(15,'Редактирование личных данных','Текст на странице редактирования профиля под заголовком',NULL),(16,'Напишите свою историю','Заголовок на странице \"Напишите свою историю\"',NULL),(18,'/upload/avatar/noAvatar.jpg','Аватар пользователя по умолчанию',NULL),(19,'Больше историй','Название кнопки \"Больше историй\"',NULL),(20,'Регистрация','Заголовок страницы регистрации',NULL),(21,'Добро пожаловать','Заголовок второй страницы регистрации',NULL),(22,'Имя, под которым будет опубликована Ваша история','Подсказка в поле ввода \"Имя\"',NULL),(23,'Email','Подсказка в поле ввода \"Email\"',NULL),(24,'Подписаться на обновления','Флажок подписаться на обновления',NULL),(25,'Пароль','Подсказка в поле ввода \"Пароль\"',NULL),(26,'Регистрация','Кнопка регистрация',NULL),(27,'Ваша профессия или деятельность','поле ввода \"Ваша профессия\"',NULL),(28,'Профессия, о которой Вы мечтали в детстве','поле ввода ',NULL),(29,'Профессия, которая Вас восхищает','поле ввода \"Профессия, которая Вас восхищает\"','test'),(30,'Самое место рассказать о себе','поле ввода \"Расскажите о себе\"',NULL),(31,'Личная страница','Поле ввода \"Личная страница\"',NULL),(32,'Загрузить Изображение','Кнопка \"Загрузить изображение\"',NULL),(33,'Завершить регистрацию','Кнопка \"Завершить регистрацию\"',NULL),(34,'Пусто','Заголовок пустой отрасли',NULL),(35,'К сожалению, на эту тему ещё нет историй','Текст пустой отрасли',NULL),(36,'Стать автором','Кнопка \"Стать автором\"',NULL),(37,'Напишите свою','Кнопка \"Напишите свою\"',NULL),(38,'Заголовок истории','Подсказка \"Заголовок истории\" на странице написания поста',NULL),(39,'Выберите нужные отрасли','Название выпадающего списка категорий',NULL),(40,'Краткое описание истории','Подсказка в поле \"Краткое описание истории\"',NULL),(41,'Предупреждение','Заголовок сообщения при удалении истории',NULL),(42,'История будет удалена безвозвратно, удалить историю ?','Текст сообщения при удалении истории',NULL),(43,'Редактирование личной информации','Заголовок страницы редактирование личной информации пользователя',NULL),(44,'Сохранить правки','Кнопка \"Сохранить правки\" на странице профиля',NULL),(45,'Написать новую историю','Кнопка \"Написать новую историю\" на странице профиля',NULL),(46,'Сейчас впишите текст вопроса','Текст-подсказка  в поле ввода вопроса юзеру (сейчас \"впишите текст вопроса\")',NULL),(47,'Пользователь не ответил ни на один вопрос.','текст, который виден на странице \"ответы\" для всех, КРОМЕ хозяина страницы,  в том случае если юзеру не задан ни один вопрос',NULL),(48,'К сожалению, другие люди пока не могут расспросить Вас о Вашем деле. Чтобы начать получать вопросы, напишите хотя бы одну историю.','текст, который виден на странице \"ответы\" для хозяина страницы,  в том случае если юзер не написал ни одной истории.',NULL),(49,'Больше вопросов','Кнопка \"Больше вопросов\"',NULL),(50,'К сожалению, Вам еще не задали ни одного вопроса.','текст, который виден на странице \"ответы\" для хозяина страницы, в том случае если у юзера уже есть истории',NULL),(51,'Пользователи могут вдохновиться историей только раз в сутки!','Текст сообщения о том, что лайк можно ставить раз в сутки',NULL),(52,'Вы уже вдохновлялись данной историей!','Текст сообщения о том, что пользователь уже ставил лайк данной истории',NULL),(53,'Ничего не рассказал(а) о себе.','Текст, который отображается под именем юзера, который ничего не рассказал о себе. (если поле ',NULL),(54,'Профессии','Шапка. заголовок \"Профессии\".',NULL),(55,'Люди','Шапка. заголовок \"Люди\".',NULL),(56,'У вас нет новостей.','Текст в пустой ленте новостей-если юзер еще ни на кого не подписан, или нет новостей',NULL),(57,'Спасибо! Ваша вопрос отправлен пользователю. Когда он ответит на него, Вы узнаете об этом в своей ленте обновлений.','Текст, который появляется перед юзером, когда тот задал вопрос',NULL),(58,'Задать вопрос','Кнопка \"Задать вопрос\"',NULL),(59,'Начни печатать','Подсказка в строке поиска',NULL),(60,'Ошибка 404 - страница не  найдена','Страница 404',NULL),(61,'','Аватар Дайджест',NULL),(62,'<p>Дайджест Ясун<br></p>','Текст заголовка Дайджест',NULL),(63,'','Текст подзаголовка Дайджест',NULL),(64,'<p>vk.com/id35</p>','Ясун в Вконтакте',''),(65,'<p>facebook.com/35</p>','Ясун в Facebook','');
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_old`
--

DROP TABLE IF EXISTS `content_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_old` (
  `id` int(11) NOT NULL,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_old`
--

LOCK TABLES `content_old` WRITE;
/*!40000 ALTER TABLE `content_old` DISABLE KEYS */;
INSERT INTO `content_old` VALUES (0,'У нас лучшее место, чтобы читать истории и делиться вдохновением','Надпись на главной'),(1,'Что такое Ясун?  ','Заголовок страницы О нас'),(2,'Много интересного','Содержимое страницы О нас'),(3,'Узнать больше','Кнопка на главной'),(4,'mailbox@yasoon.ru','Email на странице О нас'),(5,'Не туда попали','Надпись на странице 404'),(6,'Здравствуйте, %name%! Вы зарегистрировались на сайте \\\"Ясун\\\".Ваш логин:  %email% Ваш пароль: %password%','Письмо о регистрации'),(7,'Логин: %email%\nПароль: %newpass%.\nДля завершения восстановления пароля пройдите по ссылке: %link%','Письмо с напоминанием пароля'),(8,'Создайте свой профиль и напишите истории','Надпись под заголовком \\\"регистрация\\\"'),(9,'Теперь расскажите чуть больше о себе','Надпись под заголовком всё прошло успешно'),(10,'Все ваши деньги теперь принадлежат нам.','Текст пользовательского соглашения');
/*!40000 ALTER TABLE `content_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_tags`
--

DROP TABLE IF EXISTS `content_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_tags`
--

LOCK TABLES `content_tags` WRITE;
/*!40000 ALTER TABLE `content_tags` DISABLE KEYS */;
INSERT INTO `content_tags` VALUES (1,'name','value');
/*!40000 ALTER TABLE `content_tags` ENABLE KEYS */;
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
  `date_write` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`reader_id`,`writer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friends`
--

LOCK TABLES `friends` WRITE;
/*!40000 ALTER TABLE `friends` DISABLE KEYS */;
/*!40000 ALTER TABLE `friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interview`
--

DROP TABLE IF EXISTS `interview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interview` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interview`
--

LOCK TABLES `interview` WRITE;
/*!40000 ALTER TABLE `interview` DISABLE KEYS */;
/*!40000 ALTER TABLE `interview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interview_question`
--

DROP TABLE IF EXISTS `interview_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interview_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interview_id` int(11) NOT NULL,
  `text` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interview_question`
--

LOCK TABLES `interview_question` WRITE;
/*!40000 ALTER TABLE `interview_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `interview_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partners`
--

DROP TABLE IF EXISTS `partners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partnerBgImg` varchar(255) NOT NULL,
  `parnterText` varchar(255) NOT NULL,
  `parnterLink` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partners`
--

LOCK TABLES `partners` WRITE;
/*!40000 ALTER TABLE `partners` DISABLE KEYS */;
/*!40000 ALTER TABLE `partners` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_answer`
--

DROP TABLE IF EXISTS `post_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_answer`
--

LOCK TABLES `post_answer` WRITE;
/*!40000 ALTER TABLE `post_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_category`
--

DROP TABLE IF EXISTS `post_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=266 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_category`
--

LOCK TABLES `post_category` WRITE;
/*!40000 ALTER TABLE `post_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_likes`
--

DROP TABLE IF EXISTS `post_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `user_ip` varchar(20) NOT NULL,
  `last_date` datetime NOT NULL,
  `count_likes` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_likes`
--

LOCK TABLES `post_likes` WRITE;
/*!40000 ALTER TABLE `post_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_timeline`
--

DROP TABLE IF EXISTS `posts_timeline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts_timeline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_timeline`
--

LOCK TABLES `posts_timeline` WRITE;
/*!40000 ALTER TABLE `posts_timeline` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts_timeline` ENABLE KEYS */;
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
  `ask_authorId` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  `answer` text COLLATE utf8_unicode_ci,
  `notified` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IDX_B6F7494EF675F31B` (`author_id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `FK_B6F7494EF675F31B` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=257 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `story_of_the_day`
--

LOCK TABLES `story_of_the_day` WRITE;
/*!40000 ALTER TABLE `story_of_the_day` DISABLE KEYS */;
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
  `author_id` int(11) NOT NULL,
  `posts_count` int(11) NOT NULL,
  `answers_count` int(11) NOT NULL,
  `questions_count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
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

-- Dump completed on 2014-07-25 15:25:13
