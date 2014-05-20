/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50537
Source Host           : localhost:3306
Source Database       : yasoon

Target Server Type    : MYSQL
Target Server Version : 50537
File Encoding         : 65001

Date: 2014-05-19 16:31:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `answer_timeline`
-- ----------------------------
DROP TABLE IF EXISTS `answer_timeline`;
CREATE TABLE `answer_timeline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) DEFAULT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of answer_timeline
-- ----------------------------

-- ----------------------------
-- Table structure for `author`
-- ----------------------------
DROP TABLE IF EXISTS `author`;
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
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of author
-- ----------------------------
INSERT INTO `author` VALUES ('39', 'username', 'test@test.ru', '0', null, null, null, null, '2014-02-03 05:46:24', null, null, '098f6bcd4621d373cade4e832627b4f6', null, null, '1', null, null, null, '0', null);
INSERT INTO `author` VALUES ('40', 'username2', 'test22@test.ru', '0', 'test22@test.ru', 'yyy', '', '', '2014-02-03 05:55:56', null, '', 'd41d8cd98f00b204e9800998ecf8427e', '', null, '1', null, null, null, '0', null);
INSERT INTO `author` VALUES ('41', 'username22', 'test222@test.ru', '0', null, null, null, null, '2014-02-03 05:57:41', null, 'ydjfjhg', '098f6bcd4621d373cade4e832627b4f6', null, null, '1', null, null, null, '0', null);
INSERT INTO `author` VALUES ('42', 'kotays', 'kotays12@gmail.com', '0', null, null, null, null, '2014-02-04 04:10:41', null, null, 'd41d8cd98f00b204e9800998ecf8427e', null, null, '4', null, null, null, '0', null);
INSERT INTO `author` VALUES ('43', 'kota', 'kota12@bk.ru', '0', null, null, null, null, '2014-02-04 07:40:39', null, null, 'd41d8cd98f00b204e9800998ecf8427e', null, null, '1', null, null, null, '0', null);
INSERT INTO `author` VALUES ('44', 'kooott', 'kotaq1@bk.ru', '1', 'kotaq1@bk.ru', null, null, null, '2014-02-04 07:41:46', null, null, 'd41d8cd98f00b204e9800998ecf8427e', '', null, '1', null, null, null, '0', null);
INSERT INTO `author` VALUES ('45', 'kota12', 'kota123@bk.ru', '1', 'kota123@bk.ru', 'prof', 'rrr', 'rrr', '2014-02-04 09:25:38', null, 'rrrr', 'd41d8cd98f00b204e9800998ecf8427e', '', null, '1', null, null, null, '0', null);
INSERT INTO `author` VALUES ('49', 'dsfgdg', 'parandiy.mihail@gmail.com', '0', null, null, null, null, '2014-02-06 11:24:17', null, null, '999c3fdf76ce33797d31b79dd486aca0', null, null, '1', null, null, null, '0', null);
INSERT INTO `author` VALUES ('50', 'kotays12', 'kot12@bk.ru', '1', 'kot12@bk.ru', 'aaa', '', '', '2014-02-06 11:29:36', null, '', 'd41d8cd98f00b204e9800998ecf8427e', '', null, '1', null, null, null, '0', null);
INSERT INTO `author` VALUES ('51', 'tester', 't1@t.ru', '1', 't1@t.ru', 'test', '', '', '2014-02-06 11:30:52', null, '', 'd41d8cd98f00b204e9800998ecf8427e', '', null, '1', null, null, null, '0', null);
INSERT INTO `author` VALUES ('52', 't3', 't3@t.ru', '1', 't3@t.ru', 't3', '', '', '2014-02-06 11:38:23', null, '', 'd41d8cd98f00b204e9800998ecf8427e', '', null, '1', null, null, null, '0', null);
INSERT INTO `author` VALUES ('53', 'test3', 'test3@test.ru', '1', 'test3@test.ru', 'test3', '', '', '2014-02-06 11:40:11', null, '', '098f6bcd4621d373cade4e832627b4f6', '', null, '1', null, null, null, '0', null);
INSERT INTO `author` VALUES ('54', 'Bloom Berg', 'balabol@gmail.com', '1', 'balabol@gmail.com', 'Учоный', 'Сварщик', 'терминатор', '2014-02-06 15:16:25', null, '', '76419c58730d9f35de7ac538c2fd6737', '', null, '1', null, null, null, '0', null);
INSERT INTO `author` VALUES ('55', 'kota', 'k1@mail.ru', '1', 'k1@mail.ru', 'aaaa', 'ddd', 'qqqq', '2014-02-06 17:18:29', null, 'eeee', '202cb962ac59075b964b07152d234b70', '', null, '1', null, null, null, '0', null);
INSERT INTO `author` VALUES ('56', 'fox', 'fox@test.ru', '0', 'fox', 'FireFox', 'Browser', '', '2014-02-17 16:56:09', 'c0e9cf974aa8ea5e08f3f55d24a2a33c.jpg', 'I\'m firefox', '2b95d1f09b8b66c5c43622a4d9ec9a04', '', null, '4', null, null, null, '0', '2014-02-28 18:40:28');
INSERT INTO `author` VALUES ('59', 'wee', 'ee@mail.ru', '0', null, null, null, null, '2014-02-06 21:00:09', null, null, '099b3b060154898840f0ebdfb46ec78f', null, null, '1', null, null, null, '0', null);
INSERT INTO `author` VALUES ('60', 'Korol Lev', 'leva@leva.ru', '1', 'leva@leva.ru', 'Учоный', 'Чоный', 'Очный', '2014-02-07 03:51:19', null, 'ыыыыыыыыыыыыыыыыыыыыыыыыыыыыыыыыыыыыыыыыыыыыы', '76419c58730d9f35de7ac538c2fd6737', '', null, '1', null, null, null, '0', null);
INSERT INTO `author` VALUES ('61', 'torororor', 'qwweertt@inbop.com', '1', 'qwweertt@inbop.com', 'Лвлвлвлвлвлв', 'вжвдвдвщвщвв', 'вдвдвд ввлвд влв', '2014-02-07 04:03:33', null, 'вжвжвжвжвжв ввдвдвдвдв вдвдвдвдв вдвдвдвд вдв', '76419c58730d9f35de7ac538c2fd6737', '', null, '1', null, null, null, '0', null);
INSERT INTO `author` VALUES ('62', 'Kotays', 'k1@k.ru', '0', 'k1@k.ru', 'Профа', 'Мачта профы', 'Восхещение профа', '2014-02-07 04:33:26', null, 'Я программист', '202cb962ac59075b964b07152d234b70', '', null, '1', null, null, null, '0', null);
INSERT INTO `author` VALUES ('63', 'chrome', 'indigo@mail.ru', '0', 'chromes', 'чемпион', '', '', '2014-02-25 10:30:53', 'b0b67506d7f867cbd2879bf2dd4fae12.jpg', 'Что то о себе.', '554838a8451ac36cb977e719e9d6623c', 'http://vk.com/id9191', null, '4', null, null, null, '0', null);
INSERT INTO `author` VALUES ('64', 'Ferion Lapland', 'wsx@omni.ru', '0', 'wsx@omni.ru', 'eee', 'xxxxx', '', '2014-02-07 09:42:35', null, '', '76419c58730d9f35de7ac538c2fd6737', '', null, '1', null, null, null, '0', null);
INSERT INTO `author` VALUES ('65', 'test_user', 'test_user@test.ru', '0', 'test_user@test.ru', 'P', 'P2', 'P3', '2014-02-07 09:54:02', null, 'About me', '098f6bcd4621d373cade4e832627b4f6', 'vk.com/id1234', null, '1', null, null, null, '0', null);
INSERT INTO `author` VALUES ('66', 'kotaa', 'k5@k5.ru', '0', 'k5@k5.ru', 'a4', 'a', 'a', '2014-02-10 08:49:44', null, 'a', '098f6bcd4621d373cade4e832627b4f6', 'd', null, '1', null, null, null, '0', null);
INSERT INTO `author` VALUES ('67', 'Иван Клыков', 'ivan.klykov@gmail.com', '0', 'Artem Mjsdissl', 'Аналитик', 'Пилот гражданской кухни', 'Архитектор', '2014-02-24 23:45:14', '30e35093cefa3a2627fa2051095e80ce.jpg', 'Человек может бесконечно смотреть на три вещи: кекек  ыуцууу  ввввв жжжжжжж жжжжжжжж жжжжжжжж жжжжжж  777777', 'bed128365216c019988915ed3add75fb', '', null, '4', null, null, null, '0', '2014-03-26 22:37:23');
INSERT INTO `author` VALUES ('92', 'Михаил Парандий', 'rrr@dsdsd.fdff', '0', 'Михаил Парандий', 'ewqeewr', '', '', '2014-02-21 11:22:48', '.jpg', '', '', 'http://vk.com/mihail.parandiy', null, '1', null, null, '17626135', '0', null);
INSERT INTO `author` VALUES ('94', 'Иван Клыков', 'indigo@mail.ru', '0', 'Иван Клыков', 'чемпион', '', '', '2014-02-24 06:52:30', '.jpg', 'Ничего не расказал(ла) о себе.', '', 'http://vk.com/id9191', null, '1', null, null, '9191', '0', null);
INSERT INTO `author` VALUES ('96', 'tt', 'tt@tt.ru', '0', null, null, null, null, '2014-02-25 12:20:08', null, null, '822050d9ae3c47f54bee71b85fce1487', null, null, '1', null, null, null, '0', null);
INSERT INTO `author` VALUES ('97', 'tt', 'eeett@tt.ru', '0', null, null, null, null, '2014-02-25 12:22:32', null, null, 'accc9105df5383111407fd5b41255e23', null, null, '1', null, null, null, '0', null);
INSERT INTO `author` VALUES ('98', 'tt', 'tt@test.ru', '0', null, null, null, null, '2014-02-25 12:29:14', null, null, 'accc9105df5383111407fd5b41255e23', null, null, '1', null, null, null, '0', null);
INSERT INTO `author` VALUES ('99', 'tt', 'teet@test.ru', '0', null, null, null, null, '2014-02-25 12:34:29', null, null, 'accc9105df5383111407fd5b41255e23', null, null, '1', null, null, null, '0', null);
INSERT INTO `author` VALUES ('101', 'Михаил Парандий', '', '1', null, null, null, null, '2014-02-25 14:31:52', '.jpg', null, '', 'https://www.facebook.com/mihail.parandiy', null, '1', null, '100003905122055', null, '1', null);
INSERT INTO `author` VALUES ('102', 'testname', 'testname@testname.jj', '0', null, null, null, null, '2014-02-25 16:24:59', null, null, '17e4018a27cc0cf8c39948589934116a', null, null, '1', null, null, null, '0', '2014-02-25 16:24:59');
INSERT INTO `author` VALUES ('103', 'test@fdfdf.fdf', 'test@fdfdf.fdf', '0', null, null, null, null, '2014-02-25 16:25:38', null, null, '1a100d2c0dab19c4430e7d73762b3423', null, null, '1', null, null, null, '0', '2014-02-25 16:25:38');
INSERT INTO `author` VALUES ('104', 'eee@dd.gg', 'eee@dd.gg', '0', null, null, null, null, '2014-02-25 16:26:43', null, null, 'e3ceb5881a0a1fdaad01296d7554868d', null, null, '1', null, null, null, '0', '2014-02-25 16:26:43');
INSERT INTO `author` VALUES ('105', 'terter', 'tetete@bk.ru', '1', null, 'ttt', '', '', '2014-02-25 19:38:13', null, '', 'e05e7e0269a2f6870f4825c00d75710f', '', null, '1', null, null, null, '0', '2014-02-25 19:40:20');
INSERT INTO `author` VALUES ('107', 'Константин', 'polocatik@bk.ru', '0', null, 'WEB - worker', '', '', '2014-03-11 13:31:06', null, 'атыфло л оылвимл ол', '46bac3283c0024e55d970c93f469e811', '', null, '4', null, null, null, '0', '2014-03-24 15:05:02');
INSERT INTO `author` VALUES ('108', 'rtgtrgh', 'tgtr@ft.dc', '0', null, null, null, null, '2014-03-13 14:31:21', null, null, '761f057d207263120f6ef92f10f156f7', null, null, '1', null, null, null, '0', '2014-03-13 14:31:21');
INSERT INTO `author` VALUES ('110', 'John', 'polocatic@gmail.com', '0', null, null, null, null, '2014-03-19 20:28:40', null, null, '46bac3283c0024e55d970c93f469e811', null, null, '1', '2443303396', null, null, '0', '2014-03-19 20:28:40');
INSERT INTO `author` VALUES ('123', 'Константин Моисеенко', '', '1', null, null, null, null, '2014-03-24 16:49:26', '.jpg', null, '', 'http://vk.com/id55691468', null, '1', null, null, '55691468', '2', null);
INSERT INTO `author` VALUES ('124', 'Тестер Вопросов', 'serpantin@inbox.ru', '0', null, 'Мастер тестов', '', '', '2014-03-24 22:35:35', null, 'Яков Синай, академик РАН и профессор Принстонского университета, стал лауреатом премии Абеля 2014 года — аналога Нобелевской премии для математиков. О лауреате «Газете.Ru» рассказал академик РАН Але', '3ef9d2cd2a1fc9ff2c9010471832d661', 'http://https://www.facebook.com/olegtinkov/po', null, '1', '7138268117', null, null, '0', '2014-03-26 22:16:16');
INSERT INTO `author` VALUES ('131', 'timofeymelnik', 'timofeymelnik@gmail.com', '0', null, null, null, null, '2014-03-26 20:05:12', null, null, 'b6ca84b29e31e551001ae35f2f92bafd', null, null, '1', null, null, null, '0', '2014-03-26 20:05:12');
INSERT INTO `author` VALUES ('136', 'tt', 'tt@tt.tt', '0', null, null, null, null, '2014-03-27 15:30:54', null, null, 'accc9105df5383111407fd5b41255e23', null, null, '1', null, null, null, '0', '2014-03-27 15:30:54');
INSERT INTO `author` VALUES ('137', 'tt', 'tt@tt.ttt', '0', null, '', '', '', '2014-03-28 15:46:31', '41f2dd25508355eb04537b3ac52c01d6.jpg', 'Ничего не рассказал(а) о себе.', '9990775155c3518a0d7917f7780b24aa', '', null, '1', null, null, null, '0', '2014-04-14 11:59:45');
INSERT INTO `author` VALUES ('138', 'Тима Мельник', '', '1', null, null, null, null, '2014-04-02 14:07:30', '.jpg', null, '', 'http://vk.com/timofeymelnik', null, '1', null, null, '16648575', '2', null);
INSERT INTO `author` VALUES ('139', 'sdfg', 'sdfg@mai.tx', '0', null, null, null, null, '2014-04-14 12:27:59', null, null, 'e332a76c29654fcb7f6e6b31ced090c7', null, null, '1', null, null, null, '0', '2014-04-14 12:27:59');
INSERT INTO `author` VALUES ('140', 'tim', 'tim@gmail.com', '0', null, null, null, null, '2014-04-25 15:13:41', null, null, 'b15d47e99831ee63e3f47cf3d4478e9a', null, null, '1', null, null, null, '0', '2014-04-25 15:13:41');
INSERT INTO `author` VALUES ('141', 'tim', 'tim@mail.ru', '0', null, null, null, null, '2014-04-25 16:21:22', null, null, 'b15d47e99831ee63e3f47cf3d4478e9a', null, null, '1', null, null, null, '0', '2014-04-25 16:21:22');
INSERT INTO `author` VALUES ('142', 'asdf', 'asdf@asdf.as', '0', null, null, null, null, '2014-04-25 16:24:30', null, null, '912ec803b2ce49e4a541068d495ab570', null, null, '1', null, null, null, '0', '2014-04-25 16:24:30');
INSERT INTO `author` VALUES ('143', 'asdf', 'asdf@asdf.asd', '0', null, null, null, null, '2014-04-25 16:27:30', null, null, '912ec803b2ce49e4a541068d495ab570', null, null, '1', null, null, null, '0', '2014-04-25 16:27:30');
INSERT INTO `author` VALUES ('144', 'asdf', 'asdf@asd.asd', '0', null, null, null, null, '2014-04-25 17:06:58', null, null, '912ec803b2ce49e4a541068d495ab570', null, null, '1', null, null, null, '0', '2014-04-25 17:06:58');
INSERT INTO `author` VALUES ('145', 'asdf', 'asdf@asd.asdf', '0', null, null, null, null, '2014-04-25 17:07:06', null, null, '912ec803b2ce49e4a541068d495ab570', null, null, '1', null, null, null, '0', '2014-04-25 17:07:06');
INSERT INTO `author` VALUES ('146', 'hfdfg', 'hdfgh@hdg.dfgh', '0', null, null, null, null, '2014-04-25 17:09:11', null, null, '450a2f441ef0f3b05f767b4202aaab88', null, null, '1', null, null, null, '0', '2014-04-25 17:09:11');
INSERT INTO `author` VALUES ('147', 'fasdfa', 'sdfgsdfg@gsdfgs.asdf', '0', null, null, null, null, '2014-04-25 17:15:31', null, null, 'cde47ef73a184838340aafce4b402c97', null, null, '1', null, null, null, '0', '2014-04-25 17:15:31');
INSERT INTO `author` VALUES ('148', 'sdfgsdfg', 'sdfgsdfg@dfsg.asdf', '0', null, null, null, null, '2014-04-25 17:16:24', null, null, '6a204bd89f3c8348afd5c77c717a097a', null, null, '1', null, null, null, '0', '2014-04-25 17:16:24');
INSERT INTO `author` VALUES ('149', 'asdfghdfg', 'hdfghsd@gfhd.sfd', '0', null, null, null, null, '2014-04-25 17:19:21', 'b58614e1709a362e61e2d47c618db81a.jpg', null, 'cde47ef73a184838340aafce4b402c97', null, null, '1', null, null, null, '0', '2014-04-25 17:19:21');
INSERT INTO `author` VALUES ('150', 'tim', 'tim@mail.com', '0', null, 'worker', null, null, '2014-04-28 18:03:03', '69596c96e404d457720ed1adbb5f346a.jpg', null, 'b15d47e99831ee63e3f47cf3d4478e9a', null, null, '1', null, null, null, '0', '2014-04-28 18:03:17');
INSERT INTO `author` VALUES ('151', 'tema', 'artem@mail.ru', '0', null, null, null, null, '2014-04-28 18:05:17', null, null, '6a204bd89f3c8348afd5c77c717a097a', null, null, '1', null, null, null, '0', '2014-04-28 18:05:17');
INSERT INTO `author` VALUES ('152', 'tema', 'artem@mail.com', '0', null, null, null, null, '2014-04-28 18:05:33', null, null, '6a204bd89f3c8348afd5c77c717a097a', null, null, '1', null, null, null, '0', '2014-04-28 18:05:33');
INSERT INTO `author` VALUES ('153', 'avatar', 'aang@avatar.apa', '0', null, 'avatar', null, null, '2014-04-28 18:06:26', '767855d272453ca53dffb7be426776d6.jpg', null, 'e03ae33ee8417ce2c9785274217636e0', null, null, '1', null, null, null, '0', '2014-04-28 18:06:42');
INSERT INTO `author` VALUES ('154', 'name', 'name@mail.com', '0', null, null, null, null, '2014-04-28 18:10:49', 'c6f107e81a7322b5639eeed5f49acd0d.jpg', null, 'b83a886a5c437ccd9ac15473fd6f1788', null, null, '1', null, null, null, '0', '2014-04-28 18:10:49');
INSERT INTO `author` VALUES ('155', 'namename', 'family@mail.com', '0', null, 'worker', null, null, '2014-04-28 18:13:31', 'f31dd2b306a83018eafe3ed944d117d2.jpg', null, 'b83a886a5c437ccd9ac15473fd6f1788', null, null, '1', null, null, null, '0', '2014-04-28 18:14:25');
INSERT INTO `author` VALUES ('156', 'namename', 'retail@retail.com', '0', null, 'work', null, null, '2014-04-28 18:15:46', 'e37629052a92fedbc94c4a59021f7de5.jpg', null, 'b068931cc450442b63f5b3d276ea4297', null, null, '1', null, null, null, '0', '2014-04-28 18:20:20');
INSERT INTO `author` VALUES ('157', 'timofeymelnik', 'timas@mas.ru', '0', null, null, null, null, '2014-04-28 18:26:14', '86de459bc997edad0e8ee3819354d4c9.jpg', null, 'a8967cdb80c6538c99d13cb01f870c63', null, null, '1', null, null, null, '0', '2014-04-28 18:26:14');
INSERT INTO `author` VALUES ('158', 'tim', 'tim@tim.tim', '0', null, null, null, null, '2014-04-28 18:28:50', '93f023049d5d13ed851bbca96ff4a0b9.jpg', null, 'b15d47e99831ee63e3f47cf3d4478e9a', null, null, '1', null, null, null, '0', '2014-04-28 18:28:50');
INSERT INTO `author` VALUES ('159', 'asdfasdfsfd', 'asdfasd@arfsdf.asdf', '0', null, 'asdfasdf', null, null, '2014-04-28 18:47:24', null, null, '6a204bd89f3c8348afd5c77c717a097a', null, null, '1', null, null, null, '0', '2014-04-28 18:47:40');
INSERT INTO `author` VALUES ('160', 'asdfasdf', 'asdfsdfgdfs@dfsgh.sd', '0', null, 'asdfasdf', null, null, '2014-04-28 18:48:33', null, null, '6a204bd89f3c8348afd5c77c717a097a', null, null, '1', null, null, null, '0', '2014-04-28 18:48:37');
INSERT INTO `author` VALUES ('161', 'asdfasdf', 'asdfasdf@adfasdf.asd', '0', null, 'asdfasdf', null, null, '2014-04-28 18:49:16', null, null, '6a204bd89f3c8348afd5c77c717a097a', null, null, '1', null, null, null, '0', '2014-04-28 18:49:27');
INSERT INTO `author` VALUES ('162', 'asdfadsf', 'asdfasdf@xdfgx.asd', '0', null, null, null, null, '2014-04-28 19:00:12', 'c74fbc4797e2c90479f00ba6190ca186.jpg', null, '6a204bd89f3c8348afd5c77c717a097a', null, null, '1', null, null, null, '0', '2014-04-28 19:00:12');
INSERT INTO `author` VALUES ('163', 'sdfgsdfg', 'sdfgsdfg@sdfgsd.sdf', '0', null, null, null, null, '2014-04-28 19:35:57', 'caa88ccfa8c0f7b411f2abb8b7dd9e2a.jpg', null, 'e332a76c29654fcb7f6e6b31ced090c7', null, null, '1', null, null, null, '0', '2014-04-28 19:35:57');
INSERT INTO `author` VALUES ('164', 'hfgfhg', 'jgjhg@hg.hg', '0', null, 'hfgfhgfhg', null, null, '2014-04-28 21:45:26', null, null, 'c6eaac4236d081d850e9d07137d60b09', null, null, '1', null, null, null, '0', '2014-04-28 21:45:53');
INSERT INTO `author` VALUES ('165', 'musheg', 'musheg@ru.ru', '0', null, 'работа', null, null, '2014-05-14 19:59:10', null, null, '15aaf012f55266e41f298bd965df1988', null, null, '1', null, null, null, '0', '2014-05-14 19:59:28');

-- ----------------------------
-- Table structure for `author_changed_pass`
-- ----------------------------
DROP TABLE IF EXISTS `author_changed_pass`;
CREATE TABLE `author_changed_pass` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `last_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of author_changed_pass
-- ----------------------------

