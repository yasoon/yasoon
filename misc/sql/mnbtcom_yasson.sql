-- phpMyAdmin SQL Dump
-- version 4.0.8
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Май 07 2014 г., 09:08
-- Версия сервера: 5.5.34-cll-lve
-- Версия PHP: 5.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `mnbtcom_yasson`
--

-- --------------------------------------------------------

--
-- Структура таблицы `author`
--

CREATE TABLE IF NOT EXISTS `author` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=165 ;

--
-- Дамп данных таблицы `author`
--

INSERT INTO `author` (`id`, `name`, `email`, `subscribed`, `description`, `job`, `dream`, `interest`, `publication_date`, `img`, `interview_caption`, `password`, `homepage`, `salt`, `role`, `newpass`, `facebook_id`, `vkontakte_id`, `reg_from`, `date_change`) VALUES
(39, 'username', 'test@test.ru', 0, NULL, NULL, NULL, NULL, '2014-02-03 05:46:24', NULL, NULL, '098f6bcd4621d373cade4e832627b4f6', NULL, NULL, 1, NULL, NULL, NULL, 0, NULL),
(40, 'username2', 'test22@test.ru', 0, 'test22@test.ru', 'yyy', '', '', '2014-02-03 05:55:56', NULL, '', 'd41d8cd98f00b204e9800998ecf8427e', '', NULL, 1, NULL, NULL, NULL, 0, NULL),
(41, 'username22', 'test222@test.ru', 0, NULL, NULL, NULL, NULL, '2014-02-03 05:57:41', NULL, 'ydjfjhg', '098f6bcd4621d373cade4e832627b4f6', NULL, NULL, 1, NULL, NULL, NULL, 0, NULL),
(42, 'kotays', 'kotays12@gmail.com', 0, NULL, NULL, NULL, NULL, '2014-02-04 04:10:41', NULL, NULL, 'd41d8cd98f00b204e9800998ecf8427e', NULL, NULL, 4, NULL, NULL, NULL, 0, NULL),
(43, 'kota', 'kota12@bk.ru', 0, NULL, NULL, NULL, NULL, '2014-02-04 07:40:39', NULL, NULL, 'd41d8cd98f00b204e9800998ecf8427e', NULL, NULL, 1, NULL, NULL, NULL, 0, NULL),
(44, 'kooott', 'kotaq1@bk.ru', 1, 'kotaq1@bk.ru', NULL, NULL, NULL, '2014-02-04 07:41:46', NULL, NULL, 'd41d8cd98f00b204e9800998ecf8427e', '', NULL, 1, NULL, NULL, NULL, 0, NULL),
(45, 'kota12', 'kota123@bk.ru', 1, 'kota123@bk.ru', 'prof', 'rrr', 'rrr', '2014-02-04 09:25:38', NULL, 'rrrr', 'd41d8cd98f00b204e9800998ecf8427e', '', NULL, 1, NULL, NULL, NULL, 0, NULL),
(49, 'dsfgdg', 'parandiy.mihail@gmail.com', 0, NULL, NULL, NULL, NULL, '2014-02-06 11:24:17', NULL, NULL, '999c3fdf76ce33797d31b79dd486aca0', NULL, NULL, 1, NULL, NULL, NULL, 0, NULL),
(50, 'kotays12', 'kot12@bk.ru', 1, 'kot12@bk.ru', 'aaa', '', '', '2014-02-06 11:29:36', NULL, '', 'd41d8cd98f00b204e9800998ecf8427e', '', NULL, 1, NULL, NULL, NULL, 0, NULL),
(51, 'tester', 't1@t.ru', 1, 't1@t.ru', 'test', '', '', '2014-02-06 11:30:52', NULL, '', 'd41d8cd98f00b204e9800998ecf8427e', '', NULL, 1, NULL, NULL, NULL, 0, NULL),
(52, 't3', 't3@t.ru', 1, 't3@t.ru', 't3', '', '', '2014-02-06 11:38:23', NULL, '', 'd41d8cd98f00b204e9800998ecf8427e', '', NULL, 1, NULL, NULL, NULL, 0, NULL),
(53, 'test3', 'test3@test.ru', 1, 'test3@test.ru', 'test3', '', '', '2014-02-06 11:40:11', NULL, '', '098f6bcd4621d373cade4e832627b4f6', '', NULL, 1, NULL, NULL, NULL, 0, NULL),
(54, 'Bloom Berg', 'balabol@gmail.com', 1, 'balabol@gmail.com', 'Учоный', 'Сварщик', 'терминатор', '2014-02-06 15:16:25', NULL, '', '76419c58730d9f35de7ac538c2fd6737', '', NULL, 1, NULL, NULL, NULL, 0, NULL),
(55, 'kota', 'k1@mail.ru', 1, 'k1@mail.ru', 'aaaa', 'ddd', 'qqqq', '2014-02-06 17:18:29', NULL, 'eeee', '202cb962ac59075b964b07152d234b70', '', NULL, 1, NULL, NULL, NULL, 0, NULL),
(56, 'fox', 'fox@test.ru', 0, 'fox', 'FireFox', 'Browser', '', '2014-02-17 16:56:09', 'c0e9cf974aa8ea5e08f3f55d24a2a33c.jpg', 'I''m firefox', '2b95d1f09b8b66c5c43622a4d9ec9a04', '', NULL, 4, NULL, NULL, NULL, 0, '2014-02-28 18:40:28'),
(59, 'wee', 'ee@mail.ru', 0, NULL, NULL, NULL, NULL, '2014-02-06 21:00:09', NULL, NULL, '099b3b060154898840f0ebdfb46ec78f', NULL, NULL, 1, NULL, NULL, NULL, 0, NULL),
(60, 'Korol Lev', 'leva@leva.ru', 1, 'leva@leva.ru', 'Учоный', 'Чоный', 'Очный', '2014-02-07 03:51:19', NULL, 'ыыыыыыыыыыыыыыыыыыыыыыыыыыыыыыыыыыыыыыыыыыыыы', '76419c58730d9f35de7ac538c2fd6737', '', NULL, 1, NULL, NULL, NULL, 0, NULL),
(61, 'torororor', 'qwweertt@inbop.com', 1, 'qwweertt@inbop.com', 'Лвлвлвлвлвлв', 'вжвдвдвщвщвв', 'вдвдвд ввлвд влв', '2014-02-07 04:03:33', NULL, 'вжвжвжвжвжв ввдвдвдвдв вдвдвдвдв вдвдвдвд вдв', '76419c58730d9f35de7ac538c2fd6737', '', NULL, 1, NULL, NULL, NULL, 0, NULL),
(62, 'Kotays', 'k1@k.ru', 0, 'k1@k.ru', 'Профа', 'Мачта профы', 'Восхещение профа', '2014-02-07 04:33:26', NULL, 'Я программист', '202cb962ac59075b964b07152d234b70', '', NULL, 1, NULL, NULL, NULL, 0, NULL),
(63, 'chrome', 'indigo@mail.ru', 0, 'chromes', 'чемпион', '', '', '2014-02-25 10:30:53', 'b0b67506d7f867cbd2879bf2dd4fae12.jpg', 'Что то о себе.', '554838a8451ac36cb977e719e9d6623c', 'http://vk.com/id9191', NULL, 4, NULL, NULL, NULL, 0, NULL),
(64, 'Ferion Lapland', 'wsx@omni.ru', 0, 'wsx@omni.ru', 'eee', 'xxxxx', '', '2014-02-07 09:42:35', NULL, '', '76419c58730d9f35de7ac538c2fd6737', '', NULL, 1, NULL, NULL, NULL, 0, NULL),
(65, 'test_user', 'test_user@test.ru', 0, 'test_user@test.ru', 'P', 'P2', 'P3', '2014-02-07 09:54:02', NULL, 'About me', '098f6bcd4621d373cade4e832627b4f6', 'vk.com/id1234', NULL, 1, NULL, NULL, NULL, 0, NULL),
(66, 'kotaa', 'k5@k5.ru', 0, 'k5@k5.ru', 'a4', 'a', 'a', '2014-02-10 08:49:44', NULL, 'a', '098f6bcd4621d373cade4e832627b4f6', 'd', NULL, 1, NULL, NULL, NULL, 0, NULL),
(67, 'Иван Клыков', 'ivan.klykov@gmail.com', 0, 'Artem Mjsdissl', 'Аналитик', 'Пилот гражданской кухни', 'Архитектор', '2014-02-24 23:45:14', '30e35093cefa3a2627fa2051095e80ce.jpg', 'Человек может бесконечно смотреть на три вещи: кекек  ыуцууу  ввввв жжжжжжж жжжжжжжж жжжжжжжж жжжжжж  777777', 'bed128365216c019988915ed3add75fb', '', NULL, 4, NULL, NULL, NULL, 0, '2014-03-26 22:37:23'),
(92, 'Михаил Парандий', 'rrr@dsdsd.fdff', 0, 'Михаил Парандий', 'ewqeewr', '', '', '2014-02-21 11:22:48', '.jpg', '', '', 'http://vk.com/mihail.parandiy', NULL, 1, NULL, NULL, '17626135', 0, NULL),
(94, 'Иван Клыков', 'indigo@mail.ru', 0, 'Иван Клыков', 'чемпион', '', '', '2014-02-24 06:52:30', '.jpg', 'Ничего не расказал(ла) о себе.', '', 'http://vk.com/id9191', NULL, 1, NULL, NULL, '9191', 0, NULL),
(96, 'tt', 'tt@tt.ru', 0, NULL, NULL, NULL, NULL, '2014-02-25 12:20:08', NULL, NULL, '822050d9ae3c47f54bee71b85fce1487', NULL, NULL, 1, NULL, NULL, NULL, 0, NULL),
(97, 'tt', 'eeett@tt.ru', 0, NULL, NULL, NULL, NULL, '2014-02-25 12:22:32', NULL, NULL, 'accc9105df5383111407fd5b41255e23', NULL, NULL, 1, NULL, NULL, NULL, 0, NULL),
(98, 'tt', 'tt@test.ru', 0, NULL, NULL, NULL, NULL, '2014-02-25 12:29:14', NULL, NULL, 'accc9105df5383111407fd5b41255e23', NULL, NULL, 1, NULL, NULL, NULL, 0, NULL),
(99, 'tt', 'teet@test.ru', 0, NULL, NULL, NULL, NULL, '2014-02-25 12:34:29', NULL, NULL, 'accc9105df5383111407fd5b41255e23', NULL, NULL, 1, NULL, NULL, NULL, 0, NULL),
(101, 'Михаил Парандий', '', 1, NULL, NULL, NULL, NULL, '2014-02-25 14:31:52', '.jpg', NULL, '', 'https://www.facebook.com/mihail.parandiy', NULL, 1, NULL, '100003905122055', NULL, 1, NULL),
(102, 'testname', 'testname@testname.jj', 0, NULL, NULL, NULL, NULL, '2014-02-25 16:24:59', NULL, NULL, '17e4018a27cc0cf8c39948589934116a', NULL, NULL, 1, NULL, NULL, NULL, 0, '2014-02-25 16:24:59'),
(103, 'test@fdfdf.fdf', 'test@fdfdf.fdf', 0, NULL, NULL, NULL, NULL, '2014-02-25 16:25:38', NULL, NULL, '1a100d2c0dab19c4430e7d73762b3423', NULL, NULL, 1, NULL, NULL, NULL, 0, '2014-02-25 16:25:38'),
(104, 'eee@dd.gg', 'eee@dd.gg', 0, NULL, NULL, NULL, NULL, '2014-02-25 16:26:43', NULL, NULL, 'e3ceb5881a0a1fdaad01296d7554868d', NULL, NULL, 1, NULL, NULL, NULL, 0, '2014-02-25 16:26:43'),
(105, 'terter', 'tetete@bk.ru', 1, NULL, 'ttt', '', '', '2014-02-25 19:38:13', NULL, '', 'e05e7e0269a2f6870f4825c00d75710f', '', NULL, 1, NULL, NULL, NULL, 0, '2014-02-25 19:40:20'),
(107, 'Константин', 'polocatik@bk.ru', 0, NULL, 'WEB - worker', '', '', '2014-03-11 13:31:06', NULL, 'атыфло л оылвимл ол', '46bac3283c0024e55d970c93f469e811', '', NULL, 4, NULL, NULL, NULL, 0, '2014-03-24 15:05:02'),
(108, 'rtgtrgh', 'tgtr@ft.dc', 0, NULL, NULL, NULL, NULL, '2014-03-13 14:31:21', NULL, NULL, '761f057d207263120f6ef92f10f156f7', NULL, NULL, 1, NULL, NULL, NULL, 0, '2014-03-13 14:31:21'),
(110, 'John', 'polocatic@gmail.com', 0, NULL, NULL, NULL, NULL, '2014-03-19 20:28:40', NULL, NULL, '46bac3283c0024e55d970c93f469e811', NULL, NULL, 1, '2443303396', NULL, NULL, 0, '2014-03-19 20:28:40'),
(123, 'Константин Моисеенко', '', 1, NULL, NULL, NULL, NULL, '2014-03-24 16:49:26', '.jpg', NULL, '', 'http://vk.com/id55691468', NULL, 1, NULL, NULL, '55691468', 2, NULL),
(124, 'Тестер Вопросов', 'serpantin@inbox.ru', 0, NULL, 'Мастер тестов', '', '', '2014-03-24 22:35:35', NULL, 'Яков Синай, академик РАН и профессор Принстонского университета, стал лауреатом премии Абеля 2014 года — аналога Нобелевской премии для математиков. О лауреате «Газете.Ru» рассказал академик РАН Але', '3ef9d2cd2a1fc9ff2c9010471832d661', 'http://https://www.facebook.com/olegtinkov/po', NULL, 1, '7138268117', NULL, NULL, 0, '2014-03-26 22:16:16'),
(131, 'timofeymelnik', 'timofeymelnik@gmail.com', 0, NULL, NULL, NULL, NULL, '2014-03-26 20:05:12', NULL, NULL, 'b6ca84b29e31e551001ae35f2f92bafd', NULL, NULL, 1, NULL, NULL, NULL, 0, '2014-03-26 20:05:12'),
(136, 'tt', 'tt@tt.tt', 0, NULL, NULL, NULL, NULL, '2014-03-27 15:30:54', NULL, NULL, 'accc9105df5383111407fd5b41255e23', NULL, NULL, 1, NULL, NULL, NULL, 0, '2014-03-27 15:30:54'),
(137, 'tt', 'tt@tt.ttt', 0, NULL, '', '', '', '2014-03-28 15:46:31', '41f2dd25508355eb04537b3ac52c01d6.jpg', 'Ничего не рассказал(а) о себе.', '9990775155c3518a0d7917f7780b24aa', '', NULL, 1, NULL, NULL, NULL, 0, '2014-04-14 11:59:45'),
(138, 'Тима Мельник', '', 1, NULL, NULL, NULL, NULL, '2014-04-02 14:07:30', '.jpg', NULL, '', 'http://vk.com/timofeymelnik', NULL, 1, NULL, NULL, '16648575', 2, NULL),
(139, 'sdfg', 'sdfg@mai.tx', 0, NULL, NULL, NULL, NULL, '2014-04-14 12:27:59', NULL, NULL, 'e332a76c29654fcb7f6e6b31ced090c7', NULL, NULL, 1, NULL, NULL, NULL, 0, '2014-04-14 12:27:59'),
(140, 'tim', 'tim@gmail.com', 0, NULL, NULL, NULL, NULL, '2014-04-25 15:13:41', NULL, NULL, 'b15d47e99831ee63e3f47cf3d4478e9a', NULL, NULL, 1, NULL, NULL, NULL, 0, '2014-04-25 15:13:41'),
(141, 'tim', 'tim@mail.ru', 0, NULL, NULL, NULL, NULL, '2014-04-25 16:21:22', NULL, NULL, 'b15d47e99831ee63e3f47cf3d4478e9a', NULL, NULL, 1, NULL, NULL, NULL, 0, '2014-04-25 16:21:22'),
(142, 'asdf', 'asdf@asdf.as', 0, NULL, NULL, NULL, NULL, '2014-04-25 16:24:30', NULL, NULL, '912ec803b2ce49e4a541068d495ab570', NULL, NULL, 1, NULL, NULL, NULL, 0, '2014-04-25 16:24:30'),
(143, 'asdf', 'asdf@asdf.asd', 0, NULL, NULL, NULL, NULL, '2014-04-25 16:27:30', NULL, NULL, '912ec803b2ce49e4a541068d495ab570', NULL, NULL, 1, NULL, NULL, NULL, 0, '2014-04-25 16:27:30'),
(144, 'asdf', 'asdf@asd.asd', 0, NULL, NULL, NULL, NULL, '2014-04-25 17:06:58', NULL, NULL, '912ec803b2ce49e4a541068d495ab570', NULL, NULL, 1, NULL, NULL, NULL, 0, '2014-04-25 17:06:58'),
(145, 'asdf', 'asdf@asd.asdf', 0, NULL, NULL, NULL, NULL, '2014-04-25 17:07:06', NULL, NULL, '912ec803b2ce49e4a541068d495ab570', NULL, NULL, 1, NULL, NULL, NULL, 0, '2014-04-25 17:07:06'),
(146, 'hfdfg', 'hdfgh@hdg.dfgh', 0, NULL, NULL, NULL, NULL, '2014-04-25 17:09:11', NULL, NULL, '450a2f441ef0f3b05f767b4202aaab88', NULL, NULL, 1, NULL, NULL, NULL, 0, '2014-04-25 17:09:11'),
(147, 'fasdfa', 'sdfgsdfg@gsdfgs.asdf', 0, NULL, NULL, NULL, NULL, '2014-04-25 17:15:31', NULL, NULL, 'cde47ef73a184838340aafce4b402c97', NULL, NULL, 1, NULL, NULL, NULL, 0, '2014-04-25 17:15:31'),
(148, 'sdfgsdfg', 'sdfgsdfg@dfsg.asdf', 0, NULL, NULL, NULL, NULL, '2014-04-25 17:16:24', NULL, NULL, '6a204bd89f3c8348afd5c77c717a097a', NULL, NULL, 1, NULL, NULL, NULL, 0, '2014-04-25 17:16:24'),
(149, 'asdfghdfg', 'hdfghsd@gfhd.sfd', 0, NULL, NULL, NULL, NULL, '2014-04-25 17:19:21', 'b58614e1709a362e61e2d47c618db81a.jpg', NULL, 'cde47ef73a184838340aafce4b402c97', NULL, NULL, 1, NULL, NULL, NULL, 0, '2014-04-25 17:19:21'),
(150, 'tim', 'tim@mail.com', 0, NULL, 'worker', NULL, NULL, '2014-04-28 18:03:03', '69596c96e404d457720ed1adbb5f346a.jpg', NULL, 'b15d47e99831ee63e3f47cf3d4478e9a', NULL, NULL, 1, NULL, NULL, NULL, 0, '2014-04-28 18:03:17'),
(151, 'tema', 'artem@mail.ru', 0, NULL, NULL, NULL, NULL, '2014-04-28 18:05:17', NULL, NULL, '6a204bd89f3c8348afd5c77c717a097a', NULL, NULL, 1, NULL, NULL, NULL, 0, '2014-04-28 18:05:17'),
(152, 'tema', 'artem@mail.com', 0, NULL, NULL, NULL, NULL, '2014-04-28 18:05:33', NULL, NULL, '6a204bd89f3c8348afd5c77c717a097a', NULL, NULL, 1, NULL, NULL, NULL, 0, '2014-04-28 18:05:33'),
(153, 'avatar', 'aang@avatar.apa', 0, NULL, 'avatar', NULL, NULL, '2014-04-28 18:06:26', '767855d272453ca53dffb7be426776d6.jpg', NULL, 'e03ae33ee8417ce2c9785274217636e0', NULL, NULL, 1, NULL, NULL, NULL, 0, '2014-04-28 18:06:42'),
(154, 'name', 'name@mail.com', 0, NULL, NULL, NULL, NULL, '2014-04-28 18:10:49', 'c6f107e81a7322b5639eeed5f49acd0d.jpg', NULL, 'b83a886a5c437ccd9ac15473fd6f1788', NULL, NULL, 1, NULL, NULL, NULL, 0, '2014-04-28 18:10:49'),
(155, 'namename', 'family@mail.com', 0, NULL, 'worker', NULL, NULL, '2014-04-28 18:13:31', 'f31dd2b306a83018eafe3ed944d117d2.jpg', NULL, 'b83a886a5c437ccd9ac15473fd6f1788', NULL, NULL, 1, NULL, NULL, NULL, 0, '2014-04-28 18:14:25'),
(156, 'namename', 'retail@retail.com', 0, NULL, 'work', NULL, NULL, '2014-04-28 18:15:46', 'e37629052a92fedbc94c4a59021f7de5.jpg', NULL, 'b068931cc450442b63f5b3d276ea4297', NULL, NULL, 1, NULL, NULL, NULL, 0, '2014-04-28 18:20:20'),
(157, 'timofeymelnik', 'timas@mas.ru', 0, NULL, NULL, NULL, NULL, '2014-04-28 18:26:14', '86de459bc997edad0e8ee3819354d4c9.jpg', NULL, 'a8967cdb80c6538c99d13cb01f870c63', NULL, NULL, 1, NULL, NULL, NULL, 0, '2014-04-28 18:26:14'),
(158, 'tim', 'tim@tim.tim', 0, NULL, NULL, NULL, NULL, '2014-04-28 18:28:50', '93f023049d5d13ed851bbca96ff4a0b9.jpg', NULL, 'b15d47e99831ee63e3f47cf3d4478e9a', NULL, NULL, 1, NULL, NULL, NULL, 0, '2014-04-28 18:28:50'),
(159, 'asdfasdfsfd', 'asdfasd@arfsdf.asdf', 0, NULL, 'asdfasdf', NULL, NULL, '2014-04-28 18:47:24', NULL, NULL, '6a204bd89f3c8348afd5c77c717a097a', NULL, NULL, 1, NULL, NULL, NULL, 0, '2014-04-28 18:47:40'),
(160, 'asdfasdf', 'asdfsdfgdfs@dfsgh.sd', 0, NULL, 'asdfasdf', NULL, NULL, '2014-04-28 18:48:33', NULL, NULL, '6a204bd89f3c8348afd5c77c717a097a', NULL, NULL, 1, NULL, NULL, NULL, 0, '2014-04-28 18:48:37'),
(161, 'asdfasdf', 'asdfasdf@adfasdf.asd', 0, NULL, 'asdfasdf', NULL, NULL, '2014-04-28 18:49:16', NULL, NULL, '6a204bd89f3c8348afd5c77c717a097a', NULL, NULL, 1, NULL, NULL, NULL, 0, '2014-04-28 18:49:27'),
(162, 'asdfadsf', 'asdfasdf@xdfgx.asd', 0, NULL, NULL, NULL, NULL, '2014-04-28 19:00:12', 'c74fbc4797e2c90479f00ba6190ca186.jpg', NULL, '6a204bd89f3c8348afd5c77c717a097a', NULL, NULL, 1, NULL, NULL, NULL, 0, '2014-04-28 19:00:12'),
(163, 'sdfgsdfg', 'sdfgsdfg@sdfgsd.sdf', 0, NULL, NULL, NULL, NULL, '2014-04-28 19:35:57', 'caa88ccfa8c0f7b411f2abb8b7dd9e2a.jpg', NULL, 'e332a76c29654fcb7f6e6b31ced090c7', NULL, NULL, 1, NULL, NULL, NULL, 0, '2014-04-28 19:35:57'),
(164, 'hfgfhg', 'jgjhg@hg.hg', 0, NULL, 'hfgfhgfhg', NULL, NULL, '2014-04-28 21:45:26', NULL, NULL, 'c6eaac4236d081d850e9d07137d60b09', NULL, NULL, 1, NULL, NULL, NULL, 0, '2014-04-28 21:45:53');

