DROP TABLE IF EXISTS `answer_timeline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer_timeline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) DEFAULT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
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
  `role` smallint(6) NOT NULL DEFAULT '1' COMMENT ' . 1 - , 2 - , 4- ',
  `newpass` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vkontakte_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reg_from` tinyint(1) DEFAULT NULL COMMENT '0 - email 1 - facebook 2 - vkontakte',
  `date_change` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (39,'username','test@test.ru',0,NULL,NULL,NULL,NULL,'2014-02-03 05:46:24',NULL,NULL,'098f6bcd4621d373cade4e832627b4f6',NULL,NULL,1,NULL,NULL,NULL,0,NULL),(40,'username2','test22@test.ru',0,'test22@test.ru','yyy','','','2014-02-03 05:55:56',NULL,'','d41d8cd98f00b204e9800998ecf8427e','',NULL,1,NULL,NULL,NULL,0,NULL),(41,'username22','test222@test.ru',0,NULL,NULL,NULL,NULL,'2014-02-03 05:57:41',NULL,'ydjfjhg','098f6bcd4621d373cade4e832627b4f6',NULL,NULL,1,NULL,NULL,NULL,0,NULL),(42,'kotays','kotays12@gmail.com',0,NULL,NULL,NULL,NULL,'2014-02-04 04:10:41',NULL,NULL,'d41d8cd98f00b204e9800998ecf8427e',NULL,NULL,4,NULL,NULL,NULL,0,NULL),(43,'kota','kota12@bk.ru',0,NULL,NULL,NULL,NULL,'2014-02-04 07:40:39',NULL,NULL,'d41d8cd98f00b204e9800998ecf8427e',NULL,NULL,1,NULL,NULL,NULL,0,NULL),(44,'kooott','kotaq1@bk.ru',1,'kotaq1@bk.ru',NULL,NULL,NULL,'2014-02-04 07:41:46',NULL,NULL,'d41d8cd98f00b204e9800998ecf8427e','',NULL,1,NULL,NULL,NULL,0,NULL),(45,'kota12','kota123@bk.ru',1,'kota123@bk.ru','prof','rrr','rrr','2014-02-04 09:25:38',NULL,'rrrr','d41d8cd98f00b204e9800998ecf8427e','',NULL,1,NULL,NULL,NULL,0,NULL),(49,'dsfgdg','parandiy.mihail@gmail.com',0,NULL,NULL,NULL,NULL,'2014-02-06 11:24:17',NULL,NULL,'999c3fdf76ce33797d31b79dd486aca0',NULL,NULL,1,NULL,NULL,NULL,0,NULL),(50,'kotays12','kot12@bk.ru',1,'kot12@bk.ru','aaa','','','2014-02-06 11:29:36',NULL,'','d41d8cd98f00b204e9800998ecf8427e','',NULL,1,NULL,NULL,NULL,0,NULL),(51,'tester','t1@t.ru',1,'t1@t.ru','test','','','2014-02-06 11:30:52',NULL,'','d41d8cd98f00b204e9800998ecf8427e','',NULL,1,NULL,NULL,NULL,0,NULL),(52,'t3','t3@t.ru',1,'t3@t.ru','t3','','','2014-02-06 11:38:23',NULL,'','d41d8cd98f00b204e9800998ecf8427e','',NULL,1,NULL,NULL,NULL,0,NULL),(53,'test3','test3@test.ru',1,'test3@test.ru','test3','','','2014-02-06 11:40:11',NULL,'','098f6bcd4621d373cade4e832627b4f6','',NULL,1,NULL,NULL,NULL,0,NULL),(54,'Bloom Berg','balabol@gmail.com',1,'balabol@gmail.com','','','','2014-02-06 15:16:25',NULL,'','76419c58730d9f35de7ac538c2fd6737','',NULL,1,NULL,NULL,NULL,0,NULL),(55,'kota','k1@mail.ru',1,'k1@mail.ru','aaaa','ddd','qqqq','2014-02-06 17:18:29',NULL,'eeee','202cb962ac59075b964b07152d234b70','',NULL,1,NULL,NULL,NULL,0,NULL),(56,'fox','fox@test.ru',0,'fox','FireFox','Browser','','2014-02-17 16:56:09','c0e9cf974aa8ea5e08f3f55d24a2a33c.jpg','I\'m firefox','2b95d1f09b8b66c5c43622a4d9ec9a04','',NULL,4,NULL,NULL,NULL,0,'2014-02-28 18:40:28'),(59,'wee','ee@mail.ru',0,NULL,NULL,NULL,NULL,'2014-02-06 21:00:09',NULL,NULL,'099b3b060154898840f0ebdfb46ec78f',NULL,NULL,1,NULL,NULL,NULL,0,NULL),(60,'Korol Lev','leva@leva.ru',1,'leva@leva.ru','','','','2014-02-07 03:51:19',NULL,'','76419c58730d9f35de7ac538c2fd6737','',NULL,1,NULL,NULL,NULL,0,NULL),(61,'torororor','qwweertt@inbop.com',1,'qwweertt@inbop.com','','','  ','2014-02-07 04:03:33',NULL,'    ','76419c58730d9f35de7ac538c2fd6737','',NULL,1,NULL,NULL,NULL,0,NULL),(62,'Kotays','k1@k.ru',0,'k1@k.ru','',' ',' ','2014-02-07 04:33:26',NULL,' ','202cb962ac59075b964b07152d234b70','',NULL,1,NULL,NULL,NULL,0,NULL),(63,'chrome','indigo@mail.ru',0,'chromes','','','','2014-02-25 10:30:53','b0b67506d7f867cbd2879bf2dd4fae12.jpg','   .','554838a8451ac36cb977e719e9d6623c','http://vk.com/id9191',NULL,4,NULL,NULL,NULL,0,NULL),(64,'Ferion Lapland','wsx@omni.ru',0,'wsx@omni.ru','eee','xxxxx','','2014-02-07 09:42:35',NULL,'','76419c58730d9f35de7ac538c2fd6737','',NULL,1,NULL,NULL,NULL,0,NULL),(65,'test_user','test_user@test.ru',0,'test_user@test.ru','P','P2','P3','2014-02-07 09:54:02',NULL,'About me','098f6bcd4621d373cade4e832627b4f6','vk.com/id1234',NULL,1,NULL,NULL,NULL,0,NULL),(66,'kotaa','k5@k5.ru',0,'k5@k5.ru','a4','a','a','2014-02-10 08:49:44',NULL,'a','098f6bcd4621d373cade4e832627b4f6','d',NULL,1,NULL,NULL,NULL,0,NULL),(67,' ','ivan.klykov@gmail.com',0,'Artem Mjsdissl','','  ','','2014-02-24 23:45:14','30e35093cefa3a2627fa2051095e80ce.jpg','      :           777777','bed128365216c019988915ed3add75fb','',NULL,4,NULL,NULL,NULL,0,'2014-03-26 22:37:23'),(92,' ','rrr@dsdsd.fdff',0,' ','ewqeewr','','','2014-02-21 11:22:48','.jpg','','','http://vk.com/mihail.parandiy',NULL,1,NULL,NULL,'17626135',0,NULL),(94,' ','indigo@mail.ru',0,' ','','','','2014-02-24 06:52:30','.jpg','  ()  .','','http://vk.com/id9191',NULL,1,NULL,NULL,'9191',0,NULL),(96,'tt','tt@tt.ru',0,NULL,NULL,NULL,NULL,'2014-02-25 12:20:08',NULL,NULL,'822050d9ae3c47f54bee71b85fce1487',NULL,NULL,1,NULL,NULL,NULL,0,NULL),(97,'tt','eeett@tt.ru',0,NULL,NULL,NULL,NULL,'2014-02-25 12:22:32',NULL,NULL,'accc9105df5383111407fd5b41255e23',NULL,NULL,1,NULL,NULL,NULL,0,NULL),(98,'tt','tt@test.ru',0,NULL,NULL,NULL,NULL,'2014-02-25 12:29:14',NULL,NULL,'accc9105df5383111407fd5b41255e23',NULL,NULL,1,NULL,NULL,NULL,0,NULL),(99,'tt','teet@test.ru',0,NULL,NULL,NULL,NULL,'2014-02-25 12:34:29',NULL,NULL,'accc9105df5383111407fd5b41255e23',NULL,NULL,1,NULL,NULL,NULL,0,NULL),(101,' ','',1,NULL,NULL,NULL,NULL,'2014-02-25 14:31:52','.jpg',NULL,'','https://www.facebook.com/mihail.parandiy',NULL,1,NULL,'100003905122055',NULL,1,NULL),(102,'testname','testname@testname.jj',0,NULL,NULL,NULL,NULL,'2014-02-25 16:24:59',NULL,NULL,'17e4018a27cc0cf8c39948589934116a',NULL,NULL,1,NULL,NULL,NULL,0,'2014-02-25 16:24:59'),(103,'test@fdfdf.fdf','test@fdfdf.fdf',0,NULL,NULL,NULL,NULL,'2014-02-25 16:25:38',NULL,NULL,'1a100d2c0dab19c4430e7d73762b3423',NULL,NULL,1,NULL,NULL,NULL,0,'2014-02-25 16:25:38'),(104,'eee@dd.gg','eee@dd.gg',0,NULL,NULL,NULL,NULL,'2014-02-25 16:26:43',NULL,NULL,'e3ceb5881a0a1fdaad01296d7554868d',NULL,NULL,1,NULL,NULL,NULL,0,'2014-02-25 16:26:43'),(105,'terter','tetete@bk.ru',1,NULL,'ttt','','','2014-02-25 19:38:13',NULL,'','e05e7e0269a2f6870f4825c00d75710f','',NULL,1,NULL,NULL,NULL,0,'2014-02-25 19:40:20'),(107,'','polocatik@bk.ru',0,NULL,'WEB - worker','','','2014-03-11 13:31:06',NULL,'   ','46bac3283c0024e55d970c93f469e811','',NULL,4,NULL,NULL,NULL,0,'2014-03-24 15:05:02'),(108,'rtgtrgh','tgtr@ft.dc',0,NULL,NULL,NULL,NULL,'2014-03-13 14:31:21',NULL,NULL,'761f057d207263120f6ef92f10f156f7',NULL,NULL,1,NULL,NULL,NULL,0,'2014-03-13 14:31:21'),(110,'John','polocatic@gmail.com',0,NULL,NULL,NULL,NULL,'2014-03-19 20:28:40',NULL,NULL,'46bac3283c0024e55d970c93f469e811',NULL,NULL,1,'2443303396',NULL,NULL,0,'2014-03-19 20:28:40'),(123,' ','',1,NULL,NULL,NULL,NULL,'2014-03-24 16:49:26','.jpg',NULL,'','http://vk.com/id55691468',NULL,1,NULL,NULL,'55691468',2,NULL),(124,' ','serpantin@inbox.ru',0,NULL,' ','','','2014-03-24 22:35:35',NULL,' ,      ,     2014       .   «.Ru»    ','3ef9d2cd2a1fc9ff2c9010471832d661','http://https://www.facebook.com/olegtinkov/po',NULL,1,'7138268117',NULL,NULL,0,'2014-03-26 22:16:16'),(131,'timofeymelnik','timofeymelnik@gmail.com',0,NULL,NULL,NULL,NULL,'2014-03-26 20:05:12',NULL,NULL,'b6ca84b29e31e551001ae35f2f92bafd',NULL,NULL,1,NULL,NULL,NULL,0,'2014-03-26 20:05:12'),(136,'tt','tt@tt.tt',0,NULL,NULL,NULL,NULL,'2014-03-27 15:30:54',NULL,NULL,'accc9105df5383111407fd5b41255e23',NULL,NULL,1,NULL,NULL,NULL,0,'2014-03-27 15:30:54'),(137,'tt','tt@tt.ttt',0,NULL,'','','','2014-03-28 15:46:31','41f2dd25508355eb04537b3ac52c01d6.jpg','  ()  .','9990775155c3518a0d7917f7780b24aa','',NULL,4,NULL,NULL,NULL,0,'2014-04-14 11:59:45'),(138,' ','',1,NULL,NULL,NULL,NULL,'2014-04-02 14:07:30','.jpg',NULL,'','http://vk.com/timofeymelnik',NULL,1,NULL,NULL,'16648575',2,NULL),(139,'sdfg','sdfg@mai.tx',0,NULL,NULL,NULL,NULL,'2014-04-14 12:27:59',NULL,NULL,'e332a76c29654fcb7f6e6b31ced090c7',NULL,NULL,1,NULL,NULL,NULL,0,'2014-04-14 12:27:59'),(140,'tim','tim@gmail.com',0,NULL,NULL,NULL,NULL,'2014-04-25 15:13:41',NULL,NULL,'b15d47e99831ee63e3f47cf3d4478e9a',NULL,NULL,1,NULL,NULL,NULL,0,'2014-04-25 15:13:41'),(141,'tim','tim@mail.ru',0,NULL,NULL,NULL,NULL,'2014-04-25 16:21:22',NULL,NULL,'b15d47e99831ee63e3f47cf3d4478e9a',NULL,NULL,1,NULL,NULL,NULL,0,'2014-04-25 16:21:22'),(142,'asdf','asdf@asdf.as',0,NULL,NULL,NULL,NULL,'2014-04-25 16:24:30',NULL,NULL,'912ec803b2ce49e4a541068d495ab570',NULL,NULL,1,NULL,NULL,NULL,0,'2014-04-25 16:24:30'),(143,'asdf','asdf@asdf.asd',0,NULL,NULL,NULL,NULL,'2014-04-25 16:27:30',NULL,NULL,'912ec803b2ce49e4a541068d495ab570',NULL,NULL,1,NULL,NULL,NULL,0,'2014-04-25 16:27:30'),(144,'asdf','asdf@asd.asd',0,NULL,NULL,NULL,NULL,'2014-04-25 17:06:58',NULL,NULL,'912ec803b2ce49e4a541068d495ab570',NULL,NULL,1,NULL,NULL,NULL,0,'2014-04-25 17:06:58'),(145,'asdf','asdf@asd.asdf',0,NULL,NULL,NULL,NULL,'2014-04-25 17:07:06',NULL,NULL,'912ec803b2ce49e4a541068d495ab570',NULL,NULL,1,NULL,NULL,NULL,0,'2014-04-25 17:07:06'),(146,'hfdfg','hdfgh@hdg.dfgh',0,NULL,NULL,NULL,NULL,'2014-04-25 17:09:11',NULL,NULL,'450a2f441ef0f3b05f767b4202aaab88',NULL,NULL,1,NULL,NULL,NULL,0,'2014-04-25 17:09:11'),(147,'fasdfa','sdfgsdfg@gsdfgs.asdf',0,NULL,NULL,NULL,NULL,'2014-04-25 17:15:31',NULL,NULL,'cde47ef73a184838340aafce4b402c97',NULL,NULL,1,NULL,NULL,NULL,0,'2014-04-25 17:15:31'),(148,'sdfgsdfg','sdfgsdfg@dfsg.asdf',0,NULL,NULL,NULL,NULL,'2014-04-25 17:16:24',NULL,NULL,'6a204bd89f3c8348afd5c77c717a097a',NULL,NULL,1,NULL,NULL,NULL,0,'2014-04-25 17:16:24'),(149,'asdfghdfg','hdfghsd@gfhd.sfd',0,NULL,NULL,NULL,NULL,'2014-04-25 17:19:21','b58614e1709a362e61e2d47c618db81a.jpg',NULL,'cde47ef73a184838340aafce4b402c97',NULL,NULL,1,NULL,NULL,NULL,0,'2014-04-25 17:19:21'),(150,'tim','tim@mail.com',0,NULL,'worker',NULL,NULL,'2014-04-28 18:03:03','69596c96e404d457720ed1adbb5f346a.jpg',NULL,'b15d47e99831ee63e3f47cf3d4478e9a',NULL,NULL,1,NULL,NULL,NULL,0,'2014-04-28 18:03:17'),(151,'tema','artem@mail.ru',0,NULL,NULL,NULL,NULL,'2014-04-28 18:05:17',NULL,NULL,'6a204bd89f3c8348afd5c77c717a097a',NULL,NULL,1,NULL,NULL,NULL,0,'2014-04-28 18:05:17'),(152,'tema','artem@mail.com',0,NULL,NULL,NULL,NULL,'2014-04-28 18:05:33',NULL,NULL,'6a204bd89f3c8348afd5c77c717a097a',NULL,NULL,1,NULL,NULL,NULL,0,'2014-04-28 18:05:33'),(153,'avatar','aang@avatar.apa',0,NULL,'avatar',NULL,NULL,'2014-04-28 18:06:26','767855d272453ca53dffb7be426776d6.jpg',NULL,'e03ae33ee8417ce2c9785274217636e0',NULL,NULL,1,NULL,NULL,NULL,0,'2014-04-28 18:06:42'),(154,'name','name@mail.com',0,NULL,NULL,NULL,NULL,'2014-04-28 18:10:49','c6f107e81a7322b5639eeed5f49acd0d.jpg',NULL,'b83a886a5c437ccd9ac15473fd6f1788',NULL,NULL,1,NULL,NULL,NULL,0,'2014-04-28 18:10:49'),(155,'namename','family@mail.com',0,NULL,'worker',NULL,NULL,'2014-04-28 18:13:31','f31dd2b306a83018eafe3ed944d117d2.jpg',NULL,'b83a886a5c437ccd9ac15473fd6f1788',NULL,NULL,1,NULL,NULL,NULL,0,'2014-04-28 18:14:25'),(156,'namename','retail@retail.com',0,NULL,'work',NULL,NULL,'2014-04-28 18:15:46','e37629052a92fedbc94c4a59021f7de5.jpg',NULL,'b068931cc450442b63f5b3d276ea4297',NULL,NULL,1,NULL,NULL,NULL,0,'2014-04-28 18:20:20'),(157,'timofeymelnik','timas@mas.ru',0,NULL,NULL,NULL,NULL,'2014-04-28 18:26:14','86de459bc997edad0e8ee3819354d4c9.jpg',NULL,'a8967cdb80c6538c99d13cb01f870c63',NULL,NULL,1,NULL,NULL,NULL,0,'2014-04-28 18:26:14'),(158,'tim','tim@tim.tim',0,NULL,NULL,NULL,NULL,'2014-04-28 18:28:50','93f023049d5d13ed851bbca96ff4a0b9.jpg',NULL,'b15d47e99831ee63e3f47cf3d4478e9a',NULL,NULL,1,NULL,NULL,NULL,0,'2014-04-28 18:28:50'),(159,'asdfasdfsfd','asdfasd@arfsdf.asdf',0,NULL,'asdfasdf',NULL,NULL,'2014-04-28 18:47:24',NULL,NULL,'6a204bd89f3c8348afd5c77c717a097a',NULL,NULL,1,NULL,NULL,NULL,0,'2014-04-28 18:47:40'),(160,'asdfasdf','asdfsdfgdfs@dfsgh.sd',0,NULL,'asdfasdf',NULL,NULL,'2014-04-28 18:48:33',NULL,NULL,'6a204bd89f3c8348afd5c77c717a097a',NULL,NULL,1,NULL,NULL,NULL,0,'2014-04-28 18:48:37'),(161,'asdfasdf','asdfasdf@adfasdf.asd',0,NULL,'asdfasdf',NULL,NULL,'2014-04-28 18:49:16',NULL,NULL,'6a204bd89f3c8348afd5c77c717a097a',NULL,NULL,1,NULL,NULL,NULL,0,'2014-04-28 18:49:27'),(162,'asdfadsf','asdfasdf@xdfgx.asd',0,NULL,NULL,NULL,NULL,'2014-04-28 19:00:12','c74fbc4797e2c90479f00ba6190ca186.jpg',NULL,'6a204bd89f3c8348afd5c77c717a097a',NULL,NULL,1,NULL,NULL,NULL,0,'2014-04-28 19:00:12'),(163,'sdfgsdfg','sdfgsdfg@sdfgsd.sdf',0,NULL,NULL,NULL,NULL,'2014-04-28 19:35:57','caa88ccfa8c0f7b411f2abb8b7dd9e2a.jpg',NULL,'e332a76c29654fcb7f6e6b31ced090c7',NULL,NULL,1,NULL,NULL,NULL,0,'2014-04-28 19:35:57'),(164,'hfgfhg','jgjhg@hg.hg',0,NULL,'hfgfhgfhg',NULL,NULL,'2014-04-28 21:45:26',NULL,NULL,'c6eaac4236d081d850e9d07137d60b09',NULL,NULL,1,NULL,NULL,NULL,0,'2014-04-28 21:45:53'),(165,'wwww','musheg@ru.ru',0,NULL,NULL,NULL,NULL,'2014-05-14 19:59:10',NULL,NULL,'5d41402abc4b2a76b9719d911017c592',NULL,NULL,4,NULL,NULL,NULL,0,'2014-05-14 19:59:28'),(166,'wwww',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'5d41402abc4b2a76b9719d911017c592',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL);
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
INSERT INTO `categories` VALUES (1,'','  '),(2,'','   '),(3,'  ','    '),(4,'','     '),(5,'',' '),(6,'','      '),(7,'','    '),(8,'',''),(9,'','   '),(10,'','     '),(11,'  ','  '),(12,'','  ,   '),(13,'','  '),(14,'  ','    '),(16,'  ','       '),(17,'  ','    '),(18,'','     '),(19,'  ',',   '),(20,'','        '),(21,'',''),(23,'Hand-made','Hand-made');
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
INSERT INTO `content` VALUES (1,'<p><span style=\"color: #ffffff;\">     . <br></span></p><p><span style=\"color: #ffffff;\"><br></span></p><p><span style=\"color: #ffffff;\">   </span><br></p>','  ',''),(2,'<p> </p>','   ',NULL),(3,'<p><img src=\"http://i.cheltcom.ru/u/70/0247506a5611e3bf9ea8fbbcc6a54c/-/cheltcom_ru_about_us.png\"><br></p>','   ',NULL),(4,' ','  ',''),(5,'<p>mail</p>','Email    ',NULL),(6,', %name%!     \\\"\\\". :  %email%  : %password%','  ',NULL),(7,': %email%\r\n: %newpass%.\r\n      : %link%','   ',NULL),(8,'     ','   \\\"\\\"',NULL),(9,'    ','     ',NULL),(10,'     .','  ',NULL),(12,'http://google.ru',' ',NULL),(13,'/img/i6.jpg','    ',NULL),(14,' ,   ,  ','        ',''),(15,'  ','      ',NULL),(16,'  ','   \"  \"',NULL),(18,'/upload/avatar/noAvatar.jpg','   ',NULL),(19,' ','  \" \"',NULL),(20,'','  ',NULL),(21,' ','   ',NULL),(22,',      ','    \"\"',NULL),(23,'Email','    \"Email\"',NULL),(24,'  ','   ',NULL),(25,'','    \"\"',NULL),(26,'',' ',NULL),(27,'   ','  \" \"',NULL),(28,',      ','  ',NULL),(29,',   ','  \",   \"','test'),(30,'    ','  \"  \"',NULL),(31,' ','  \" \"',NULL),(32,' ',' \" \"',NULL),(33,' ',' \" \"',NULL),(34,'','  ',NULL),(35,' ,      ','  ',NULL),(36,' ',' \" \"',NULL),(37,' ',' \" \"',NULL),(38,' ',' \" \"    ',NULL),(39,'  ','   ',NULL),(40,'  ','   \"  \"',NULL),(41,'','    ',NULL),(42,'   ,   ?','    ',NULL),(43,'  ','     ',NULL),(44,' ',' \" \"   ',NULL),(45,'  ',' \"  \"   ',NULL),(46,'   ','-       ( \"  \")',NULL),(47,'      .',',     \"\"  ,   ,           ',NULL),(48,' ,          .    ,     .',',     \"\"   ,           .',NULL),(49,' ',' \" \"',NULL),(50,' ,       .',',     \"\"   ,         ',NULL),(51,'       !','   ,       ',NULL),(52,'    !','   ,       ',NULL),(53,'  ()  .',',     ,      . (  ',NULL),(54,'','.  \"\".',NULL),(55,'','.  \"\".',NULL),(56,'   .','    -       ,   ',NULL),(57,'!    .     ,        .',',    ,    ',NULL),(58,' ',' \" \"',NULL),(59,' ','   ',NULL),(60,' 404 -    ',' 404',NULL),(61,'',' ',NULL),(62,'<p> <br></p>','  ',NULL),(63,'','  ',NULL),(64,'<p>vk.com/id35</p>','  ',''),(65,'<p>facebook.com/35</p>','  Facebook','');
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
INSERT INTO `content_old` VALUES (0,'   ,      ','  '),(1,'  ?  ','   '),(2,' ','   '),(3,' ','  '),(4,'mailbox@yasoon.ru','Email    '),(5,'  ','   404'),(6,', %name%!     \\\"\\\". :  %email%  : %password%','  '),(7,': %email%\n: %newpass%.\n      : %link%','   '),(8,'     ','   \\\"\\\"'),(9,'     ','     '),(10,'     .','  ');
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
  `reader_id` int(11) NOT NULL COMMENT 'Id ,  ',
  `writer_id` int(11) NOT NULL COMMENT 'Id ,    reader',
  `date_write` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`reader_id`,`writer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friends`