-- ----------------------------
-- Table structure for `blank_question`
-- ----------------------------
DROP TABLE IF EXISTS `blank_question`;
CREATE TABLE `blank_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  `place` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of blank_question
-- ----------------------------

-- ----------------------------
-- Table structure for `categories`
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES ('1', 'Безопасность', 'Все о безопасности');
INSERT INTO `categories` VALUES ('2', 'Дизайн', 'Тут творчиства не занимать');
INSERT INTO `categories` VALUES ('3', 'Добыча полезных ископаемых', 'Для тех кто любит нефть');
INSERT INTO `categories` VALUES ('4', 'Интернет', 'нтернет он и в Африке интернет');
INSERT INTO `categories` VALUES ('5', 'Искусство', 'Любителям искуства');
INSERT INTO `categories` VALUES ('6', 'Медиа', 'Все начиная от фильмов и заканчивая дудками');
INSERT INTO `categories` VALUES ('7', 'Музыка', 'Для людей с музыкальным слухом');
INSERT INTO `categories` VALUES ('8', 'Наука', 'Ученым');
INSERT INTO `categories` VALUES ('9', 'Образование', 'Всем кому интиресно обучение');
INSERT INTO `categories` VALUES ('10', 'Право', 'Что бы знать хоть парочку законов');
INSERT INTO `categories` VALUES ('11', 'Природа и животные', 'Любителям всего живого');
INSERT INTO `categories` VALUES ('12', 'Программирование', 'Ну это святое, как не крути');
INSERT INTO `categories` VALUES ('13', 'Производство', 'Специально для самоделкиных');
INSERT INTO `categories` VALUES ('14', 'Психология и тренинги', 'Для тех кто любит отдыхать');
INSERT INTO `categories` VALUES ('16', 'Развлечения и туризм', 'Для тех кто идет в ногу со временем');
INSERT INTO `categories` VALUES ('17', 'Строительство и недвижимость', 'Про всякие машинки и телефончики');
INSERT INTO `categories` VALUES ('18', 'Технологии', 'Все услуги которые вообще можно представить');
INSERT INTO `categories` VALUES ('19', 'Транспорт и связь', 'Деньги, они всем нужны');
INSERT INTO `categories` VALUES ('20', 'Услуги', 'Для тех кто любит создавать красоту из подручных предметов');
INSERT INTO `categories` VALUES ('21', 'Финансы', 'Финансы');
INSERT INTO `categories` VALUES ('23', 'Hand-made', 'Hand-made');

-- ----------------------------
-- Table structure for `content`
-- ----------------------------
DROP TABLE IF EXISTS `content`;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `tagId` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of content
-- ----------------------------
INSERT INTO `content` VALUES ('1', '<p><span style=\"color: #ffffff;\">Источник профессионального вдохновения на каждый день. <br></span></p><p><span style=\"color: #ffffff;\"><br></span></p><p><span style=\"color: #ffffff;\">Ныне это очень трудно</span><br></p>', 'Надпись на главной', '');
INSERT INTO `content` VALUES ('2', '<p>О нас</p>', 'Заголовок страницы О нас', null);
INSERT INTO `content` VALUES ('3', '<p><img src=\"http://i.cheltcom.ru/u/70/0247506a5611e3bf9ea8fbbcc6a54c/-/cheltcom_ru_about_us.png\"><br></p>', 'Содержимое страницы О нас', null);
INSERT INTO `content` VALUES ('4', 'Узнать больше', 'Кнопка на главной', '');
INSERT INTO `content` VALUES ('5', '<p>mail</p>', 'Email на странице О нас', null);
INSERT INTO `content` VALUES ('6', 'Здравствуйте, %name%! Вы зарегистрировались на сайте \\\"Ясун\\\".Ваш логин:  %email% Ваш пароль: %password%', 'Письмо о регистрации', null);
INSERT INTO `content` VALUES ('7', 'Логин: %email%\r\nПароль: %newpass%.\r\nДля завершения восстановления пароля пройдите по ссылке: %link%', 'Письмо с напоминанием пароля', null);
INSERT INTO `content` VALUES ('8', 'Создайте свой профиль и напишите истории', 'Надпись под заголовком \\\"регистрация\\\"', null);
INSERT INTO `content` VALUES ('9', 'Расскажите чуть больше о себе', 'Надпись под заголовком всё прошло успешно', null);
INSERT INTO `content` VALUES ('10', 'Все ваши деньги теперь принадлежат нам.', 'Текст пользовательского соглашения', null);
INSERT INTO `content` VALUES ('12', 'http://google.ru', 'Ссылка партнера', null);
INSERT INTO `content` VALUES ('13', '/img/i6.jpg', 'Ссылка на картинку на главной', null);
INSERT INTO `content` VALUES ('14', 'Истории людей, которые любят то, что делают', 'Текст под названием отрасли на странице людей и профессий', '');
INSERT INTO `content` VALUES ('15', 'Редактирование личных данных', 'Текст на странице редактирования профиля под заголовком', null);
INSERT INTO `content` VALUES ('16', 'Напишите свою историю', 'Заголовок на странице \"Напишите свою историю\"', null);
INSERT INTO `content` VALUES ('18', '/upload/avatar/noAvatar.jpg', 'Аватар пользователя по умолчанию', null);
INSERT INTO `content` VALUES ('19', 'Больше историй', 'Название кнопки \"Больше историй\"', null);
INSERT INTO `content` VALUES ('20', 'Регистрация', 'Заголовок страницы регистрации', null);
INSERT INTO `content` VALUES ('21', 'Добро пожаловать', 'Заголовок второй страницы регистрации', null);
INSERT INTO `content` VALUES ('22', 'Имя, под которым будет опубликована Ваша история', 'Подсказка в поле ввода \"Имя\"', null);
INSERT INTO `content` VALUES ('23', 'Email', 'Подсказка в поле ввода \"Email\"', null);
INSERT INTO `content` VALUES ('24', 'Подписаться на обновления', 'Флажок подписаться на обновления', null);
INSERT INTO `content` VALUES ('25', 'Пароль', 'Подсказка в поле ввода \"Пароль\"', null);
INSERT INTO `content` VALUES ('26', 'Регистрация', 'Кнопка регистрация', null);
INSERT INTO `content` VALUES ('27', 'Ваша профессия или деятельность', 'поле ввода \"Ваша профессия\"', null);
INSERT INTO `content` VALUES ('28', 'Профессия, о которой Вы мечтали в детстве', 'поле ввода ', null);
INSERT INTO `content` VALUES ('29', 'Профессия, которая Вас восхищает', 'поле ввода \"Профессия, которая Вас восхищает\"', 'test');
INSERT INTO `content` VALUES ('30', 'Самое место рассказать о себе', 'поле ввода \"Расскажите о себе\"', null);
INSERT INTO `content` VALUES ('31', 'Личная страница', 'Поле ввода \"Личная страница\"', null);
INSERT INTO `content` VALUES ('32', 'Загрузить Изображение', 'Кнопка \"Загрузить изображение\"', null);
INSERT INTO `content` VALUES ('33', 'Завершить регистрацию', 'Кнопка \"Завершить регистрацию\"', null);
INSERT INTO `content` VALUES ('34', 'Пусто', 'Заголовок пустой отрасли', null);
INSERT INTO `content` VALUES ('35', 'К сожалению, на эту тему ещё нет историй', 'Текст пустой отрасли', null);
INSERT INTO `content` VALUES ('36', 'Стать автором', 'Кнопка \"Стать автором\"', null);
INSERT INTO `content` VALUES ('37', 'Напишите свою', 'Кнопка \"Напишите свою\"', null);
INSERT INTO `content` VALUES ('38', 'Заголовок истории', 'Подсказка \"Заголовок истории\" на странице написания поста', null);
INSERT INTO `content` VALUES ('39', 'Выберите нужные отрасли', 'Название выпадающего списка категорий', null);
INSERT INTO `content` VALUES ('40', 'Краткое описание истории', 'Подсказка в поле \"Краткое описание истории\"', null);
INSERT INTO `content` VALUES ('41', 'Предупреждение', 'Заголовок сообщения при удалении истории', null);
INSERT INTO `content` VALUES ('42', 'История будет удалена безвозвратно, удалить историю ?', 'Текст сообщения при удалении истории', null);
INSERT INTO `content` VALUES ('43', 'Редактирование личной информации', 'Заголовок страницы редактирование личной информации пользователя', null);
INSERT INTO `content` VALUES ('44', 'Сохранить правки', 'Кнопка \"Сохранить правки\" на странице профиля', null);
INSERT INTO `content` VALUES ('45', 'Написать новую историю', 'Кнопка \"Написать новую историю\" на странице профиля', null);
INSERT INTO `content` VALUES ('46', 'Сейчас впишите текст вопроса', 'Текст-подсказка  в поле ввода вопроса юзеру (сейчас \"впишите текст вопроса\")', null);
INSERT INTO `content` VALUES ('47', 'Пользователь не ответил ни на один вопрос.', 'текст, который виден на странице \"ответы\" для всех, КРОМЕ хозяина страницы,  в том случае если юзеру не задан ни один вопрос', null);
INSERT INTO `content` VALUES ('48', 'К сожалению, другие люди пока не могут расспросить Вас о Вашем деле. Чтобы начать получать вопросы, напишите хотя бы одну историю.', 'текст, который виден на странице \"ответы\" для хозяина страницы,  в том случае если юзер не написал ни одной истории.', null);
INSERT INTO `content` VALUES ('49', 'Больше вопросов', 'Кнопка \"Больше вопросов\"', null);
INSERT INTO `content` VALUES ('50', 'К сожалению, Вам еще не задали ни одного вопроса.', 'текст, который виден на странице \"ответы\" для хозяина страницы, в том случае если у юзера уже есть истории', null);
INSERT INTO `content` VALUES ('51', 'Пользователи могут вдохновиться историей только раз в сутки!', 'Текст сообщения о том, что лайк можно ставить раз в сутки', null);
INSERT INTO `content` VALUES ('52', 'Вы уже вдохновлялись данной историей!', 'Текст сообщения о том, что пользователь уже ставил лайк данной истории', null);
INSERT INTO `content` VALUES ('53', 'Ничего не рассказал(а) о себе.', 'Текст, который отображается под именем юзера, который ничего не рассказал о себе. (если поле ', null);
INSERT INTO `content` VALUES ('54', 'Профессии', 'Шапка. заголовок \"Профессии\".', null);
INSERT INTO `content` VALUES ('55', 'Люди', 'Шапка. заголовок \"Люди\".', null);
INSERT INTO `content` VALUES ('56', 'У вас нет новостей.', 'Текст в пустой ленте новостей-если юзер еще ни на кого не подписан, или нет новостей', null);
INSERT INTO `content` VALUES ('57', 'Спасибо! Ваша вопрос отправлен пользователю. Когда он ответит на него, Вы узнаете об этом в своей ленте обновлений.', 'Текст, который появляется перед юзером, когда тот задал вопрос', null);
INSERT INTO `content` VALUES ('58', 'Задать вопрос', 'Кнопка \"Задать вопрос\"', null);
INSERT INTO `content` VALUES ('59', 'Начни печатать', 'Подсказка в строке поиска', null);
INSERT INTO `content` VALUES ('60', 'Ошибка 404 - страница не  найдена', 'Страница 404', null);
INSERT INTO `content` VALUES ('61', '', 'Аватар Дайджест', null);
INSERT INTO `content` VALUES ('62', '<p>Дайджест Ясун<br></p>', 'Текст заголовка Дайджест', null);
INSERT INTO `content` VALUES ('63', '', 'Текст подзаголовка Дайджест', null);
INSERT INTO `content` VALUES ('64', '<p>vk.com/id35</p>', 'Ясун в Вконтакте', '');
INSERT INTO `content` VALUES ('65', '<p>facebook.com/35</p>', 'Ясун в Facebook', '');

-- ----------------------------
-- Table structure for `content_old`
-- ----------------------------
DROP TABLE IF EXISTS `content_old`;
CREATE TABLE `content_old` (
  `id` int(11) NOT NULL,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of content_old
-- ----------------------------
INSERT INTO `content_old` VALUES ('0', 'У нас лучшее место, чтобы читать истории и делиться вдохновением', 'Надпись на главной');
INSERT INTO `content_old` VALUES ('1', 'Что такое Ясун?  ', 'Заголовок страницы О нас');
INSERT INTO `content_old` VALUES ('2', 'Много интересного', 'Содержимое страницы О нас');
INSERT INTO `content_old` VALUES ('3', 'Узнать больше', 'Кнопка на главной');
INSERT INTO `content_old` VALUES ('4', 'mailbox@yasoon.ru', 'Email на странице О нас');
INSERT INTO `content_old` VALUES ('5', 'Не туда попали', 'Надпись на странице 404');
INSERT INTO `content_old` VALUES ('6', 'Здравствуйте, %name%! Вы зарегистрировались на сайте \\\"Ясун\\\".Ваш логин:  %email% Ваш пароль: %password%', 'Письмо о регистрации');
INSERT INTO `content_old` VALUES ('7', 'Логин: %email%\nПароль: %newpass%.\nДля завершения восстановления пароля пройдите по ссылке: %link%', 'Письмо с напоминанием пароля');
INSERT INTO `content_old` VALUES ('8', 'Создайте свой профиль и напишите истории', 'Надпись под заголовком \\\"регистрация\\\"');
INSERT INTO `content_old` VALUES ('9', 'Теперь расскажите чуть больше о себе', 'Надпись под заголовком всё прошло успешно');
INSERT INTO `content_old` VALUES ('10', 'Все ваши деньги теперь принадлежат нам.', 'Текст пользовательского соглашения');

-- ----------------------------
-- Table structure for `content_tags`
-- ----------------------------
DROP TABLE IF EXISTS `content_tags`;
CREATE TABLE `content_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of content_tags
-- ----------------------------
INSERT INTO `content_tags` VALUES ('1', 'name', 'value');