-- --------------------------------------------------------

--
-- Структура таблицы `author_changed_pass`
--

CREATE TABLE IF NOT EXISTS `author_changed_pass` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `last_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `blank_question`
--

CREATE TABLE IF NOT EXISTS `blank_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  `place` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`) VALUES
(1, 'Безопасность', 'Все о безопасности'),
(2, 'Дизайн', 'Тут творчиства не занимать'),
(3, 'Добыча полезных ископаемых', 'Для тех кто любит нефть'),
(4, 'Интернет', 'нтернет он и в Африке интернет'),
(5, 'Искусство', 'Любителям искуства'),
(6, 'Медиа', 'Все начиная от фильмов и заканчивая дудками'),
(7, 'Музыка', 'Для людей с музыкальным слухом'),
(8, 'Наука', 'Ученым'),
(9, 'Образование', 'Всем кому интиресно обучение'),
(10, 'Право', 'Что бы знать хоть парочку законов'),
(11, 'Природа и животные', 'Любителям всего живого'),
(12, 'Программирование', 'Ну это святое, как не крути'),
(13, 'Производство', 'Специально для самоделкиных'),
(14, 'Психология и тренинги', 'Для тех кто любит отдыхать'),
(16, 'Развлечения и туризм', 'Для тех кто идет в ногу со временем'),
(17, 'Строительство и недвижимость', 'Про всякие машинки и телефончики'),
(18, 'Технологии', 'Все услуги которые вообще можно представить'),
(19, 'Транспорт и связь', 'Деньги, они всем нужны'),
(20, 'Услуги', 'Для тех кто любит создавать красоту из подручных предметов'),
(21, 'Финансы', 'Финансы'),
(23, 'Hand-made', 'Hand-made');

-- --------------------------------------------------------

--
-- Структура таблицы `content`
--

CREATE TABLE IF NOT EXISTS `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `tagId` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=66 ;