--

LOCK TABLES `friends` WRITE;
/*!40000 ALTER TABLE `friends` DISABLE KEYS */;
INSERT INTO `friends` VALUES (4,41,41,NULL),(14,41,87,NULL),(15,67,87,NULL),(17,87,88,'2014-02-17 05:16:02'),(19,63,56,'2014-02-17 16:31:57'),(24,56,63,'2014-02-18 18:18:28'),(25,63,67,'2014-03-01 01:50:13'),(27,66,67,'2014-03-01 02:00:06'),(28,56,67,'2014-03-01 02:00:44'),(30,67,94,'2014-03-28 00:23:55'),(31,165,137,NULL),(32,137,165,NULL);
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
INSERT INTO `interview` VALUES (1,'dwsdsds'),(2,'tests2'),(20,'t3'),(21,'t4'),(22,'   '),(23,'   '),(24,'   ');
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
INSERT INTO `interview_question` VALUES (1,1,'dsfsfsf'),(2,1,'dfsfsgfsgs'),(12,2,''),(13,2,''),(37,20,'1'),(38,20,'2'),(39,21,'1'),(40,21,'2'),(41,22,' '),(42,22,'     ?'),(43,23,' '),(44,23,'     ?'),(45,24,' '),(46,24,'     ?');
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
INSERT INTO `partners` VALUES (1,'/img/i6.jpg','Sheremetiveo airoport work stories<br/> Only for today','www.google.ru');
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
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
INSERT INTO `story_of_the_day` VALUES (16,22,'2014-02-19 14:43:37'),(17,22,'2014-02-19 14:43:40'),(18,27,'2014-02-24 15:07:47'),(19,56,'2014-02-24 16:15:59'),(20,27,'2014-02-25 00:44:53'),(21,27,'2014-02-26 16:55:16'),(22,27,'2014-02-27 12:17:50'),(23,27,'2014-03-12 19:26:11'),(24,58,'2014-04-09 23:25:59');
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timeline`
--

LOCK TABLES `timeline` WRITE;
/*!40000 ALTER TABLE `timeline` DISABLE KEYS */;
INSERT INTO `timeline` VALUES (1,45,0,0,1),(3,87,2,3,5),(4,41,11,4,2),(5,67,0,0,0),(6,56,1,0,1),(7,63,3,1,2),(11,66,1,0,1),(13,107,0,0,3),(14,123,0,0,0);
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

-- Dump completed on 2014-05-27 17:00:05