-- ----------------------------
-- Table structure for `friends`
-- ----------------------------
DROP TABLE IF EXISTS `friends`;
CREATE TABLE `friends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reader_id` int(11) NOT NULL COMMENT 'Id того, кто подписывается',
  `writer_id` int(11) NOT NULL COMMENT 'Id того, на кого подписан reader',
  `date_write` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`reader_id`,`writer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of friends
-- ----------------------------
INSERT INTO `friends` VALUES ('4', '41', '41', null);
INSERT INTO `friends` VALUES ('14', '41', '87', null);
INSERT INTO `friends` VALUES ('15', '67', '87', null);
INSERT INTO `friends` VALUES ('17', '87', '88', '2014-02-17 05:16:02');
INSERT INTO `friends` VALUES ('19', '63', '56', '2014-02-17 16:31:57');
INSERT INTO `friends` VALUES ('24', '56', '63', '2014-02-18 18:18:28');
INSERT INTO `friends` VALUES ('25', '63', '67', '2014-03-01 01:50:13');
INSERT INTO `friends` VALUES ('27', '66', '67', '2014-03-01 02:00:06');
INSERT INTO `friends` VALUES ('28', '56', '67', '2014-03-01 02:00:44');
INSERT INTO `friends` VALUES ('30', '67', '94', '2014-03-28 00:23:55');
INSERT INTO `friends` VALUES ('31', '137', '165', null);

-- ----------------------------
-- Table structure for `interview`
-- ----------------------------
DROP TABLE IF EXISTS `interview`;
CREATE TABLE `interview` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of interview
-- ----------------------------
INSERT INTO `interview` VALUES ('1', 'dwsdsds');
INSERT INTO `interview` VALUES ('2', 'tests2');
INSERT INTO `interview` VALUES ('20', 't3');
INSERT INTO `interview` VALUES ('21', 't4');
INSERT INTO `interview` VALUES ('22', 'Очень интересное новое интервью');
INSERT INTO `interview` VALUES ('23', 'Очень интересное новое интервью');
INSERT INTO `interview` VALUES ('24', 'Очень интересное новое интервью');

-- ----------------------------
-- Table structure for `interview_question`
-- ----------------------------
DROP TABLE IF EXISTS `interview_question`;
CREATE TABLE `interview_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interview_id` int(11) NOT NULL,
  `text` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of interview_question
-- ----------------------------
INSERT INTO `interview_question` VALUES ('1', '1', 'dsfsfsf');
INSERT INTO `interview_question` VALUES ('2', '1', 'dfsfsgfsgs');
INSERT INTO `interview_question` VALUES ('12', '2', 'первый');
INSERT INTO `interview_question` VALUES ('13', '2', 'Второй');
INSERT INTO `interview_question` VALUES ('37', '20', '1');
INSERT INTO `interview_question` VALUES ('38', '20', '2');
INSERT INTO `interview_question` VALUES ('39', '21', '1');
INSERT INTO `interview_question` VALUES ('40', '21', '2');
INSERT INTO `interview_question` VALUES ('41', '22', 'потрясающий вопрос');
INSERT INTO `interview_question` VALUES ('42', '22', 'что бы еще спросить у тебя?');
INSERT INTO `interview_question` VALUES ('43', '23', 'потрясающий вопрос');
INSERT INTO `interview_question` VALUES ('44', '23', 'что бы еще спросить у тебя?');
INSERT INTO `interview_question` VALUES ('45', '24', 'потрясающий вопрос');
INSERT INTO `interview_question` VALUES ('46', '24', 'что бы еще спросить у тебя?');

-- ----------------------------
-- Table structure for `partners`
-- ----------------------------
DROP TABLE IF EXISTS `partners`;
CREATE TABLE `partners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partnerBgImg` varchar(255) NOT NULL,
  `parnterText` varchar(255) NOT NULL,
  `parnterLink` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of partners
-- ----------------------------
INSERT INTO `partners` VALUES ('1', '/img/i6.jpg', 'Sheremetiveo airoport work stories<br/> Only for today', 'www.google.ru');

-- ----------------------------
-- Table structure for `post`
-- ----------------------------
DROP TABLE IF EXISTS `post`;
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
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES ('27', '41', 'waedfafd', 'слово слово слово слово', '2014-01-10 00:00:00', 'sfdgsdg', '3', '41', '6');
INSERT INTO `post` VALUES ('41', '41', '', 'cscsc', '2014-02-05 09:23:34', '', '3', '16', '0');
INSERT INTO `post` VALUES ('42', '39', '', '<article questionid=\"1\"><h3>Вопрос 1</h3><div class=\"question_content\">Тут описан ответ на первую историю</div></article>', '2014-02-06 11:22:01', 'Статья', '0', '1', '0');
INSERT INTO `post` VALUES ('53', '49', '', 'text text text text text', '2014-02-07 03:31:29', 'fffff', '0', '2', '0');
INSERT INTO `post` VALUES ('54', '59', 'aaaa', '<article questionid=\"1\"><h3>Вопрос 1</h3><div class=\"question_content\">ddd</div></article>', '2014-02-07 03:54:35', 'aaa', '0', '0', '0');
INSERT INTO `post` VALUES ('55', '59', 'addd', '<article questionid=\"1\"><h3>Вопрос 1</h3><div class=\"question_content\">eeee</div></article>', '2014-02-07 04:06:55', 'aaa', '0', '0', '0');
INSERT INTO `post` VALUES ('56', '59', 'Краткое описание истории', '<article questionid=\"1\"><h3>Вопрос 1</h3><div class=\"question_content\">Ответ на первый вопрос</div></article>', '2014-02-07 04:10:18', 'Заголовок новой истории', '0', '0', '0');
INSERT INTO `post` VALUES ('57', '62', 'описание нового поста', '<article questionid=\"1\"><h3>Вопрос 1</h3><div class=\"question_content\">Ответ на первый вопрос</div></article><article questionid=\"2\"><h3>Вопрос 2</h3><div class=\"question_content\">Ответ на 2 вопрос</div></article>', '2014-02-07 04:37:43', 'Новый пост', '0', '2', '0');
INSERT INTO `post` VALUES ('58', '64', 'iuiuiuiuiu', '<article questionid=\"1\"><h3>Вопрос 1</h3><div class=\"question_content\">ghghghgg\nglglglg\nglglgl\n\n\ngl;glgllgl\nglglgl\n\n\ngkgkgkgkg\nglglglg\nglglglgl\n\n\n\nglglglg\nglglglll\nglglgllg\ngkgkgkllgk\n\ngkgkgkgkk\nglgllglglglglgl\ngkgkglgkggkgkg\ngkgkgklg</div></article><article questionid=\"2\"><h3>Вопрос 2</h3><div class=\"question_content\">uuuukukuk\nopopopop</div></article>', '2014-02-07 10:21:05', 'wert', '0', '2', '0');
INSERT INTO `post` VALUES ('59', '66', 'exetp', '<article questionid=\"1\"><h3>Вопрос 1</h3><div class=\"question_content\">Question 1</div></article><article questionid=\"2\"><h3>Вопрос 2</h3><div class=\"question_content\">Question 2</div></article>', '2014-02-07 11:19:23', 'New post', '0', '5', '0');
INSERT INTO `post` VALUES ('60', '66', 'exetp', '<article questionid=\"1\"><h3>Вопрос 1</h3><div class=\"question_content\">Question 1</div></article><article questionid=\"2\"><h3>Вопрос 2</h3><div class=\"question_content\">Question 2</div></article>', '2014-02-07 11:19:32', 'New post', '0', '5', '0');
INSERT INTO `post` VALUES ('61', '66', 'Краткое поисание ', '<article questionid=\"1\"><h3>Вопрос 1</h3><div class=\"question_content\">Это первый вопрос</div></article><article questionid=\"2\"><h3>Вопрос 2</h3><div class=\"question_content\">Это всторой вопрос</div></article>', '2014-02-10 01:54:33', 'Текст новой истории', '0', '3', '0');
INSERT INTO `post` VALUES ('62', '66', 'тттт', '<article questionid=\"1\"><h3>Вопрос 1</h3><div class=\"question_content\">фыв</div></article><article questionid=\"2\"><h3>Вопрос 2</h3><div class=\"question_content\">фыв</div></article>', '2014-02-10 02:00:37', 'Пост', '0', '3', '0');
INSERT INTO `post` VALUES ('70', '39', 'rggegeg', '<article questionid=\"1\"><h3>Вопрос 1</h3><div class=\"question_content\">rggfgdgdfgdg</div></article>', '2014-02-11 10:55:57', 'test indexisto', '0', '4', '0');
INSERT INTO `post` VALUES ('72', '67', 'а я не поехал. я купил мотыля и пошел на реку. я люблю рыбалку!', '<article questionid=\"57\"><h3>Вопрос 1</h3><div class=\"question_content\">наша делигация выступила</div></article><article questionid=\"58\"><h3>Вопрос 2</h3><div class=\"question_content\">с пакетом конструктивных предложений\n</div></article>', '2014-02-11 14:44:14', 'Международная конференция по вопросам интеграции ', '0', '4', '0');
INSERT INTO `post` VALUES ('80', '63', '111', '<article questionid=\"1\"><h3>dsfsfsf</h3><div class=\"question_content\"></div></article><article questionid=\"2\"><h3>dfsfsgfsgs</h3><div class=\"question_content\">444</div></article>', '2014-02-21 17:39:04', 'catpost', '0', '4', '0');
INSERT INTO `post` VALUES ('87', '63', 'йййй', '<article questionid=\"1\"><h3>Вопрос 1</h3><div class=\"question_content\">ууу</div></article><article questionid=\"2\"><h3>Вопрос 2</h3><div class=\"question_content\">ккк</div></article>', '2014-02-17 10:06:23', 'Хистори', '0', '3', '0');
INSERT INTO `post` VALUES ('88', '63', 'фывыфв', '<article questionid=\"1\"><h3>Вопрос 1</h3><div class=\"question_content\">фыв</div></article><article questionid=\"2\"><h3>Вопрос 2</h3><div class=\"question_content\">фывыф</div></article>', '2014-02-17 10:07:07', 'фывфы', '0', '1', '0');
INSERT INTO `post` VALUES ('89', '63', 'фыв', '<article questionid=\"1\"><h3>Вопрос 1</h3><div class=\"question_content\">фыв</div></article><article questionid=\"2\"><h3>Вопрос 2</h3><div class=\"question_content\"></div></article>', '2014-02-17 10:13:34', 'фыв', '0', '1', '0');
INSERT INTO `post` VALUES ('95', '56', 'История написанная при помощи редактора', '<article questionid=\"1\"><h3>dsfsfsf</h3><div class=\"question_content\"><h1 style=\"text-align: center;\">Вот и история</h1><blockquote>Цытата великого человека</blockquote></div></article>', '2014-02-27 17:49:08', 'История написанная при помощи редактора', '0', '2', '0');
INSERT INTO `post` VALUES ('96', '56', 'Жизнь', '<article questionid=\"1\"><h3 class=\"questionTitle\">dsfsfsf</h3><div class=\"question_content\"><blockquote>asdasd</blockquote>\n</div></article><article questionid=\"2\"><h3 class=\"questionTitle\">dfsfsgfsgs</h3><div class=\"question_content\"><h3>sadasdas</h3><p>Тестовая история о жизни</p>\n</div></article>', '2014-02-27 18:39:35', 'История жизни', '0', '4', '0');
INSERT INTO `post` VALUES ('97', '56', 'ddd', '<article questionid=\"1\" class=\"questionContent\"><h3 class=\"questionTitle\">dsfsfsf</h3><div class=\"question_content\"><p></p><p><img src=\"/upload/images/e95eff49a9d7aad75e05c2bc27b38e19.jpg\" style=\"width: 450px; height: 333px; float: left; margin: 0px 10px 10px 0px;\" alt=\"\"></p>&nbsp; Test<p></p></div></article>', '2014-02-27 20:49:09', 'Test', '0', '2', '0');
INSERT INTO `post` VALUES ('99', '107', 'Попробуем запрограммировать робота', '<article questionid=\"1\" class=\"questionContent\"><h3 class=\"questionTitle\">dsfsfsf</h3><div class=\"question_content\"><p></p><p></p><p></p><ul><li>Один</li><li>Два</li><li><span style=\"font-size: 15px; line-height: 1.45em;\">Три</span><br></li></ul><div><br></div><div>текст&nbsp;</div><div>для текста&nbsp;</div><div>для теста отступа</div><div><br></div><ol><li>Пи</li><li>ту</li><li>пи</li></ol><p></p><table id=\"table5134\"><tbody><tr><td>1</td><td>2</td><td>3</td></tr><tr><td>4</td><td>5</td><td>6</td></tr></tbody></table><p></p><a href=\"http://yasoon.mnb-t.com/google.com\">Поиск</a><br><p></p>\n<p></p><p><img src=\"/upload/images/619b113e52331b860566c7a0d9b57591.jpg\" style=\"\"></p><object width=\"560\" height=\"315\"><param name=\"movie\" value=\"//www.youtube.com/v/K0_GCuim9kY?hl=ru_RU&amp;version=3\"><param name=\"allowFullScreen\" value=\"true\"><param name=\"allowscriptaccess\" value=\"always\"><embed src=\"//www.youtube.com/v/K0_GCuim9kY?hl=ru_RU&amp;version=3\" type=\"application/x-shockwave-flash\" width=\"560\" height=\"315\" allowscriptaccess=\"always\" allowfullscreen=\"true\"></object>\n</div></article><article questionid=\"2\" class=\"questionContent\"><h3 class=\"questionTitle\">dfsfsgfsgs</h3><div class=\"question_content\"><p>У нас что-то получится</p></div></article><article questionid=\"1\" class=\"questionContent\"><h3 class=\"questionTitle\">dsfsfsf</h3><div class=\"question_content\"><p></p><p></p><p></p><ul><li>Один</li><li>Два</li><li><span style=\"font-size: 15px; line-height: 1.45em;\">Три</span><br></li></ul><div><br></div><div>текст&nbsp;</div><div>для текста&nbsp;</div><div>для теста отступа</div><div><br></div><ol><li>Пи</li><li>ту</li><li>пи</li></ol><p></p><table id=\"table5134\"><tbody><tr><td>1</td><td>2</td><td>3</td></tr><tr><td>4</td><td>5</td><td>6</td></tr></tbody></table><p></p><a href=\"http://yasoon.mnb-t.com/google.com\">Поиск</a><br><p></p>\n<p></p><p><img src=\"/upload/images/619b113e52331b860566c7a0d9b57591.jpg\" style=\"\"></p><object width=\"560\" height=\"315\"><param name=\"movie\" value=\"//www.youtube.com/v/K0_GCuim9kY?hl=ru_RU&amp;version=3\"><param name=\"allowFullScreen\" value=\"true\"><param name=\"allowscriptaccess\" value=\"always\"><embed src=\"//www.youtube.com/v/K0_GCuim9kY?hl=ru_RU&amp;version=3\" type=\"application/x-shockwave-flash\" width=\"560\" height=\"315\" allowscriptaccess=\"always\" allowfullscreen=\"true\"></object>\n</div></article><article questionid=\"2\" class=\"questionContent\"><h3 class=\"questionTitle\">dfsfsgfsgs</h3><div class=\"question_content\"><p>У нас что-то получится</p></div></article>', '2014-04-01 19:51:03', 'Попробуем', '0', '3', '0');
INSERT INTO `post` VALUES ('104', '123', 'история', '<article questionid=\"1\" class=\"questionContent\"><h3 class=\"questionTitle\">dsfsfsf</h3><div class=\"question_content\"><p>ответ<br></p></div></article><article questionid=\"2\" class=\"questionContent\"><h3 class=\"questionTitle\">dfsfsgfsgs</h3><div class=\"question_content\"><p>ответ<br></p></div></article>', '2014-03-25 14:09:39', 'Новая история', '0', '0', '0');
INSERT INTO `post` VALUES ('105', '67', 'очень краткое описание', '<article questionid=\"43\" class=\"questionContent\"><h3 class=\"questionTitle\">потрясающий вопрос</h3><div class=\"question_content\"><p>какой вопрос, такой и ответ!</p></div></article><article questionid=\"44\" class=\"questionContent\"><h3 class=\"questionTitle\">что бы еще спросить у тебя?</h3><div class=\"question_content\"><p>да не надо больге ничего</p></div></article>', '2014-03-26 23:45:01', 'Супер интервью', '0', '0', '0');
INSERT INTO `post` VALUES ('106', '94', 'очень краткое, но в то же время очень полное описание истории  очень краткое, но в то же время очень полное описание истории очень краткое, но в то же время очень полное описание истории очень краткое, но в то же время очень полное описание истории очень ', '<article questionid=\"2\" class=\"questionContent\"><h3 class=\"questionTitle\">dfsfsgfsgs</h3><div class=\"question_content\"><p>отлчиный вопрос, непонятно правда что на него отвечать&nbsp;</p><blockquote>возможно, все не так просто</blockquote><p>хотя</p><p>не знаю ни одного человека каоторый бы</p><blockquote>согласился на такое</blockquote><p>вот вам и картинка напоследок</p><p><strike>хотя не дам</strike></p><p>давайте лучше <a href=\"www.yandex.ru\">ссылку</a>.</p></div></article>', '2014-03-27 23:54:19', 'Попробуем после всего этого написать пост', '0', '0', '0');
INSERT INTO `post` VALUES ('107', '94', 'сказка про репку', '<article questionid=\"1\" class=\"questionContent\"><h3 class=\"questionTitle\">dsfsfsf</h3><div class=\"question_content\"><p>&nbsp;ввщщ &nbsp;вщвщвщв &nbsp;вщвщвщвщв &nbsp;вдвщвщвщв &nbsp;вщвщвщвщвщ вщвщв&nbsp;«Даже это «Даже это попадает в YouTube. Это аморально и подло», — сказал Эрдоган, пообещав «добраться до YouTube».попадает в YouTube. Это аморально и подло», — сказал Эрдоган, пообещав «добраться до YouTube». &nbsp;«Даже это попадает в YouTube. Это аморально и подло», — сказал Эрдоган, пообещав «добраться до YouTube». &nbsp;«Даже это попадает в YouTube. Это аморально и подло», — сказал Эрдоган, пообещав «добраться до YouTube». &nbsp;«Даже это попадает в YouTube. Это аморально и подло», — сказал Эрдоган, пообещав «добрат<b>ься до YouTube»</b>.</p><p>fffff&nbsp;«Даже это попадает в YouTube. Это аморально и подло», — сказал Эрдоган, пообещав «добраться до YouTube».</p><p></p><ul><li>fkfffkfkfk</li><li>f;flflf &nbsp;fpffpfpfpfp f«Даже это попадает в YouTube. Это аморально и подло», — сказал Эрдоган, пообещав «добраться до YouTube».</li></ul><div>ffofofo &nbsp;«Даже это попадает в YouTube. Это аморально и подло», — сказал Эрдоган, пообещав «добраться до YouTube».</div><p></p></div></article><article questionid=\"1\" class=\"questionContent\"><h3 class=\"questionTitle\">dsfsfsf</h3><div class=\"question_content\"><p>&nbsp;ввщщ &nbsp;вщвщвщв &nbsp;вщвщвщвщв &nbsp;вдвщвщвщв &nbsp;вщвщвщвщвщ вщвщв&nbsp;«Даже это «Даже это попадает в YouTube. Это аморально и подло», — сказал Эрдоган, пообещав «добраться до YouTube».попадает в YouTube. Это аморально и подло», — сказал Эрдоган, пообещав «добраться до YouTube». &nbsp;«Даже это попадает в YouTube. Это аморально и подло», — сказал Эрдоган, пообещав «добраться до YouTube». &nbsp;«Даже это попадает в YouTube. Это аморально и подло», — сказал Эрдоган, пообещав «добраться до YouTube». &nbsp;«Даже это попадает в YouTube. Это аморально и подло», — сказал Эрдоган, пообещав «добрат<b>ься до YouTube»</b>.</p><p>fffff&nbsp;«Даже это попадает в YouTube. Это аморально и подло», — сказал Эрдоган, пообещав «добраться до YouTube».</p><p></p><ul><li>fkfffkfkfk</li><li>f;flflf &nbsp;fpffpfpfpfp f«Даже это попадает в YouTube. Это аморально и подло», — сказал Эрдоган, пообещав «добраться до YouTube».</li></ul><div>ffofofo &nbsp;«Даже это попадает в YouTube. Это аморально и подло», — сказал Эрдоган, пообещав «добраться до YouTube».</div><p></p></div></article>', '2014-03-31 22:41:31', 'Попытка №2', '0', '0', '0');
INSERT INTO `post` VALUES ('108', '137', 'tt', '<article questionid=\"1\" class=\"questionContent\"><h3 class=\"questionTitle\">dsfsfsf</h3><div class=\"question_content\"><p>tt<br></p></div></article><article questionid=\"2\" class=\"questionContent\"><h3 class=\"questionTitle\">dfsfsgfsgs</h3><div class=\"question_content\"><p>tt<br></p></div></article>', '2014-03-28 19:53:19', 'tt', '0', '0', '0');
INSERT INTO `post` VALUES ('109', '137', 'sdfasd fsda fsda fsda fasd fasdf ', '<article questionid=\"0\" class=\"questionContent\">\n	<h3 class=\"questionTitle\">\n		dsfsfsf\n	</h3>\n	<div class=\"question_content\">\n		<p>sdf sdfasdfsdaf fsdaf asdnfm,asd ,bfasd.&nbsp;</p>\n	</div>\n</article><article questionid=\"1\" class=\"questionContent\">\n	<h3 class=\"questionTitle\">\n		dfsfsgfsgs\n	</h3>\n	<div class=\"question_content\">\n		<p>asdf sdaf sdafmsan fmnsdam, nfbasdnbf k.jasdyfh j.dsbnafd</p>\n	</div>\n</article>', '2014-05-14 19:45:54', 'asdfasdfasd', '0', '0', '0');
INSERT INTO `post` VALUES ('110', '137', 'as fasd fasd', '<article questionid=\"0\" class=\"questionContent\">\n	<h3 class=\"questionTitle\">\n		dsfsfsf\n	</h3>\n	<div class=\"question_content\">\n		<p>sdaf sdfasd fsda fasd</p>\n	</div>\n</article><article questionid=\"1\" class=\"questionContent\">\n	<h3 class=\"questionTitle\">\n		dfsfsgfsgs\n	</h3>\n	<div class=\"question_content\">\n		<p>sdf asdf asdf gfsd h&nbsp;</p>\n	</div>\n</article>', '2014-05-14 19:47:38', 'fgasdf dsf', '0', '0', '0');
INSERT INTO `post` VALUES ('111', '137', 'fasdf asd fasdf asdf sda', '<article questionid=\"0\" class=\"questionContent\">\n	<h3 class=\"questionTitle\">\n		dsfsfsf\n	</h3>\n	<div class=\"question_content\">\n		<p>sda fsda hdg nf&nbsp;</p>\n	</div>\n</article><article questionid=\"1\" class=\"questionContent\">\n	<h3 class=\"questionTitle\">\n		dfsfsgfsgs\n	</h3>\n	<div class=\"question_content\">\n		<p>bvn bvcn cvaarw fdsf asd</p>\n	</div>\n</article>', '2014-05-14 19:48:32', 'fgsdaf sda', '0', '0', '0');
INSERT INTO `post` VALUES ('112', '137', 'sdfg sdfg dfhbcnv sdafa sfsdafd gsdfg d', '<article questionid=\"0\" class=\"questionContent\">\n	<h3 class=\"questionTitle\">\n		dsfsfsf\n	</h3>\n	<div class=\"question_content\">\n		<p>sdfg sdfg sdfn gdfhg sdfmn gsdfmng dfdfg dfg</p>\n	</div>\n</article><article questionid=\"1\" class=\"questionContent\">\n	<h3 class=\"questionTitle\">\n		dfsfsgfsgs\n	</h3>\n	<div class=\"question_content\">\n		<p>sdf gsdfg sdfn vgnwer ert gdf gsdfg dffdg dfg df</p>\n	</div>\n</article>', '2014-05-14 19:49:11', 'dfg sdfg sdfg', '0', '0', '0');
INSERT INTO `post` VALUES ('113', '137', 'sdaf sdaf asdfasd ', '<article questionid=\"0\" class=\"questionContent\">\n	<h3 class=\"questionTitle\">\n		dsfsfsf\n	</h3>\n	<div class=\"question_content\">\n		<p>asdf sdaf ffd bxcv&nbsp;</p>\n	</div>\n</article><article questionid=\"1\" class=\"questionContent\">\n	<h3 class=\"questionTitle\">\n		dfsfsgfsgs\n	</h3>\n	<div class=\"question_content\">\n		<p>cvb xcvb xcnvb xcncva f</p>\n	</div>\n</article>', '2014-05-14 19:57:23', 'dfdas fsda sdfsafsd a', '0', '0', '0');
INSERT INTO `post` VALUES ('124', '165', 'asdf sdfasd f asd ', '<article questionid=\"0\" class=\"questionContent\">\n	<h3 class=\"questionTitle\">\n		dsfsfsf\n	</h3>\n	<div class=\"question_content\">\n		<p>asdf dasfasdf asd</p>\n	</div>\n</article><article questionid=\"1\" class=\"questionContent\">\n	<h3 class=\"questionTitle\">\n		dfsfsgfsgs\n	</h3>\n	<div class=\"question_content\">\n		<p>sdf asdfasdfasdf asdfasd</p>\n	</div>\n</article>', '2014-05-14 20:15:53', 'sdaf dasfasdf asdfasd', '0', '0', '0');
INSERT INTO `post` VALUES ('125', '165', 'sdf asdf asdf sda', '<article questionid=\"0\" class=\"questionContent\">\n	<h3 class=\"questionTitle\">\n		dsfsfsf\n	</h3>\n	<div class=\"question_content\">\n		<p>sad fasd&nbsp;</p>\n	</div>\n</article><article questionid=\"1\" class=\"questionContent\">\n	<h3 class=\"questionTitle\">\n		dfsfsgfsgs\n	</h3>\n	<div class=\"question_content\">\n		<p>adfdas</p>\n	</div>\n</article>', '2014-05-14 20:16:57', 'fdsaf asdfasd fasd', '0', '0', '0');
INSERT INTO `post` VALUES ('126', '165', 'fasd fasd fdas fasd fasdf', '<article questionid=\"0\" class=\"questionContent\">\n	<h3 class=\"questionTitle\">\n		dsfsfsf\n	</h3>\n	<div class=\"question_content\">\n		<p>asdf sdaf asd</p>\n	</div>\n</article><article questionid=\"1\" class=\"questionContent\">\n	<h3 class=\"questionTitle\">\n		dfsfsgfsgs\n	</h3>\n	<div class=\"question_content\">\n		<p>asdf asdf asdf</p>\n	</div>\n</article>', '2014-05-14 20:17:25', 'sdaf sdafasd', '0', '0', '0');
INSERT INTO `post` VALUES ('127', '165', 'фыв афы вафы', '<article questionid=\"0\" class=\"questionContent\">\n	<h3 class=\"questionTitle\">\n		dsfsfsf\n	</h3>\n	<div class=\"question_content\">\n		<p>ыфва&nbsp;</p>\n	</div>\n</article><article questionid=\"1\" class=\"questionContent\">\n	<h3 class=\"questionTitle\">\n		dfsfsgfsgs\n	</h3>\n	<div class=\"question_content\">\n		<p>ыва ф</p>\n	</div>\n</article>', '2014-05-15 17:10:44', 'ыва фыва фыва', '0', '0', '0');

-- ----------------------------
-- Table structure for `posts_timeline`
-- ----------------------------
DROP TABLE IF EXISTS `posts_timeline`;
CREATE TABLE `posts_timeline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of posts_timeline
-- ----------------------------