--
-- Дамп данных таблицы `content`
--

INSERT INTO `content` (`id`, `text`, `description`, `tagId`) VALUES
(1, '<p><span style="color: #ffffff;">Источник профессионального вдохновения на каждый день. <br></span></p><p><span style="color: #ffffff;"><br></span></p><p><span style="color: #ffffff;">Ныне это очень трудно</span><br></p>', 'Надпись на главной', ''),
(2, '<p>О нас</p>', 'Заголовок страницы О нас', NULL),
(3, '<p><img src="http://i.cheltcom.ru/u/70/0247506a5611e3bf9ea8fbbcc6a54c/-/cheltcom_ru_about_us.png"><br></p>', 'Содержимое страницы О нас', NULL),
(4, 'Узнать больше', 'Кнопка на главной', ''),
(5, '<p>mail</p>', 'Email на странице О нас', NULL),
(6, 'Здравствуйте, %name%! Вы зарегистрировались на сайте \\"Ясун\\".Ваш логин:  %email% Ваш пароль: %password%', 'Письмо о регистрации', NULL),
(7, 'Логин: %email%\r\nПароль: %newpass%.\r\nДля завершения восстановления пароля пройдите по ссылке: %link%', 'Письмо с напоминанием пароля', NULL),
(8, 'Создайте свой профиль и напишите истории', 'Надпись под заголовком \\"регистрация\\"', NULL),
(9, 'Расскажите чуть больше о себе', 'Надпись под заголовком всё прошло успешно', NULL),
(10, 'Все ваши деньги теперь принадлежат нам.', 'Текст пользовательского соглашения', NULL),
(12, 'http://google.ru', 'Ссылка партнера', NULL),
(13, '/img/i6.jpg', 'Ссылка на картинку на главной', NULL),
(14, 'Истории людей, которые любят то, что делают', 'Текст под названием отрасли на странице людей и профессий', ''),
(15, 'Редактирование личных данных', 'Текст на странице редактирования профиля под заголовком', NULL),
(16, 'Напишите свою историю', 'Заголовок на странице "Напишите свою историю"', NULL),
(18, '/upload/avatar/noAvatar.jpg', 'Аватар пользователя по умолчанию', NULL),
(19, 'Больше историй', 'Название кнопки "Больше историй"', NULL),
(20, 'Регистрация', 'Заголовок страницы регистрации', NULL),
(21, 'Добро пожаловать', 'Заголовок второй страницы регистрации', NULL),
(22, 'Имя, под которым будет опубликована Ваша история', 'Подсказка в поле ввода "Имя"', NULL),
(23, 'Email', 'Подсказка в поле ввода "Email"', NULL),
(24, 'Подписаться на обновления', 'Флажок подписаться на обновления', NULL),
(25, 'Пароль', 'Подсказка в поле ввода "Пароль"', NULL),
(26, 'Регистрация', 'Кнопка регистрация', NULL),
(27, 'Ваша профессия или деятельность', 'поле ввода "Ваша профессия"', NULL),
(28, 'Профессия, о которой Вы мечтали в детстве', 'поле ввода ', NULL),
(29, 'Профессия, которая Вас восхищает', 'поле ввода "Профессия, которая Вас восхищает"', 'test'),
(30, 'Самое место рассказать о себе', 'поле ввода "Расскажите о себе"', NULL),
(31, 'Личная страница', 'Поле ввода "Личная страница"', NULL),
(32, 'Загрузить Изображение', 'Кнопка "Загрузить изображение"', NULL),
(33, 'Завершить регистрацию', 'Кнопка "Завершить регистрацию"', NULL),
(34, 'Пусто', 'Заголовок пустой отрасли', NULL),
(35, 'К сожалению, на эту тему ещё нет историй', 'Текст пустой отрасли', NULL),
(36, 'Стать автором', 'Кнопка "Стать автором"', NULL),
(37, 'Напишите свою', 'Кнопка "Напишите свою"', NULL),
(38, 'Заголовок истории', 'Подсказка "Заголовок истории" на странице написания поста', NULL),
(39, 'Выберите нужные отрасли', 'Название выпадающего списка категорий', NULL),
(40, 'Краткое описание истории', 'Подсказка в поле "Краткое описание истории"', NULL),
(41, 'Предупреждение', 'Заголовок сообщения при удалении истории', NULL),
(42, 'История будет удалена безвозвратно, удалить историю ?', 'Текст сообщения при удалении истории', NULL),
(43, 'Редактирование личной информации', 'Заголовок страницы редактирование личной информации пользователя', NULL),
(44, 'Сохранить правки', 'Кнопка "Сохранить правки" на странице профиля', NULL),
(45, 'Написать новую историю', 'Кнопка "Написать новую историю" на странице профиля', NULL),
(46, 'Сейчас впишите текст вопроса', 'Текст-подсказка  в поле ввода вопроса юзеру (сейчас "впишите текст вопроса")', NULL),
(47, 'Пользователь не ответил ни на один вопрос.', 'текст, который виден на странице "ответы" для всех, КРОМЕ хозяина страницы,  в том случае если юзеру не задан ни один вопрос', NULL),
(48, 'К сожалению, другие люди пока не могут расспросить Вас о Вашем деле. Чтобы начать получать вопросы, напишите хотя бы одну историю.', 'текст, который виден на странице "ответы" для хозяина страницы,  в том случае если юзер не написал ни одной истории.', NULL),
(49, 'Больше вопросов', 'Кнопка "Больше вопросов"', NULL),
(50, 'К сожалению, Вам еще не задали ни одного вопроса.', 'текст, который виден на странице "ответы" для хозяина страницы, в том случае если у юзера уже есть истории', NULL),
(51, 'Пользователи могут вдохновиться историей только раз в сутки!', 'Текст сообщения о том, что лайк можно ставить раз в сутки', NULL),
(52, 'Вы уже вдохновлялись данной историей!', 'Текст сообщения о том, что пользователь уже ставил лайк данной истории', NULL),
(53, 'Ничего не рассказал(а) о себе.', 'Текст, который отображается под именем юзера, который ничего не рассказал о себе. (если поле ', NULL),
(54, 'Профессии', 'Шапка. заголовок "Профессии".', NULL),
(55, 'Люди', 'Шапка. заголовок "Люди".', NULL),
(56, 'У вас нет новостей.', 'Текст в пустой ленте новостей-если юзер еще ни на кого не подписан, или нет новостей', NULL),
(57, 'Спасибо! Ваша вопрос отправлен пользователю. Когда он ответит на него, Вы узнаете об этом в своей ленте обновлений.', 'Текст, который появляется перед юзером, когда тот задал вопрос', NULL),
(58, 'Задать вопрос', 'Кнопка "Задать вопрос"', NULL),
(59, 'Начни печатать', 'Подсказка в строке поиска', NULL),
(60, 'Ошибка 404 - страница не  найдена', 'Страница 404', NULL),
(61, '', 'Аватар Дайджест', NULL),
(62, '<p>Дайджест Ясун<br></p>', 'Текст заголовка Дайджест', NULL),
(63, '', 'Текст подзаголовка Дайджест', NULL),
(64, '<p>vk.com/id35</p>', 'Ясун в Вконтакте', ''),
(65, '<p>facebook.com/35</p>', 'Ясун в Facebook', '');

