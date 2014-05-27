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