-- ----------------------------
-- Table structure for `post_answer`
-- ----------------------------
DROP TABLE IF EXISTS `post_answer`;
CREATE TABLE `post_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of post_answer
-- ----------------------------
INSERT INTO `post_answer` VALUES ('7', '41', '1', 'fvsvd');
INSERT INTO `post_answer` VALUES ('8', '41', '2', 'gsfgs');
INSERT INTO `post_answer` VALUES ('13', '54', '1', 'ddd');
INSERT INTO `post_answer` VALUES ('14', '54', '2', '');
INSERT INTO `post_answer` VALUES ('15', '55', '1', 'eeee');
INSERT INTO `post_answer` VALUES ('16', '55', '2', '');
INSERT INTO `post_answer` VALUES ('17', '56', '1', 'Ответ на первый вопрос');
INSERT INTO `post_answer` VALUES ('18', '56', '2', '');
INSERT INTO `post_answer` VALUES ('19', '57', '1', 'Ответ на первый вопрос');
INSERT INTO `post_answer` VALUES ('20', '57', '2', 'Ответ на 2 вопрос');
INSERT INTO `post_answer` VALUES ('21', '58', '1', 'ghghghgg\nglglglg\nglglgl\n\n\ngl;glgllgl\nglglgl\n\n\ngkgkgkgkg\nglglglg\nglglglgl\n\n\n\nglglglg\nglglglll\nglglgllg\ngkgkgkllgk\n\ngkgkgkgkk\nglgllglglglglgl\ngkgkglgkggkgkg\ngkgkgklg');
INSERT INTO `post_answer` VALUES ('22', '58', '2', 'uuuukukuk\nopopopop');
INSERT INTO `post_answer` VALUES ('23', '59', '1', 'Question 1');
INSERT INTO `post_answer` VALUES ('24', '59', '2', 'Question 2');
INSERT INTO `post_answer` VALUES ('25', '60', '1', 'Question 1');
INSERT INTO `post_answer` VALUES ('26', '60', '2', 'Question 2');
INSERT INTO `post_answer` VALUES ('27', '61', '1', 'Это первый вопрос');
INSERT INTO `post_answer` VALUES ('28', '61', '2', 'Это всторой вопрос');
INSERT INTO `post_answer` VALUES ('29', '62', '1', 'фыв');
INSERT INTO `post_answer` VALUES ('30', '62', '2', 'фыв');
INSERT INTO `post_answer` VALUES ('33', '53', '1', 'reeretfffff');
INSERT INTO `post_answer` VALUES ('34', '53', '2', 'dfsfsf');
INSERT INTO `post_answer` VALUES ('53', '70', '1', 'rggfgdgdfgdg');
INSERT INTO `post_answer` VALUES ('54', '70', '2', '');
INSERT INTO `post_answer` VALUES ('81', '80', '1', '');
INSERT INTO `post_answer` VALUES ('82', '80', '2', '444');
INSERT INTO `post_answer` VALUES ('95', '87', '1', 'ууу');
INSERT INTO `post_answer` VALUES ('96', '87', '2', 'ккк');
INSERT INTO `post_answer` VALUES ('97', '88', '1', 'фыв');
INSERT INTO `post_answer` VALUES ('98', '88', '2', 'фывыф');
INSERT INTO `post_answer` VALUES ('99', '89', '1', 'фыв');
INSERT INTO `post_answer` VALUES ('100', '89', '2', '');
INSERT INTO `post_answer` VALUES ('119', '95', '1', '<h1 style=\"text-align: center;\">Вот и история</h1><blockquote>Цытата великого человека</blockquote>');
INSERT INTO `post_answer` VALUES ('120', '95', '2', '');
INSERT INTO `post_answer` VALUES ('121', '95', '30', '');
INSERT INTO `post_answer` VALUES ('122', '95', '31', '');
INSERT INTO `post_answer` VALUES ('123', '95', '32', '');
INSERT INTO `post_answer` VALUES ('124', '95', '33', '');
INSERT INTO `post_answer` VALUES ('125', '96', '1', '<blockquote>asdasd</blockquote>\n');
INSERT INTO `post_answer` VALUES ('126', '96', '2', '<h3>sadasdas</h3><p>Тестовая история о жизни</p>\n');
INSERT INTO `post_answer` VALUES ('127', '96', '30', '');
INSERT INTO `post_answer` VALUES ('128', '96', '31', '');
INSERT INTO `post_answer` VALUES ('129', '96', '32', '');
INSERT INTO `post_answer` VALUES ('130', '96', '33', '');
INSERT INTO `post_answer` VALUES ('131', '97', '1', '<p><p><img src=\"/upload/images/e95eff49a9d7aad75e05c2bc27b38e19.jpg\" style=\"width: 450px; height: 333px; float: left; margin: 0px 10px 10px 0px;\" alt=\"\"></p>&nbsp; Test</p>');
INSERT INTO `post_answer` VALUES ('132', '97', '2', '');
INSERT INTO `post_answer` VALUES ('133', '97', '30', '');
INSERT INTO `post_answer` VALUES ('134', '97', '31', '');
INSERT INTO `post_answer` VALUES ('135', '97', '32', '');
INSERT INTO `post_answer` VALUES ('136', '97', '33', '');
INSERT INTO `post_answer` VALUES ('139', '99', '1', '<p></p><p></p><p></p><ul><li>Один</li><li>Два</li><li><span style=\"font-size: 15px; line-height: 1.45em;\">Три</span><br></li></ul><div><br></div><div>текст&nbsp;</div><div>для текста&nbsp;</div><div>для теста отступа</div><div><br></div><ol><li>Пи</li><li>ту</li><li>пи</li></ol><p></p><table id=\"table5134\"><tbody><tr><td>1</td><td>2</td><td>3</td></tr><tr><td>4</td><td>5</td><td>6</td></tr></tbody></table><p></p><a href=\"http://yasoon.mnb-t.com/google.com\">Поиск</a><br><p></p>\n<p></p><p><img src=\"/upload/images/619b113e52331b860566c7a0d9b57591.jpg\" style=\"\"></p><object width=\"560\" height=\"315\"><param name=\"movie\" value=\"//www.youtube.com/v/K0_GCuim9kY?hl=ru_RU&amp;version=3\"><param name=\"allowFullScreen\" value=\"true\"><param name=\"allowscriptaccess\" value=\"always\"><embed src=\"//www.youtube.com/v/K0_GCuim9kY?hl=ru_RU&amp;version=3\" type=\"application/x-shockwave-flash\" width=\"560\" height=\"315\" allowscriptaccess=\"always\" allowfullscreen=\"true\"></object>\n');
INSERT INTO `post_answer` VALUES ('140', '99', '2', '<p>У нас что-то получится</p>');
INSERT INTO `post_answer` VALUES ('149', '104', '1', '<p>ответ<br></p>');
INSERT INTO `post_answer` VALUES ('150', '104', '2', '<p>ответ<br></p>');
INSERT INTO `post_answer` VALUES ('151', '105', '43', '<p>какой вопрос, такой и ответ!</p>');
INSERT INTO `post_answer` VALUES ('152', '105', '44', '<p>да не надо больге ничего</p>');
INSERT INTO `post_answer` VALUES ('153', '106', '1', '');
INSERT INTO `post_answer` VALUES ('154', '106', '2', '<p>отлчиный вопрос, непонятно правда что на него отвечать&nbsp;</p><blockquote>возможно, все не так просто</blockquote><p>хотя</p><p>не знаю ни одного человека каоторый бы</p><blockquote>согласился на такое</blockquote><p>вот вам и картинка напоследок</p><p><strike>хотя не дам</strike></p><p>давайте лучше <a href=\"www.yandex.ru\">ссылку</a>.</p>');
INSERT INTO `post_answer` VALUES ('155', '107', '1', '<p>&nbsp;ввщщ &nbsp;вщвщвщв &nbsp;вщвщвщвщв &nbsp;вдвщвщвщв &nbsp;вщвщвщвщвщ вщвщв&nbsp;«Даже это «Даже это попадает в YouTube. Это аморально и подло», — сказал Эрдоган, пообещав «добраться до YouTube».попадает в YouTube. Это аморально и подло», — сказал Эрдоган, пообещав «добраться до YouTube». &nbsp;«Даже это попадает в YouTube. Это аморально и подло», — сказал Эрдоган, пообещав «добраться до YouTube». &nbsp;«Даже это попадает в YouTube. Это аморально и подло», — сказал Эрдоган, пообещав «добраться до YouTube». &nbsp;«Даже это попадает в YouTube. Это аморально и подло», — сказал Эрдоган, пообещав «добрат<b>ься до YouTube»</b>.</p><p>fffff&nbsp;«Даже это попадает в YouTube. Это аморально и подло», — сказал Эрдоган, пообещав «добраться до YouTube».</p><p><ul><li>fkfffkfkfk</li><li>f;flflf &nbsp;fpffpfpfpfp f«Даже это попадает в YouTube. Это аморально и подло», — сказал Эрдоган, пообещав «добраться до YouTube».</li></ul><div>ffofofo &nbsp;«Даже это попадает в YouTube. Это аморально и подло», — сказал Эрдоган, пообещав «добраться до YouTube».</div></p>');
INSERT INTO `post_answer` VALUES ('156', '107', '2', '');
INSERT INTO `post_answer` VALUES ('157', '108', '1', '<p>tt<br></p>');
INSERT INTO `post_answer` VALUES ('158', '108', '2', '<p>tt<br></p>');

-- ----------------------------
-- Table structure for `post_category`
-- ----------------------------
DROP TABLE IF EXISTS `post_category`;
CREATE TABLE `post_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=248 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of post_category
-- ----------------------------
INSERT INTO `post_category` VALUES ('7', '27', '1');
INSERT INTO `post_category` VALUES ('14', '41', '1');
INSERT INTO `post_category` VALUES ('16', '41', '2');
INSERT INTO `post_category` VALUES ('45', '54', '1');
INSERT INTO `post_category` VALUES ('46', '55', '2');
INSERT INTO `post_category` VALUES ('47', '56', '1');
INSERT INTO `post_category` VALUES ('48', '57', '1');
INSERT INTO `post_category` VALUES ('49', '57', '2');
INSERT INTO `post_category` VALUES ('50', '58', '1');
INSERT INTO `post_category` VALUES ('51', '58', '2');
INSERT INTO `post_category` VALUES ('52', '59', '1');
INSERT INTO `post_category` VALUES ('53', '59', '2');
INSERT INTO `post_category` VALUES ('54', '60', '1');
INSERT INTO `post_category` VALUES ('55', '60', '2');
INSERT INTO `post_category` VALUES ('56', '61', '2');
INSERT INTO `post_category` VALUES ('57', '62', '2');
INSERT INTO `post_category` VALUES ('110', '53', '1');
INSERT INTO `post_category` VALUES ('125', '53', '4');
INSERT INTO `post_category` VALUES ('126', '53', '5');
INSERT INTO `post_category` VALUES ('127', '53', '7');
INSERT INTO `post_category` VALUES ('135', '70', '1');
INSERT INTO `post_category` VALUES ('136', '70', '2');
INSERT INTO `post_category` VALUES ('137', '70', '4');
INSERT INTO `post_category` VALUES ('142', '72', '14');
INSERT INTO `post_category` VALUES ('143', '72', '19');
INSERT INTO `post_category` VALUES ('163', '80', '5');
INSERT INTO `post_category` VALUES ('180', '80', '7');
INSERT INTO `post_category` VALUES ('186', '80', '3');
INSERT INTO `post_category` VALUES ('187', '87', '2');
INSERT INTO `post_category` VALUES ('188', '87', '3');
INSERT INTO `post_category` VALUES ('189', '88', '2');
INSERT INTO `post_category` VALUES ('190', '88', '3');
INSERT INTO `post_category` VALUES ('191', '89', '2');
INSERT INTO `post_category` VALUES ('202', '95', '6');
INSERT INTO `post_category` VALUES ('203', '96', '3');
INSERT INTO `post_category` VALUES ('204', '97', '2');
INSERT INTO `post_category` VALUES ('206', '99', '12');
INSERT INTO `post_category` VALUES ('214', '104', '2');
INSERT INTO `post_category` VALUES ('215', '105', '2');
INSERT INTO `post_category` VALUES ('216', '105', '5');
INSERT INTO `post_category` VALUES ('217', '106', '4');
INSERT INTO `post_category` VALUES ('218', '106', '18');
INSERT INTO `post_category` VALUES ('219', '107', '1');
INSERT INTO `post_category` VALUES ('220', '108', '1');
INSERT INTO `post_category` VALUES ('221', '108', '2');
INSERT INTO `post_category` VALUES ('222', '109', '1');
INSERT INTO `post_category` VALUES ('223', '109', '3');
INSERT INTO `post_category` VALUES ('224', '110', '4');
INSERT INTO `post_category` VALUES ('225', '110', '5');
INSERT INTO `post_category` VALUES ('226', '112', '5');
INSERT INTO `post_category` VALUES ('227', '112', '9');
INSERT INTO `post_category` VALUES ('228', '113', '3');
INSERT INTO `post_category` VALUES ('229', '113', '6');
INSERT INTO `post_category` VALUES ('230', '113', '8');
INSERT INTO `post_category` VALUES ('231', '114', '3');
INSERT INTO `post_category` VALUES ('232', '114', '6');
INSERT INTO `post_category` VALUES ('233', '115', '1');
INSERT INTO `post_category` VALUES ('234', '116', '4');
INSERT INTO `post_category` VALUES ('235', '116', '7');
INSERT INTO `post_category` VALUES ('236', '117', '1');
INSERT INTO `post_category` VALUES ('237', '117', '3');
INSERT INTO `post_category` VALUES ('238', '118', '5');
INSERT INTO `post_category` VALUES ('239', '120', '1');
INSERT INTO `post_category` VALUES ('240', '121', '1');
INSERT INTO `post_category` VALUES ('241', '121', '7');
INSERT INTO `post_category` VALUES ('242', '122', '1');
INSERT INTO `post_category` VALUES ('243', '123', '3');
INSERT INTO `post_category` VALUES ('244', '124', '1');
INSERT INTO `post_category` VALUES ('245', '125', '1');
INSERT INTO `post_category` VALUES ('246', '126', '1');
INSERT INTO `post_category` VALUES ('247', '127', '1');