-- --------------------------------------------------------

--
-- Структура таблицы `content_old`
--

CREATE TABLE IF NOT EXISTS `content_old` (
  `id` int(11) NOT NULL,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `content_old`
--

INSERT INTO `content_old` (`id`, `text`, `description`) VALUES
(0, 'У нас лучшее место, чтобы читать истории и делиться вдохновением', 'Надпись на главной'),
(1, 'Что такое Ясун?  ', 'Заголовок страницы О нас'),
(2, 'Много интересного', 'Содержимое страницы О нас'),
(3, 'Узнать больше', 'Кнопка на главной'),
(4, 'mailbox@yasoon.ru', 'Email на странице О нас'),
(5, 'Не туда попали', 'Надпись на странице 404'),
(6, 'Здравствуйте, %name%! Вы зарегистрировались на сайте \\"Ясун\\".Ваш логин:  %email% Ваш пароль: %password%', 'Письмо о регистрации'),
(7, 'Логин: %email%\nПароль: %newpass%.\nДля завершения восстановления пароля пройдите по ссылке: %link%', 'Письмо с напоминанием пароля'),
(8, 'Создайте свой профиль и напишите истории', 'Надпись под заголовком \\"регистрация\\"'),
(9, 'Теперь расскажите чуть больше о себе', 'Надпись под заголовком всё прошло успешно'),
(10, 'Все ваши деньги теперь принадлежат нам.', 'Текст пользовательского соглашения');

-- --------------------------------------------------------

--
-- Структура таблицы `content_tags`
--

CREATE TABLE IF NOT EXISTS `content_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `content_tags`
--

INSERT INTO `content_tags` (`id`, `name`, `value`) VALUES
(1, 'name', 'value');

-- --------------------------------------------------------

--
-- Структура таблицы `friends`
--

CREATE TABLE IF NOT EXISTS `friends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reader_id` int(11) NOT NULL COMMENT 'Id того, кто подписывается',
  `writer_id` int(11) NOT NULL COMMENT 'Id того, на кого подписан reader',
  `date_write` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`reader_id`,`writer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=31 ;

--
-- Дамп данных таблицы `friends`
--

INSERT INTO `friends` (`id`, `reader_id`, `writer_id`, `date_write`) VALUES
(4, 41, 41, NULL),
(14, 41, 87, NULL),
(15, 67, 87, NULL),
(17, 87, 88, '2014-02-17 05:16:02'),
(19, 63, 56, '2014-02-17 16:31:57'),
(24, 56, 63, '2014-02-18 18:18:28'),
(25, 63, 67, '2014-03-01 01:50:13'),
(27, 66, 67, '2014-03-01 02:00:06'),
(28, 56, 67, '2014-03-01 02:00:44'),
(30, 67, 94, '2014-03-28 00:23:55');

-- --------------------------------------------------------

--
-- Структура таблицы `interview`
--

CREATE TABLE IF NOT EXISTS `interview` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Дамп данных таблицы `interview`
--

INSERT INTO `interview` (`id`, `name`) VALUES
(1, 'dwsdsds'),
(2, 'tests2'),
(20, 't3'),
(21, 't4'),
(22, 'Очень интересное новое интервью'),
(23, 'Очень интересное новое интервью'),
(24, 'Очень интересное новое интервью');

-- --------------------------------------------------------

--
-- Структура таблицы `interview_question`
--

CREATE TABLE IF NOT EXISTS `interview_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interview_id` int(11) NOT NULL,
  `text` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=47 ;

--
-- Дамп данных таблицы `interview_question`
--

INSERT INTO `interview_question` (`id`, `interview_id`, `text`) VALUES
(1, 1, 'dsfsfsf'),
(2, 1, 'dfsfsgfsgs'),
(12, 2, 'первый'),
(13, 2, 'Второй'),
(37, 20, '1'),
(38, 20, '2'),
(39, 21, '1'),
(40, 21, '2'),
(41, 22, 'потрясающий вопрос'),
(42, 22, 'что бы еще спросить у тебя?'),
(43, 23, 'потрясающий вопрос'),
(44, 23, 'что бы еще спросить у тебя?'),
(45, 24, 'потрясающий вопрос'),
(46, 24, 'что бы еще спросить у тебя?');

-- --------------------------------------------------------

--
-- Структура таблицы `partners`
--

CREATE TABLE IF NOT EXISTS `partners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partnerBgImg` varchar(255) NOT NULL,
  `parnterText` varchar(255) NOT NULL,
  `parnterLink` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `partners`
--

INSERT INTO `partners` (`id`, `partnerBgImg`, `parnterText`, `parnterLink`) VALUES
(1, '/img/i6.jpg', 'Sheremetiveo airoport work stories<br/> Only for today', 'www.google.ru');

-- --------------------------------------------------------

--
-- Структура таблицы `post`
--

CREATE TABLE IF NOT EXISTS `post` (
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
  KEY `IDX_5A8A6C8DF675F31B` (`author_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=109 ;

--
-- Дамп данных таблицы `post`
--

INSERT INTO `post` (`id`, `author_id`, `preview`, `text`, `date`, `caption`, `place`, `likes`, `visits`) VALUES
(27, 41, 'waedfafd', 'слово слово слово слово', '2014-01-10 00:00:00', 'sfdgsdg', 3, 41, 6),
(41, 41, '', 'cscsc', '2014-02-05 09:23:34', '', 3, 16, 0),
(42, 39, '', '<article questionid="1"><h3>Вопрос 1</h3><div class="question_content">Тут описан ответ на первую историю</div></article>', '2014-02-06 11:22:01', 'Статья', 0, 1, 0),
(53, 49, '', 'text text text text text', '2014-02-07 03:31:29', 'fffff', 0, 2, 0),
(54, 59, 'aaaa', '<article questionid="1"><h3>Вопрос 1</h3><div class="question_content">ddd</div></article>', '2014-02-07 03:54:35', 'aaa', 0, 0, 0),
(55, 59, 'addd', '<article questionid="1"><h3>Вопрос 1</h3><div class="question_content">eeee</div></article>', '2014-02-07 04:06:55', 'aaa', 0, 0, 0),
(56, 59, 'Краткое описание истории', '<article questionid="1"><h3>Вопрос 1</h3><div class="question_content">Ответ на первый вопрос</div></article>', '2014-02-07 04:10:18', 'Заголовок новой истории', 0, 0, 0),
(57, 62, 'описание нового поста', '<article questionid="1"><h3>Вопрос 1</h3><div class="question_content">Ответ на первый вопрос</div></article><article questionid="2"><h3>Вопрос 2</h3><div class="question_content">Ответ на 2 вопрос</div></article>', '2014-02-07 04:37:43', 'Новый пост', 0, 2, 0),
(58, 64, 'iuiuiuiuiu', '<article questionid="1"><h3>Вопрос 1</h3><div class="question_content">ghghghgg\nglglglg\nglglgl\n\n\ngl;glgllgl\nglglgl\n\n\ngkgkgkgkg\nglglglg\nglglglgl\n\n\n\nglglglg\nglglglll\nglglgllg\ngkgkgkllgk\n\ngkgkgkgkk\nglgllglglglglgl\ngkgkglgkggkgkg\ngkgkgklg</div></article><article questionid="2"><h3>Вопрос 2</h3><div class="question_content">uuuukukuk\nopopopop</div></article>', '2014-02-07 10:21:05', 'wert', 0, 2, 0),
(59, 66, 'exetp', '<article questionid="1"><h3>Вопрос 1</h3><div class="question_content">Question 1</div></article><article questionid="2"><h3>Вопрос 2</h3><div class="question_content">Question 2</div></article>', '2014-02-07 11:19:23', 'New post', 0, 5, 0),
(60, 66, 'exetp', '<article questionid="1"><h3>Вопрос 1</h3><div class="question_content">Question 1</div></article><article questionid="2"><h3>Вопрос 2</h3><div class="question_content">Question 2</div></article>', '2014-02-07 11:19:32', 'New post', 0, 5, 0),
(61, 66, 'Краткое поисание ', '<article questionid="1"><h3>Вопрос 1</h3><div class="question_content">Это первый вопрос</div></article><article questionid="2"><h3>Вопрос 2</h3><div class="question_content">Это всторой вопрос</div></article>', '2014-02-10 01:54:33', 'Текст новой истории', 0, 3, 0),
(62, 66, 'тттт', '<article questionid="1"><h3>Вопрос 1</h3><div class="question_content">фыв</div></article><article questionid="2"><h3>Вопрос 2</h3><div class="question_content">фыв</div></article>', '2014-02-10 02:00:37', 'Пост', 0, 3, 0),
(70, 39, 'rggegeg', '<article questionid="1"><h3>Вопрос 1</h3><div class="question_content">rggfgdgdfgdg</div></article>', '2014-02-11 10:55:57', 'test indexisto', 0, 4, 0),
(72, 67, 'а я не поехал. я купил мотыля и пошел на реку. я люблю рыбалку!', '<article questionid="57"><h3>Вопрос 1</h3><div class="question_content">наша делигация выступила</div></article><article questionid="58"><h3>Вопрос 2</h3><div class="question_content">с пакетом конструктивных предложений\n</div></article>', '2014-02-11 14:44:14', 'Международная конференция по вопросам интеграции ', 0, 4, 0),
(80, 63, '111', '<article questionid="1"><h3>dsfsfsf</h3><div class="question_content"></div></article><article questionid="2"><h3>dfsfsgfsgs</h3><div class="question_content">444</div></article>', '2014-02-21 17:39:04', 'catpost', 0, 4, 0),
(87, 63, 'йййй', '<article questionid="1"><h3>Вопрос 1</h3><div class="question_content">ууу</div></article><article questionid="2"><h3>Вопрос 2</h3><div class="question_content">ккк</div></article>', '2014-02-17 10:06:23', 'Хистори', 0, 3, 0),
(88, 63, 'фывыфв', '<article questionid="1"><h3>Вопрос 1</h3><div class="question_content">фыв</div></article><article questionid="2"><h3>Вопрос 2</h3><div class="question_content">фывыф</div></article>', '2014-02-17 10:07:07', 'фывфы', 0, 1, 0),
(89, 63, 'фыв', '<article questionid="1"><h3>Вопрос 1</h3><div class="question_content">фыв</div></article><article questionid="2"><h3>Вопрос 2</h3><div class="question_content"></div></article>', '2014-02-17 10:13:34', 'фыв', 0, 1, 0),
(95, 56, 'История написанная при помощи редактора', '<article questionid="1"><h3>dsfsfsf</h3><div class="question_content"><h1 style="text-align: center;">Вот и история</h1><blockquote>Цытата великого человека</blockquote></div></article>', '2014-02-27 17:49:08', 'История написанная при помощи редактора', 0, 2, 0),
(96, 56, 'Жизнь', '<article questionid="1"><h3 class="questionTitle">dsfsfsf</h3><div class="question_content"><blockquote>asdasd</blockquote>\n</div></article><article questionid="2"><h3 class="questionTitle">dfsfsgfsgs</h3><div class="question_content"><h3>sadasdas</h3><p>Тестовая история о жизни</p>\n</div></article>', '2014-02-27 18:39:35', 'История жизни', 0, 4, 0),
(97, 56, 'ddd', '<article questionid="1" class="questionContent"><h3 class="questionTitle">dsfsfsf</h3><div class="question_content"><p></p><p><img src="/upload/images/e95eff49a9d7aad75e05c2bc27b38e19.jpg" style="width: 450px; height: 333px; float: left; margin: 0px 10px 10px 0px;" alt=""></p>&nbsp; Test<p></p></div></article>', '2014-02-27 20:49:09', 'Test', 0, 2, 0),
(99, 107, 'Попробуем запрограммировать робота', '<article questionid="1" class="questionContent"><h3 class="questionTitle">dsfsfsf</h3><div class="question_content"><p></p><p></p><p></p><ul><li>Один</li><li>Два</li><li><span style="font-size: 15px; line-height: 1.45em;">Три</span><br></li></ul><div><br></div><div>текст&nbsp;</div><div>для текста&nbsp;</div><div>для теста отступа</div><div><br></div><ol><li>Пи</li><li>ту</li><li>пи</li></ol><p></p><table id="table5134"><tbody><tr><td>1</td><td>2</td><td>3</td></tr><tr><td>4</td><td>5</td><td>6</td></tr></tbody></table><p></p><a href="http://yasoon.mnb-t.com/google.com">Поиск</a><br><p></p>\n<p></p><p><img src="/upload/images/619b113e52331b860566c7a0d9b57591.jpg" style=""></p><object width="560" height="315"><param name="movie" value="//www.youtube.com/v/K0_GCuim9kY?hl=ru_RU&amp;version=3"><param name="allowFullScreen" value="true"><param name="allowscriptaccess" value="always"><embed src="//www.youtube.com/v/K0_GCuim9kY?hl=ru_RU&amp;version=3" type="application/x-shockwave-flash" width="560" height="315" allowscriptaccess="always" allowfullscreen="true"></object>\n</div></article><article questionid="2" class="questionContent"><h3 class="questionTitle">dfsfsgfsgs</h3><div class="question_content"><p>У нас что-то получится</p></div></article><article questionid="1" class="questionContent"><h3 class="questionTitle">dsfsfsf</h3><div class="question_content"><p></p><p></p><p></p><ul><li>Один</li><li>Два</li><li><span style="font-size: 15px; line-height: 1.45em;">Три</span><br></li></ul><div><br></div><div>текст&nbsp;</div><div>для текста&nbsp;</div><div>для теста отступа</div><div><br></div><ol><li>Пи</li><li>ту</li><li>пи</li></ol><p></p><table id="table5134"><tbody><tr><td>1</td><td>2</td><td>3</td></tr><tr><td>4</td><td>5</td><td>6</td></tr></tbody></table><p></p><a href="http://yasoon.mnb-t.com/google.com">Поиск</a><br><p></p>\n<p></p><p><img src="/upload/images/619b113e52331b860566c7a0d9b57591.jpg" style=""></p><object width="560" height="315"><param name="movie" value="//www.youtube.com/v/K0_GCuim9kY?hl=ru_RU&amp;version=3"><param name="allowFullScreen" value="true"><param name="allowscriptaccess" value="always"><embed src="//www.youtube.com/v/K0_GCuim9kY?hl=ru_RU&amp;version=3" type="application/x-shockwave-flash" width="560" height="315" allowscriptaccess="always" allowfullscreen="true"></object>\n</div></article><article questionid="2" class="questionContent"><h3 class="questionTitle">dfsfsgfsgs</h3><div class="question_content"><p>У нас что-то получится</p></div></article>', '2014-04-01 19:51:03', 'Попробуем', 0, 3, 0),
(104, 123, 'история', '<article questionid="1" class="questionContent"><h3 class="questionTitle">dsfsfsf</h3><div class="question_content"><p>ответ<br></p></div></article><article questionid="2" class="questionContent"><h3 class="questionTitle">dfsfsgfsgs</h3><div class="question_content"><p>ответ<br></p></div></article>', '2014-03-25 14:09:39', 'Новая история', 0, 0, 0),
(105, 67, 'очень краткое описание', '<article questionid="43" class="questionContent"><h3 class="questionTitle">потрясающий вопрос</h3><div class="question_content"><p>какой вопрос, такой и ответ!</p></div></article><article questionid="44" class="questionContent"><h3 class="questionTitle">что бы еще спросить у тебя?</h3><div class="question_content"><p>да не надо больге ничего</p></div></article>', '2014-03-26 23:45:01', 'Супер интервью', 0, 0, 0),
(106, 94, 'очень краткое, но в то же время очень полное описание истории  очень краткое, но в то же время очень полное описание истории очень краткое, но в то же время очень полное описание истории очень краткое, но в то же время очень полное описание истории очень ', '<article questionid="2" class="questionContent"><h3 class="questionTitle">dfsfsgfsgs</h3><div class="question_content"><p>отлчиный вопрос, непонятно правда что на него отвечать&nbsp;</p><blockquote>возможно, все не так просто</blockquote><p>хотя</p><p>не знаю ни одного человека каоторый бы</p><blockquote>согласился на такое</blockquote><p>вот вам и картинка напоследок</p><p><strike>хотя не дам</strike></p><p>давайте лучше <a href="www.yandex.ru">ссылку</a>.</p></div></article>', '2014-03-27 23:54:19', 'Попробуем после всего этого написать пост', 0, 0, 0),
(107, 94, 'сказка про репку', '<article questionid="1" class="questionContent"><h3 class="questionTitle">dsfsfsf</h3><div class="question_content"><p>&nbsp;ввщщ &nbsp;вщвщвщв &nbsp;вщвщвщвщв &nbsp;вдвщвщвщв &nbsp;вщвщвщвщвщ вщвщв&nbsp;«Даже это «Даже это попадает в YouTube. Это аморально и подло», — сказал Эрдоган, пообещав «добраться до YouTube».попадает в YouTube. Это аморально и подло», — сказал Эрдоган, пообещав «добраться до YouTube». &nbsp;«Даже это попадает в YouTube. Это аморально и подло», — сказал Эрдоган, пообещав «добраться до YouTube». &nbsp;«Даже это попадает в YouTube. Это аморально и подло», — сказал Эрдоган, пообещав «добраться до YouTube». &nbsp;«Даже это попадает в YouTube. Это аморально и подло», — сказал Эрдоган, пообещав «добрат<b>ься до YouTube»</b>.</p><p>fffff&nbsp;«Даже это попадает в YouTube. Это аморально и подло», — сказал Эрдоган, пообещав «добраться до YouTube».</p><p></p><ul><li>fkfffkfkfk</li><li>f;flflf &nbsp;fpffpfpfpfp f«Даже это попадает в YouTube. Это аморально и подло», — сказал Эрдоган, пообещав «добраться до YouTube».</li></ul><div>ffofofo &nbsp;«Даже это попадает в YouTube. Это аморально и подло», — сказал Эрдоган, пообещав «добраться до YouTube».</div><p></p></div></article><article questionid="1" class="questionContent"><h3 class="questionTitle">dsfsfsf</h3><div class="question_content"><p>&nbsp;ввщщ &nbsp;вщвщвщв &nbsp;вщвщвщвщв &nbsp;вдвщвщвщв &nbsp;вщвщвщвщвщ вщвщв&nbsp;«Даже это «Даже это попадает в YouTube. Это аморально и подло», — сказал Эрдоган, пообещав «добраться до YouTube».попадает в YouTube. Это аморально и подло», — сказал Эрдоган, пообещав «добраться до YouTube». &nbsp;«Даже это попадает в YouTube. Это аморально и подло», — сказал Эрдоган, пообещав «добраться до YouTube». &nbsp;«Даже это попадает в YouTube. Это аморально и подло», — сказал Эрдоган, пообещав «добраться до YouTube». &nbsp;«Даже это попадает в YouTube. Это аморально и подло», — сказал Эрдоган, пообещав «добрат<b>ься до YouTube»</b>.</p><p>fffff&nbsp;«Даже это попадает в YouTube. Это аморально и подло», — сказал Эрдоган, пообещав «добраться до YouTube».</p><p></p><ul><li>fkfffkfkfk</li><li>f;flflf &nbsp;fpffpfpfpfp f«Даже это попадает в YouTube. Это аморально и подло», — сказал Эрдоган, пообещав «добраться до YouTube».</li></ul><div>ffofofo &nbsp;«Даже это попадает в YouTube. Это аморально и подло», — сказал Эрдоган, пообещав «добраться до YouTube».</div><p></p></div></article>', '2014-03-31 22:41:31', 'Попытка №2', 0, 0, 0),
(108, 137, 'tt', '<article questionid="1" class="questionContent"><h3 class="questionTitle">dsfsfsf</h3><div class="question_content"><p>tt<br></p></div></article><article questionid="2" class="questionContent"><h3 class="questionTitle">dfsfsgfsgs</h3><div class="question_content"><p>tt<br></p></div></article>', '2014-03-28 19:53:19', 'tt', 0, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `post_answer`
--

CREATE TABLE IF NOT EXISTS `post_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=159 ;

--
-- Дамп данных таблицы `post_answer`
--

INSERT INTO `post_answer` (`id`, `post_id`, `question_id`, `answer`) VALUES
(7, 41, 1, 'fvsvd'),
(8, 41, 2, 'gsfgs'),
(13, 54, 1, 'ddd'),
(14, 54, 2, ''),
(15, 55, 1, 'eeee'),
(16, 55, 2, ''),
(17, 56, 1, 'Ответ на первый вопрос'),
(18, 56, 2, ''),
(19, 57, 1, 'Ответ на первый вопрос'),
(20, 57, 2, 'Ответ на 2 вопрос'),
(21, 58, 1, 'ghghghgg\nglglglg\nglglgl\n\n\ngl;glgllgl\nglglgl\n\n\ngkgkgkgkg\nglglglg\nglglglgl\n\n\n\nglglglg\nglglglll\nglglgllg\ngkgkgkllgk\n\ngkgkgkgkk\nglgllglglglglgl\ngkgkglgkggkgkg\ngkgkgklg'),
(22, 58, 2, 'uuuukukuk\nopopopop'),
(23, 59, 1, 'Question 1'),
(24, 59, 2, 'Question 2'),
(25, 60, 1, 'Question 1'),
(26, 60, 2, 'Question 2'),
(27, 61, 1, 'Это первый вопрос'),
(28, 61, 2, 'Это всторой вопрос'),
(29, 62, 1, 'фыв'),
(30, 62, 2, 'фыв'),
(33, 53, 1, 'reeretfffff'),
(34, 53, 2, 'dfsfsf'),
(53, 70, 1, 'rggfgdgdfgdg'),
(54, 70, 2, ''),
(81, 80, 1, ''),
(82, 80, 2, '444'),
(95, 87, 1, 'ууу'),
(96, 87, 2, 'ккк'),
(97, 88, 1, 'фыв'),
(98, 88, 2, 'фывыф'),
(99, 89, 1, 'фыв'),
(100, 89, 2, ''),
(119, 95, 1, '<h1 style="text-align: center;">Вот и история</h1><blockquote>Цытата великого человека</blockquote>'),
(120, 95, 2, ''),
(121, 95, 30, ''),
(122, 95, 31, ''),
(123, 95, 32, ''),
(124, 95, 33, ''),
(125, 96, 1, '<blockquote>asdasd</blockquote>\n'),
(126, 96, 2, '<h3>sadasdas</h3><p>Тестовая история о жизни</p>\n'),
(127, 96, 30, ''),
(128, 96, 31, ''),
(129, 96, 32, ''),
(130, 96, 33, ''),
(131, 97, 1, '<p><p><img src="/upload/images/e95eff49a9d7aad75e05c2bc27b38e19.jpg" style="width: 450px; height: 333px; float: left; margin: 0px 10px 10px 0px;" alt=""></p>&nbsp; Test</p>'),
(132, 97, 2, ''),
(133, 97, 30, ''),
(134, 97, 31, ''),
(135, 97, 32, ''),
(136, 97, 33, ''),
(139, 99, 1, '<p></p><p></p><p></p><ul><li>Один</li><li>Два</li><li><span style="font-size: 15px; line-height: 1.45em;">Три</span><br></li></ul><div><br></div><div>текст&nbsp;</div><div>для текста&nbsp;</div><div>для теста отступа</div><div><br></div><ol><li>Пи</li><li>ту</li><li>пи</li></ol><p></p><table id="table5134"><tbody><tr><td>1</td><td>2</td><td>3</td></tr><tr><td>4</td><td>5</td><td>6</td></tr></tbody></table><p></p><a href="http://yasoon.mnb-t.com/google.com">Поиск</a><br><p></p>\n<p></p><p><img src="/upload/images/619b113e52331b860566c7a0d9b57591.jpg" style=""></p><object width="560" height="315"><param name="movie" value="//www.youtube.com/v/K0_GCuim9kY?hl=ru_RU&amp;version=3"><param name="allowFullScreen" value="true"><param name="allowscriptaccess" value="always"><embed src="//www.youtube.com/v/K0_GCuim9kY?hl=ru_RU&amp;version=3" type="application/x-shockwave-flash" width="560" height="315" allowscriptaccess="always" allowfullscreen="true"></object>\n'),
(140, 99, 2, '<p>У нас что-то получится</p>'),
(149, 104, 1, '<p>ответ<br></p>'),
(150, 104, 2, '<p>ответ<br></p>'),
(151, 105, 43, '<p>какой вопрос, такой и ответ!</p>'),
(152, 105, 44, '<p>да не надо больге ничего</p>'),
(153, 106, 1, ''),
(154, 106, 2, '<p>отлчиный вопрос, непонятно правда что на него отвечать&nbsp;</p><blockquote>возможно, все не так просто</blockquote><p>хотя</p><p>не знаю ни одного человека каоторый бы</p><blockquote>согласился на такое</blockquote><p>вот вам и картинка напоследок</p><p><strike>хотя не дам</strike></p><p>давайте лучше <a href="www.yandex.ru">ссылку</a>.</p>'),
(155, 107, 1, '<p>&nbsp;ввщщ &nbsp;вщвщвщв &nbsp;вщвщвщвщв &nbsp;вдвщвщвщв &nbsp;вщвщвщвщвщ вщвщв&nbsp;«Даже это «Даже это попадает в YouTube. Это аморально и подло», — сказал Эрдоган, пообещав «добраться до YouTube».попадает в YouTube. Это аморально и подло», — сказал Эрдоган, пообещав «добраться до YouTube». &nbsp;«Даже это попадает в YouTube. Это аморально и подло», — сказал Эрдоган, пообещав «добраться до YouTube». &nbsp;«Даже это попадает в YouTube. Это аморально и подло», — сказал Эрдоган, пообещав «добраться до YouTube». &nbsp;«Даже это попадает в YouTube. Это аморально и подло», — сказал Эрдоган, пообещав «добрат<b>ься до YouTube»</b>.</p><p>fffff&nbsp;«Даже это попадает в YouTube. Это аморально и подло», — сказал Эрдоган, пообещав «добраться до YouTube».</p><p><ul><li>fkfffkfkfk</li><li>f;flflf &nbsp;fpffpfpfpfp f«Даже это попадает в YouTube. Это аморально и подло», — сказал Эрдоган, пообещав «добраться до YouTube».</li></ul><div>ffofofo &nbsp;«Даже это попадает в YouTube. Это аморально и подло», — сказал Эрдоган, пообещав «добраться до YouTube».</div></p>'),
(156, 107, 2, ''),
(157, 108, 1, '<p>tt<br></p>'),
(158, 108, 2, '<p>tt<br></p>');

-- --------------------------------------------------------

--
-- Структура таблицы `post_category`
--

CREATE TABLE IF NOT EXISTS `post_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=222 ;

--
-- Дамп данных таблицы `post_category`
--

INSERT INTO `post_category` (`id`, `post_id`, `category_id`) VALUES
(7, 27, 1),
(14, 41, 1),
(16, 41, 2),
(45, 54, 1),
(46, 55, 2),
(47, 56, 1),
(48, 57, 1),
(49, 57, 2),
(50, 58, 1),
(51, 58, 2),
(52, 59, 1),
(53, 59, 2),
(54, 60, 1),
(55, 60, 2),
(56, 61, 2),
(57, 62, 2),
(110, 53, 1),
(125, 53, 4),
(126, 53, 5),
(127, 53, 7),
(135, 70, 1),
(136, 70, 2),
(137, 70, 4),
(142, 72, 14),
(143, 72, 19),
(163, 80, 5),
(180, 80, 7),
(186, 80, 3),
(187, 87, 2),
(188, 87, 3),
(189, 88, 2),
(190, 88, 3),
(191, 89, 2),
(202, 95, 6),
(203, 96, 3),
(204, 97, 2),
(206, 99, 12),
(214, 104, 2),
(215, 105, 2),
(216, 105, 5),
(217, 106, 4),
(218, 106, 18),
(219, 107, 1),
(220, 108, 1),
(221, 108, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `post_likes`
--

CREATE TABLE IF NOT EXISTS `post_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `user_ip` varchar(20) NOT NULL,
  `last_date` datetime NOT NULL,
  `count_likes` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=64 ;

--
-- Дамп данных таблицы `post_likes`
--

INSERT INTO `post_likes` (`id`, `post_id`, `author_id`, `user_ip`, `last_date`, `count_likes`) VALUES
(12, 22, 0, '93.170.155.159', '2014-02-17 15:20:46', 3),
(13, 22, 39, '0', '2014-02-17 10:22:07', 2),
(14, 59, 63, '0', '2014-02-11 07:41:09', 1),
(15, 62, 63, '0', '2014-02-11 07:51:10', 1),
(16, 61, 63, '0', '2014-02-11 07:51:13', 1),
(17, 60, 63, '0', '2014-02-11 07:51:16', 1),
(18, 58, 63, '0', '2014-02-11 07:55:37', 1),
(20, 62, 0, '178.212.197.205', '2014-02-11 08:17:41', 1),
(21, 61, 0, '178.212.197.205', '2014-02-11 08:17:49', 1),
(22, 53, 63, '0', '2014-02-28 00:19:35', 2),
(23, 23, 63, '0', '2014-02-14 02:50:02', 2),
(24, 70, 0, '46.39.46.30', '2014-03-23 19:13:51', 3),
(25, 69, 0, '46.39.46.30', '2014-02-11 12:57:49', 1),
(27, 72, 0, '178.255.200.61', '2014-03-24 22:41:13', 3),
(28, 60, 0, '178.212.197.205', '2014-04-24 13:01:50', 3),
(29, 59, 0, '178.212.197.205', '2014-02-17 10:59:24', 3),
(30, 58, 0, '178.212.197.205', '2014-02-12 09:44:03', 1),
(32, 73, 0, '178.212.197.205', '2014-02-18 21:55:04', 2),
(33, 73, 63, '0', '2014-02-14 07:40:15', 1),
(34, 65, 63, '0', '2014-02-14 09:36:43', 1),
(35, 24, 0, '93.170.155.159', '2014-02-14 11:51:45', 1),
(36, 80, 0, '93.170.155.159', '2014-02-17 10:33:43', 2),
(37, 79, 0, '46.39.46.30', '2014-02-15 16:36:07', 1),
(39, 80, 63, '0', '2014-02-27 12:57:27', 2),
(41, 87, 0, '178.212.197.205', '2014-02-18 18:51:31', 2),
(42, 88, 0, '178.212.197.205', '2014-02-17 10:33:47', 1),
(43, 42, 0, '178.212.197.205', '2014-02-17 10:59:31', 1),
(46, 87, 56, '0', '2014-02-27 12:57:40', 1),
(47, 96, 67, '0', '2014-03-01 00:40:39', 2),
(48, 70, 67, '0', '2014-02-28 00:22:03', 1),
(49, 97, 56, '0', '2014-02-28 17:27:58', 1),
(50, 27, 56, '0', '2014-04-14 13:31:22', 2),
(51, 97, 0, '178.212.197.205', '2014-02-28 17:28:18', 1),
(52, 96, 0, '178.212.197.205', '2014-04-25 21:07:59', 2),
(53, 95, 56, '0', '2014-03-12 20:16:00', 1),
(54, 101, 0, '188.115.128.64', '2014-03-20 14:23:45', 1),
(55, 100, 0, '188.115.128.64', '2014-03-20 14:23:48', 1),
(56, 41, 107, '0', '2014-03-22 12:16:05', 1),
(57, 103, 0, '46.39.46.30', '2014-03-23 19:15:43', 1),
(58, 103, 67, '0', '2014-03-23 19:23:24', 1),
(59, 99, 67, '0', '2014-03-24 21:04:58', 2),
(60, 72, 107, '0', '2014-03-24 18:53:13', 1),
(61, 99, 0, '46.39.46.30', '2014-03-24 22:41:37', 1),
(62, 27, 0, '93.170.155.159', '2014-04-24 10:40:06', 1),
(63, 95, 0, '37.233.62.35', '2014-04-29 17:52:39', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `question`
--

CREATE TABLE IF NOT EXISTS `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `ask_authorId` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  `answer` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_B6F7494EF675F31B` (`author_id`),
  KEY `author_id` (`author_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=97 ;

--
-- Дамп данных таблицы `question`
--

INSERT INTO `question` (`id`, `author_id`, `ask_authorId`, `date`, `text`, `answer`) VALUES
(20, 44, 41, '2014-02-07 03:54:07', 'Текст вопроса', NULL),
(21, 56, 63, '2014-02-07 09:46:26', 'Почему лиса ?', 'Потому что огонь!'),
(24, 63, 56, '2014-02-10 09:15:53', 'Почему хочешь быть лучшим ?', 'Потому что я лучший!'),
(25, 63, 56, '2014-02-10 09:28:10', 'Почему хочешь быть лучшим ?', '111'),
(31, 63, 56, '2014-02-10 09:41:30', '1111', 'jntnds'),
(33, 41, 67, '2014-02-10 12:53:25', 'как ты сам вооюще??_)', NULL),
(34, 41, 67, '2014-02-10 12:53:47', 'ну ты смешной', NULL),
(35, 62, 39, '2014-02-11 11:53:43', 'Тест индекса', NULL),
(42, 45, 25, '2014-02-14 06:23:41', 'fsfdfdf', NULL),
(43, 45, 25, '2014-02-14 06:24:14', 'fsfdfdf', NULL),
(44, 45, 25, '2014-02-14 06:25:48', 'fsfdfdf', NULL),
(49, 56, 63, '2014-02-17 11:45:37', 'Еще раз !', 'Держи'),
(50, 63, 56, '2014-02-17 16:35:46', 'Вопрос', '442412'),
(51, 63, 56, '2014-02-17 16:36:37', 'еее', '2323'),
(52, 63, 56, '2014-02-17 18:09:08', '133', '2323'),
(53, 63, 56, '2014-02-17 18:10:08', '888', '222'),
(55, 56, 63, '2014-02-18 18:41:54', 'Что поповоду браузера ?', 'Я лучший!'),
(56, 66, 67, '2014-02-27 23:42:19', 'как поживаешь?', NULL),
(57, 56, 67, '2014-02-28 00:01:08', 'как дела фокс', 'Отлично )'),
(58, 63, 67, '2014-02-28 00:04:30', 'неужели', NULL),
(59, 63, 67, '2014-02-28 00:05:33', 'к', NULL),
(61, 67, 56, '2014-02-28 18:42:10', 'Как дела еще раз ?)', NULL),
(62, 56, 67, '2014-03-01 00:42:35', 'какой то очень интересный вопрос', NULL),
(63, 56, 67, '2014-03-01 00:42:58', 'и еще один держи', NULL),
(64, 67, 94, '2014-03-01 02:21:09', 'здарова брате', 'здоровее видали'),
(76, 41, 107, '2014-03-24 16:27:04', 'текст вопроса', NULL),
(79, 107, 123, '2014-03-24 17:16:12', 'Какой нибудь еще', 'b tot jlby jndtn'),
(80, 107, 123, '2014-03-24 17:17:31', 'Задать еще один вопрос', 'another answer'),
(81, 107, 123, '2014-03-24 17:19:10', 'и еще один', 'и еще один ответ'),
(82, 107, 123, '2014-03-24 17:21:10', 'тупое тестрование', 'тупой ответ'),
(85, 107, 123, '2014-03-24 18:19:33', 'задаем вопрос', 'Наконец то я разобрался'),
(90, 123, 107, '2014-03-25 14:10:05', 'вопрос', 'ответ'),
(92, 123, 107, '2014-03-25 14:24:26', 'новый вопрос', 'one two'),
(93, 67, 124, '2014-03-25 14:44:41', 'Привет, как дела с тестами вопросов? (', 'Отлиично вроде бы'),
(96, 41, 123, '2014-03-25 18:19:33', 'вопрос', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `story_of_the_day`
--

CREATE TABLE IF NOT EXISTS `story_of_the_day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `assigned` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=25 ;

--
-- Дамп данных таблицы `story_of_the_day`
--

INSERT INTO `story_of_the_day` (`id`, `post_id`, `assigned`) VALUES
(16, 22, '2014-02-19 14:43:37'),
(17, 22, '2014-02-19 14:43:40'),
(18, 27, '2014-02-24 15:07:47'),
(19, 56, '2014-02-24 16:15:59'),
(20, 27, '2014-02-25 00:44:53'),
(21, 27, '2014-02-26 16:55:16'),
(22, 27, '2014-02-27 12:17:50'),
(23, 27, '2014-03-12 19:26:11'),
(24, 58, '2014-04-09 23:25:59');

-- --------------------------------------------------------

--
-- Структура таблицы `timeline`
--

CREATE TABLE IF NOT EXISTS `timeline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `posts_count` int(11) NOT NULL,
  `answers_count` int(11) NOT NULL,
  `questions_count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Дамп данных таблицы `timeline`
--

INSERT INTO `timeline` (`id`, `author_id`, `posts_count`, `answers_count`, `questions_count`) VALUES
(1, 45, 0, 0, 1),
(3, 87, 2, 3, 5),
(4, 41, 11, 4, 2),
(5, 67, 0, 0, 0),
(6, 56, 1, 0, 1),
(7, 63, 3, 1, 2),
(11, 66, 1, 0, 1),
(13, 107, 0, 0, 3),
(14, 123, 0, 0, 0);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `FK_5A8A6C8DF675F31B` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`);

--
-- Ограничения внешнего ключа таблицы `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `FK_B6F7494EF675F31B` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