-- ----------------------------
-- Table structure for `post_likes`
-- ----------------------------
DROP TABLE IF EXISTS `post_likes`;
CREATE TABLE `post_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `user_ip` varchar(20) NOT NULL,
  `last_date` datetime NOT NULL,
  `count_likes` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of post_likes
-- ----------------------------
INSERT INTO `post_likes` VALUES ('12', '22', '0', '93.170.155.159', '2014-02-17 15:20:46', '3');
INSERT INTO `post_likes` VALUES ('13', '22', '39', '0', '2014-02-17 10:22:07', '2');
INSERT INTO `post_likes` VALUES ('14', '59', '63', '0', '2014-02-11 07:41:09', '1');
INSERT INTO `post_likes` VALUES ('15', '62', '63', '0', '2014-02-11 07:51:10', '1');
INSERT INTO `post_likes` VALUES ('16', '61', '63', '0', '2014-02-11 07:51:13', '1');
INSERT INTO `post_likes` VALUES ('17', '60', '63', '0', '2014-02-11 07:51:16', '1');
INSERT INTO `post_likes` VALUES ('18', '58', '63', '0', '2014-02-11 07:55:37', '1');
INSERT INTO `post_likes` VALUES ('20', '62', '0', '178.212.197.205', '2014-02-11 08:17:41', '1');
INSERT INTO `post_likes` VALUES ('21', '61', '0', '178.212.197.205', '2014-02-11 08:17:49', '1');
INSERT INTO `post_likes` VALUES ('22', '53', '63', '0', '2014-02-28 00:19:35', '2');
INSERT INTO `post_likes` VALUES ('23', '23', '63', '0', '2014-02-14 02:50:02', '2');
INSERT INTO `post_likes` VALUES ('24', '70', '0', '46.39.46.30', '2014-03-23 19:13:51', '3');
INSERT INTO `post_likes` VALUES ('25', '69', '0', '46.39.46.30', '2014-02-11 12:57:49', '1');
INSERT INTO `post_likes` VALUES ('27', '72', '0', '178.255.200.61', '2014-03-24 22:41:13', '3');
INSERT INTO `post_likes` VALUES ('28', '60', '0', '178.212.197.205', '2014-04-24 13:01:50', '3');
INSERT INTO `post_likes` VALUES ('29', '59', '0', '178.212.197.205', '2014-02-17 10:59:24', '3');
INSERT INTO `post_likes` VALUES ('30', '58', '0', '178.212.197.205', '2014-02-12 09:44:03', '1');
INSERT INTO `post_likes` VALUES ('32', '73', '0', '178.212.197.205', '2014-02-18 21:55:04', '2');
INSERT INTO `post_likes` VALUES ('33', '73', '63', '0', '2014-02-14 07:40:15', '1');
INSERT INTO `post_likes` VALUES ('34', '65', '63', '0', '2014-02-14 09:36:43', '1');
INSERT INTO `post_likes` VALUES ('35', '24', '0', '93.170.155.159', '2014-02-14 11:51:45', '1');
INSERT INTO `post_likes` VALUES ('36', '80', '0', '93.170.155.159', '2014-02-17 10:33:43', '2');
INSERT INTO `post_likes` VALUES ('37', '79', '0', '46.39.46.30', '2014-02-15 16:36:07', '1');
INSERT INTO `post_likes` VALUES ('39', '80', '63', '0', '2014-02-27 12:57:27', '2');
INSERT INTO `post_likes` VALUES ('41', '87', '0', '178.212.197.205', '2014-02-18 18:51:31', '2');
INSERT INTO `post_likes` VALUES ('42', '88', '0', '178.212.197.205', '2014-02-17 10:33:47', '1');
INSERT INTO `post_likes` VALUES ('43', '42', '0', '178.212.197.205', '2014-02-17 10:59:31', '1');
INSERT INTO `post_likes` VALUES ('46', '87', '56', '0', '2014-02-27 12:57:40', '1');
INSERT INTO `post_likes` VALUES ('47', '96', '67', '0', '2014-03-01 00:40:39', '2');
INSERT INTO `post_likes` VALUES ('48', '70', '67', '0', '2014-02-28 00:22:03', '1');
INSERT INTO `post_likes` VALUES ('49', '97', '56', '0', '2014-02-28 17:27:58', '1');
INSERT INTO `post_likes` VALUES ('50', '27', '56', '0', '2014-04-14 13:31:22', '2');
INSERT INTO `post_likes` VALUES ('51', '97', '0', '178.212.197.205', '2014-02-28 17:28:18', '1');
INSERT INTO `post_likes` VALUES ('52', '96', '0', '178.212.197.205', '2014-04-25 21:07:59', '2');
INSERT INTO `post_likes` VALUES ('53', '95', '56', '0', '2014-03-12 20:16:00', '1');
INSERT INTO `post_likes` VALUES ('54', '101', '0', '188.115.128.64', '2014-03-20 14:23:45', '1');
INSERT INTO `post_likes` VALUES ('55', '100', '0', '188.115.128.64', '2014-03-20 14:23:48', '1');
INSERT INTO `post_likes` VALUES ('56', '41', '107', '0', '2014-03-22 12:16:05', '1');
INSERT INTO `post_likes` VALUES ('57', '103', '0', '46.39.46.30', '2014-03-23 19:15:43', '1');
INSERT INTO `post_likes` VALUES ('58', '103', '67', '0', '2014-03-23 19:23:24', '1');
INSERT INTO `post_likes` VALUES ('59', '99', '67', '0', '2014-03-24 21:04:58', '2');
INSERT INTO `post_likes` VALUES ('60', '72', '107', '0', '2014-03-24 18:53:13', '1');
INSERT INTO `post_likes` VALUES ('61', '99', '0', '46.39.46.30', '2014-03-24 22:41:37', '1');
INSERT INTO `post_likes` VALUES ('62', '27', '0', '93.170.155.159', '2014-04-24 10:40:06', '1');
INSERT INTO `post_likes` VALUES ('63', '95', '0', '37.233.62.35', '2014-04-29 17:52:39', '1');

-- ----------------------------
-- Table structure for `question`
-- ----------------------------
DROP TABLE IF EXISTS `question`;
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

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('20', '44', '41', '2014-02-07 03:54:07', 'Текст вопроса', null, '0');
INSERT INTO `question` VALUES ('21', '56', '63', '2014-02-07 09:46:26', 'Почему лиса ?', 'Потому что огонь!', '0');
INSERT INTO `question` VALUES ('24', '63', '56', '2014-02-10 09:15:53', 'Почему хочешь быть лучшим ?', 'Потому что я лучший!', '0');
INSERT INTO `question` VALUES ('25', '63', '56', '2014-02-10 09:28:10', 'Почему хочешь быть лучшим ?', '111', '0');
INSERT INTO `question` VALUES ('31', '63', '56', '2014-02-10 09:41:30', '1111', 'jntnds', '0');
INSERT INTO `question` VALUES ('33', '41', '67', '2014-02-10 12:53:25', 'как ты сам вооюще??_)', null, '0');
INSERT INTO `question` VALUES ('34', '41', '67', '2014-02-10 12:53:47', 'ну ты смешной', null, '0');
INSERT INTO `question` VALUES ('35', '62', '39', '2014-02-11 11:53:43', 'Тест индекса', null, '0');
INSERT INTO `question` VALUES ('42', '45', '25', '2014-02-14 06:23:41', 'fsfdfdf', null, '0');
INSERT INTO `question` VALUES ('43', '45', '25', '2014-02-14 06:24:14', 'fsfdfdf', null, '0');
INSERT INTO `question` VALUES ('44', '45', '25', '2014-02-14 06:25:48', 'fsfdfdf', null, '0');
INSERT INTO `question` VALUES ('49', '56', '63', '2014-02-17 11:45:37', 'Еще раз !', 'Держи', '0');
INSERT INTO `question` VALUES ('50', '63', '56', '2014-02-17 16:35:46', 'Вопрос', '442412', '0');
INSERT INTO `question` VALUES ('51', '63', '56', '2014-02-17 16:36:37', 'еее', '2323', '0');
INSERT INTO `question` VALUES ('52', '63', '56', '2014-02-17 18:09:08', '133', '2323', '0');
INSERT INTO `question` VALUES ('53', '63', '56', '2014-02-17 18:10:08', '888', '222', '0');
INSERT INTO `question` VALUES ('55', '56', '63', '2014-02-18 18:41:54', 'Что поповоду браузера ?', 'Я лучший!', '0');
INSERT INTO `question` VALUES ('56', '66', '67', '2014-02-27 23:42:19', 'как поживаешь?', null, '0');
INSERT INTO `question` VALUES ('57', '56', '67', '2014-02-28 00:01:08', 'как дела фокс', 'Отлично )', '0');
INSERT INTO `question` VALUES ('58', '63', '67', '2014-02-28 00:04:30', 'неужели', null, '0');
INSERT INTO `question` VALUES ('59', '63', '67', '2014-02-28 00:05:33', 'к', null, '0');
INSERT INTO `question` VALUES ('61', '67', '56', '2014-02-28 18:42:10', 'Как дела еще раз ?)', null, '0');
INSERT INTO `question` VALUES ('62', '56', '67', '2014-03-01 00:42:35', 'какой то очень интересный вопрос', null, '0');
INSERT INTO `question` VALUES ('63', '56', '67', '2014-03-01 00:42:58', 'и еще один держи', null, '0');
INSERT INTO `question` VALUES ('64', '67', '94', '2014-03-01 02:21:09', 'здарова брате', 'здоровее видали', '0');
INSERT INTO `question` VALUES ('76', '41', '107', '2014-03-24 16:27:04', 'текст вопроса', null, '0');
INSERT INTO `question` VALUES ('79', '107', '123', '2014-03-24 17:16:12', 'Какой нибудь еще', 'b tot jlby jndtn', '0');
INSERT INTO `question` VALUES ('80', '107', '123', '2014-03-24 17:17:31', 'Задать еще один вопрос', 'another answer', '0');
INSERT INTO `question` VALUES ('81', '107', '123', '2014-03-24 17:19:10', 'и еще один', 'и еще один ответ', '0');
INSERT INTO `question` VALUES ('82', '107', '123', '2014-03-24 17:21:10', 'тупое тестрование', 'тупой ответ', '0');
INSERT INTO `question` VALUES ('85', '107', '123', '2014-03-24 18:19:33', 'задаем вопрос', 'Наконец то я разобрался', '0');
INSERT INTO `question` VALUES ('90', '123', '107', '2014-03-25 14:10:05', 'вопрос', 'ответ', '0');
INSERT INTO `question` VALUES ('92', '123', '107', '2014-03-25 14:24:26', 'новый вопрос', 'one two', '0');
INSERT INTO `question` VALUES ('93', '67', '124', '2014-03-25 14:44:41', 'Привет, как дела с тестами вопросов? (', 'Отлиично вроде бы', '0');
INSERT INTO `question` VALUES ('96', '41', '123', '2014-03-25 18:19:33', 'вопрос', null, '0');
INSERT INTO `question` VALUES ('106', '165', '137', '2014-05-19 14:45:18', 'aaaaa', null, '0');

-- ----------------------------
-- Table structure for `story_of_the_day`
-- ----------------------------
DROP TABLE IF EXISTS `story_of_the_day`;
CREATE TABLE `story_of_the_day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `assigned` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of story_of_the_day
-- ----------------------------
INSERT INTO `story_of_the_day` VALUES ('16', '22', '2014-02-19 14:43:37');
INSERT INTO `story_of_the_day` VALUES ('17', '22', '2014-02-19 14:43:40');
INSERT INTO `story_of_the_day` VALUES ('18', '27', '2014-02-24 15:07:47');
INSERT INTO `story_of_the_day` VALUES ('19', '56', '2014-02-24 16:15:59');
INSERT INTO `story_of_the_day` VALUES ('20', '27', '2014-02-25 00:44:53');
INSERT INTO `story_of_the_day` VALUES ('21', '27', '2014-02-26 16:55:16');
INSERT INTO `story_of_the_day` VALUES ('22', '27', '2014-02-27 12:17:50');
INSERT INTO `story_of_the_day` VALUES ('23', '27', '2014-03-12 19:26:11');
INSERT INTO `story_of_the_day` VALUES ('24', '58', '2014-04-09 23:25:59');

-- ----------------------------
-- Table structure for `timeline`
-- ----------------------------
DROP TABLE IF EXISTS `timeline`;
CREATE TABLE `timeline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `posts_count` int(11) NOT NULL,
  `answers_count` int(11) NOT NULL,
  `questions_count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of timeline
-- ----------------------------
INSERT INTO `timeline` VALUES ('1', '45', '0', '0', '1');
INSERT INTO `timeline` VALUES ('3', '87', '2', '3', '5');
INSERT INTO `timeline` VALUES ('4', '41', '11', '4', '2');
INSERT INTO `timeline` VALUES ('5', '67', '0', '0', '0');
INSERT INTO `timeline` VALUES ('6', '56', '1', '0', '1');
INSERT INTO `timeline` VALUES ('7', '63', '3', '1', '2');
INSERT INTO `timeline` VALUES ('11', '66', '1', '0', '1');
INSERT INTO `timeline` VALUES ('13', '107', '0', '0', '3');
INSERT INTO `timeline` VALUES ('14', '123', '0', '0', '0');
