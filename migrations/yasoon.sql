-- phpMyAdmin SQL Dump
-- version 4.0.6deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 09, 2016 at 05:10 PM
-- Server version: 5.5.37-0ubuntu0.13.10.1
-- PHP Version: 5.5.3-1ubuntu2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `yasoon`
--

-- --------------------------------------------------------

--
-- Table structure for table `answer_timeline`
--

CREATE TABLE IF NOT EXISTS `answer_timeline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) DEFAULT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `answer_timeline`
--

INSERT INTO `answer_timeline` (`id`, `author_id`, `question_id`) VALUES
(1, 245, 6),
(3, 310, 6);

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE IF NOT EXISTS `author` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci DEFAULT '''''',
  `subscribed` tinyint(1) DEFAULT '0',
  `description` varchar(200) COLLATE utf8_unicode_ci DEFAULT '''''',
  `job` varchar(129) COLLATE utf8_unicode_ci DEFAULT '''''',
  `dream` varchar(129) COLLATE utf8_unicode_ci DEFAULT '''''',
  `interest` varchar(129) COLLATE utf8_unicode_ci DEFAULT '''''',
  `publication_date` datetime DEFAULT NULL,
  `img` varchar(45) COLLATE utf8_unicode_ci DEFAULT 'noAvatar.jpg',
  `interview_caption` varchar(290) COLLATE utf8_unicode_ci DEFAULT NULL,
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AVG_ROW_LENGTH=390 AUTO_INCREMENT=483 ;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`id`, `name`, `email`, `subscribed`, `description`, `job`, `dream`, `interest`, `publication_date`, `img`, `interview_caption`, `password`, `homepage`, `salt`, `role`, `newpass`, `facebook_id`, `vkontakte_id`, `reg_from`, `date_change`) VALUES
(192, 'Иван Клыков', 'serpantin@inbox.ru', 0, NULL, 'Основатель', 'Пилот гражданской авиации', 'Архитектор', '2014-07-25 16:14:58', '213fa066796e26126bcfd95c6dfd5666.jpg', 'Фондовые рынки - это смесь математики, психологии и искусства - пересечение всего того, чем я когда-либо хотел заниматься. Фондовый рынок - как море. Никогда не надоедает.', 'e64067c3d016f2437a8a2351b2e19be2', 'yasoon.ru', NULL, 4, NULL, NULL, NULL, 0, '2015-01-03 02:44:36'),
(195, 'Dimitry', 'alegria2112@gmail.com', 1, NULL, 'Танцор диско', 'Главный танцор диско', 'Главный танцор диско', '2014-07-25 19:34:21', NULL, 'Я танцор диско - этим все сказано!', '8870a7d35201e2f5a6e45626dddeeba1', 'disco_good', NULL, 1, NULL, NULL, NULL, 0, '2014-07-25 19:36:50'),
(220, 'Наталья Кашина', 'millula@mail.ru', 0, NULL, 'Юриспруденция', 'Профессиональный спорт ', 'Юриспруденция и киноиндустрия ', '2014-08-20 01:12:03', '1452440137.jpg', 'Профессия юриста состоит в том, чтобы все ставить под сомнение, ни с чем не соглашаться и без конца говорить.\n\nТ. Джефферсон', '', 'http://vk.com/millula', NULL, 1, NULL, NULL, '986089', 2, '2014-08-22 14:30:56'),
(222, 'Соня Деянова', '', 0, NULL, 'Юрист ', 'Журналист', 'Ученый', '2014-08-22 00:44:05', '1408653845.jpg', '', '', 'http://vk.com/deyanova_s', NULL, 1, NULL, NULL, '11397836', 2, '2014-08-22 01:54:36'),
(223, 'Таня Горячева', '', 0, NULL, 'Дизайн и архитектура', 'Модельер', 'Архитектор', '2014-08-22 12:33:03', '1408696383.jpg', 'Я люблю свою работу - это возможность реализовать себя, создавая буквально из ничего, с чистого листа и пустого рабочего поля автокада максимально эргономичное, комфортное и при всем при этом красивое пространство для жизни.', '', 'http://vk.com/id810551', NULL, 1, NULL, NULL, '810551', 2, '2014-08-22 13:31:38'),
(224, 'Мария Калякина', '', 1, NULL, NULL, NULL, NULL, '2014-08-22 17:28:02', '1408714082.jpg', NULL, '', 'https://www.facebook.com/mary.kalyakina', NULL, 1, NULL, '100000807174858', NULL, 1, NULL),
(225, 'Мария Калякина', '', 1, NULL, NULL, NULL, NULL, '2014-08-22 17:29:17', '1408714157.jpg', NULL, '', 'http://vk.com/me.online', NULL, 1, NULL, NULL, '553171', 2, NULL),
(226, ' ', '', 1, NULL, NULL, NULL, NULL, '2014-08-22 17:29:42', '1408714182.jpg', NULL, '', 'http://vk.com/', NULL, 1, NULL, NULL, NULL, 2, NULL),
(227, 'Мария Калякина', 'romashka_QK_@mail.ru', 1, NULL, 'Инвестиционный консультант', 'Телеведущей, библиотекарем', 'Управляющий активами', '2014-08-22 17:30:18', NULL, 'Я занимаюсь тем, что приносит мне деньги и удовольствие от времяпрепровождения с умными, интересными людьми.', 'c1225c944d5c6226bdd22a56d651f1ca', 'https://www.facebook.com/mary.kalyakina', NULL, 1, NULL, NULL, NULL, 0, '2014-08-22 17:33:06'),
(228, 'Екатерина Кузьмина', '', 1, NULL, NULL, NULL, NULL, '2014-08-23 02:14:53', '1408745693.jpg', NULL, '', 'http://vk.com/id160535013', NULL, 1, NULL, NULL, '160535013', 2, NULL),
(229, 'Елена Клыкова', '', 0, NULL, 'Компьютерный анализ изображений ', 'Врач, научный работник', 'Писатель, режиссер', '2014-08-23 21:22:12', '1420282778.jpg', '', '', 'http://vk.com/id31947320', NULL, 1, NULL, NULL, '31947320', 2, '2015-01-03 15:00:11'),
(230, 'Марина Кашина', '', 0, NULL, 'Риск-менеджер', 'Сыщик', 'Врач', '2014-08-23 21:50:42', '1421789399.jpg', '', '', 'http://vk.com/kashina_m', NULL, 1, NULL, NULL, '81343', 2, '2014-08-23 21:51:53'),
(231, 'Анастасия Скобликова', 'skoblikova_as@mail.ru', 0, NULL, '', '', '', '2014-08-24 21:02:17', '3f03b33e65885d06799e63f27ece50d6.jpg', '', '28a5070ebbfd742760af31b7195ffa80', '', NULL, 1, '4545350338', NULL, NULL, 0, '2014-12-21 22:51:55'),
(232, 'Максим Иванов', 'svech@bk.ru', 0, NULL, 'АСУ ТП, инженер-наладчик', 'Летчик-истребитель', 'Министр иностранных дел', '2014-08-29 09:20:04', NULL, 'Главная заповедь наладчика - НЕ УСУГУБИ', '064daa5cf38da507d9eea4c59239567a', '', NULL, 1, '7024240614', NULL, NULL, 0, '2014-08-29 09:37:34'),
(233, 'Наталья Коробкина', 'n_temkina@yahoo.com', 0, NULL, 'Риск-менеджмент', 'Учитель, педагог', 'Учитель', '2014-08-29 16:39:11', '8158d45920642e8d2386755318a730c5.jpg', NULL, 'a3d5f60cf07e5f32e790a092739df065', NULL, NULL, 1, NULL, NULL, NULL, 0, '2014-08-29 16:39:11'),
(234, 'Марина Кашина', 'mlkashina@gmail.com', 0, NULL, 'Основатель', 'Сыщик', 'Врач', '2014-09-01 21:54:04', 'e51ad969fee68dde27919e9dd32d4de5.jpg', 'Всему причина человеческий фактор.', '41b5d047aee57b6755722424323c26ec', '', NULL, 1, NULL, NULL, NULL, 0, '2014-10-20 15:32:43'),
(235, 'Ivan Test', 'test@yasoon.ru', 0, NULL, NULL, NULL, NULL, '2014-09-25 19:27:20', NULL, NULL, '4eae18cf9e54a0f62b44176d074cbe2f', NULL, NULL, 1, NULL, NULL, NULL, 0, '2014-09-25 19:27:20'),
(236, 'Мария Мельницкая', '', 1, NULL, NULL, NULL, NULL, '2014-09-04 19:44:58', '1409845498.jpg', NULL, '', 'http://vk.com/vanillawitch', NULL, 1, NULL, NULL, '133355', 2, NULL),
(240, 'Елена Голубюк', '', 0, NULL, 'Дирижер', 'Композитор, певица', 'Изобретатель', '2014-09-08 20:41:27', '1421784845.jpg', 'Музыка воодушевляет весь мир, снабжает душу крыльями, способствует полету воображения; музыка придает жизнь и веселье всему существующему... Ее можно назвать воплощением всего прекрасного и всего возвышенного.\n \nПлатон\n', '', 'http://vk.com/id11353188', NULL, 1, NULL, NULL, '11353188', 2, '2014-09-09 15:26:40'),
(241, 'Ольга Егорова', '', 0, NULL, 'Оптическое приборостроение (микроскопия)', 'Библиотекарь', 'Служить Родине (в любой профессии)', '2014-09-08 22:43:26', '1410201806.jpg', 'Помогаю специалистам разных направлений освоить современный микроскоп и методы контрастирования , найти решения  поставленных задач по микроскопическим исследованиям разных объектов в медицине, микроэлектроники, часовой промышленности , геологии и минералогии, археологии и др.', '', 'http://vk.com/poi3938546', NULL, 1, NULL, NULL, '5635313', 2, '2014-09-08 22:53:05'),
(243, 'Андрей Эттер', '', 0, NULL, 'Консультант', 'Актер', 'Учитель', '2014-09-09 15:35:02', '1410262502.jpg', 'Первая профессия, в которой я попробовал себя.\nМоя должность сводится к тому, чтобы говорить людям одно и то же.\nЕсли они не понимают, то упрощаешь, главное - не упростить до настолько детского уровня, что он покажется клиенту оскорбительным. \n ', '', 'http://vk.com/dartpotato', NULL, 1, NULL, NULL, '58504460', 2, '2014-09-09 15:41:43'),
(244, 'Artyom Gavrilov', '', 0, NULL, 'Программист', 'Мечтал строить ракеты', 'Инженеры', '2014-09-10 23:04:57', '1410375897.jpg', '', '', 'http://vk.com/charliea', NULL, 1, NULL, NULL, '2528831', 2, '2014-09-10 23:08:10'),
(245, 'artur minaev', 'artur@yasoon.ru', 0, NULL, 'sobakovod', NULL, 'rjshki', '2014-09-28 13:27:32', NULL, 'ddkdk dmdkdkd dkd', '4eae18cf9e54a0f62b44176d074cbe2f', NULL, NULL, 1, NULL, NULL, NULL, 0, '2014-09-28 13:28:03'),
(247, 'Екатерина Васильева', '', 0, NULL, 'Воспитатель детского сада', 'Врач', 'Неонатолог', '2014-09-15 21:23:35', '1410801815.jpg', '', '', 'http://vk.com/id4115110', NULL, 1, NULL, NULL, '4115110', 2, '2014-09-15 22:05:03'),
(254, 'Валерия Пикалёва', '', 1, NULL, NULL, NULL, NULL, '2014-09-20 19:38:44', '1411227525.jpg', NULL, '', 'https://www.facebook.com/lerka.pikalyova', NULL, 1, NULL, '100000765942030', NULL, 1, NULL),
(257, 'Блог Ясуна', 'yasoon.ga@gmail.com', 0, NULL, 'Пиарщик', NULL, NULL, '2014-10-05 22:38:19', '44873753abcee9e266647fe94b1eb1c5.png', NULL, '41b5d047aee57b6755722424323c26ec', 'yasoon.ru', NULL, 1, NULL, NULL, NULL, 0, '2014-10-05 22:39:40'),
(258, 'Сергей', 'serwizz@gmail.com', 0, NULL, 'Программист', NULL, 'Летчик', '2014-10-05 22:51:15', '40ddd1dababb727f722b82e29543d796.jpg', NULL, '8952b13c23db2e1dde3e0cf930906200', NULL, NULL, 4, NULL, NULL, NULL, 0, '2014-10-05 22:56:21'),
(259, 'Иван Клыков', '', 0, NULL, 'СЕО', '', '', '2014-10-05 22:58:44', '1421588372.jpg', '', '', 'http://vk.com/id9191', NULL, 1, NULL, NULL, '9191', 2, '2015-01-09 16:13:41'),
(260, 'Marina Kashina', '', 0, NULL, 'Блоггер', 'Саентолог', 'Диетолог', '2014-10-05 23:02:10', '1412535731.jpg', 'Стала блоггером вчера', '', 'https://www.facebook.com/mlkashina', NULL, 1, NULL, '100000407935023', NULL, 1, '2014-10-05 23:03:08'),
(261, ' ', '', 1, NULL, NULL, NULL, NULL, '2014-10-07 01:33:22', '1412631202.jpg', NULL, '', 'http://vk.com/', NULL, 1, NULL, NULL, NULL, 2, NULL),
(262, 'Леонид', 'leonid.kashin@gmail.com', 1, NULL, 'Механик, инженер', NULL, NULL, '2014-10-07 01:58:46', NULL, NULL, '41b5d047aee57b6755722424323c26ec', NULL, NULL, 1, NULL, NULL, NULL, 0, '2014-10-07 02:00:33'),
(263, 'Aleksey Savitsky', 'alekseysavitsky@gmail.com', 1, NULL, NULL, NULL, NULL, '2014-10-09 21:35:24', '1427191739.jpg', NULL, '', 'https://www.facebook.com/aleksey.savitsky', NULL, 1, NULL, '1341077128', NULL, 1, NULL),
(264, 'Ольга', 'skiphy@yandex.ru', 0, NULL, 'Преподаватель высшей математики', 'Учитель', 'Судоводитель', '2014-10-14 23:27:02', 'f8e8d40a1294dca4f267813cc6d94426.jpg', '8,5 лет отработала техническим писателем, потом внезапно все бросила и пошла преподавать высшую математику.', '548c4a5f90470ccc71ffcb34dccd0979', '', NULL, 1, '6630305510', NULL, NULL, 0, '2014-10-28 01:08:09'),
(282, 'Ilya Chekh', '', 0, NULL, 'Робототехника', 'Техническая инженерная специальность', 'Робототехника', '2014-10-18 21:04:19', '1421977626.jpg', 'Опыт работы инженером-конструктором на машиностроительном заводе в Санкт-Петербурге. Руководил направлением. Основатель и генеральный директор компании W.E.A.S. Robotics, которая занимается разработкой различных решений в области робототехники и автоматизации.', '', 'https://www.facebook.com/ilya.chekh', NULL, 1, NULL, '1462508266', NULL, 1, '2015-01-23 07:47:46'),
(283, 'Елена', 'eleptn@gmail.com', 0, NULL, 'Изобразительное искусство', 'Балерина', 'Меня восхищают не профессии, а личности, кото', '2014-10-18 23:23:52', 'bcf8a2a57f30b5ab36c65fc4b017a4df.JPG', 'Люблю разрушать стереотипы и очеловечивать мифы. Многие зарубежные туристы так расписали матрешек с моей помощью, что их не стыдно показать или даже подарить близким или друзьям. Они сами потом любуются и удивляются, какие красавицы у них получились. И я вместе  с ними. ', 'c3afccebe97c0c7c74fd9d92257e6476', '', NULL, 1, NULL, NULL, NULL, 0, '2014-10-19 19:35:30'),
(284, 'Александр', 'alexandr_r@mail.ru', 0, NULL, 'Управление', 'пожарный', 'музыкант', '2014-10-19 17:17:51', '711a3c332d52feebc3097408e4afc977.jpg', '', '40fa3902e19c4daf1b1bc464f279617a', '', NULL, 1, NULL, NULL, NULL, 0, '2014-10-19 17:51:06'),
(285, 'Марина Зенина', 'mari_ng@bk.ru', 1, NULL, 'Врач, лабораторная онкогематология', 'учитель', 'Врач, педагог', '2014-10-20 18:19:46', '1dfb5853f6b98a1e783ceb204c61e796.bmp', 'Занимаюсь диагностикой онкогематологических заболеваний. Каждый случай - как пазл. Нужно собрать воедино все данные - анализ крови, костного мозга, анамнез и выставить диагноз. ', '71f4d6eba67a6b26f7f5281dd2c758bb', NULL, NULL, 1, NULL, NULL, NULL, 0, '2014-10-20 18:27:33'),
(286, 'Алексей Савицкий', '', 1, NULL, NULL, NULL, NULL, '2014-10-21 01:07:05', '1413839225.jpg', NULL, '', 'http://vk.com/id5333762', NULL, 1, NULL, NULL, '5333762', 2, NULL),
(287, 'Евгения Краснова', '', 0, NULL, 'руководитель конструкторского бюро', 'изобретатель', 'программист', '2014-10-21 21:00:48', '1413910848.jpg', 'Я руководила с детства - родителями, подружками, одноклассниками, процессами. Люблю разбираться во всем новом для себя. Особенно в областях, которые бросают вызов. Конструкторская деятельность - одна из таких. ', '', 'http://vk.com/id1925358', NULL, 1, NULL, NULL, '1925358', 2, '2014-10-21 21:09:34'),
(288, 'Алла', 'povarkova@mail.ru', 0, NULL, 'Продавец', 'Дрессировщица :-)', 'Художник, композитор, изобретатель', '2014-10-23 12:58:58', '88781f05245a765048f66369f625c23e.jpg', '', '941343b8c2d5631304d2717d0286116c', '', NULL, 1, NULL, NULL, NULL, 0, '2014-10-24 12:03:50'),
(289, 'Лидия Ивановна', 'lida_iv@mail.ru', 0, NULL, 'ИНЖЕНЕР МЕТАЛЛУРГ', '', '', '2014-10-24 21:44:31', '3d971fd5f9aa9ef65a0e2b9075087e2b.jpg', '', '429952387ee6a9cda7952a5a2b137b82', '', NULL, 1, NULL, NULL, NULL, 0, '2014-10-24 22:34:54'),
(290, 'Варвара Косова', '', 0, NULL, 'Трансформационный тренер, коуч, стилист', 'педагог', 'трансформационный тренер', '2014-10-30 22:37:15', '1414694235.jpg', 'Люблю спорт и ранний завтрак в центре города. Часто работаю в кофейнях, они создают особое настроение и вдохноение на день.', '', 'http://vk.com/vakosova', NULL, 1, NULL, NULL, '614163', 2, '2014-10-30 22:39:31'),
(291, 'Надежда Филимоненкова', '', 0, NULL, '--', '', '', '2014-11-01 14:45:55', '1414838755.jpg', '', '', 'http://vk.com/id216266', NULL, 1, NULL, NULL, '216266', 2, '2014-11-09 18:24:31'),
(292, 'Julia Lvov', 'jl_105@hotmail.com', 0, NULL, 'Risk Program Manager', '', '', '2014-11-02 22:06:41', '8861e7ffcf0d996907d47c9dc0faa398.JPG', '', '4a2afcda0115caa3c12e39c5309df4f0', '', NULL, 1, NULL, NULL, NULL, 0, '2015-02-15 14:00:11'),
(294, 'Викуля Мельник', '', 1, NULL, NULL, NULL, NULL, '2014-11-07 21:07:38', '1415380058.jpg', NULL, '', 'http://vk.com/viktoriya_vikatoriya_v', NULL, 1, NULL, NULL, '15563571', 2, NULL),
(295, ' ', '', 1, NULL, NULL, NULL, NULL, '2014-11-15 00:01:33', '1415995293.jpg', NULL, '', 'http://vk.com/', NULL, 1, NULL, NULL, NULL, 2, NULL),
(296, ' ', '', 1, NULL, NULL, NULL, NULL, '2014-11-15 00:04:07', '1415995447.jpg', NULL, '', 'http://vk.com/', NULL, 1, NULL, NULL, NULL, 2, NULL),
(297, ' ', '', 1, NULL, NULL, NULL, NULL, '2014-11-15 00:06:21', '1415995581.jpg', NULL, '', 'http://vk.com/', NULL, 1, NULL, NULL, NULL, 2, NULL),
(298, ' ', '', 1, NULL, NULL, NULL, NULL, '2014-11-15 00:26:32', '1415996792.jpg', NULL, '', 'http://vk.com/', NULL, 1, NULL, NULL, NULL, 2, NULL),
(300, 'Жанна Д''Арк', 'janna@yasoon.ru', 0, NULL, 'Спасаю Францию', NULL, NULL, '2014-11-15 22:55:54', '3c86e2658bde170cec8cf2acf136af6c.gif', 'Казнена в 1431. Оправдана в 1456. Канизирована в 1920.', '91ad92d3db441e628a7e06d000eb0f4b', NULL, NULL, 1, NULL, NULL, NULL, 0, '2014-11-15 23:01:35'),
(301, 'Sky_radar', 'alex_flight_radar@gmail.com', 0, NULL, 'Второй пилот ВС ', 'Летчик-истребитель', 'Нейрохирург', '2014-11-16 20:06:06', NULL, NULL, '91ad92d3db441e628a7e06d000eb0f4b', NULL, NULL, 1, NULL, NULL, NULL, 0, '2014-11-16 20:16:44'),
(302, 'Евгений', 'evgen.test@test.com', 0, NULL, 'it', NULL, NULL, '2014-11-17 20:49:01', NULL, NULL, '202cb962ac59075b964b07152d234b70', NULL, NULL, 1, NULL, NULL, NULL, 0, '2014-11-17 20:49:08'),
(303, 'asd', 'asd@asd.com', 0, NULL, 'asd', NULL, NULL, '2014-11-17 21:09:44', NULL, NULL, '7815696ecbf1c96e6894b779456d330e', NULL, NULL, 1, NULL, NULL, NULL, 0, '2014-11-17 21:09:48'),
(304, 'Lyosha Kannibalyosha', '', 1, NULL, NULL, NULL, NULL, '2014-11-18 22:06:06', '1416333966.jpg', NULL, '', 'http://vk.com/cannibalo', NULL, 1, NULL, NULL, '3369880', 2, NULL),
(305, 'test', 'test@test.test', 0, NULL, 'Торговля', '', '', '2014-11-18 23:06:34', NULL, '', '827ccb0eea8a706c4c34a16891f84e7b', '', NULL, 1, '5014052501', NULL, NULL, 0, '2014-12-04 12:27:18'),
(306, 'Артур Перевалов', '', 1, NULL, NULL, NULL, NULL, '2014-11-19 00:34:41', '1416342881.jpg', NULL, '', 'https://www.facebook.com/artur.perevalov', NULL, 1, NULL, '1138794063', NULL, 1, NULL),
(307, 'Анатолий Цукерман', '', 0, NULL, 'Учитель иностранного языка', 'Актер театра и кино', 'Режиссер театра и кино, сценарист и писатель', '2014-11-19 12:31:21', '1416385881.jpg', '', '', 'http://vk.com/securitypolicy', NULL, 1, NULL, NULL, '2857594', 2, '2014-11-19 12:42:21'),
(308, 'Анатолий Цукерман', '', 1, NULL, NULL, NULL, NULL, '2014-11-19 12:29:28', '1416385768.jpg', NULL, '', 'http://vk.com/securitypolicy', NULL, 1, NULL, NULL, '2857594', 2, NULL),
(309, 'Ваша Маша', '', 1, NULL, NULL, NULL, NULL, '2014-11-19 13:42:17', '1416390137.jpg', NULL, '', 'http://vk.com/id8191', NULL, 1, NULL, NULL, '8191', 2, NULL),
(310, 'Милорад Йович', 'milorad@yasoon.ru', 0, NULL, 'Банкир', NULL, NULL, '2014-11-19 15:41:52', '8a6ad8e143822fc1c759f2e525590c3c.png', NULL, '91ad92d3db441e628a7e06d000eb0f4b', NULL, NULL, 1, NULL, NULL, NULL, 0, '2014-11-19 15:42:45'),
(311, 'Миша', 'ohimsosocial@gmail.com', 0, NULL, 'Переводчик', 'Машинист', 'Садовник-библиотекарь', '2014-11-21 14:50:07', NULL, NULL, 'dc647eb65e6711e155375218212b3964', NULL, NULL, 1, NULL, NULL, NULL, 0, '2014-11-21 14:50:46'),
(312, 'Иван Соломин', '', 1, NULL, NULL, NULL, NULL, '2014-11-21 17:58:46', '1416578326.jpg', NULL, '', 'https://www.facebook.com/ivan.solomin', NULL, 1, NULL, '100001807209114', NULL, 1, NULL),
(313, 'Евгений', 'suraleb.boris@gmail.com', 0, NULL, 'Программист', '', '', '2014-11-24 22:58:10', NULL, '', '202cb962ac59075b964b07152d234b70', '', NULL, 1, '1093318114', NULL, NULL, 0, '2014-12-04 12:32:44'),
(325, 'Natasha Kashina', '', 1, NULL, NULL, NULL, NULL, '2014-12-06 17:14:33', '1417871673.jpg', NULL, '', 'https://www.facebook.com/natasha.kashina.10', NULL, 1, NULL, '100007307616067', NULL, 1, NULL),
(326, 'Михаил Казекин', '', 0, NULL, 'Data Scientist', 'Не помню', 'Летчик', '2014-12-07 03:36:35', '1417908995.jpg', '', '', 'http://vk.com/mikaza', NULL, 1, NULL, NULL, '37', 2, '2014-12-07 03:37:57'),
(327, 'Михаил Парандий', '', 1, NULL, NULL, NULL, NULL, '2014-12-09 01:20:51', '1422915016.jpg', NULL, '', 'http://vk.com/mihail.parandiy', NULL, 1, NULL, NULL, '17626135', 2, NULL),
(328, 'Sonia Sarvi', '', 0, NULL, 'Музыка, музыкальная педагогика, звукорежиссура.', 'Певица, еще какое-то время - воспитатель детского сада, циркачка и моряк', 'Музыкант, а вообще - любая, когда я вижу настоящее мастерство. Социальные профес', '2014-12-10 22:38:45', '1424593712.jpg', '', '', 'http://vk.com/soniasaarvi', NULL, 1, NULL, NULL, '9512626', 2, '2014-12-11 12:02:35'),
(329, 'Сергей Пикалёв', '', 1, NULL, NULL, NULL, NULL, '2014-12-12 12:42:29', '1418373749.jpg', NULL, '', 'https://www.facebook.com/spikalev', NULL, 1, NULL, '613241944', NULL, 1, NULL),
(330, 'Марго Войнаровская', '', 1, NULL, NULL, NULL, NULL, '2014-12-15 17:52:02', '1418651522.jpg', NULL, '', 'https://www.facebook.com/ternovnikk', NULL, 1, NULL, '100000545464497', NULL, 1, NULL),
(331, 'Тима Мельник', '', 1, NULL, NULL, NULL, NULL, '2014-12-18 12:53:12', '1423572844.jpg', NULL, '', 'http://vk.com/timofeymelnik', NULL, 1, NULL, NULL, '16648575', 2, NULL),
(332, 'Игорь Качура', '', 0, NULL, 'Интернет', 'Милицейский', 'Евангелист', '2014-12-21 02:22:27', '1419114147.jpg', '8 лет работая в Интернете я умудрился из за технической ошибки хостера и своему недосмотру потерять один из своих сайтов.', '', 'https://www.facebook.com/ikachura', NULL, 1, NULL, '735282327', NULL, 1, '2014-12-21 02:24:50'),
(333, 'Jane Bondarenko', '', 0, NULL, '', '', '', '2014-12-21 13:42:52', '1419154972.jpg', '', '', 'https://www.facebook.com/janefromrussia', NULL, 1, NULL, '1561793792', NULL, 1, '2014-12-21 13:44:38'),
(334, 'Юля Жидкова', 'julie-f14@yandex.ru', 1, NULL, NULL, NULL, NULL, '2014-12-21 13:44:09', '1428586563.jpg', NULL, '', 'http://vk.com/yulia.zhidkova', NULL, 1, NULL, NULL, '80709', 2, NULL),
(335, 'Julia Zhidkova', '', 1, NULL, NULL, NULL, NULL, '2014-12-21 15:23:06', '1419160986.jpg', NULL, '', 'https://www.facebook.com/julia.zhidkova.9', NULL, 1, NULL, '100000738079826', NULL, 1, NULL),
(336, 'Юрий Васильев', '', 1, NULL, NULL, NULL, NULL, '2014-12-21 18:50:16', '1419173416.jpg', NULL, '', 'http://vk.com/yurii', NULL, 1, NULL, NULL, '236286', 2, NULL),
(337, 'Кирилл Пан-Ченко', '', 1, NULL, NULL, NULL, NULL, '2014-12-22 18:49:52', '1419259792.jpg', NULL, '', 'http://vk.com/panchenko_kirill', NULL, 1, NULL, NULL, '186516952', 2, NULL),
(338, 'Lena Lena', 'julia.zhidkova@gmail.com', 0, NULL, 'Продажи', 'Принцесса', 'Писатель', '2014-12-25 13:41:02', 'ef3b851e132a2b9eef1fa7cb92d2aff4.jpg', 'Чем больше знаешь о клиентах неформальной информации, тем ты ближе к успеху. Одна моя постоянная клиентка рассказывала мне вообще все - вплоть до того, какого цвета трусы она купит мужу на 23 февраля.', 'e1687f4370afeafeb028f2044f4ec0c2', '', NULL, 1, '4343721280', NULL, NULL, 0, '2014-12-25 15:43:07'),
(340, 'Илья Сакмаров', '', 1, NULL, NULL, NULL, NULL, '2014-12-28 22:47:35', '1419792455.jpg', NULL, '', 'http://vk.com/spbmusic.ilya', NULL, 1, NULL, NULL, '69832734', 2, NULL),
(341, 'Алла Григорьевна', 'litvina_alla@mail.ru', 0, NULL, 'Дирижер хора', '', 'Меня восхищают не профессии, а люди в профессии, которые работают не ради денег, а ради дела. ', '2014-12-31 16:08:14', '59c02b52aaaee0669e1ac45d8f43c811.jpg', 'В нашей профессии есть такое понятие «воля к звуку», потому что если у тебя свободные руки, пластичные, но они просто живут сами по себе и не выражают сути музыкального сочинения, то они не могут заставить исполнителя сделать то, что нужно, и результата не будет. ', '32c7f2f8268c9f9df94fafad2f3a9b03', '', NULL, 1, NULL, NULL, NULL, 0, '2014-12-31 16:28:45'),
(342, 'Марго-Габриэль Войнаровская', '', 0, NULL, 'Лаборант (художник-реставратор)', 'я мечтала быть иллюстратором детских книг или работать на заводе игрушек.=)', 'Меня восхищает настоящий профессионализм в любой области', '2015-01-02 21:08:23', '1420218503.jpg', 'За жизнь я сменила несколько совершенно не связанных друг с другом профессий: я работала администратором отеля, секретарем, обучала пользователей и работатала тестировщиком. Но в каждой сфере старалась стать профи, а не ламером.', '', 'http://vk.com/gabrygabry', NULL, 1, NULL, NULL, '203870309', 2, '2015-01-02 22:14:19'),
(343, 'Maxim Avdeev', 'paranoizze2002@mail.ru', 0, NULL, NULL, NULL, NULL, '2015-01-03 02:59:02', NULL, NULL, '76419c58730d9f35de7ac538c2fd6737', NULL, NULL, 1, NULL, NULL, NULL, 0, '2015-01-03 02:59:25'),
(344, 'Антон Акимов', '', 1, NULL, NULL, NULL, NULL, '2015-01-04 23:17:27', '1420399047.jpg', NULL, '', 'https://www.facebook.com/akimovanton.1979', NULL, 1, NULL, '1810369064', NULL, 1, NULL),
(345, 'Иван Утёнков', '', 1, NULL, NULL, NULL, NULL, '2015-01-05 11:11:08', '1420441868.jpg', NULL, '', 'https://www.facebook.com/profile.php?id=10000', NULL, 1, NULL, '100007928657206', NULL, 1, NULL),
(346, ' ', '', 1, NULL, NULL, NULL, NULL, '2015-01-07 14:29:10', '1420626550.jpg', NULL, '', 'http://vk.com/', NULL, 1, NULL, NULL, NULL, 2, NULL),
(347, 'Иван Курган', '', 0, NULL, '', '', '', '2015-01-07 22:57:17', '1420657037.jpg', '', '', 'http://vk.com/id285922283', NULL, 1, NULL, NULL, '285922283', 2, '2015-01-07 22:57:57'),
(348, 'Даша Мытарева', '', 1, NULL, NULL, NULL, NULL, '2015-01-12 16:56:08', '1421067368.jpg', NULL, '', 'http://vk.com/id548658', NULL, 1, NULL, NULL, '548658', 2, NULL),
(365, 'Станислав Соловьёв', '', 1, NULL, NULL, NULL, NULL, '2015-01-21 15:52:48', '1421841168.jpg', NULL, '', 'http://vk.com/stanislav_borisovich', NULL, 1, NULL, NULL, '2868562', 2, NULL),
(366, 'Анастасия Плетнева', '', 1, NULL, NULL, NULL, NULL, '2015-01-21 23:54:01', '1421870041.jpg', NULL, '', 'http://vk.com/pletneva1984', NULL, 1, NULL, NULL, '1766308', 2, NULL),
(367, 'Аня Шелкова', '', 1, NULL, NULL, NULL, NULL, '2015-01-22 13:12:40', '1421917960.jpg', NULL, '', 'http://vk.com/anna_shelkova', NULL, 1, NULL, NULL, '30725', 2, NULL),
(368, 'Никита Соломатин', '', 1, NULL, NULL, NULL, NULL, '2015-01-23 17:05:00', '1422018300.jpg', NULL, '', 'https://www.facebook.com/SwamiSattianan', NULL, 1, NULL, '100000809934603', NULL, 1, NULL),
(369, 'Екатерина Марми', '', 0, NULL, 'Business-development', 'Дизайнер', 'Самой заниматься своим бизнесом))))', '2015-01-23 21:33:58', '1422051863.jpg', 'Если я действительно чем-то "дышу", испытываю страсть к какому-то делу, я сделаю его на лучшем уровне, даже если я буду знать сперва "0" об этом деле. Дело должно быть вашим, и у вас должна быть сила воли, и вы за считанные дни, месяцы станете профессионалом в этой сфере)))', '', 'http://vk.com/id13178', NULL, 1, NULL, NULL, '13178', 2, '2015-01-23 22:10:31'),
(375, 'Anna Budrevich', '', 1, NULL, NULL, NULL, NULL, '2015-01-24 18:22:25', '1422109345.jpg', NULL, '', 'https://www.facebook.com/ann.budrevich', NULL, 1, NULL, '1370876420', NULL, 1, NULL),
(376, 'Рената Мокрова', '', 1, NULL, NULL, NULL, NULL, '2015-01-24 18:44:53', '1422110693.jpg', NULL, '', 'http://vk.com/mokrova', NULL, 1, NULL, NULL, '279198', 2, NULL),
(377, 'Аннет Котова', '', 1, NULL, NULL, NULL, NULL, '2015-01-25 15:45:43', '1422186343.jpg', NULL, '', 'http://vk.com/pettruchyo', NULL, 1, NULL, NULL, '1099346', 2, NULL),
(378, 'Мария Азеева', '', 1, NULL, NULL, NULL, NULL, '2015-01-25 16:39:50', '1422189603.jpg', NULL, '', 'http://vk.com/azeevamasha', NULL, 1, NULL, NULL, '4369870', 2, NULL),
(393, 'ck', 'coolkidder@mailinator.com', 0, NULL, NULL, NULL, NULL, '2015-01-25 18:28:34', NULL, NULL, '8fb1217acded3bbf36434092af553672', NULL, NULL, 1, NULL, NULL, NULL, 0, '2015-01-25 18:28:40'),
(394, 'sunroman', 'sunroman@mail.ru', 0, NULL, NULL, NULL, NULL, '2015-01-25 22:06:09', NULL, NULL, '2bb87948d65c948badbc61bd07ebb031', NULL, NULL, 1, NULL, NULL, NULL, 0, '2015-01-25 22:06:09'),
(395, 'Anastasia', 'anastasia.rubashkina@gmail.com', 0, NULL, NULL, NULL, NULL, '2015-01-25 22:29:05', NULL, NULL, 'bd9f2a50805565010aa8d92aabc28e29', NULL, NULL, 1, NULL, NULL, NULL, 0, '2015-01-25 22:29:05'),
(396, 'Елена Маркова', '', 1, NULL, NULL, NULL, NULL, '2015-01-26 01:12:50', '1422220370.jpg', NULL, '', 'http://vk.com/lenahelsinki', NULL, 1, NULL, NULL, '209238', 2, NULL),
(397, 'Алла Скороспелова', '', 1, NULL, NULL, NULL, NULL, '2015-01-26 02:48:37', '1422226117.jpg', NULL, '', 'http://vk.com/id40692583', NULL, 1, NULL, NULL, '40692583', 2, NULL),
(398, 'Дарья Жукова', '', 1, NULL, NULL, NULL, NULL, '2015-01-26 09:27:55', '1422250075.jpg', NULL, '', 'http://vk.com/oboroten_amaris', NULL, 1, NULL, NULL, '1839546', 2, NULL),
(404, 'Ассоль из Лимассол ', '', 1, NULL, NULL, NULL, NULL, '2015-01-26 09:28:00', NULL, NULL, '', 'http://vk.com/', NULL, 1, NULL, NULL, NULL, 2, NULL),
(405, 'Elizaveta Meriluoto', '', 1, NULL, NULL, NULL, NULL, '2015-01-26 16:14:05', '1422274445.jpg', NULL, '', 'http://vk.com/elizaveta.bogdanova', NULL, 1, NULL, NULL, '2010153', 2, NULL),
(406, 'Настя Ложечко', '', 1, NULL, NULL, NULL, NULL, '2015-01-26 23:01:56', '1422298916.jpg', NULL, '', 'http://vk.com/id237918171', NULL, 1, NULL, NULL, '237918171', 2, NULL),
(407, 'Максим Матлахов', '', 1, NULL, NULL, NULL, NULL, '2015-01-27 00:41:24', '1422304884.jpg', NULL, '', 'http://vk.com/matlahov', NULL, 1, NULL, NULL, '4333829', 2, NULL),
(408, 'Вероника Кувшинова', '', 1, NULL, NULL, NULL, NULL, '2015-01-27 00:58:00', '1422305880.jpg', NULL, '', 'http://vk.com/id834578', NULL, 1, NULL, NULL, '834578', 2, NULL),
(409, 'Оля Дёмина', '', 1, NULL, NULL, NULL, NULL, '2015-01-27 09:05:47', '1423329334.jpg', NULL, '', 'http://vk.com/id1253817', NULL, 1, NULL, NULL, '1253817', 2, NULL),
(410, 'Светланка Штобза', '', 1, NULL, NULL, NULL, NULL, '2015-01-27 10:23:02', '1422339782.jpg', NULL, '', 'http://vk.com/lana_shtobza', NULL, 1, NULL, NULL, '8867299', 2, NULL),
(411, 'Alexander Finn', 'alexander.dyachenko@yahoo.com', 0, NULL, 'IT', NULL, NULL, '2015-01-27 11:54:41', NULL, NULL, '9cb3f9f19b4ca01100601333e0a9256c', NULL, NULL, 1, NULL, NULL, NULL, 0, '2015-01-27 11:55:05'),
(412, 'Alatar Raer', '', 1, NULL, NULL, NULL, NULL, '2015-01-27 15:54:21', '1422359661.jpg', NULL, '', 'http://vk.com/alatarraer', NULL, 1, NULL, NULL, '69497911', 2, NULL),
(413, 'Анастасия Бителёва', '', 1, NULL, NULL, NULL, NULL, '2015-01-29 09:23:24', '1422509004.jpg', NULL, '', 'http://vk.com/id2320779', NULL, 1, NULL, NULL, '2320779', 2, NULL),
(414, 'Юлия Ладыженко', '', 1, NULL, NULL, NULL, NULL, '2015-01-29 18:51:54', '1422543114.jpg', NULL, '', 'http://vk.com/yladyzhenko', NULL, 1, NULL, NULL, '762454', 2, NULL),
(415, 'Alexander Edunov', '', 1, NULL, NULL, NULL, NULL, '2015-01-30 01:46:02', '1423644649.jpg', NULL, '', 'http://vk.com/a_edunov', NULL, 1, NULL, NULL, '50804538', 2, NULL),
(416, 'Александр Невидимов', '', 1, NULL, NULL, NULL, NULL, '2015-01-30 02:08:19', '1422569299.jpg', NULL, '', 'http://vk.com/dr.nevidimov', NULL, 1, NULL, NULL, '1548489', 2, NULL),
(417, 'Ольга', 'tolstikhina@gmail.com', 0, NULL, 'Экономист по образованию, развиваю свой проект', 'Адвокат', 'Архитектор', '2015-01-30 12:53:07', '4587776ad8b3635df82e84f0729af188.jpg', NULL, '04c8e2c73de57e54aee752cd7075b33d', 'Olga Nikitina (LikedIn)', NULL, 1, NULL, NULL, NULL, 0, '2015-01-30 12:58:52'),
(418, 'Алина Кулиева', '', 1, NULL, NULL, NULL, NULL, '2015-02-02 14:09:17', '1422871757.jpg', NULL, '', 'http://vk.com/id43196533', NULL, 1, NULL, NULL, '43196533', 2, NULL),
(419, 'Эвелина Владимирская', '', 1, NULL, NULL, NULL, NULL, '2015-02-02 21:56:04', '1422899764.jpg', NULL, '', 'http://vk.com/micinali', NULL, 1, NULL, NULL, '1280529', 2, NULL),
(420, 'Ekaterina Geta', 'geta.ekaterina@gmail.com', 0, NULL, 'Digital Marketing Manager', 'Actrisse', 'Firm director, photographer, entrepreneur', '2015-02-03 13:28:39', '9bab8a6a008e5cb5db7cd4a7ddb1d883.jpg', 'Every 3 years I change the career direction (at least so far )', 'd93c248a04e512e146473144657e8b77', NULL, NULL, 1, NULL, NULL, NULL, 0, '2015-02-03 13:31:32'),
(421, 'Анна Дятлова', '', 1, NULL, NULL, NULL, NULL, '2015-02-03 18:39:54', '1422974394.jpg', NULL, '', 'http://vk.com/annanass88', NULL, 1, NULL, NULL, '996143', 2, NULL),
(422, 'Анна Хобитц', '', 1, NULL, NULL, NULL, NULL, '2015-02-04 13:49:26', '1423043366.jpg', NULL, '', 'https://www.facebook.com/anna.hobitz', NULL, 1, NULL, '100000084913371', NULL, 1, NULL),
(423, 'Анна Переверзева', '', 1, NULL, NULL, NULL, NULL, '2015-02-07 18:28:48', '1423319328.jpg', NULL, '', 'http://vk.com/ab_pereverzeva', NULL, 1, NULL, NULL, '579003', 2, NULL),
(424, 'Мария Разяповна', '', 1, NULL, NULL, NULL, NULL, '2015-02-12 00:57:10', '1423688230.jpg', NULL, '', 'http://vk.com/id260014238', NULL, 1, NULL, NULL, '260014238', 2, NULL),
(425, 'Makar Traktor', '', 1, NULL, NULL, NULL, NULL, '2015-02-13 03:00:15', '1423782015.jpg', NULL, '', 'https://www.facebook.com/profile.php?id=10000', NULL, 1, NULL, '100004131407855', NULL, 1, NULL),
(426, 'Алина Галимова', '', 1, NULL, NULL, NULL, NULL, '2015-02-13 21:00:01', '1423846801.jpg', NULL, '', 'http://vk.com/id764654', NULL, 1, NULL, NULL, '764654', 2, NULL),
(427, 'Enk Off', '', 1, NULL, NULL, NULL, NULL, '2015-02-16 18:38:26', '1424097506.jpg', NULL, '', 'https://www.facebook.com/enk.off.3', NULL, 1, NULL, '100004099480092', NULL, 1, NULL),
(428, 'Андрей Серяков', '', 0, NULL, 'Физик', 'Спасатель', '', '2015-02-20 22:54:16', '1424471768.jpg', '', '', 'http://vk.com/andrey_seryakov', NULL, 1, NULL, NULL, '362212', 2, '2015-02-21 02:44:15'),
(429, 'Евгений Борисевич', 'suraleb-boris@rambler.ru', 1, NULL, NULL, NULL, NULL, '2015-03-19 23:15:51', '1427148357.jpg', NULL, '', 'http://vk.com/id4021836', NULL, 1, NULL, NULL, '4021836', 2, NULL),
(430, 'Евгений Борисевич', 'suraleb.boris@gmail.com', 1, NULL, NULL, NULL, NULL, '2015-03-19 23:48:18', '1427148441.jpg', NULL, '', 'https://www.facebook.com/suraleb.boris', NULL, 1, NULL, '100007675149629', NULL, 1, NULL),
(440, 'Ivan Klykov', 'serpantin@inbox.ru', 1, NULL, NULL, NULL, NULL, '2015-03-24 21:22:48', '1427217768.jpg', NULL, '', 'https://www.facebook.com/ivan.klykov.3', NULL, 1, NULL, '1363047651', NULL, 1, NULL),
(442, 'Arsen Ovsepyan', 'investidea.pro@gmail.com', 0, NULL, 'Предприниматель', 'Врач', 'Министр иностранных дел', '2015-04-05 18:51:46', NULL, 'Пока сам что-то не попробуешь, не узнаешь', '91ad92d3db441e628a7e06d000eb0f4b', NULL, NULL, 1, NULL, NULL, NULL, 0, '2015-04-05 18:55:09'),
(443, 'Катя Орлова', 'katyaorlova@testtest.ru', 0, NULL, 'Финансовый аналитик', 'Балерина', 'Те, кто сочиняют музыку', '2015-04-05 20:55:27', 'acbc3115a8e329abcc5f0d17a5355357.png', '"Делай, что должен и будь, что будет!"', '91ad92d3db441e628a7e06d000eb0f4b', NULL, NULL, 1, NULL, NULL, NULL, 0, '2015-04-05 20:58:12'),
(444, 'Джордж', 'george@testtest.ru', 0, NULL, 'Банкир', '', 'Нейрохирург', '2015-04-09 19:40:34', NULL, '', '91ad92d3db441e628a7e06d000eb0f4b', '', NULL, 1, NULL, NULL, NULL, 0, '2015-04-09 19:59:46'),
(445, 'Мила Сафронова', 'mans-lyudmila@yandex.ru', 0, NULL, 'Клаустрофобия Королев vk.com/phobiamsk', 'Эльф-лучник', 'Космонавт', '2015-04-09 21:29:01', '1429184335.jpg', 'phobia.ru\n\nГлавное - всегда понимать, чего ты хочешь', '', 'http://vk.com/manslyudmila', NULL, 1, NULL, NULL, '2983911', 2, '2015-04-17 21:46:14'),
(476, 'Konstantin Makeykin', '', 1, NULL, NULL, NULL, NULL, '2015-04-09 21:34:03', '1428600843.jpg', NULL, '', 'http://vk.com/zardes', NULL, 1, NULL, NULL, '1353609', 2, NULL),
(477, 'Vladislav Sorokin', 'vlad@vsorokin.com', 1, NULL, NULL, NULL, NULL, '2015-04-21 11:36:30', '1429601790.jpg', NULL, '', 'https://www.facebook.com/fxdev', NULL, 1, NULL, '882124428492342', NULL, 1, NULL),
(478, 'Milena Vann', 'milenaa.tkachenko@gmail.com', 1, NULL, NULL, NULL, NULL, '2015-04-27 23:28:15', '1430162895.jpg', NULL, '', 'http://vk.com/galunzovskaya', NULL, 1, NULL, NULL, '179138751', 2, NULL),
(479, 'Andrey Osipov', 'wellas2005@yandex.ru', 0, NULL, 'Фотожурналист, Госинспектор по маломерным судам МЧС России', 'Программист', 'Меня восхищают творческие люди, а также врачи, в самом хорошем понимании этой профессии', '2015-06-11 22:22:01', NULL, 'Глядя на шедевр, я прихожу в экстаз от того, чему могу научиться. Мне и в голову не приходит растекаться в умилении.\nСальвадор Дали', 'd1b822ac1f850813da87f19df2974fa0', NULL, NULL, 1, NULL, NULL, NULL, 0, '2015-06-11 22:28:11'),
(480, 'Yulia Raduga', 'charli13@mail.ru', 1, NULL, NULL, NULL, NULL, '2015-07-17 20:27:05', '1437150425.jpg', NULL, '', 'http://vk.com/id3398212', NULL, 1, NULL, NULL, '3398212', 2, NULL),
(481, 'Светлана Светличная', '', 1, NULL, NULL, NULL, NULL, '2015-08-20 17:29:25', '1440077365.jpg', NULL, '', 'http://vk.com/id247370667', NULL, 1, NULL, NULL, '247370667', 2, NULL),
(482, 'Александр', 'tranceberllin@yandex.ru', 1, NULL, 'географ', NULL, NULL, '2016-02-19 11:22:17', NULL, NULL, 'c1d811148e3fbb0b37af2c895d9c29fb', NULL, NULL, 1, NULL, NULL, NULL, 0, '2016-02-19 11:23:01');

-- --------------------------------------------------------

--
-- Table structure for table `author_changed_pass`
--

CREATE TABLE IF NOT EXISTS `author_changed_pass` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `last_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `blank_question`
--

CREATE TABLE IF NOT EXISTS `blank_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  `place` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `lvl` int(11) DEFAULT NULL,
  `path` text,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=121 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `description`, `lvl`, `path`, `parent_id`) VALUES
(53, 'Индустрии', 'Индустрии', 1, 'Индустрии,', NULL),
(54, 'Культура', 'Культура', 1, 'Культура,', NULL),
(55, 'Медицина', 'Медицина', 1, 'Медицина,', NULL),
(56, 'Наука', 'Наука', 1, 'Наука,', NULL),
(57, 'Природа', 'Природа', 1, 'Природа,', NULL),
(58, 'Развитие Человека', 'Развитие Человека', 1, 'Развитие Человека,', NULL),
(59, 'Технологии', 'Технологии', 1, 'Технологии,', NULL),
(60, 'Услуги', 'Услуги', 1, 'Услуги,', NULL),
(61, 'Финансы', 'Финансы', 1, 'Финансы,', NULL),
(62, 'Производство', 'Производство', 2, 'Индустрии,Производство,', 53),
(63, 'Транспорт', 'Транспорт', 2, 'Индустрии,Транспорт,', 53),
(64, 'Строительство', 'Строительство', 2, 'Индустрии,Строительство,', 53),
(65, 'Энергетика', 'Энергетика', 2, 'Индустрии,Энергетика,', 53),
(66, 'Арт', 'Арт', 2, 'Культура,Арт,', 54),
(67, 'Дизайн', 'Дизайн', 2, 'Культура,Дизайн,', 54),
(68, 'Музыка', 'Музыка', 2, 'Культура,Музыка,', 54),
(69, 'Архитектура', 'Архитектура', 2, 'Культура,Архитектура,', 54),
(70, 'Лечение', 'Лечение', 2, 'Медицина,Лечение,', 55),
(71, 'Исследования', 'Исследования', 2, 'Медицина,Исследования,', 55),
(72, 'Точные', 'Точные', 2, 'Наука,Точные,', 56),
(73, 'Социальные', 'Социальные', 2, 'Наука,Социальные,', 56),
(74, 'Животные', 'Животные', 2, 'Природа,Животные,', 57),
(75, 'Экология и Забота об окружающей среде', 'Экология и Забота об окружающей среде ', 2, 'Природа,Экология и Забота об окружающей среде,', 57),
(76, 'Образование', 'Образование', 2, 'Развитие Человека,Образование,', 58),
(77, 'Спорт', 'Спорт', 2, 'Развитие Человека,Спорт,', 58),
(78, 'Психология и тренинги', 'Психология и тренинги', 2, 'Развитие Человека,Психология и тренинги,', 58),
(79, 'Программирование', 'Программирование', 2, 'Технологии,Программирование,', 59),
(80, 'Роботы', 'Роботы', 2, 'Технологии,Роботы,', 59),
(81, 'Медиа', 'Медиа', 2, 'Услуги,Медиа,', 60),
(82, 'Право', 'Право', 2, 'Услуги,Право,', 60),
(83, 'Развлечения', 'Развлечения', 2, 'Услуги,Развлечения,', 60),
(84, 'Корпоративные финансы', 'Корпоративные финансы', 2, 'Финансы,Корпоративные финансы,', 61),
(85, 'Финансовые рынки', 'Финансовые рынки', 2, 'Финансы,Финансовые рынки,', 61),
(86, 'Банки', 'Банки', 2, 'Финансы,Банки,', 61),
(87, 'Страхование', 'Страхование', 2, 'Финансы,Страхование,', 61),
(88, 'Интернет', 'Интернет', 2, 'Технологии,Интернет,', 59),
(89, 'Продажи и магазины', 'Продажи и магазины', 2, 'Услуги,Продажи и магазины,', 60),
(90, 'Маркетинг', 'Маркетинг', 2, 'Услуги,Маркетинг,', 60),
(91, 'Консультирование', 'Консультирование', 2, 'Услуги,Консультирование,', 60),
(94, 'Путешествия и туризм', 'Путешествия и туризм', 3, 'Услуги,Развлечения,Путешествия и туризм,', 83),
(95, 'Дети', 'Дети', 3, 'Услуги,Развлечения,Дети,', 83),
(96, 'Для взрослых', 'Для взрослых', 3, 'Услуги,Развлечения,Для взрослых,', 83),
(97, 'Нефть и газ', 'Нефть и газ', 2, 'Индустрии,Нефть и газ,', 53),
(98, 'Бары и рестораны', 'Бары и рестораны', 2, 'Услуги,Бары и рестораны,', 60),
(99, 'Платежи', 'Платежи', 2, 'Финансы,Платежи,', 61),
(100, 'Акушерство ', 'Акушерство ', 2, 'Медицина,Акушерство ,', 55),
(101, 'Безопасность', 'Безопасность', 2, 'Технологии,Безопасность,', 59),
(102, 'Устройства', 'Устройства', 2, 'Технологии,Устройства,', 59),
(103, 'Медицинские технологии', 'Медицинские технологии', 2, 'Медицина,Медицинские технологии,', 55),
(104, 'Фармацевтика', 'Фармацевтика', 2, 'Медицина,Фармацевтика,', 55),
(105, 'Трейдинг ', 'Трейдинг ', 3, 'Финансы,Финансовые рынки,Трейдинг ,', 85),
(106, 'Акции', 'Акции', 3, 'Финансы,Финансовые рынки,Акции,', 85),
(108, 'Инвестиции и привлечение капитала', 'Инвестиции и привлечение капитала', 3, 'Финансы,Финансовые рынки,Инвестиции и привлечение капитала,', 85),
(109, 'Валютные рынки', 'Валютные рынки', 3, 'Финансы,Финансовые рынки,Валютные рынки,', 85),
(110, 'Деривативы', 'Деривативы', 3, 'Финансы,Финансовые рынки,Деривативы,', 85),
(111, 'Венчурные инвестиции', 'Венчурные инвестиции', 2, 'Финансы,Венчурные инвестиции,', 61),
(112, 'Забота об организме', 'Забота об организме', 2, 'Развитие Человека,Забота об организме,', 58),
(114, 'Мобильные приложения', 'Мобильные приложения', 3, 'Технологии,Устройства,Мобильные приложения,', 102),
(115, 'Инженер', 'Инженер', 3, 'Технологии,Устройства,Инженер,', 102),
(116, 'Фитнесс', 'Фитнесс', 3, 'Развитие Человека,Спорт,Фитнесс,', 77),
(117, 'Легкая атлетика и бег', 'Легкая атлетика и бег', 3, 'Развитие Человека,Спорт,Легкая атлетика и бег,', 77),
(118, 'Проджект-менеджмент', 'Проджект-менеджемент', 2, 'Технологии,Проджект-менеджмент,', 59),
(119, 'Облигации ', 'Облигации ', 3, 'Финансы,Финансовые рынки,Облигации ,', 85),
(120, 'Квесты', 'Квесты', 3, 'Услуги,Развлечения,Квесты,', 83);

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE IF NOT EXISTS `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `tagId` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AVG_ROW_LENGTH=248 AUTO_INCREMENT=116 ;

--
-- Dumping data for table `content`
--

INSERT INTO `content` (`id`, `text`, `description`, `tagId`) VALUES
(1, '<h1>Делайте то, что нравится</h1>', 'Надпись на главной', ''),
(2, '', 'Заголовок страницы О нас', ''),
(3, '<b>Ясун</b> - это площадка для обмена отзывами о любых занятиях. Здесь люди делятся историями о том, <i>чем</i> они занимаются, как  и почему.<br><br><b>Задача Ясуна</b>: помогать в преодолении профессиональных кризисов. <br>Ясун - путеводитель для тех, кто хочет сменить работу, или увяз в рутине и нуждается в получении творческого импульса. <br><br>Ясун - это как площадка с отзывами о путешествиях, только вместо городов здесь собраны отзывы из первых рук о любых активностях. <br><br>На Ясуне Вы можете узнать, какими качествами обладают люди той или иной профессии, что мотивирует их ежедневно заниматься своим делом, с какими трудностями приходится сталкиваться, а также чем Ваши друзья и близкие <i>на самом деле</i> занимаются треть своей жизни. <br><br>Автором проекта может стать каждый. <br><br>Присоединяйтесь! Чем больше историй появится на Ясуне на тему одной профессии или деятельности, тем объемнее окажется ее образ.<br><br>Начните прямо сейчас!<br><br><i>Не нашли своей отрасли в каталоге?<br>Хотите добавить страницу о своем проекте или предложить идею? Пишите на <b>info@yasoon.ru.</b></i>\n<br><br><br>\n\n\n', 'Содержимое страницы О нас', ''),
(4, 'Читать истории', 'Кнопка на главной', ''),
(5, 'В процессе.', 'Email на странице О нас', ''),
(6, 'Логин: %email%\nПароль: %newpass%.\nДля завершения восстановления пароля пройдите по ссылке: %link%', 'Письмо о регистрации', ''),
(7, 'Здравствуйте, %name%! Вы зарегистрировались на сайте Yasoon.ru (Ясун). Ваш логин:  %email% Ваш пароль: %password%', 'Письмо с напоминанием пароля', ''),
(8, 'Ваш опыт поможет другим людям ', 'Надпись под заголовком \\"регистрация\\"', ''),
(9, '', 'Надпись под заголовком всё прошло успешно', ''),
(10, 'СВЕТЛЫЕ СТОРОНЫ ПРОФЕССИИ', 'Текст пользовательского соглашения', NULL),
(12, 'Потоки', 'Ссылка партнера', ''),
(13, '/content/c3745c5bb299926fe3c3e3fc2df7d113.jpg', 'Ссылка на картинку на главной', NULL),
(14, '', 'Текст под названием отрасли на странице людей и профессий', ''),
(15, 'Про меня', 'Текст на странице редактирования профиля под заголовком', ''),
(16, '<p style="font-size: 0.62em"><span style="background-color: rgb(255, 242, 153);">Расскажите, как устроена эта деятельность изнутри</span></p>', 'Заголовок на странице "Напишите свою историю"', ''),
(18, '/upload/avatar/noAvatar.jpg', 'Аватар пользователя по умолчанию', NULL),
(19, 'Больше историй', 'Название кнопки "Больше историй"', NULL),
(20, 'Регистрация', 'Заголовок страницы регистрации', NULL),
(21, 'Про меня', 'Заголовок второй страницы регистрации', ''),
(22, 'Имя, под которым будет опубликована Ваша история', 'Подсказка в поле ввода "Имя"', NULL),
(23, 'Email', 'Подсказка в поле ввода "Email"', NULL),
(24, 'Подписаться на новости проекта', 'Флажок подписаться на обновления', ''),
(25, 'Пароль', 'Подсказка в поле ввода "Пароль"', NULL),
(26, 'Регистрация', 'Кнопка регистрация', NULL),
(27, 'Моя профессия или деятельность', 'поле ввода "Ваша профессия"', ''),
(28, 'Профессия - детская мечта', 'поле ввода ', ''),
(29, 'Профессия, которая восхищает', 'поле ввода "Профессия, которая Вас восхищает"', 'test'),
(30, 'Интересный факт о моей работе или обо мне как профессионале', 'поле ввода "Расскажите о себе"', ''),
(31, 'Личная страница для тех, кто хочет узнать про меня побольше', 'Поле ввода "Личная страница"', ''),
(32, 'Загрузить Изображение', 'Кнопка "Загрузить изображение"', NULL),
(33, 'Завершить регистрацию', 'Кнопка "Завершить регистрацию"', NULL),
(34, '', 'Заголовок пустой отрасли', ''),
(35, '', 'Текст пустой отрасли', ''),
(36, 'Стать автором', 'Кнопка "Стать автором"', NULL),
(37, 'Напишите свою', 'Кнопка "Напишите свою"', NULL),
(38, 'Заголовок ', 'Подсказка "Заголовок истории" на странице написания поста', ''),
(39, 'Сфера деятельности...', 'Название выпадающего списка категорий', ''),
(40, 'Краткое предисловие. Например: любимая цитата об этом деле или описание места работы.\n', 'Подсказка в поле "Краткое описание истории"', ''),
(41, 'Ойейейей!', 'Заголовок сообщения при удалении истории', ''),
(42, 'Ай-яй-яй-яй! История будет удалена безвозвратно!', 'Текст сообщения при удалении истории', ''),
(43, 'Про меня', 'Заголовок страницы редактирование личной информации пользователя', ''),
(44, 'Сохранить правки', 'Кнопка "Сохранить правки" на странице профиля', NULL),
(45, 'Опубликовать', 'Кнопка "Написать новую историю" на странице профиля', ''),
(46, 'Задайте волнующий вопрос спикеру...', 'Текст-подсказка  в поле ввода вопроса юзеру (сейчас "впишите текст вопроса")', ''),
(47, '', 'текст, который виден на странице "ответы" для всех, КРОМЕ хозяина страницы,  в том случае если юзеру не задан ни один вопрос', ''),
(48, '<br><br>Вам пока не задали ни одного вопроса. Напишите хотя бы одну историю, чтобы другие люди могли расспросить Вас о Вашем деле.', 'текст, который виден на странице "ответы" для хозяина страницы,  в том случае если юзер не написал ни одной истории.', ''),
(49, 'Больше вопросов', 'Кнопка "Больше вопросов"', NULL),
(50, '', 'текст, который виден на странице "ответы" для хозяина страницы, в том случае если у юзера уже есть истории', ''),
(51, 'Пользователи могут вдохновиться историей только раз в сутки!', 'Текст сообщения о том, что лайк можно ставить раз в сутки', NULL),
(52, 'Вы уже вдохновлялись данной историей!', 'Текст сообщения о том, что пользователь уже ставил лайк данной истории', NULL),
(53, 'Ничего не рассказал(а) о себе.', 'Текст, который отображается под именем юзера, который ничего не рассказал о себе. (если поле ', NULL),
(54, 'Отрасли', 'Шапка. заголовок "Профессии".', ''),
(55, 'Люди', 'Шапка. заголовок "Люди".', NULL),
(56, 'У вас нет новостей.', 'Текст в пустой ленте новостей-если юзер еще ни на кого не подписан, или нет новостей', NULL),
(57, 'Спасибо! Ваша вопрос отправлен пользователю. Когда он ответит на него, Вы узнаете об этом в своей ленте обновлений.', 'Текст, который появляется перед юзером, когда тот задал вопрос', NULL),
(58, 'Задать вопрос', 'Кнопка "Задать вопрос"', NULL),
(59, '<p>О чем будет моя история</p>', 'Подсказка в строке поиска', ''),
(60, '<p style="font-size: 1em">К сожалению или к счастью, этой страницы не существует. НО!<br><br>Вы <b><a href="https://yasoon.ru/#/posts/0/rateSort/">можете начать читать интересные истории </a></b> даже отсюда!</p>', 'Страница 404', ''),
(61, 'История из потока:', 'Аватар Дайджест', ''),
(62, 'background-color: rgb(255, 242, 153);', 'Текст заголовка Дайджест', ''),
(63, '', 'Текст подзаголовка Дайджест', NULL),
(64, '<span style="background-color: rgb(255, 242, 153);">Поздравляем. Ваш вопрос доставлен адресату. Когда он ответит на вопрос, Вы узнаете об этом в своей ленте обновлений.</span>', 'Ясун в Вконтакте', ''),
(65, '<h3>Как все устроено</h3>', 'Ясун в Facebook', ''),
(66, 'Спасибо! Ваша вопрос отправлен пользователю. Когда он ответит на него, Вы узнаете об этом в своей ленте обновлений.', 'Вопрос заданный пользователю', ''),
(67, '', 'Подзаголовок категорий', ''),
(68, 'Вы действительно хотите удалить этот пост?', 'deletePostConfirmation', NULL),
(69, '', 'Ссылка на видео главной страницы без расширения (если видео надо убрать, то оставить пустым)', ''),
(70, '/content/d53badf990804829d335ed816e62a548.jpg', 'Адресс картинки для страницы "О нас"', 'NULL'),
(71, '', 'Адресс картинки для страницы "Правила"', 'NULL'),
(72, 'Топ за месяц', 'Название вкладки "Новые истории" на странице "Истории"', 'NULL'),
(73, 'Топ за все время', 'Название вкладки "Популярные истории" на странице "Истории"', 'NULL'),
(74, '99', 'На вкладке "Новые истории" выводить истории за последние (в днях):', 'NULL'),
(75, '2', 'На вкладке "Новые истории" выводить истории с рейтингом не ниже:', 'NULL'),
(76, 'Советы авторам', 'Название подсказки для написания поста', 'NULL'),
(77, '<h4><li>Расскажите какую-нибудь историю из жизни<br><br><li>Расскажите о плюсах и минусах<br><br><li>Поделитесь фото рабочего места</h4>', 'Текст подсказки для написания поста', 'NULL'),
(78, 'background-color: rgb(255, 242, 153);', 'Цвет фона для постов администраторов', 'NULL'),
(79, 'Моя история', 'Кнопка входа для не зарегистрированных пользователей', 'NULL'),
(80, 'Ясун, yasoon', 'Ключевые слова через запятую', 'NULL'),
(81, 'Отзывы о занятиях и профессиях', 'Описание страницы (отображается при социальном шаринге)', 'NULL'),
(82, 'Модерируемые потоки:', 'Заголовок для модерируемых потоков в профиле', 'NULL'),
(83, '<i>У Вас пока нет управляемых потоков.</i><br><br></b>Если Вы эксперт в каком-то деле и хотите лично управлять страницей <b><a href="https://yasoon.ru/#/interviews/">наподобие одной из этих</a></b>, напишите нам на info@yasoon.ru.<br><br>Мы изучим Вашу идею и свяжемся с Вами для уточнения деталей.<br><br><br>\n', 'Текст для модератора потоков', 'NULL'),
(84, '<h4><span style="background-color: rgb(255, 242, 153);">Расскажите о деле, которым Вы занимаетесь.</span><br></h4><b>О чем хотите рассказать?</b>', 'Текст при выборе темы отзыва', 'NULL'),
(85, '', 'Общий текст, отображаемый в отзывах', 'NULL'),
(86, 'Заголовок', 'Заголовок для отзыва', 'NULL'),
(87, 'Как Вы пришли в эту область? <br>\nЧто Вас в ней вдохновляет?<br>\nЧто знают профессионалы этого дела, о чем не знают другие?<br>', 'Описание для отзыва', 'NULL'),
(88, 'Готов быть экспертом на эту тему. Хочу участвовать в других опросах!', 'Текст для кнопки эксперт', 'NULL'),
(89, 'Ужасно', 'Текст для оценщика "1 баллов"', 'NULL'),
(90, 'Так себе', 'Текст для оценщика "2 баллов"', 'NULL'),
(91, 'Более менее!', 'Текст для оценщика "3 баллов"', 'NULL'),
(92, 'Хорошо', 'Текст для оценщика "4 баллов"', 'NULL'),
(93, 'Потрясающе', 'Текст для оценщика "5 баллов"', 'NULL'),
(94, 'Написать обзор +', 'Кнопка на главной странице для создания отчета', 'NULL'),
(95, '<p style="font-size: 0.67em">Если отрасли нет в каталоге, напишите на info@yasoon.ru. <br>Пока расскажите о чем-нибудь другом. </p>', 'Поле, выводимое при выборе категории отзыва', 'NULL'),
(96, 'Обязательно ли наличие профильного образования для успешного занятия этим делом?', 'Первый вопрос к отзыву', 'NULL'),
(97, 'Cпокойно ли спите по ночам от этой работы?', 'Второй вопрос к отзыву', 'NULL'),
(98, 'Перспективы отрасли (на ближайшие годы, в Вашей стране)', 'Вопрос к нижнему "оценщику" в отзывах ', 'NULL'),
(99, '<span style="background-color: rgb(255, 242, 153);"><b>Общее впечатление от занятия этим делом</b></span>', 'Заголовок для основного "оценщика" в отзывах', 'NULL'),
(100, '<H3>Модераторы потока:</H3>', 'Заголовок для модераторов потока', 'NULL'),
(101, '<h3>Путеводитель по любым занятиям</h3><br>', 'Заголовок для поиска на главной странице', 'NULL'),
(102, 'Занятие или профессия', 'Подсказка для поиска на главной странице', 'NULL'),
(103, 'Сфера деятельности, профессия, занятие...', 'Подсказка для поиска в попапе', 'NULL'),
(104, '', 'Заголовок для статистики в категориях "Рейтинг"', 'NULL'),
(105, 'Перспективы', 'Заголовок для статистики в категориях "Перспективы"', 'NULL'),
(106, 'Вопрос 1', 'Заголовок для статистики в категориях "Вопрос 1"', 'NULL'),
(107, 'Вопрос 2', 'Заголовок для статистики в категориях "Вопрос 2"', 'NULL'),
(108, 'Всего записей', 'Заголовок для статистики в категориях "Всего записей"', 'NULL'),
(109, '', 'Цвет фона для статистики отзывов', 'NULL'),
(110, 'Напишите обзор', 'Кнопка на главной странице для создания поста', 'NULL'),
(111, '<b>Индекс счастья</b>', 'Описание для рейтинга категорий', 'NULL'),
(112, 'Как Вы связаны с этой темой?', 'Название для выбора типа на странице отзыва', 'NULL'),
(113, 'выбрано # ', 'Текст выбранного типа на странице отзыва', 'NULL'),
(114, '<h4>Есть опыт в каком-то деле? </h4>', 'Текст между поиском и кнопкой на главной', 'NULL'),
(115, '<b>Перспективы</b>', 'Описание для перспектив категории', 'NULL');

-- --------------------------------------------------------

--
-- Table structure for table `content_old`
--

CREATE TABLE IF NOT EXISTS `content_old` (
  `id` int(11) NOT NULL,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AVG_ROW_LENGTH=1489;

--
-- Dumping data for table `content_old`
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
-- Table structure for table `content_tags`
--

CREATE TABLE IF NOT EXISTS `content_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AVG_ROW_LENGTH=16384 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `content_tags`
--

INSERT INTO `content_tags` (`id`, `name`, `value`) VALUES
(1, 'name', 'value');

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--

CREATE TABLE IF NOT EXISTS `friends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reader_id` int(11) NOT NULL COMMENT 'Id того, кто подписывается',
  `writer_id` int(11) NOT NULL COMMENT 'Id того, на кого подписан reader',
  `date_write` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`reader_id`,`writer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `friends`
--

INSERT INTO `friends` (`id`, `reader_id`, `writer_id`, `date_write`) VALUES
(1, 245, 192, '2014-10-02 18:18:55'),
(2, 245, 247, '2014-10-05 21:56:17'),
(3, 259, 192, '2014-11-15 00:07:38'),
(4, 192, 234, '2014-11-15 00:10:31'),
(5, 310, 192, '2014-11-19 15:51:36'),
(6, 406, 366, '2015-01-26 23:02:03'),
(7, 481, 334, '2015-08-20 17:35:57');

-- --------------------------------------------------------

--
-- Table structure for table `interview`
--

CREATE TABLE IF NOT EXISTS `interview` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('visible','invisible') DEFAULT 'invisible',
  `order` int(11) DEFAULT NULL,
  `lego` enum('0','1') DEFAULT '0',
  `preview_img` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `lego_img` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `position` int(6) DEFAULT '0',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `type_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `interview`
--

INSERT INTO `interview` (`id`, `name`, `status`, `order`, `lego`, `preview_img`, `lego_img`, `position`, `description`, `type_id`) VALUES
(1, 'Я люблю свою работу.  Мой путь.', 'visible', 1, '0', '9325aa1c4201d874498e764f9358b6a8.jpg', 'c99b22254c8fef54eae523387c8c0b91.jpg', 1, '', 0),
(2, 'Темные стороны  профессии', 'visible', 2, '0', '', '', 0, '', 0),
(3, 'Мысли о моем деле  ', 'visible', 3, '0', '', '', 0, '', 0),
(4, 'Как и Для чего мы делаем Ясун', 'invisible', 4, '0', '', '', 0, '', 0),
(5, 'Эмиграция: жизнь и работа в новой стране.', 'invisible', 5, '1', '5635d9d0b0f41099a1ee0f2cbbc3543e.jpg', '9b77189b58233ac8b3ffe6f8f39a4944.jpg', 2, 'Попросили людей мира поделиться своими историями.<br>Присоединяйтесь к потоку!', 3),
(6, 'Молодые ученые о своей деятельности', 'invisible', 5, '1', '818b679475b2e5a750992ec3a9032f77.jpg', '643500acc3d0721187325ef251d472c5.jpg', 2, '', 3),
(7, 'Квесты в реальности', 'invisible', 5, '1', '73c4eb55e359524eab4e86339ab1fd9c.jpg', 'af80c8b5f0888f87faece83f2690d8de.jpg', 3, 'Создатели квеста <a href="http://vk.com/phobiamsk"><b>"Гензель и Гретель"</b></a>о своей мотивации<br>и том, как устроен  этот бизнес.<br>', 2),
(8, 'Бег', 'invisible', 5, '1', '264d94da4216e0cf2d1c62253bebb789.jpg', 'f5cc868a43694e773b9693f9f7797730.jpg', 2, 'Как способ привести мысли в порядок', 4);

-- --------------------------------------------------------

--
-- Table structure for table `interview_moderator`
--

CREATE TABLE IF NOT EXISTS `interview_moderator` (
  `interview_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `interview_moderator`
--

INSERT INTO `interview_moderator` (`interview_id`, `author_id`) VALUES
(1, 192),
(5, 192),
(6, 192),
(6, 192),
(7, 445);

-- --------------------------------------------------------

--
-- Table structure for table `interview_question`
--

CREATE TABLE IF NOT EXISTS `interview_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interview_id` int(11) NOT NULL,
  `text` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=862 AUTO_INCREMENT=374 ;

--
-- Dumping data for table `interview_question`
--

INSERT INTO `interview_question` (`id`, `interview_id`, `text`) VALUES
(322, 1, 'Как бы Вы объяснили 5-летнему ребенку, чем Вы занимаетесь?'),
(323, 1, 'Что самое возбуждающее в Вашем деле? '),
(324, 1, 'Как Вам пришла идея работать в этой профессии?'),
(325, 1, 'Есть ли у Вас вдохновители, люди, которые повлияли на Вас? Расскажите о них'),
(326, 1, 'Какие решающие этапы были на Вашем профессиональном пути?'),
(327, 1, 'Что самое трудное в Вашем деле?'),
(328, 1, 'Какие у Вас были провалы и что Вы из них извлекли?'),
(329, 1, 'Какой результат Вам приятно вспоминать?'),
(330, 1, 'Какие профессиональные привычки Вы используете в повседневной жизни?'),
(331, 1, 'Что значит быть "настоящим мастером" в Вашем деле? '),
(332, 1, 'Какое будущее у Вашей отрасли?'),
(333, 1, 'С какими стереотипами о Вашей профессии Вы чаще всего сталкиваетесь?'),
(334, 1, 'Над чем шутят люди Вашей профессии? '),
(335, 1, 'Расскажите что-нибудь, что знают люди Вашей профессии, о чем неизвестно большинству, и что может принести пользу в повседневной жизни?'),
(336, 1, 'Какой профессиональный совет Вы бы дали себе 18-летнему?'),
(337, 1, 'Какие книги или курсы Вы рекомендуете, чтобы лучше разобраться в Вашем деле?'),
(338, 1, 'Поделитесь какой-нибудь байкой или смешным случаем из Вашей практики?'),
(339, 1, 'Мысли о моем деле...'),
(340, 2, 'Что не нравится другим людям, когда они сталкиваются с моей профессией?'),
(341, 2, 'Что мне не нравится в моей профессии?'),
(342, 2, 'Как профессиональная деятельность негативно влияет на мою психику и здоровье'),
(343, 2, 'Какие злоупотребления бывают в этой профессии? Как обманывают клиентов?'),
(344, 3, 'Новое на Ясуне'),
(345, 4, 'Каким Вы видите Ясун через 3 года?'),
(346, 5, 'В какую страну Вы уехали и почему? '),
(347, 5, 'Ваше первое яркое впечатление о новой стране'),
(348, 5, 'Как здесь устроена Ваша профессия? Пришлось ли Вам переучиваться?'),
(349, 6, 'Как бы Вы объяснили 5-летнему ребенку, чем Вы занимаетесь?'),
(350, 6, 'Что самое возбуждающее в Вашем деле? '),
(351, 6, 'Как Вам пришла идея работать в этой профессии?'),
(352, 6, 'Есть ли у Вас вдохновители, люди, которые повлияли на Вас? Расскажите о них'),
(353, 6, 'Какие решающие этапы были на Вашем профессиональном пути?'),
(354, 6, 'Что самое трудное в Вашем деле?'),
(355, 6, 'Какие у Вас были провалы и что Вы из них извлекли?'),
(356, 6, 'Какой результат Вам приятно вспоминать?'),
(357, 6, 'Какие профессиональные привычки Вы используете в повседневной жизни?'),
(358, 6, 'Что значит быть "настоящим мастером" в Вашем деле? '),
(359, 6, 'Какое будущее у Вашей отрасли?'),
(360, 6, 'С какими стереотипами о Вашей профессии Вы чаще всего сталкиваетесь?'),
(361, 6, 'Над чем шутят люди Вашей профессии? '),
(362, 6, 'Расскажите что-нибудь, что знают люди Вашей профессии, о чем неизвестно большинству, и что может принести пользу в повседневной жизни?'),
(363, 6, 'Какой профессиональный совет Вы бы дали себе 18-летнему?'),
(364, 6, 'Какие книги или курсы Вы рекомендуете, чтобы лучше разобраться в Вашем деле?'),
(365, 6, 'Поделитесь какой-нибудь байкой или смешным случаем из Вашей практики?'),
(366, 6, 'Мысли о моем деле...'),
(367, 7, 'Как Вам пришла идея профессионально заняться квестами?'),
(368, 7, 'Как придумываются квесты? Какие фишки вы используете?'),
(369, 7, 'Есть ли какой-нибудь случай на площадке, который Вам особенно запомнился?'),
(370, 7, 'Как развивается отрасль? Какие квесты ждут нас в будущем?'),
(371, 8, 'Как Вы начали заниматься бегом? Где, как часто и в каком стиле бегаете? '),
(372, 8, 'Что, на Ваш взгляд, самое важное в занятии бегом? Как нужно бегать, чтобы получать удовольствие?'),
(373, 8, 'Как бег влияет на другие сферы Вашей жизни?');

-- --------------------------------------------------------

--
-- Table structure for table `interview_type`
--

CREATE TABLE IF NOT EXISTS `interview_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(39) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `interview_type`
--

INSERT INTO `interview_type` (`id`, `type`) VALUES
(1, 'Смена карьеры'),
(2, 'Истории за Вашими любимыми проектами'),
(3, 'Общие темы'),
(4, 'Личное развитие');

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

CREATE TABLE IF NOT EXISTS `partners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partnerBgImg` varchar(255) NOT NULL,
  `parnterText` varchar(255) NOT NULL,
  `parnterLink` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE IF NOT EXISTS `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `interview_id` int(11) NOT NULL,
  `preview` varchar(333) COLLATE utf8_unicode_ci NOT NULL,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `caption` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `place` smallint(6) NOT NULL,
  `likes` int(11) NOT NULL DEFAULT '0',
  `visits` int(11) NOT NULL DEFAULT '0',
  `previewImg` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `IDX_5A8A6C8DF675F31B` (`author_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AVG_ROW_LENGTH=11702 AUTO_INCREMENT=144 ;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `author_id`, `interview_id`, `preview`, `text`, `date`, `caption`, `place`, `likes`, `visits`, `previewImg`) VALUES
(49, 259, 1, 'Человек может бесконечно смотреть на три вещи: на огонь, на воду и на графики акций. Фондовый рынок – это величайшая проекция человеческой психики.', '', '2015-01-07 13:58:26', 'Управляющий активами', 0, 28, 126, ''),
(50, 222, 1, '', '', '2014-10-02 00:49:40', 'Юрист', 0, 10, 15, ''),
(51, 220, 1, 'обычно к юристам приходят с вопросам "а можно сделать так?".... так вот, самое большое удовольствие это говорить им - ""Да. пожалуйста!"', '', '2014-10-02 00:54:40', 'Юриспруденция', 0, 14, 23, ''),
(53, 232, 1, 'Главная заповедь наладчика - НЕ УСУГУБИ', '', '2014-10-02 01:35:03', 'Инженер АСУ ТП', 0, 18, 13, ''),
(55, 233, 1, 'Риск-менеджмент - алхимия финансов', '', '2014-10-02 03:04:28', 'Риск-менеджер', 0, 14, 38, ''),
(56, 240, 1, '', '', '2014-10-02 03:06:48', 'Дирижер', 0, 4, 8, ''),
(57, 243, 1, 'Если Вы подумываете устроиться консультантом (не важно, куда), думаю, моя история даст довольно полное представление о том, что с Вами будет на этой должности происходить. Вы профи; те, кто звонят, не знают или думают, что знают. А дальше как повезет.', '<article questionid="0" class="questionContent">\n	<h3 class="questionTitle">\n		\n	Как бы Вы объяснили 5-летнему ребенку, чем Вы занимаетесь?\n\n	</h3>\n	<div class="question_content">\n		<p>- Помнишь, в детском саду та симпатичная рыженькая воспитательница показывала вам буквы?&nbsp;</p><p>- Да!</p><p>- Вот... А твой папочка показывает буквы взрослым дядям.<br></p>\n	</div>\n</article><article questionid="1" class="questionContent">\n	<h3 class="questionTitle">\n		\n	Что самое захватывающее в Вашем деле? Что приносит Вам удовольствие?\n\n	</h3>\n	<div class="question_content">\n		<p>Самое захватывающее в моем деле - прийти на работу после волшебного воскресенья и узнать, что в сервисе, который ты поддерживаешь, сломалось всё. Даже то, о чем ты раньше не знал. Приблизительные сроки починки - от четырех часов до двух дней. Каждый час клиенты теряют деньги из-за сбоя. Ты получаешь сообщение от коллеги консультанта, что он опоздает, так как несносные феи спрятали всю его обувь, пока он кормил единорога звездной пылью. Посмотрев на часы, ты понимаешь, что до начала смены остается три минуты, а потом лавина звонков и чатов постепенно вытеснит из тебя всё человеческое. Вот эти три минуты и&nbsp; наполняют особенно яркими эмоциями.</p><p><br></p><p>Удовольствие от работы мне приносит множество вещей: <br></p><p>- ощущение того, что клиент узнал новое, смог разобраться;</p><p>- общение с коллегами (боже мой, в компании каких отвязных жуков я работал!);</p><p>- обед.<br></p>\n	</div>\n</article><article questionid="2" class="questionContent">\n	<h3 class="questionTitle">\n		\n	Как Вы пришли в эту профессию?\n\n	</h3>\n	<div class="question_content">\n		<p>Закончил университет, начал искать работу. С лингвистическим образованием без опыта это сделать достаточно трудно. Месяцы шли, попал в опалу у родителей, провалился в программе набора в British and American Tobacco. Немного подзаработал на выставке на манеже, Работы по-прежнему нет. Проспорил другу тысячу рублей (настоящий удар), сбережения почти растаяли. Друг устроился в компанию, порекомендовал меня на должность консультанта отдела. Не прошел собеседование, так как одним из требований был быстрый темп речи, которым я отличался только в студенческие годы до того, как моё сердце превратилось в камень. Открылась вакансия консультанта дружественного отдела, я пришел на собеседование&nbsp; (вроде, этого неудачника уже один раз смотрели, дадим ему второй шанс) и&nbsp; - о чудо! - меня взяли. Вопрос про радиус Земли был для меня неожиданностью. <br></p>\n	</div>\n</article><article questionid="3" class="questionContent">\n	<h3 class="questionTitle">\n		\n	Есть ли у Вас вдохновители, люди, которые повлияли на Вас? Расскажите, кто они.\n\n	</h3>\n	<div class="question_content">\n		<p>1) Отец. Вдохновлял меня бранью, криками и угрозами.</p><p>2) Роберт Шекли. У каждого есть призвание, каждый где-то нужен. (Рассказ "Ускоритель").</p><p>3) Рэй Бредбери. Даже если ты прожил жизнь впустую, то хотя бы маленькая девочка загадает желание, приняв за звезду твоё сгорающее в атмосфере тело. (Шутки шутками, а идея такая, пронзительный рассказ "Калейдоскоп").<br></p>\n	</div>\n</article><article questionid="4" class="questionContent">\n	<h3 class="questionTitle">\n		\n	Какие решающие вехи были на Вашем профессиональном пути?\n\n	</h3>\n	<div class="question_content">\n		<p>Так как специфика работы отдела заключалась в основном в обработке потока обращений, то один рабочий год несильно отличался от другого. Поэтому сложно назвать какие-то этапы на профессиональном пути. Не было трансформации из гусеницы в бабочку, просто моя гусеница ела все больше, пряталась от птиц всё лучше и осваивала скрипку.&nbsp;</p><p><br></p><p>Пожалуй, вспоминается лишь один случай. Ко мне закралась в голову отравляющая мысль о том, что у нас появляются новые продукты, я работаю больше двух лет, а получаю столько же, сколько раньше получал. Я поведал об этом другу за бокалом пива, и он предложил мне поговорить с руководителем. Мы договорились с ним, что если завтра я этого не сделаю, то он придет на мой этаж и при всех ударит меня по лицу. <br></p><p>На следующий день я написал ему: "А, может, не при всех?.." Получил ответ: "Дудки!"</p><p>Позвал начальников департамента и отдела в переговорку. Так я стал руководителем сектора.<br></p>\n	</div>\n</article><article questionid="5" class="questionContent">\n	<h3 class="questionTitle">\n		\n	Что самое трудное в Вашем деле?\n\n	</h3>\n	<div class="question_content">\n		<p>Не выходить из себя во время общения. Именно поэтому мы говорим "Минуту, пожалуйста", ставим телефон на mute и орем самые грязные ругательства, даже когда для ответа на вопрос нам минута вовсе не нужна. <br></p><p><br></p><p>Также очень трудно вести несколько чатов, разговаривать с клиентам по телефону и отвечать на вопросы сотрудников филиалов одновременно. <br></p>\n	</div>\n</article><article questionid="6" class="questionContent">\n	<h3 class="questionTitle">\n		\n	Какие у Вас были провалы и неудачи? Чему Вы из них научились?\n\n	</h3>\n	<div class="question_content">\n		<p>Однажды случился так называемый выброс нерыночных котировок, что поставило под угрозу существование множества инвестиционных счетов. У меня была возможность сказать IT специалисту выключить процедуру расчетов, что спасло бы счета, однако я этого не сделал, подумав, что другой отдел разберется сам. <br></p><p>Итог - счета ликвидировались. На восстановление всех потребовалась неделя. Если бы расчеты были остановлены, все последствия устранились бы за 2 дня.</p><p>Научился не бояться брать на себя ответственность.<br></p>\n	</div>\n</article><article questionid="7" class="questionContent">\n	<h3 class="questionTitle">\n		\n	Какой результат Вам приятно вспоминать?\n\n	</h3>\n	<div class="question_content">\n		<p>Миллиард чатов и миллион звонков на одного второго января, а точнее предвкушение отдыха после дня, когда ты отработал на полную.<br></p>\n	</div>\n</article><article questionid="8" class="questionContent">\n	<h3 class="questionTitle">\n		\n	Какие профессиональные привычки Вы используете в повседневной жизни?\n\n	</h3>\n	<div class="question_content">\n		<p>Считать все в процентах.<br></p>\n	</div>\n</article><article questionid="9" class="questionContent">\n	<h3 class="questionTitle">\n		\n	Что является показателем настоящего мастерства в Вашем деле?\n\n	</h3>\n	<div class="question_content">\n		<p>Способность выполнять несколько задач одновременно, убедительность, грамотная речь, безукоризненная вежливость.<br></p>\n	</div>\n</article><article questionid="10" class="questionContent">\n	<h3 class="questionTitle">\n		\n	Какое будущее у Вашей отрасли?\n\n	</h3>\n	<div class="question_content">\n		<p>Радужное.<br></p>\n	</div>\n</article><article questionid="11" class="questionContent">\n	<h3 class="questionTitle">\n		\n	С какими стереотипами о Вашей профессии Вы чаще всего сталкиваетесь?\n\n	</h3>\n	<div class="question_content">\n		<p>С такими же, с какими все сталкиваются в повседневной жизни, разница только в количестве людей, на которых навешиваешь ярлыки. <br></p><p>Количество растет, известный тебе стереотип играет новыми красками, потом ты превращаешься из терпимого в нетерпимого, потом пропитываешься злобой, потом становится всё равно.&nbsp; </p>\n	</div>\n</article><article questionid="12" class="questionContent">\n	<h3 class="questionTitle">\n		\n	Над чем шутят люди Вашей профессии? \n\n	</h3>\n	<div class="question_content">\n		<p>Над глупостью клиентов.</p><p>Клиенты зачастую не знают, что если в городе <b>А</b> время на час отстает от времени города <b>В</b>, и в городе <b>В</b> сейчас 12, то в городе <b>А</b> будет 11. Клиенты думают, что 0.01 и одна сотая - это разные вещи. Вообще корок очень много. Все и не припомню. <br></p>\n	</div>\n</article><article questionid="13" class="questionContent">\n	<h3 class="questionTitle">\n		\n	Что знают люди Вашей профессии, о чем неизвестно большинству, и что может принести пользу в повседневной жизни?\n\n	</h3>\n	<div class="question_content">\n		<p>Нельзя без риска заработать на инвестициях больше, чем предлагает банк. Не гневайтесь, что я упомянул, для многих это действительно неочевидно. <br></p>\n	</div>\n</article><article questionid="14" class="questionContent">\n	<h3 class="questionTitle">\n		\n	Какое образование и в каком учебном заведении может способствовать хорошему старту в Вашей профессии?\n\n	</h3>\n	<div class="question_content">\n		<p>Для консультанта главное - уметь правильно строить речь, а вот образование зависит от области работы компании.<br></p>\n	</div>\n</article><article questionid="15" class="questionContent">\n	<h3 class="questionTitle">\n		\n	Какие книги или курсы Вы рекомендуете, чтобы лучше разобраться в Вашем деле?\n\n	</h3>\n	<div class="question_content">\n		Любая книга про форекс для начинающих.<br>\n	</div>\n</article><article questionid="16" class="questionContent">\n	<h3 class="questionTitle">\n		\n	Расскажите какую-нибудь байку или курьезный случай из Вашей практики?\n\n	</h3>\n	<div class="question_content">\n		<p>Потеря&nbsp; двух ключей доступа, которая в общей сложности обошлась мне в 10 килорублей. Довольно курьёзно. Когда же наконец руководство компаний поймет, что взимание высоких штрафов неспособно излечить человека от рассеянности?! <br></p>\n	</div>\n</article><article questionid="17" class="questionContent">\n	<h3 class="questionTitle">\n		\n	Есть ли особенности работы по Вашей профессии в зависимости от страны или национальных традиций?\n\n	</h3>\n	<div class="question_content">\n		<p>Есть. Индийцев, тайцев и индонезийцев лучше сразу в начале разговора просить писать письмо, потому что довольно проблематично понять, что они тебе говорят.<br></p>\n	</div>\n</article><article questionid="18" class="questionContent">\n	<h3 class="questionTitle">\n		\n	Мои мысли о моем деле...\n\n	</h3>\n	<div class="question_content">\n		<p>Оно простое, так как ты оперируешь одними и теми же знаниями на протяжении всего срока работы.</p><p><br></p><p>Оно сложное, так как ты работаешь с клиентами, которые зачастую заблуждаются или злятся, а тебе нужно сделать все возможное, что воззвать к их разуму. <br></p><p><br></p><p>Оно спокойное, потому что можно расслабиться, когда нет запросов от клиентов.</p><p><br></p><p>Оно изнуряющее, так как в случае сбоя или запуска нового продукта невозможно справиться со всем.</p><p><br></p><p>Оно ответственное, так как ты являешься буфером между клиентом и компанией.</p><p><br></p><p> Оно утомительное, так как весь негатив в адрес компании клиенты направляют на тебя.<br></p><p><br></p><p>Если же вопрос касается дела, которым мне бы хотелось заниматься, было множество вещей, которые меня интересовали и к которым я терял интерес. Надеюсь, мое дело само найдет меня, если, конечно, операция по отделению от меня сиамского близнеца пройдет успешно.<br></p>\n	</div>\n</article>', '2014-10-02 03:18:37', 'Консультант службы поддержки', 0, 35, 71, ''),
(58, 244, 1, '', '', '2014-10-02 03:24:44', 'Программирование - это просто и сложно одновременно!', 0, 10, 12, ''),
(59, 247, 1, '', '', '2014-10-02 03:33:55', 'Учить или учиться? Что нам могут дать дети', 0, 13, 14, ''),
(60, 241, 1, '', '', '2014-10-02 03:31:10', 'Микроскоп', 0, 11, 34, ''),
(61, 234, 1, 'В 1995 году Ник Лиссон обанкротил старейший и знаменитейший британский Barings Bank. После 4 лет тюремного заключения он напишет книгу "Как я обанкротил Бэрингс" и будет разъезжать по миру с дорогостоящими семинарами по риск-менеджменту.', '', '2014-11-04 15:33:11', 'Магическое управление рисками', 0, 24, 37, ''),
(62, 254, 1, '', '', '2014-10-01 02:22:33', 'Государственный таможенный инспектор!', 0, 6, 8, ''),
(65, 262, 1, '', '', '2014-10-07 22:44:15', 'Производство оружия', 0, 4, 26, ''),
(66, 259, 6, 'Математик может придумать свой собственный математический объект, всю жизнь его изучать и стать самым крутым и востребованным специалистом в мире в своей теме. Потому что больше никто, кроме него, в ней ничего не понимает.', '', '2014-10-20 03:48:46', 'Математик-теоретик', 0, 8, 16, ''),
(74, 229, 1, 'Анализ изображений - область, в которой могут найти применение многие специалисты: эксперты, аналитики,математики, программисты, дизайнеры, преподаватели.А суть профессии – научить компьютер видеть и узнавать мир,как это пока может делать только человек.', '', '2014-10-19 12:40:26', 'Анализ изображений', 0, 21, 41, ''),
(75, 283, 1, 'В обществе увеличивается заинтересованность в межличностном общении, получении персональных услуг, в том числе и в сфере ремесел. Есть спрос на переживание, получение личного опыта.', '', '2014-11-03 16:26:45', 'Мастер-классы по росписи матрешек', 0, 26, 70, ''),
(76, 284, 1, '1,01 в степени 365 равно  37,8. Тогда как 0.99 в степени 365 равно 0,026. Этот факт хорошо иллюстрирует не только требуемый уровень самоотдачи, с которой ты должен двигать свое дело, но и то, что эти усилия  должны иметь место каждый день, без исключения.', '', '2014-10-19 22:22:03', 'Дело в деле...', 0, 15, 18, ''),
(78, 285, 1, 'Стала гематологом, чтобы преодолеть страх. В институте самый страшный билет на экзамене был по теории кроветворения.', '', '2014-10-21 22:38:59', 'Мир под микроскопом', 0, 16, 13, ''),
(79, 288, 1, 'Где-то вычитала, что есть два океана, красный и голубой. Красный цвета крови конкурентов, борющихся за клиента. В голубом же свободно плавает тот, кто предлагает нечто уникальное. Хотелось бы плавать в голубом. Приходится если не в красном, то в розовом..', '', '2014-10-24 16:35:00', 'Продажи систем и программ', 0, 8, 4, ''),
(80, 289, 1, '', '', '2014-10-24 22:30:13', 'Инженер-металлург', 0, 13, 6, ''),
(81, 264, 1, 'Технический писатель - это автор всех тех инструкций, справок и руководств, по которым люди пытаются пользоваться программами и приборами. Взгляд изнутри.', '', '2014-11-05 01:10:52', 'Технический писатель', 0, 11, 4, ''),
(82, 290, 1, ' Я радею за семейные ценности и отношения, основанные на доверии, уважении и любви, где на передний план выходит не принцип взаимного использования, а желание сделать другого счастливым.', '', '2014-10-30 23:03:58', 'Мой путь к себе', 0, 5, 31, ''),
(85, 300, 1, 'Когда мне было 17 лет, мы с отрядом взяли неприступный Орлеан. Мне оставалось 2 года. Каково это - вести за собой армию. Невыдуманная история.', '', '2014-05-08 23:44:46', 'Куда нас ведут, мы узнаем в конце', 0, 0, 5, ''),
(86, 306, 6, '', '', '2014-11-19 01:01:50', 'Экспериментальная физика высокотемпературной плазмы', 0, 7, 13, ''),
(88, 307, 1, 'Исповедь учителя гимназии, специализирующейся в изучении французского языка. Полезно всем, кто когда-либо задумывался о том, что такое преподавать в школе, и какой безумец вообще может на такое решиться.', '', '2014-11-19 17:15:28', 'Учитель (Моисей для детей)', 0, 9, 64, ''),
(100, 311, 1, '', '', '2014-11-21 18:31:38', 'Перевожу', 0, 4, 16, ''),
(101, 225, 1, '', '', '2014-11-26 16:19:02', 'Специалист отдела продвижения инвестиционных продуктов', 0, 2, 19, ''),
(103, 328, 1, 'О музыке и о том, как все бывает не сразу. И о мечте. И о том, что мечты сбываются.', '', '2015-02-22 12:29:20', 'Певица', 0, 15, 222, '/web//upload/images/7ed5359ac3b5c288c43b611722732ba1.jpg'),
(105, 334, 1, '', '', '2014-12-23 20:13:31', 'Общественное мнение решает', 0, 3, 68, ''),
(107, 334, 3, '', '', '2014-12-23 18:21:09', 'Все настоящее идет из детства', 0, 7, 108, ''),
(110, 338, 1, '', '', '2014-12-25 16:20:58', 'Залог успешных продаж - умение общаться', 0, 1, 38, ''),
(111, 338, 3, '', '', '2014-12-25 16:27:42', 'Для продажника слова "завтра" не существует', 0, 2, 16, ''),
(112, 334, 3, '', '', '2014-12-27 14:44:10', 'Мой яркий тайм-менеджмент на 2015 год', 0, 7, 426, ''),
(113, 340, 1, 'Бывает такое, что человек не ставит своей целью получение прибыли, но готов к собственному бизнесу, эффективным проектам, производству. Если вы такой, то дорога обязательно приведет вас к социальному предпринимательству и некоммерческой деятельности', '', '2014-12-29 00:30:34', 'Социальное предпринимательство', 0, 6, 58, ''),
(114, 338, 3, 'Этой фразой был открыт мой первый тренинг по продажам.\nСегодня я делюсь техниками, которые помогли мне обеспечить стабильный товарооборот на своей первой должности торгового представителя в косметической компании. ', '', '2014-12-30 19:18:45', '"Делай, что должен делать, и будет, что должно быть"', 0, 1, 22, ''),
(115, 341, 1, '', '', '2014-12-31 16:21:43', 'Дирижер хора, педагог', 0, 5, 29, ''),
(116, 342, 1, 'Около года назад я начала путь в совершенно новую для меня отрасль - реставрации, и пока работаю с документами, но стремлюсь к развитию в новую область...', '', '2015-01-02 22:14:52', 'Лаборант (будущий художник-реставратор) ', 0, 6, 65, ''),
(119, 366, 1, '"Актером можешь ты не быть, но человеком быть обязан!" Так и я , руководитель ДТС " Дебют" учу детей быть счастливыми, любить, уметь дружить!Искать свою звезду...свой путь к ней...и я люблю их, и они отвечают мне взаимностью...', '', '2015-01-25 19:35:35', 'Театр-это здорово!', 0, 17, 182, ''),
(120, 220, 5, 'тут студенты даже в 35 это нормально', '', '2015-01-23 03:49:50', 'Абердин. Студенты. Килты..... и Нефть!', 0, 3, 40, ''),
(121, 282, 6, 'Небольшая история о единственно важной причине начать свой бизнес', '', '2015-01-25 19:59:36', 'Высокотехнологичное предпринимательство на благо обществу', 0, 23, 225, ''),
(122, 369, 5, 'Человек переезжает в новую страну, и многим вокруг кажется, что он так хорошо устроился, что его жизнь кипит; но по своему опыту могу сказать, что абсолютно не просто жить в другой стране, и нужно иметь огромную силу воли, чтобы выжить в новых условиях)))', '', '2015-01-23 22:15:09', 'Жизнь в новой стране не так проста, как многим кажется', 0, 2, 86, ''),
(123, 369, 1, '', '', '2015-01-23 22:21:32', 'Никогда не идите на поводу у других!', 0, 2, 37, ''),
(124, 377, 1, 'Работа всегда была для меня чем-то принудительно-обязательно вписывающимся в мою сумасшедшую жизнь. Но я всегда искала то, что мне интересно и шла на некий компромисс - да, я буду у вас с удовольствием работать и мириться при этом с рабочим графиком.', '', '2015-01-25 19:04:32', 'Туризм, фотография, кто знает, что будет следующим)', 0, 1, 64, ''),
(125, 394, 5, 'Ингерманландцы – название этнических финнов, изначально проживавших в нынешней Ленинградской области вокруг Санкт-Петербурга. ', '', '2015-01-25 22:30:30', 'Мы выбираем, нас выбирают', 0, 2, 44, ''),
(126, 396, 5, 'Любое событие моей жизни в прошлом имеет продолжение в будущем. Эту книгу нужно просто научиться читать, чувствовать жизнь, видеть знаки. Тогда можно избежать ошибок и разочарований. И оптимизм, конечно же!', '', '2015-01-26 01:35:56', 'Случайности не случайны!', 0, 6, 40, ''),
(127, 404, 5, '', '', '2015-01-26 09:44:19', 'Как я уехала на Кипр ', 0, 2, 45, ''),
(128, 408, 5, '', '', '2015-01-27 01:15:47', 'Быть лидером это - искусство', 0, 0, 6, ''),
(129, 411, 5, '', '', '2015-01-27 12:10:17', 'Русский IT-специалист в Финляндии', 0, 3, 42, ''),
(130, 412, 1, 'Еще в детстве, таща очередного бездомного котенка домой, я твердо решила, что посвящю себя, все свое время и всю свою жизнь помощи братьям нашим меньшим, ', '', '2015-01-27 17:20:56', 'Медицинский врач лечит человека, а ветеринарный врач – человечество.', 0, 8, 66, ''),
(131, 405, 5, 'Не бойтесь в жизни перемен, тем более неотвратимых. Они приходят лишь тогда когда они необходимы.\n', '', '2015-01-27 23:12:29', 'Переезд, изменивший жизнь', 0, 6, 73, ''),
(132, 414, 5, '"Курица - не птица, Польша не заграница!" Но ГОРАЗДО комфортнее:)', '', '2015-01-29 18:58:06', 'В Польшу только ради Google?', 0, 2, 24, ''),
(133, 419, 5, '', '', '2015-02-02 22:22:09', 'Германия', 0, 8, 142, ''),
(134, 417, 1, 'www.korzinanadom.ru', '', '2015-02-12 13:07:27', 'Корзина на дом', 0, 10, 69, ''),
(135, 409, 1, 'это моя первая работа....', '', '2014-09-08 22:43:54', 'я очень люблю свою работу', 0, 3, 57, ''),
(136, 292, 1, 'I work as a Risk Program Manger in Corporate Operational Risk department of large financial institution in United States.', '', '2015-02-15 12:53:47', 'Risk Program Manager', 0, 4, 111, ''),
(137, 292, 5, 'Interesting things happen when you move to another country..))', '', '2015-02-15 13:57:53', 'United States ', 0, 6, 49, ''),
(138, 428, 6, 'Путь физика, работающего на современных ускорительных экспериментах (Большой адронных коллайдер и т.п.)', '', '2015-02-21 02:36:40', 'Отложенный полет к звездам. ', 0, 8, 10, ''),
(139, 192, 3, 'Узнайте, как Ясун помогает найти новые области для самореализации', '', '2015-06-29 21:15:11', 'Добро пожаловать на Ясун', 0, 8, 75, '/web/upload/content/d53badf990804829d335ed816e62a548.jpg'),
(140, 442, 8, 'Бег - это лучший способ для поддержания организма в тонусе и позитивной перезагрузки мозга.', '', '2015-04-05 19:35:33', 'Бег как способ очищения мозга от мусора', 0, 5, 11, ''),
(141, 443, 8, '', '', '2015-04-08 20:30:12', 'Run, Forest, run', 0, 2, 2, ''),
(142, 444, 8, '', '', '2015-04-09 19:59:07', 'Как я бежал свой первый полумарафон', 0, 5, 10, ''),
(143, 445, 7, '"Клаустрофобия" - это не болезнь, а новый взгляд на реальность. Попробовав раз, вы заразитесь этой страстью надолго. Уникальность каждого квеста Клаустрофобии дает возможность испытывать  совершенно новые эмоции, от погружения в сказку до полета в космос.', '', '2015-04-17 21:40:47', 'Клаустрофобия в Подмосковье', 0, 5, 26, '/web//upload/images/443c255c69de15e2577db6ecdb00b597.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `posts_timeline`
--

CREATE TABLE IF NOT EXISTS `posts_timeline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=46 ;

--
-- Dumping data for table `posts_timeline`
--

INSERT INTO `posts_timeline` (`id`, `author_id`, `post_id`) VALUES
(3, 245, 89),
(6, 245, 90),
(9, 245, 91),
(12, 245, 92),
(15, 245, 94),
(17, 310, 94),
(18, 245, 95),
(20, 310, 95),
(21, 245, 97),
(23, 310, 97),
(24, 245, 98),
(26, 310, 98),
(27, 245, 99),
(29, 310, 99),
(30, 245, 102),
(32, 310, 102),
(33, 245, 104),
(35, 310, 104),
(37, 245, 109),
(39, 310, 109),
(40, 245, 139),
(41, 259, 139),
(42, 310, 139),
(43, 245, 144),
(44, 259, 144),
(45, 310, 144);

-- --------------------------------------------------------

--
-- Table structure for table `post_answer`
--

CREATE TABLE IF NOT EXISTS `post_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `lego` enum('0','1') DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1789 ;

--
-- Dumping data for table `post_answer`
--

INSERT INTO `post_answer` (`id`, `post_id`, `question_id`, `answer`, `lego`) VALUES
(123, 50, 322, '<p>Иногда у больших и известных фирм (например, у тех, которые делают твои любимые шоколадки или машины, как у твоего папы, или у тех, которые продают красивую одежду для твоей мамы) бывают сложности с законом. Мы им помогаем разобраться, что к чему.<br></p>', '0'),
(124, 50, 330, '<p>Ставить под сомнение получаемую информацию. Ну, и в законы лезть, чуть что.&nbsp;<br></p>', '0'),
(125, 50, 333, '<p><p>Большинство людей считают, что юриспруденция - это скучно.&nbsp;</p><p>&nbsp;" - Кем ты работаешь?</p><p>&nbsp; &nbsp; - Я - юрист...</p><p>&nbsp; &nbsp; - О НЕТ, ДАЛЬШЕ НЕ НАДО!!!"</p><p>Но вообще-то юристы не все зануды, честное слово.&nbsp;Да и профессии, я верю, бывают поскучнее.</p><p>Ещё один стереотип - многие считают, что все юристы либо адвокаты, либо прокуроры, либо судьи. Ну, нотариусы ещё. На самом деле очень большое количество юристов не имеют никакого отношения к судам. Например, работают в качестве штатных юристов с договорами или консультируют клиентов в юридической фирм</p><br></p>', '0'),
(126, 50, 334, '<p>Из задачника по уголовному праву:<br></p><p><p></p><p></p><p><img src="/web//upload/images/104a0e18eea0f85f88c81b68ba85d725.jpg" style=""></p>Ну, что-то вроде того...<br></p>', '0'),
(127, 50, 337, '<p><p>Не буду советовать профессиональные ресурсы, они и так всем известны, и каким пользоваться - это уже дело вкуса.&nbsp;</p><p>А вот начинающим юристам советую прочитать книгу Гришема "Фирма" для того, чтобы понять, хочется ли им работать в консалтинге.&nbsp;</p><br></p>', '0'),
(128, 50, 339, '<p><p>Чужие слова, очень точно передающие мои мысли:&nbsp;</p><p>"—&nbsp;Адвокатом, наверно, неплохо, но мне все равно не нравится,&nbsp;— говорю.&nbsp;— Понимаешь, неплохо, если они спасают жизнь невинным людям и вообще занимаются такими делами, но в том-то и штука, что адвокаты ничем таким не занимаются. Если стать адвокатом, так будешь просто гнать деньги, играть в гольф, в бридж, покупать машины, пить сухие коктейли и ходить этаким франтом. И вообще, даже если ты все время спасал бы людям жизнь, откуда бы ты знал, ради чего ты это делаешь — ради того, чтобы&nbsp;<em>на самом деле</em>&nbsp;спасти жизнь человеку, или ради того, чтобы стать знаменитым адвокатом, чтобы тебя все хлопали по плечу и поздравляли, когда ты выиграешь этот треклятый процесс,&nbsp;— словом, как в кино, в дрянных фильмах. Как узнать, делаешь ты все это напоказ или по-настоящему, липа все это или не липа? Нипочем не узнать!"</p><p>(Дж. Сэллинджер, "Над пропастью во ржи")</p><br></p>', '0'),
(129, 51, 322, '<p>иногда даже самые умные взрослые не могут понять кто из них прав.... тогда они идут к юристу.<br></p>', '0'),
(130, 51, 323, '<p>обычно к юристам приходят с вопросам "а можно сделать так?".... так вот, самое большое удовольствие это говорить им - ""Да. пожалуйста!"" &nbsp;с. (к,ф. " О чем говорят мужчины)&nbsp;<br></p>', '0'),
(131, 51, 324, '<p>не повезло в школе с учителем химии... и химиком, как родители, стать не получилось )))&nbsp;<br></p>', '0'),
(132, 51, 327, '<p>Сохранять спокойствие. Искренне завидую тем, кто способен быть невозмутимым даже в самом напряженном и ответственном деле.<br></p>', '0'),
(133, 51, 328, '<p>от части сожалею о магистратуре юрфака СПбГУ... 2 года занятий 2 раза в неделю... не самый продуктивный способ получить LLM (который и назвать то так можно лишь с определенной натяжкой)<br></p>', '0'),
(134, 51, 330, '<p>читаю, что подписываю)<br></p>', '0'),
(135, 51, 331, '<p>сложно сказать... это точно не количество выигранных дел, или количество клиентов... возможно &nbsp;- способность предвидеть исход судебного разбирательства... хотя я бы даже сказала, способность, по возможности, решать споры на досудебной стадии... но это уже медиация)))<br></p>', '0'),
(136, 51, 332, '<p>юриспруденция всегда существовала и будет существовать, что же касается поголовья юристов, то тем нас будет больше, чем выше будет уровень жизни населения (а следовательно, сил, средств и времени у компаний и физиков вести судебные разбирательства) как собственно и у любых представителей сферы услуг)))<br></p>', '0'),
(137, 51, 333, '<p><p>люблю немецкий анекдот на этот счет:&nbsp;</p><p>две аварии: в одной сбили кошку, в другой - юриста... Следователь безошибочно определяет в какой кого...</p><p>- Как вам это удалось?&nbsp;</p><p>- Все просто... перед телом юриста не было тормозного пути.</p><p>Бытует два главных стериотипа о юристов:&nbsp;</p><p>1 их никто не любит</p><p>2 их слишком много</p><p>Но если честно, нас не любят, пока не столкнуться с проблемой, для решения которой мы нужны... тогда же мистическим образом оказывается, что именно по этому вопросу компетентных специалистов практически и нет)))&nbsp;</p><br></p>', '0'),
(138, 51, 334, '<p><p>как не странно.. обычно над собой</p><p>"2 юриста - 4 мнения" &nbsp;и "юрист поставил точку в предложении, на 16 строк ниже от его начала" &nbsp;- придумали юристы)))&nbsp;</p><br></p>', '0'),
(139, 51, 335, '<p>повторюсь... юрфак прежде всего учит читать, что подписываешь)))&nbsp;<br></p>', '0'),
(140, 51, 337, '<p><p>язык нужен всегда</p><p>некоторые настаивают на риторики и ораторской искусстве... но юриспруденция бывает очень разная и в зависимости от отрасли нужно интересоваться и Экономикой и Историей .... и даже медициной)))</p><br></p>', '0'),
(214, 53, 322, '<p>Делаю так, что бы на заводе всю работу делали машины (станки, роботы), а люди только контролировали или управляли &nbsp;этими машинами.<br></p>', '0'),
(215, 53, 323, '<p></p><p>Инженер&nbsp;(фр.&nbsp;<i>ingénieur</i>&nbsp;← от&nbsp;лат.&nbsp;<i>ingenium -</i>&nbsp;хитроумный, способный, изобретательный) - выдумщик.</p><p>Захватывает, прежде всего, процесс поиска и реализации инженерных решений.&nbsp;</p><br><p></p>', '0'),
(216, 53, 325, '<p>Это люди которые приняли меня молодого выпускника ВУЗа в свой сплоченный коллектив, которые передают свой огромный опыт и знания. Для этих людей нет сложных или не выполнимых задач в профессиональной деятельности. Все задачи какими бы сложными они не казались, при должном подходе могут быть успешно реализованы.<br></p>', '0'),
(217, 53, 327, '<p>С появлением семьи, наиболее трудным являются долгосрочные командировки.<br></p>', '0'),
(218, 53, 335, '<p>Откровенных секретов нет, но знания полученные &nbsp;при работе с электротехническим оборудованием и системами электроснабжения могут успешно применяться в быту.<br></p>', '0'),
(267, 55, 322, '<p><p><b><i>Что такое риск менеджмент?</i></b></p><p>Что такое риск менеджмент трудно объяснить не только ребенку, но взрослому, не имеющему отношения к финансовой сфере. Поэтому начну издалека.&nbsp;</p><p>Финансовый рынок (так же как и обычный рынок и магазин) - место где встречаются покупатели и продавцы. Только в отличии от обычного рынка, где продают продукты, на финансовом продают деньги. Сразу возникает вопрос: "А зачем же продавать деньги?" "Продают", возможно, не самое подходящее слово. Немного точнее и понятнее будет сказать "их дают в долг". У некоторых людей или компаний могут появиться временно ненужные (свободные) деньги, которые они готовы дать в долг тому, кому они сейчас нужны, но за это рассчитывают в будущем получить какую-то выгоду.&nbsp;</p><p>Но ведь всегда есть опасность, что тот кому ты деньги дал на время, тебе их не вернет или не выполнит все условия. Это называется риск. А вот задача риск менеджера такой риск научиться различать, т.е. определить кому опаснее (более рисковано) давать в долг и насколько.&nbsp;</p><p>(<i>Для тех, кто что-то понимает в ценных бумагах:</i>&nbsp;<i>Эта аналогия с долгом напрямую применима к кредитам, облигациям и другим долговым инструментам и соответственно к кредитному риску. Но ее легко расширить и на рынок акций и рыночный риск, если под покупкой акций (вложением денег в компанию) понимать временную передачу денег в расчете получить в будущем доход от &nbsp;дивидендов или&nbsp;роста цены акции. За кадром пока оставим товарный рынок.)</i></p><p><b><i>Зачем нужно оценивать и управлять рисками?</i></b></p><p>Опасностей (рисков) на финансовых рынках так много, что люди не всегда в состоянии их полностью осознать. Результатом может оказаться потеря очень нужных денег. Например, у вас есть деньги, которые вам понадобиться в следующем месяце, чтобы заплатить за квартиру или купить еду. Сейчас они вам не нужны и вы можете на них заработать. Но потерять их вам нельзя, т.к. иначе через месяц вам будет нечего есть или негде жить. Вы же не будете покупать на эти деньги лотерейный билет или одалживать их соседу, играющему в казино. Нужно будет поискать вложение понадежнее. Такие вещи понятны и без риск-менеджера, но финансовом рынке все сложнее и не так очевидно.</p><br></p>', '0'),
(268, 55, 323, '<p><p><b><i>Как оценивают риски?</i></b></p><p>Как ни странно, но делают это очень по-разному. Специальность риск-менеджера очень молодая (на западе появилась лет 30 назад). И хотя существует уже довольно много учебников, устоявшихся рабочих технологий очень мало. А те, что есть, довольно спорные. Часто математики, занимающиеся разработкой моделей для оценки рисков, говорят, что то, что применяют на практике, - неверно, слишком много упрощений делающих модель &nbsp;далекой от реальности. На это практики отвечают, что сложные математические модели невозможно применить в повседневной работе: невозможно найти столько данных, учесть столько факторов и т.д.</p><p>Иногда кажется что никакая модель не сможет описать достаточно точно процессы, на финансовых рынках. Возможно, изменение цен и процентных ставок больше связаны с человеческой психологией и психологией толпы.</p><p>Известные мне попытки построить относительно точные математические модели кажутся мне пока безуспешными, но сам процесс очень увлекателен.</p><p>А риски пр этом никуда не деваются и управлять ими надо. В общем, задача получается во многом творческая.</p><br></p>', '0'),
(269, 55, 339, '<p>Любые попытки математиков строить прогнозы цен и других финансовых показателей кажутся мне сродни средневековой алхимии. Попытки получить золото из других компонентов не увенчались успехом, но попутно были открыты интересные и нужны свойства веществ. Алхимия дала сильный толчок для развития химии. Думаю финансовые математики не смогут получить золото, т.е. спрогнозировать цену, но откроют интересные и полезные свойства денег, финансовых инструментов и, возможно, людей.<br></p>', '0'),
(270, 56, 328, '<p>Провалы и неудачи были гораздо чаще, чем успехи. Но зато всегда есть к чему стремиться, учиться на своих ошибках, в следующий раз стараешься их учитывать. Главное, во что бы то ни было, довести дело до конца!&nbsp; Вы когда-нибудь видели, чтобы дирижер или пианист психнул и ушел за кулисы, если он ошибся?&nbsp; Это недопустимо. Со мной однажды была такая история. Я была на конкурсе, выступала в качестве вокалистки, пела романс. Я плохо знала слова второго куплета, зубрила их, но они мне не давались. Когда я вышла на сцену и стала петь, я поняла, что не помню второй куплет. Совсем!&nbsp; И что делать? Я два раза спела слова первого куплета!&nbsp; И почти никто этого не заметил. Хорошо, что это было в Чехии, где мало говорят по-русски. Конечно, стыдно было, неудобно, но еще неудобней мне было бы перед моим педагогом, если бы я сбилась, остановилась или бы вообще сорвала номер.&nbsp;<br></p>', '0'),
(271, 56, 334, '<p>Музыканты много над чем шутят. Я часто вспоминаю шутку, которая была популярной в музыкальном училище. Ноты попадают в руки разные: и новые, и старые. У меня есть клавир 1893 года выпуска. В таких экземплярах страницы, &nbsp;пожелтевшие от времени, есть пятна. Когда мы видели какое-нибудь пятно, говорили последнюю фразу из этой шутки: Певец дает указания аккомпаниатору, показывает ему ноты: "Тут играем, тут не играем, здесь жирное пятно -&nbsp;<br>рыбу заворачивали".<br></p>', '0'),
(288, 57, 322, '<p></p><p>- Помнишь, в детском саду та симпатичная рыженькая воспитательница показывала вам буквы?&nbsp;</p><p>- Да!</p><p>- Вот... А твой папочка показывает буквы взрослым дядям.</p><br><p></p>', '0'),
(289, 57, 323, '<p></p><p>Самое захватывающее в моем деле - прийти на работу после волшебного воскресенья и узнать, что в сервисе, который ты поддерживаешь, сломалось всё. Даже то, о чем ты раньше не знал. Приблизительные сроки починки - от четырех часов до двух дней. Каждый час клиенты теряют деньги из-за сбоя. Ты получаешь сообщение от коллеги консультанта, что он опоздает, так как несносные феи спрятали всю его обувь, пока он кормил единорога звездной пылью. Посмотрев на часы, ты понимаешь, что до начала смены остается три минуты, а потом лавина звонков и чатов постепенно вытеснит из тебя всё человеческое. Вот эти три минуты и&nbsp; наполняют особенно яркими эмоциями.</p><p>Удовольствие от работы мне приносит множество вещей:&nbsp;</p><p>- ощущение того, что клиент узнал новое, смог разобраться;</p><p>- общение с коллегами (боже мой, в компании каких отвязных жуков я работал!);</p><p>- обед.</p><br><p></p>', '0'),
(290, 57, 324, '<p>Закончил университет, начал искать работу. С лингвистическим образованием без опыта это сделать достаточно трудно. Месяцы шли, попал в опалу у родителей, провалился в программе набора в British and American Tobacco. Немного подзаработал на выставке на манеже, Работы по-прежнему нет. Проспорил другу тысячу рублей (настоящий удар), сбережения почти растаяли. Друг устроился в компанию, порекомендовал меня на должность консультанта отдела. Не прошел собеседование, так как одним из требований был быстрый темп речи, которым я отличался только в студенческие годы до того, как моё сердце превратилось в камень. Открылась вакансия консультанта дружественного отдела, я пришел на собеседование&nbsp; (вроде, этого неудачника уже один раз смотрели, дадим ему второй шанс) и&nbsp; - о чудо! - меня взяли. Вопрос про радиус Земли был для меня неожиданностью.&nbsp;<br></p>', '0'),
(291, 57, 325, '<p></p><p>1) Отец. Вдохновлял меня бранью, криками и угрозами.</p><p>2) Роберт Шекли. У каждого есть призвание, каждый где-то нужен. (Рассказ "Ускоритель").</p><p>3) Рэй Бредбери. Даже если ты прожил жизнь впустую, то хотя бы маленькая девочка загадает желание, приняв за звезду твоё сгорающее в атмосфере тело. (Шутки шутками, а идея такая, пронзительный рассказ "Калейдоскоп").</p><br><p></p>', '0'),
(292, 57, 326, '<p></p><p>Так как специфика работы отдела заключалась в основном в обработке потока обращений, то один рабочий год несильно отличался от другого. Поэтому сложно назвать какие-то этапы на профессиональном пути. Не было трансформации из гусеницы в бабочку, просто моя гусеница ела все больше, пряталась от птиц всё лучше и осваивала скрипку.&nbsp;</p><p>Пожалуй, вспоминается лишь один случай. Ко мне закралась в голову отравляющая мысль о том, что у нас появляются новые продукты, я работаю больше двух лет, а получаю столько же, сколько раньше получал. Я поведал об этом другу за бокалом пива, и он предложил мне поговорить с руководителем. Мы договорились с ним, что если завтра я этого не сделаю, то он придет на мой этаж и при всех ударит меня по лицу.&nbsp;</p><p>На следующий день я написал ему: "А, может, не при всех?.." Получил ответ: "Дудки!"</p><p>Позвал начальников департамента и отдела в переговорку. Так я стал руководителем сектора.</p><br><p></p>', '0'),
(293, 57, 327, '<p></p><p>Не выходить из себя во время общения. Именно поэтому мы говорим "Минуту, пожалуйста", ставим телефон на mute и орем самые грязные ругательства, даже когда для ответа на вопрос нам минута вовсе не нужна.&nbsp;</p><p>Также очень трудно вести несколько чатов, разговаривать с клиентам по телефону и отвечать на вопросы сотрудников филиалов одновременно.&nbsp;</p><br><p></p>', '0'),
(294, 57, 328, '<p></p><p>Однажды случился так называемый выброс нерыночных котировок, что поставило под угрозу существование множества инвестиционных счетов. У меня была возможность сказать IT специалисту выключить процедуру расчетов, что спасло бы счета, однако я этого не сделал, подумав, что другой отдел разберется сам.&nbsp;</p><p>Итог - счета ликвидировались. На восстановление всех потребовалась неделя. Если бы расчеты были остановлены, все последствия устранились бы за 2 дня.</p><p>Научился не бояться брать на себя ответственность.</p><br><p></p>', '0'),
(295, 57, 329, '<p>Миллиард чатов и миллион звонков на одного второго января, а точнее предвкушение отдыха после дня, когда ты отработал на полную.<br></p>', '0'),
(296, 57, 330, '<p>Считать все в процентах.<br></p>', '0'),
(297, 57, 331, '<p>Способность выполнять несколько задач одновременно, убедительность, грамотная речь, безукоризненная вежливость.<br></p>', '0'),
(298, 57, 332, '<p>Радужное.</p>', '0'),
(299, 57, 333, '<p></p><p>С такими же, с какими все сталкиваются в повседневной жизни, разница только в количестве людей, на которых навешиваешь ярлыки.&nbsp;</p><p>Количество растет, известный тебе стереотип играет новыми красками, потом ты превращаешься из терпимого в нетерпимого, потом пропитываешься злобой, потом становится всё равно.&nbsp;</p><br><p></p>', '0'),
(300, 57, 334, '<p></p><p>Над глупостью клиентов.</p><p>Клиенты зачастую не знают, что если в городе&nbsp;<b>А</b>&nbsp;время на час отстает от времени города&nbsp;<b>В</b>, и в городе&nbsp;<b>В</b>&nbsp;сейчас 12, то в городе&nbsp;<b>А</b>&nbsp;будет 11. Клиенты думают, что 0.01 и одна сотая - это разные вещи. Вообще корок очень много. Все и не припомню.&nbsp;</p><br><p></p>', '0'),
(301, 57, 335, '<p>Нельзя без риска заработать на инвестициях больше, чем предлагает банк. Не гневайтесь, что я упомянул, для многих это действительно неочевидно.&nbsp;<br></p>', '0'),
(302, 57, 338, '<p>Потеря&nbsp; двух ключей доступа, которая в общей сложности обошлась мне в 10 килорублей. Довольно курьёзно. Когда же наконец руководство компаний поймет, что взимание высоких штрафов неспособно излечить человека от рассеянности?!&nbsp;<br></p>', '0'),
(304, 57, 339, '<p><p>Оно простое, так как ты оперируешь одними и теми же знаниями на протяжении всего срока работы.</p><p>Оно сложное, так как ты работаешь с клиентами, которые зачастую заблуждаются или злятся, а тебе нужно сделать все возможное, что воззвать к их разуму.&nbsp;</p><p>Оно спокойное, потому что можно расслабиться, когда нет запросов от клиентов.</p><p>Оно изнуряющее, так как в случае сбоя или запуска нового продукта невозможно справиться со всем.</p><p>Оно ответственное, так как ты являешься буфером между клиентом и компанией.</p><p>Оно утомительное, так как весь негатив в адрес компании клиенты направляют на тебя.</p><p>Если же вопрос касается дела, которым мне бы хотелось заниматься, было множество вещей, которые меня интересовали и к которым я терял интерес. Надеюсь, мое дело само найдет меня, если, конечно, операция по отделению от меня сиамского близнеца пройдет успешно.</p><br></p>', '0'),
(311, 58, 322, '<p>Я умею повелевать разными устройствами!&nbsp;<br></p>', '0'),
(312, 58, 323, '<p>Довольно часто возникают задачи, которые я не знаю как решить, приходится копать решения в глубинах интернета, изобретать "велосипеды", пробовать различные варианты и т.п. Когда в итоге решение находится, наступает "оргазм мозга", великолепное ощущение!<br></p>', '0'),
(313, 58, 324, '<p>Мне нравились компьютеры, я хотел понимать их лучше. Сначала в школе попал в класс с уклоном в информатику, далее был университет.<br></p>', '0'),
(314, 58, 325, '<p>На меня влияет технологический прогресс. Мне всегда было интересно знать как устроенна та или иная вещь. В детстве у меня не было ни одной игрушки которую я бы не разобрал, что бы узнать как она работает. В этом смысле меня всегда подстёгивает собственное любопытство.<br></p>', '0'),
(315, 58, 327, '<p>Приходится много думать, много читать и как следствие устают мозги. Но как правило небольшая передышка от работы даёт прилив сил и помогает по другому взглянуть на проблему.<br></p>', '0'),
(316, 58, 328, '<p>Провалы и неудачи это постоянная составляющая любой профессии, главное извлекать из них уроки. Если что то не получилось, надо довести дело до конца, разобраться в чём причина, как её устранить и сделать всё как надо<br></p>', '0'),
(317, 58, 329, '<p>Помню первые написанные программки, выводящие "Hello World!" в консоль, очень радовали. Это были очень маленькие, но очень важные успехи. Именно они разожгли интерес.&nbsp;<br></p>', '0'),
(318, 58, 330, '<p><p>1) Важно давать себе передышку, иногда это просто встать с кресла и размяться, иногда основательно выспаться.</p><p>2) Когда что то не понятно, не надо бояться спрашивать у других. Я постоянно задаю вопросы, даже те, которые могут показаться глупыми. Не надо копить вопросы, надо их задавать, и многие вещи станут проще.</p><br></p>', '0'),
(319, 58, 332, '<p>Очень и очень большое!<br></p>', '0'),
(320, 58, 333, '<p>Программист это все лишь одна из профессий в IT, к тому же программисты тоже все разные, и делятся на кучу разновидностей. Для рядового обывателя программист - это человек-комбайн, который знает почему у вас не работает стиральная машина, может "скачать интернет" на флэшку, чинит любую технику, знает где взять пиратский софт без вирусов, знает как убрать любое сообщение о любой ошибке после любых действий, знает какой телефон лучше купить и почему, и тому подобные вещи, вообще никак не связанные с профессией.<br></p>', '0'),
(321, 58, 334, '<p>Над всем, как правило обстановка в коллективе достаточно неформальная и пошутить любят все, в том числе и над собой.<br></p>', '0'),
(322, 58, 335, '<p>В первую очередь я думаю это знание компьютерной безопасности. Большинству пользователей жилось бы гораздо комфортнее, если бы они знали и соблюдали правила безопасности в интернете.<br></p>', '0'),
(323, 58, 336, '<p><p>Отрасль довольно динамичная и образовательная программа в любом случае будет немного отставать от реального положения дел. Тем не менее образование даст понимание многих фундаментальных вещей. Выбирать лучше вуз с хорошим финансированием и не сильно старым преподавательским составом. Все ведущие вузы страны дадут хорошее, актуальное образование. В масштабе планеты лидером является Массачусетский Технологический Университет (MIT).</p><p>Но не стоит думать что вуз даст всё что нужно, многое придётся постигать самому, поэтому я рекомендую с 3-4 курса найти стажировку, так вы сможете дополнить теоритические знания практическими.</p><br></p>', '0'),
(328, 60, 322, '<p>Для того, чтобы рассказать о своей профессии мне далеко ходить не надо. Например, я ношу очки с увеличивающими стёклами. Сначала я показываю свои глаза без очков, а потом их одеваю. Перемена заметна, т.к. у меня + 6 дптр. затем использую их как &nbsp;лупу, а дальше уже &nbsp;можно перейти к микроскопу. &nbsp;Но обычно останавливаемся на очках и лупе.<br></p>', '0'),
(329, 60, 323, '<p>Очень люблю удивлять. Мне нравится видеть, как специалисты после общения со мной не боятся микроскопа. А когда у них появляются предложения по работе со своими препаратами на новом уровне или видят разницу в микроскопах разного класса сложности, я говорю себе :"Ай-да Ольга, ай-да...." Ну, дальше вы знаете. А удовольствие мне приносят стремления специалистов повысить свою квалификацию в области микроскопии. Застой удручает.&nbsp;<br></p>', '0'),
(330, 60, 324, '<p>В школе микроскоп видела раза два. После 10 класса я поступила в институт. В то время профессия "инженер" была в чести. &nbsp;В Ленинградский институт точной механики и оптики меня привёл папа (он и мама работали в этой области). Факультет был Оптический. Абсолютно ничего не понимала в своей специальности ни до &nbsp;поступления в институт, ни на 6-м курсе. Проработав 2 года &nbsp;в СНО, я точно знала &nbsp; одно: никогда не буду конструктором и очень люблю исследовательскую деятельность (собирать данные и анализировать)<br></p>', '0'),
(331, 60, 325, '<p>Диплом я писала в группе Микрооптики у к.т.н. Р. М. Лариной ("Королева микрооптики", как её называли в лаборатории) , в той группе и осталась после защиты диплома. Именно тогда я поняла одну простую истину: главное кто тебя встретит первым в твоей профессии; кто будет Учителем, кто сумеет зажечь огонь в твоём сердце. &nbsp;Мне повезло. Меня окружали счастливые люди, которые любили то дело, которому служили: к.т.н. Л.С. Агроскин ("Папа цитофотометрии"), д.т.н. А.П. Грамматин (расчётчик оптических систем), которых уже, к сожалению, нет с нами. Есть и ныне здравствующие . д.т.н. Л.Н.Андреев (тоже расчётчик оптических систем), к.т.н. В.Г.Пантелеев (один из ведущих специалистов в области анализа изображений). Были и многие другие.<br></p>', '0'),
(332, 60, 326, '<p>Защита кандидатской диссертации по &nbsp;оценке технологичности микрообъективов нового поколения в трудном 1996 году. Могла бы и не защитить уже написанную диссертацию, если бы вдруг не получила предложение стать членом &nbsp;Нью-Йоркской Академии наук. Я тогда работала на ЛОМО. Время было непростое, но руководство приняло решение и мне оплатили членство. Так нас стало двое членов Нью-Йоркской Академии &nbsp;: первым был к.т.н. Рэм Михайлович Рагузин , разработчик микроскопов серии "БИОЛАМ" и "МИКМЕД". Все восприняли это как знак признания заслуг отечественной оптической промышленности. Мы жили в другое время и уронить честь своей страны не имели право. Вот и получилось, что всю свою жизнь в профессиональном плане стараюсь соответствовать , как говориться, заявленному.&nbsp;<br></p>', '0'),
(333, 60, 327, '<p>Чтобы тебя слушали. Очень редко кто признаётся, что он плохо знает микроскоп, его настройку, его возможности. И этот психологический барьер специалисту преодолеть очень сложно. Но я знаю, что это необходимо. Я знаю то, чего нет в книгах (хотя сама написала 4 книги), что нельзя постичь само учением, хотя человек может проработать с микроскопом и более 40 лет. &nbsp;<br></p>', '0'),
(334, 60, 328, '<p>К сожалению, жизнь идёт так, как идёт, и мы живём не в вакууме. Люди разные, время разное и без ошибок и огорчений не прожить. Мы не всем нравимся, нам не все нравятся. Главное, чтобы это не влияло на профессиональные качества. Нельзя опускать руки после не получившегося эксперимента, проекта, семинара. Если что-то не получается, то очень важно остановиться и оглянуться или посмотреть вокруг себя. Никогда не надо винить другого, сначала надо понять, что у тебя не получилось. Надо поднять руку, резко опустить ей вниз и сказать: "Да и бог с ним" (или покрепче в зависимости от глубины провала или неудачи).Твои знания - это твоё богатство.&nbsp;И то что знаешь ты, это знаешь только ты. Но не забывай, что это относится ко всем. Вы можете говорить, понимая друг друга или не понимая, но вы оба гениальны и оба профессионалы. Только книги может быть читали разные и фильмы смотрели другие. Поэтому важно уметь переводить для себя то, что говорит другой. А ему стараться говорить так, чтобы он тебя понял, приближаясь к его уровню знаний (он, конечно же, специалист в своей области, по другому вопросу и т.д.). Это очень сложно, но очень важно.&nbsp;<br></p>', '0'),
(335, 60, 329, '<p>Мне приятно, когда после очередного семинара, или консультации, или курса повышения квалификации, мне говорят :"Спасибо! Мы столько нового узнали!".<br></p>', '0'),
(336, 60, 330, '<p>Слежу за тем , чтобы &nbsp;очки моих родных и близких всегда были чистыми. Это же относится к экрану телевизора.<br></p>', '0'),
(337, 60, 331, '<p>Возможность подойти к любому микроскопу и его настроить, заставить&nbsp;правильно&nbsp;работать .<br></p>', '0'),
(338, 60, 332, '<p>Надеюсь, что будущее есть. Очень хочу, чтобы заработало ЛОМО, чтобы восстановилось наше оптическое микроскопическое производство. И мечтаю о том, чтобы наладился выпуск микроскопов до 300 тыс. микроскопов в год.<br></p>', '0'),
(339, 60, 333, '<p>Микроскоп (в том числе и игрушка) - самый простой оптический прибор. А профессиональный микроскоп никогда не выходит из строя - он же железный.<br></p>', '0'),
(340, 60, 334, '<p>Над всем, что не касается микроскопов.<br></p>', '0'),
(341, 60, 335, '<p>С помощью очков или лупы можно разжечь костёр (только не ради &nbsp;баловства)&nbsp;<br></p>', '0'),
(342, 60, 337, '<p>О.В. Егорова "С микроскопом на "ты". Надеюсь, что в скором времени появится книга сказка-быль для мальчиков и девочек, а также их родителей про планету ОПТИКА. В ней идёт рассказ о практически всех оптических приборах (лупы, проекторы, бинокли, фотоаппараты, зрительные трубы и телескопы, микроскопы от детского до профессионального) . Речь идёт об &nbsp;устройстве и правильной работе с этими приборами. &nbsp;Моими помощниками являются мои внуки от 4 до 16 лет. Надеюсь, что это будет интересно всем.&nbsp;<br></p>', '0');
INSERT INTO `post_answer` (`id`, `post_id`, `question_id`, `answer`, `lego`) VALUES
(343, 60, 338, '<p>Первым делом во второй месяц &nbsp;после окончания института для меня инженера-стажёра стала поездка в Киев на Арсенал для размещения очень важной оптической детали (оптического &nbsp;модулятора для установки измерения частотно-контрастной характеристики микрообъективов). Надо было приехать, связаться с главным инженером, передать нашу информацию (здесь договорённость была на высшем уровне), а дальше надо было дойти до цеха, поговорить с начальником и технологом, чтобы объяснить что надо делать. На всё про всё 1 день. Мне 23 года, длинная коса на плече - девчонка. Я никогда не летала на самолёте. Никогда не была в Киеве. Никогда одна не &nbsp;была на заводе. По начальникам никогда не ходила. Уезжая, получила напутствие нашего начальника:"Кидаем тебя, как кутёнка в воду (хорошо, что хоть понимал, что делали): выплавишь - спасибо скажем; потонешь - ну так тому и быть". Кто никогда не был на Арсенале могу сказать - это огромный завод, по которому перемещаешься только на автобусе. Короче, только две мысли, по очереди возникавшие в моём, честно скажу, воспалённом мозгу, и &nbsp;помогли&nbsp;мне&nbsp;справиться с задачей: "Прорвёмся!&nbsp;Где наша не пропадала! " и "Язык до Киева доведёт". С тех пор для меня любая командировка, в любой город с незнакомыми адресами и людьми были не по чём.&nbsp;<br></p>', '0'),
(349, 59, 322, '<p>Когда твоя мама далеко от тебя, ты должен быть уверен в том, что рядом есть тот, кто поддержит тебя, поможет в любом деле, утешит, когда тебе плохо, посмеется вместе с тобой, когда ты счастлив, посадит на колени и тихонько прижмет твою голову к своей груди, прошептав на ушко: "Все будет хорошо". Это буду я.<br></p>', '0'),
(350, 59, 323, '<p>Отдача. Пусть это самое банальное, что можно сказать, но стоит большого, когда твои малыши с утра бегут не к игрушкам, а к тебе, докладывая последние новости, рассказывая шепотом огромную тайну: "А у мамы в животике растет мой братик!", крича при случайной встрече на всю улицу твое имя. Вот тут-то начинаешь ощущать, что ты не случайный человек в их жизни. А самое важное - они еще не умеют врать. А значит делают все это искренне. И тут приходит понимание, что ты им действительно важен.&nbsp;<br></p>', '0'),
(352, 59, 325, '<p>Мой вдохновитель - мои дети. Они действительно многому могут научить. Надо только уметь их слушать. И слышать.<br></p>', '0'),
(353, 59, 327, '<p>Хотела здесь сказать многое. Но, немного подумав, поняла. Самое трудное - это ответственность. Жизнь и здоровье - в первую очередь. Но не менее важна ответственность за то, что ты запишешь в эти чистые белые листки. Поэтому приходится думать над каждым шагом, словом, казалось бы ерундовым занятием. И я понимаю, что часть из данного мной этим малышам станет зачином для чего- то большего, возможно даже решающего в их жизни.<br></p>', '0'),
(364, 62, 322, '<p></p><p>Люди моей профессии следят ,чтобы ничего плохого в страну не привезли и ничего нашего незаконно не вывезли.</p><p>Дяди и тёти &nbsp;в зеленой форме,которые помогают стране !</p><br><p></p>', '0'),
(365, 62, 323, '<p>Сами самолёты! Есть в них что-то притягательное...своя романтика)<br></p>', '0'),
(366, 62, 324, '<p>По распределению) Получила образование и пошла работать по специальности! Всё просто )<br></p>', '0'),
(367, 62, 333, '<p></p><p>"А чё, через тебя возить наркоту можно ?"- причем это просто шутка,даже не от увлекающихся этим людей )</p><p>"Подаришь мне порш или феррари?" Как одна из вариаций на тему "таможенники деньги лопатами гребут "&nbsp;</p><br><p></p>', '0'),
(368, 62, 335, '<p></p><p>Что можно привезти в Россию,сколько и как это сделать законно )))</p><p>&nbsp;И что "самолет взлетает против ветра"- можно выбрать эту фразу неким девизом для определенного этапа в своей жизни )&nbsp;</p><br><p></p>', '0'),
(380, 65, 322, '<p>&nbsp;Дед собирает маленькие ракетки.</p>', '0'),
(381, 65, 323, '<p>&nbsp;Удовольствие приносит понятие того, что выпускаемая продукция на уровне "лучших мировых образцов". Сейчас, когда распространено мнение о никчемности российского производства, греет душу своя продукция.</p>', '0'),
(382, 65, 324, '<p>Обычно. Деревенская школа, Ленинградский механический институт, оборонный завод.</p>', '0'),
(383, 65, 325, '<p>Вдохновителей у меня не было. ВСЕ САМ!</p>', '0'),
(384, 65, 326, '<p>Решающим, я считаю, было поступить после деревенской школы в "Военмех". А затем новые изделия, карьера до должности начальника сборочного цеха. И как ни странно - отсутствие смертельных случаев у подчиненных.</p>', '0'),
(385, 65, 327, '<p>Наше производство очень запротоколировано. Строжайшее соблюдение всех технологий, инструкций, предписаний... каждый день и каждую минуту,</p>', '0'),
(386, 65, 328, '<p>Провалы? Конверсия 90-х годов, Смотреть как все разваливали,</p>', '0'),
(387, 65, 329, '<p>.</p>', '0'),
(388, 65, 330, '<p>Думаю, что работа с людьми, Мне интересно организовывать работу людей и у меня это получается<br></p>', '0'),
(389, 65, 331, '<p>Уважать людей, особенно умеющих что-то делать, считать любую работу ценной, не опаздывать,</p>', '0'),
(390, 65, 332, '<p>Государство требует защиты всегда,</p>', '0'),
(391, 65, 333, '<p>Не люблю слово "оборонка", зная всю сложность,</p>', '0'),
(392, 65, 337, '<p>Пользу приносит все!</p>', '0'),
(393, 65, 338, '<p>Отправляли изделия на отстрел на полигон, задержались с испытаниями, до поезда 40 км, опаздывали. Машина ушла за 5 минут до отправления поезда, Поезд&nbsp;<b>случайно&nbsp;</b>задержали на час. Упорным везет!!!<br></p>', '0'),
(512, 74, 322, '<p></p><p>Я пытаюсь объяснить компьютеру, чем шарик отличается от кубика, кошка от\nсобаки, Муха-Цокотуха от Тараканища. Компьютер ведь становится умным только после\nтого, как его научит человек, который пока все-таки умнее. Вот сам подумай и найди\nпять &nbsp;отличий кошки от собаки: голова, два\nуха, четыре лапы, хвост. Ну вроде все одно и тоже, как же ты их отличаешь?</p><br><p></p>', '0'),
(513, 74, 323, '<p></p><p>Процесс создания нового продукта. Его совершенствование. Чем больше опыта\nи знаний, тем сильнее хочется сделать лучше. Приносит удовлетворение, когда мнение\nпрофессионала в той области, для которой сделан продукт, совпадает с тем, как это\nделает программа. Конечно, 100 % совпадение бывает редко, не возможно все\nформализовать, особенно для объектов живой природы. У человека соединяется все\nвместе - знания, опыт, интуиция. А как формализовать интуицию? Радуюсь, когда\nпоявляется новая предметная область, в которой еще не работала. Есть повод и\nвозможность потратить рабочее время на получение новых знаний и знакомства с интересными\nлюдьми.&nbsp;</p><br><p></p>', '0'),
(514, 74, 324, '<p></p><p>Абсолютно случайно. Не выбирала и даже не подозревала о существовании\nтакой профессии. Стечение обстоятельств. После окончания геологического факультета\nЛенинградского университета пришла работать петрографом в физико-химическую\nлабораторию института фарфора и керамики (в Санкт-Петербурге был такой\nстаринный, дореволюционный еще институт напротив Новой Голландии.) Петрограф –\nэтот исследователь, который изучает состав и строение природных и искусственных\nматериалов. Приходилась много работать с микроскопом, рассматривать, описывать,\nсчитать, измерять. Очень утомительное занятие. И вот заведующий лабораторией решил\nсделать этот процесс автоматизированным, а именно фотографировать изображения с\nмикроскопа, вводить их в компьютер, а потом анализировать с помощью программ,\nкоторые написали наши программисты. Так появился наш первый анализатор\nизображений ВидеоТесТ. Сейчас это кажется обычным инструментом, а тогда – было круто!\nТо, на что исследователю под микроскопом приходилось тратить дни, с помощью\nанализатора выполнялось за часы. После первой версии программы захотелось\nсделать лучше, потом еще лучше. Так и стала наша лаборатория заниматься разработкой\nсистем анализа изображений. А когда институт фарфора окончательно «смыло»\nволной перестройки 90-х, мы организовали компанию ВидеоТесТ , которая жива и по сей день.</p><a href="http://www.videotest.ru" class="active">ВидеоТесТ-анализ изображений</a><br><p></p>', '0'),
(515, 74, 325, '<p></p><p>Прежде всего, это мои преподаватели в Университете. Это зав. кафедрой\nгеохимии Барабанов Владимир Федорович, &nbsp;Гавриленко Владимир Васильевич, которые обожали\nсвою профессию, имели академические знания и УЧИЛИ НАС УЧИТЬСЯ, т.е. самим\nнаходить ответы на вопросы, которые не были в программе. Мне это очень помогло\nв дальнейшем, потому в своей профессиональной деятельности мне пришлось учиться\nтому, чему нигде не учат.</p><br><p></p>', '0'),
(516, 74, 327, '<p>Трудно\nнайти эксперта профессионала предметной области, который хотел бы и сумел бы\nтак рассказать о своих знаниях, чтобы их можно было формализовать. Как правило,\nотличные специалисты сначала вообще не понимают, что от них хотят. Им и так все\nясно. Например, на мой вопрос, чем же эта больная клетка отличается от\nздоровой, ответ был следующим: «Ну, &nbsp;смотрит\nона на меня по-другому» Вот и вся формализация.&nbsp;</p><p>Не всегда получается контакт\nчеловеческий, а без этого плодотворной работы не будет.<br></p>', '0'),
(517, 74, 329, '<p><p>К счастью, есть что вспомнить. Если на карте России (и не только России)\nпоставить флажки в местах, где работают анализаторы изображений ВидеоТесТ в\nмедицине, науке, на производстве – то это будет как «платье в горошек». Нас\nзнают многие и большинство заказчиков нас любят. </p>\n\n<p>Приносит удовлетворение, как это ни странно, обращения наших\nпользователей, у которых что-то перестало работать. Они просят, как можно\nбыстрее решить их проблему, потому что «ну просто невозможно работать без вашей\nсистемы!». А ведь еще совсем недавно смотрели в микроскоп и были довольны.&nbsp;</p><br></p>', '0'),
(518, 74, 330, '<p><p>Перед покупкой\nкакой-либо значительной вещи тщательно изучать разных производителей и выбирать\nпо свойствам, а не по красоте и навязчивости рекламы.&nbsp;</p><br></p>', '0'),
(519, 74, 335, '<p></p><p>Медицинские анализы, особенно те, которые делаются под микроскопом, очень\nсубъективны. Если что не так, то &nbsp;надо\nпеределать в надежной лаборатории, лучше у знакомых</p><br><p></p>', '0'),
(520, 74, 339, '<p></p><p>Анализ изображений - это профессиональная область, в которой могут найти\nприменение многие специалисты: эксперты, аналитики, математики, программисты, дизайнеры,\nтестировщики, психологи, преподаватели. А суть профессии – научить компьютер\nвидеть и узнавать мир, как это пока может делать только человек.</p><br><p></p>', '0'),
(643, 76, 322, '<p>Я организатор,\nесли коротко. Ты когда-нибудь жил в деревне? Или на даче? Ты любишь малину? Отлично.\nПредставь, дружок, что тебе нужно собрать много ягод, очень много ягод, чтоб\nбабушка сварила варенье. Бабушка строго настрого наказала собрать всю малину,\nпока она поехала в город за покупками. И сделать это надо очень быстро,\nнапример за 3-4 часа. Ты можешь делать это один, но ты ни за что не успеешь сделать\nработу полностью вовремя. Ты можешь попросить друзей о помощи. У &nbsp;тебя\nесть много друзей в деревне, или в дачном поселке, но они все заняты своими\nделами: один лучший друг чинит велосипед, другой собрался на рыбалку, лучшая\nподружка расставляет своих кукол или собирает букеты или играет с кошкой – все\nзаняты и, конечно, их дела для них &nbsp;всех важнее,\nчем твоя малина. Тебе нужно найти слова и важные причины, чтобы они отложили\nсвои дела и помогли тебе выполнить поручение бабушки. &nbsp;Ты должен сделать из них союзников и тогда вы\nвсе вместе соберете малину, и строгая бабушка будет довольна. Как это сделать? Это\nименно тот вопрос, на который отвечает любой&nbsp;\nруководитель. Как из людей, у каждого из которых есть множество\nсобственных задач, сделать команду людей, которая увлеченно, с удовольствием и\nс пользой занимается задачей, которую поставил ты.&nbsp; Именно этим я и занимаюсь.<br></p>', '0'),
(644, 76, 323, '<p></p><p>В моем деле для меня самое важное соответствие между достигнутым хорошим\nрезультатом и процессом, т.е. тщательно отобранными и продуманными методами и\nспособами , которые к этому результату привели. &nbsp;Мне важно понимать объективную техническую или\nтехнологическую &nbsp;востребованность и общую\nполезность&nbsp; результата, к которому идет\nкомпания. Кроме того важен и конечный финансовый результат. &nbsp;Для меня одно без другого неполноценно и\nнедостаточно для&nbsp; получения полного\nудовольствия от &nbsp;собственной работы.</p><br><p></p>', '0'),
(645, 76, 324, '<p>По\nосновной профессии я физик. Однако я никогда не занимался ни &nbsp;физическими, ни &nbsp;научно-техническими исследованиями в чистом\nвиде. Окончив физический факультет Уральского Госуниверситета &nbsp;я , по распределению, занялся разработкой\nспециальной цифровой техники, что, надо сказать, уже было довольно далеко от\nмоей университетской специализации и потребовало существенного самообразования\n(впрочем как и все мои дальнейшие ипостаси), и &nbsp;потом уходил от естественнонаучных задач\nдальше и дальше. &nbsp;Я руководил кампанией в\nЕкатеринбурге, которая имела с десяток направлений, самое крупное из которых\nбыло связано с созданием, производством и продажей мягкой мебели. Сейчас я\nработаю в небольшой инжиниринговой компании, которая занимается внедрением,\nпоставкой &nbsp;и сопровождением современных\nстроительных технологий. Такие разные направления деятельности, казалось бы, но\nони связаны для меня некой единой внутренней логикой, которая заключается в\nтом, что в точке старта, в переломный момент завершения предыдущего этапа моей\nработы и необходимости нового выбора, я тратил время на поиски, и, рассматривая\nварианты, я находил и &nbsp;соглашался только\nна тот вариант, которым сам искренне хотел заниматься, который, по тем или иным\nпричинам вдохновлял меня. &nbsp;Я имею\nуспешный опыт работы только в тех направлениях, &nbsp;которые воодушевляли меня, и уверен, что это\nне случайно. При этом я не обращал внимание, насколько они далеки от моего\nпредыдущего опыта.<br></p>', '0'),
(646, 76, 325, '<p>Конечно,\nтакие люди есть.&nbsp; Их, &nbsp;конечно, немного. Однако они , как правило, не\nимеют отношения к моей профессиональной деятельности.&nbsp; Меня вдохновляют люди талантливые и одновременно\nцельные. Результативность &nbsp;в общепринятом\nпонимании не играет существенного значения.&nbsp;\nЭто могут быть писатели и поэты, музыканты и журналисты – неважно. &nbsp;Одно из важных отличий таких людей, на мой\nвзгляд, в том, что эти люди совсем не говорят лишних слов (хотя могут быть\nочень говорливы) и они совсем не агрессивны. И еще меня вдохновляют мои друзья\nи моя семья.<br></p>', '0'),
(647, 76, 327, '<p></p><p>Есть много препятствий между &nbsp;тобой и результатом. Ты можешь выбрать цель,\nкоторая недостижима при том уровне ресурсов, включая время, которые есть у тебя\nв распоряжении. Ты можешь выбрать стратегию, которая не сработает по внутренним\nили внешним причинам. Но я уверен, как это не странно звучит, что бизнес имеет значительную\nиррациональную составляющую. Поэтому выбери вдохновляющую цель, думай, считай,\nбудь честен перед собой и если&nbsp; ты\nоснащен всем ранее перечисленным – иди до конца. И это самое сложное. И это не\nвсегда практически возможно. Я знаю, но…. Если же говорить о технологических\nсложностях, то основная из них, на мой взгляд, это паузы или время , которое\nнеобходимо для принятия очередного решения. Ключевые решения должны приниматься\nбыстро. Конечно, это субъективно. Конечно, не мгновенно, после разумного\nвремени, взятого на понимание задачи, но слово «быстро» должно быть применимо к\nэтому процессу. &nbsp;Недавно где то увидел,\nчто 1,01 в степени 365 равно&nbsp; 37,8. Тогда\nкак 0.99 в степени 365 равно 0,026. Это очевидное упрощение, тем не менее, &nbsp;хорошо иллюстрирует не только требуемый уровень\nсамоотдачи, с которой ты должен двигать свое дело, но и то, что эти усилия &nbsp;должны иметь место &nbsp;каждый день, без исключений.&nbsp;</p><br><p></p>', '0'),
(659, 61, 322, '<p></p><p>Риск-менеджером "работает" мама, которая на прогулке страхует ребенка на горке или предостерегает его от "опасных" игр.</p><blockquote>Мамы, как и риск-менеджеры, бывают разные, кто-то не пустит малыша в лужу, а кто-то оденет перед прогулкой резиновые сапоги.&nbsp;</blockquote><p>Только в отличие от мамы, которая лично решает, что есть опасность и оценивает ее степень, риск-менеджер должен принимать решения согласно установленным правилам, как если бы с малышом гуляла няня и "оберегала" бы его согласно рекомендациям мамы.</p><br><p></p>', '0'),
(660, 61, 323, '<p><span style="line-height: 1.45em;">Меня радует и захватывает постепенное незаметное изменение сознания менеджеров (трейдеров, коммерсантов), которые часто со скучающим взглядом и сонным сознанием совершенно без намека на инициативу встречают саму идею развития риск-менеджмента в Компании, а в последствии, вполне осознанно используют плоды этой системы.&nbsp;</span></p><p>Риск-менеджер не может работать в изоляции, он ценен только если смог встроиться в бизнес-процесс и заручиться поддержкой менеджмента. Общение, умение убеждать, вовремя уступить, но не отступать, а главное СЛУШАТЬ и СЛЫШАТЬ...&nbsp;</p><blockquote>Риск-менеджер - это дипломмат с математическим бэкграундом.&nbsp;</blockquote><p>Вот эта магическая смесь математики и психологии в большей степени меня и привлекает.</p><p></p>', '0'),
(661, 61, 324, '<p></p><p>В профессию меня привел мой научный руководитель в университете (Русаков Олег Витальевич), за что ему огромное спасибо и низкий поклон. Помню, что еще на первом курсе меня очень вдохновили его рассказы о фондовом рынке. Я интуитивно осознавала, что это мое.&nbsp;</p><p>Однако, я могла бы выбрать и торговлю....&nbsp;</p><blockquote>Наверное, мое природное тяготение скорее к точности и продуманности решения, а не к скорости его принятия, сыграло свою роль, поэтому ... все таки риск-менеджер, не трейдер.</blockquote><br><p></p>', '0'),
(662, 61, 325, '<p></p><p>Я уже рассказала о Русакове Олеге Витальевиче, но могу акцентировать, что его роль решающая в том, что я выбрала именно эту сферу. А далее...</p><p>Игорь Смирнов (инвестиционный директор) часто поддерживал меня и внимательно относился к моему мнению, что было важно, когда молодой специалист приходил на заседания инвестиционного комитета - собрания "акул бизнеса" и вселило в меня профессиональную уверенность.</p><p>Вообще мне очень везло на руководителей.&nbsp;</p><p>Ольга Балакирева своим внимательным, переходящим в придирчивость, отношением к работе заметно способствовала развитию у меня весьма занудной щепетильности к деталям и мелочам, что так важно риск-менеджеру.</p><p>Анна Корбут научила меня фразе "пользуясь случаем, хочу!" , которую я трактую, как умение заниматься саморазвитием и самовоспитанием в любой ситуации.</p><p>Вообщем, спасибо всем.</p><br><p></p>', '0'),
(663, 61, 336, '<p>Дерзайте</p>', '0'),
(691, 78, 322, '<p>Смотрю на клеточки крови взрослых и говорю, что у них за болезни.<br></p>', '0'),
(692, 78, 323, '<p>Правильно выставленный диагноз и констатация хорошего результата лечения.<br></p>', '0'),
(693, 78, 324, '<p>Хотела преодолеть страх. В институте самый страшный билет на экзамене был по теории кроветворения.<br></p>', '0'),
(694, 78, 325, '<p>Мои учителя в профессии - Куралева Вера Васильевна, Карнилова Татьяна Аркадьевна, Андреева Надежда Ефимовна, Губаренко Нина Константиновна.</p><p>А сейчас - Тиранова София Александровна и Балашова Валентина Андреевна.</p><p>Это все блестящие врачи, профессионалы своего дела. Все сотрудники института гематологии.<br></p>', '0'),
(695, 78, 326, '<p>Один большой этап - училась, учусь и буду учиться. Нельзя останавливаться на достигнутом.<br></p>', '0'),
(696, 78, 327, '<p>Терпение. <br></p>', '0'),
(697, 78, 331, '<p>Диагностика - очень сложная область медицины. Нужно собирать воедино множество признаков и выдавать диагноз. И быть в курсе всех последних классификаций, публикаций и т.д. В нашей текучке это трудно. Но надо.<br></p>', '0'),
(698, 78, 332, '<p>Скорее всего нужно будет владеть еще и навыками оценки гистологических, иммуногистохимических, иммунологических анализов. И анализ изображений. Важно перевести признаки&nbsp; изменений клеток из описательных в измерительные категории.<br></p>', '0'),
(699, 78, 333, '<p>Врач-лаборант. Даже звучит уничижительно. <br></p>', '0'),
(700, 78, 336, '<p>Читать, учить языки и смотреть, смотреть и смотреть препараты. Только так можно стать "мастером".<br></p>', '0'),
(701, 78, 337, '<p>Ординатура МАПО по специальности клиническая лабораторная диагностика.<br></p>', '0'),
(702, 78, 338, '<p>Курьезные у нас только фамилии пациентов.<br></p>', '0'),
(703, 78, 339, '<p>Тяжелая психологически и физически работа. К сожалению, мало оплачиваемая. Но очень нужная. Очень.<br></p>', '0'),
(835, 79, 322, '<p>Как раз недавно объясняла. Правда, шестилетнему. Сказала: "Сижу в большой комнате и продаю всякие штуки. Они позволяют печатать вот такие вот красивые бейджи на шею, как я тебе сделала, чтобы на занятия в школу ходить. Сама цену назначаю, потом люди приходят, денежки платят, а я на эти денежки тебе машинки&nbsp; покупаю." Ребенок проникся, вдохновился и очень просился ко мне на работу, чтобы тоже такие штуки продавать.<br></p>', '0'),
(836, 79, 323, '<p>Возбуждающего ничего нет :-) Удовольствие приносит свобода, наличие заказов, и когда заказчики довольны.<br></p>', '0'),
(837, 79, 324, '<p>Сильно захотелось работать на себя. <br></p>', '0'),
(838, 79, 325, '<p>Профессор Барабанов Владимир Федорович, зав.и основатель кафедры геохимии геологического факультета ЛГУ. Впечатлял силой характера. Ну и вот еще его крылатые фразы запомнились: "За так и ворона не летает" и "Наука - это зверинец". Оказалось, так и есть.</p><p>Хрипун Мария Кирилловна, читала у нас общую химию на 1-ом курсе. Поражала вдохновенностью. О водороде рассказывала, как о любимом человеке.</p><p>Шульдинер Виктор Изральевич, доктор геологических наук во ВСЕГЕИ. Преданность профессии. И только поработав с ним я, наконец, поняла, что такое геология.</p><p>Пьер Лабуасс, французский директор лифтовой компании ОТИС. Поражала способность ясно видеть перспективы и работать на результат.</p><p>Пантелеев Валерий Георгиевич, директор и основатель компании ВидеоТест. Увлеченностью и способностью увлечь. Также от него я усвоила, что "если критикуешь - предлагай". Или молчи в тряпочку :-)<br></p>', '0'),
(839, 79, 326, '<p>В общем-то, плыла себе по течению, и вот приплыла.<br></p>', '0'),
(840, 79, 327, '<p>Найти заказчика и продать ему.<br></p>', '0'),
(841, 79, 328, '<p>Полное фиаско в попытке перевоспитать сотрудника. Изобрела велосипед или извлекла старую и всем известную истину - никого не надо перевоспитывать.</p><p>Неумение выстроить бизнес правильно. Извлекла: ну и фиг с ним, как есть, так и хорошо,<br></p>', '0'),
(842, 79, 329, '<p>Реально приятно вспоминать, что мне удалось найти серьезного иностранного покупателя-партнера на программный продукт ВидеоТесТ, который был в то время (уже довольно давнее) не очень конкурентным предложением и продавался исключительно в России. Ну и потом удалось сделать то же самое, для других продуктов серии inPhoto, но это уже было не так ново.<br></p>', '0'),
(843, 79, 330, '<p>Никогда никому ничего не обещаю, если нет 150% уверенности, что смогу сделать.<br></p>', '0'),
(844, 79, 331, '<p>Виртуозно работать не по принципу "спрос рождает предложение", а по принципу "предложение рождает спрос".<br></p>', '0'),
(845, 79, 333, '<p>Продавец - это спекулянт.<br></p>', '0'),
(846, 79, 335, '<p>Предложение рождает спрос! <br></p><p>Но и люди моей профессии этого часто не понимают...<br></p>', '0'),
(847, 79, 336, '<p>"Не ждать милостей от природы", а действовать.<br></p>', '0'),
(848, 80, 322, '<p><p>Моя работа - это такая игра в доктора, только с больными металлическими детальками. Мне приносят их с трещинами, совсем сломанными, истертыми, ржавыми или еще как-нибудь испорченными. Игра начинается с того, что я их начинаю рассматривать вначале просто глазами, потом под лупой (мы с тобой под ней рассматривали жуков), потом под микроскопом (ты этот прибор еще не видел, в нем такие сильные увеличительные стекла, что пылинка выглядит, как камешек). Рассматриваю, как они устроены, что у них в ранках, почему это произошло и нельзя ли как-нибудь это вылечить, или исправить. Придумываю, что бы такое сделать, чтобы они больше не ломались. Некоторым придумываю режим закалки, т.е. как нагревать и как потом охлаждать, чтобы они больше не простывали. Других заставляю "пропотеть" (да...да, металл может "потеть" в жарко разогретой печи). Могу придумать новый материал, соединить несколько слоев разных материалов в один, для прочности, как их покрасить и еще много чего придумываю.</p><br></p>', '0'),
(849, 80, 323, '<p><p>"Взять след" и бежать к цели. Удовольствие приносит п<span style="line-height: 1.45em; background-color: initial;">редвкушение\nинтересной задачи, увидеть воплощенным задуманное.</span></p><br></p>', '0'),
(850, 80, 324, '<p><p>У нас династия:: мои отец, тетя, старшая сестра профессионально этим занимались,&nbsp;</p><br></p>', '0'),
(851, 80, 325, '<p><p>Самое сильное влияние на меня, еще школьницу, оказал роман известной в советское время писательницы Галины Николаевой "Битва в пути"и последующая его экранизация. Это увлекательный рассказ о работе металлургов в одном из сибирских городов. Героям присуще творчество в повседневной работе и ответственность за принятые решения.</p><br></p>', '0'),
(852, 80, 326, '<p><p>Учеба в Ленинградском Политехническом институте. Работа в составе молодежного научно-производственного подразделения на предприятии с замкнутым металлургическим циклом, защита диссертации.</p><br></p>', '0'),
(853, 80, 327, '<p><p>Довести дело до конц.а.</p><br></p>', '0'),
(854, 80, 328, '<p>Провалов не было, вдохновляли удачи. Когда с душой что-то делаешь, люди начинают откликаться и помогать<br></p>', '0'),
(855, 80, 329, '<p><p>Разработка нового материала для валков холодной прокатки.</p><br></p>', '0'),
(856, 80, 330, '<p><p>Стремление разрешать неопределенности.</p><br></p>', '0'),
(857, 80, 331, '<p><p>Видеть дальше собственного носа и иметь практические навыки работы.</p><br></p>', '0'),
(858, 80, 332, '<p><p>Профессия инженера-металлурга со специализацией материаловедение и термическая обработка сталей и сплавов - вечная профессия. Человечество всегда будет производить эти материалы и изделия из них, непрерывно повышая требования к их свойствам и качеству.</p><br></p>', '0'),
(859, 80, 333, '<p><p>Металлург - &nbsp;значит сталевар.</p><br></p>', '0'),
(860, 80, 334, '<p><p>Профессиональных шуток и баек у моих коллег не замечала. Все шутки относятся к обычной жизни в социуме.</p><br></p>', '0'),
(861, 80, 335, '<p><p>Металл, также как и живое существо,, может наследовать признаки и свойства. Наследственность должна быть учтена при работе над новыми разработками.</p><br></p>', '0'),
(862, 80, 337, '<p><p>Нашему делу надо учиться в ВУЗах. Лучшими, с моей точки зрения, на сегодняшний день являются Политехнический институт в Санкт-Петербурге, Уральский политехнический институт в Екатеринбурге и МИСИС в Москве.</p><br></p>', '0'),
(863, 80, 339, '<p>Профессия инженера-металлурга.- вечная профессия. Человечество всегда будет производить эти материалы и изделия из них, непрерывно повышая требования к их свойствам и качеству.<br></p>', '0'),
(882, 81, 322, '<p>Взрослые для работы часто используют разные компьютерные программы. Чтобы разобраться в какой-нибудь новой программе, нужна книжка, где будет написано, как это все работает. Вот такие книжки я и писала.</p>', '0'),
(883, 81, 323, '<p>Превращение чистого листа в осмысленный и законченный текст. Магия букв и слов.</p>', '0'),
(884, 81, 324, '<p>Эта профессия оказалась идеальным сочетанием технического образования и огромной любви к текстам.</p>', '0'),
(885, 81, 325, '<p>Наверное, такими вдохновителями можно считать большую часть моих университетских преподавателей. Они развили пытливость ума, любопытство, умение четко и лаконично формулировать свои мысли, а главное - если за что-то браться, то делать это хорошо.</p><p>Ну, а главным вдохновителем всей своей жизни я считаю, конечно, своего отца. Именно он привил мне все мои качества и принципы. Чему я бесконечно благодарна.</p>', '0'),
(886, 81, 326, '<p>Первым таким этапом, пожалуй, можно назвать самое первое предложение такой вакансии. До того момента я даже не знала о существовании такой профессии.&nbsp;</p><p>Приглашение же в одну из крупнейших российских компаний стало, пожалуй, главным признанием. Ну, а переломным моментом, наверное, было то, что я в итоге согласилась на это предложение, не побоялась новой "высоты".</p>', '0'),
(887, 81, 327, '<p>Думаю, что самое трудное непосредственно в работе - это начать писать, когда перед тобой чистый лист. Кроме того - соблюдение баланса между подробностью объяснения и лаконичностью и структурированностью текста. А в целом - этап согласования результата на всех уровнях. Сколько людей - столько и мнений...</p>', '0'),
(888, 81, 328, '<p>Каких-то крупных и явных провалов не припомню. А небольшие неудачи бывают у всех. Бывали, конечно, периоды "творческого кризиса", когда сидишь перед пустым листом и понимаешь, что вот не можешь начать писать и всё... А сроки идут... В такие моменты главное было - начать писать, неважно что. Потом, в процессе, все сто раз переделается...&nbsp;</p>', '0');
INSERT INTO `post_answer` (`id`, `post_id`, `question_id`, `answer`, `lego`) VALUES
(889, 81, 329, '<p>Всегда приятна "обратная связь". Когда через какое-то время после выхода очередного "Руководства пользователя", люди, которые им пользовались, говорят, что им все понятно и просто.</p>', '0'),
(890, 81, 330, '<p>Лаконичность изложения и структурированность речи, как письменной, так и устной. Грамотность. Не могу позволить себе писать с ошибками даже в личной переписке - глаз режет. С другой стороны, тяжело читать современные издания книг - на каждой опечатке или ошибке глаз невольно останавливается.</p>', '0'),
(891, 81, 331, '<p>Уметь объяснить что угодно на заданном уровне. Для школьника объяснение будет одно, для профессионала в области - разумеется, другое.</p>', '0'),
(892, 81, 332, '<p>Чем больше выпускается программного обеспечения, тем больше нужно руководств для него, причем, идет активное разделение по уровням - для пользователя, для администратора, для техника... Хочется надеяться, что качество не будет принесено в жертву количеству и скорости...</p>', '0'),
(893, 81, 333, '<p>"Руководства никому не нужны, их никто не читает" и "Да что там делать-то? Подумаешь - тексты писать?!"</p>', '0'),
(894, 81, 334, '<p>Чаще всего - над опечатками, конечно.</p>', '0'),
(895, 81, 335, '<p>При чтении любого руководства, к программному обеспечению или прибору, стоит помнить, что те, кто пишет эти инструкции, иногда "в глаза не видели" и "руками не трогали" того, о чем пишут. Это следствие ускорения процесса разработки и выпуска...</p>', '0'),
(896, 81, 336, '<p>Не надо бояться чего-то нового. И не надо слишком много прислушиваться к "общественному мнению".</p>', '0'),
(897, 81, 337, '<p>Профессиональные форумы, тренинги компании Философт...</p><p>С другой стороны, нельзя научить хорошо писать. Научиться писать можно только длительной практикой...</p>', '0'),
(898, 81, 338, '<p>Большинство курьезов, конечно же, связаны с опечатками. &nbsp;Например,"айтивирус" вместо "антивирус" (говорящая, в общем-то, опечатка).</p>', '0'),
(899, 81, 339, '<p>Берешь порой в руки инструкцию к чему-нибудь, пытаешься по этой инструкции сделать что-то и понимаешь - написали ее просто "чтобы было". И становится очень грустно... Ведь технический писатель по сути призван помочь пользователю справиться с трудностями освоения нового - программного обеспечения, прибора или еще чего-нибудь... Возникает ощущение, что писателю было практически наплевать, кто, как и с каким результатом будет это читать... Так быть не должно, я уверена.</p><p>Кроме того, я убеждена, что технический писатель на то и технический - он должен разбираться в технических деталях того, о чем пишет. По текстам написанных инструкций и руководств, как правило, видно, насколько автор владеет материалом. Не понимая тонкостей, трудно объяснить другому человеку "How it works"©.&nbsp;</p><p>Сейчас, к сожалению, наблюдается тенденция, при которой во главу угла ставится владение русским языком, а техническая грамотность отходит на второй план. Надеюсь, что баланс все же выровняется.</p>', '0'),
(905, 66, 350, '<p>Математика<span style="line-height: 1.45em;">&nbsp;вкусная.</span></p><p>Удовольствие в любимом деле приносит легкость, с которой ты им занимаешься: &nbsp;азарт, ощущение того, решение где-то близко.</p><p><span style="line-height: 1.45em;">Если дело "твое", &nbsp;оно дается "легко". &nbsp;Вернее, трудности есть, но они воспринимаются как локальные решаемые задачи.&nbsp;</span></p><blockquote>В рамках не то что всей математики, а даже ее отдельных направлений, например, &nbsp;алгебры, есть вещи , которые не вызывают сильного душевного отклика, а есть те, которые возбуждают и вызывают восторг</blockquote><p>Огромное удовольствие приносят красивые идеи и доказательства. &nbsp;Математики так и говорят "красивое доказательство" или "изящное".&nbsp;</p>', '0'),
(906, 66, 352, '<p><span style="line-height: 1.45em;">2 преподавателя на мат-мехе.&nbsp;</span><br></p><p></p><p>Александр Иванович Генералов (алегбра и теория чисел) и Хавин Виктор Петрович (матанализ). Великие выдающиеся люди.&nbsp;</p><blockquote>Я&nbsp;уже не очень помню, чему именно они учили, но это то что называется&nbsp;<br>“I''ve learned that people will forget what you said, people will forget what you did, but people will never forget how you made them feel.”</blockquote><p><span style="line-height: 1.45em;">Что рассказать без прилагательных? &nbsp;В памяти всплывают забавные, но почему-то на всю жизнь запомнившиеся истории. Как-то раз я присутствовал на его специальном семинаре, где он все время повторял "колчан, колчан, суперколчан". Колчаном он называл какие-то множества, с которыми в каком-то там алегбраическом пространстве что-то там происходит (простите, Александр Иванович, я не очень в теме, но слушать это было потрясающе!). Как потом выяснилось - он был сам изобретателем этой модели, этой теории, придумывал и доказывал теоремы на эту тему. Шутили, что он самый крутой, невероятно крутой специалист в мире по "колчанам", потому что он сам их придумал и мало кто еще, кроме него, их понимает.</span><br></p><p>Он знает до 97 знака число "Пи". Выучил в юности для тренировки памяти. Как-то на лекции начал нам его называть, но потом осекся и говорит, "что-то память плохая стала, только до 56 знака могу вспомнить".</p><p><br></p><p>Виктор Петрович Хавин - что можно сказать о нем? Авторитет и пример на всю жизнь... Пример невероятной работоспособности, правильного отношения к своему делу и к людям. Быть в 80 лет востребованным специалистом, &nbsp;собирать аудитории, путешествовать по миру, &nbsp;писать книги, &nbsp;быть уважаемым всеми учениками и при этом разносторонним &nbsp;<i>ясно</i> мыслящим человеком. Про таких говорят "человек старой школы" - &nbsp;глыба.</p><p></p>', '0'),
(907, 66, 360, '<p></p><ul><li><span style="line-height: 1.45em;">Четко определять терминыв разговоре.&nbsp;</span><span style="line-height: 1.45em;">Если меня спросят холодно ли на улице, я скажу "на улице минус пять".&nbsp;</span><span style="line-height: 1.45em;">Все ведь относительно: кому-то холодно, кому-то - нет.&nbsp;</span></li><li><span style="line-height: 1.45em;">Люблю считать в уме. Например, на рынке. Там двойные вычисления: заметить вес, умножить на цену килограмма и потом посчитать сумму произведений. К тому моменту когда продавец назовет мне итоговую сумму, я уже все посчитал. Если расхождение менее 7%, прощаю.</span></li></ul><p></p><p><br></p>', '0'),
(908, 66, 361, '<p>Математики шутят над всем множеством вещей, кроме тех, над чем не шутят.</p><p><br></p><p>Как-то так.</p>', '0'),
(909, 66, 362, '<p><span style="line-height: 1.45em;">Моск - это мышца. Если его постоянно тренировать, он будет в тонусе. И наоборот, чтобы сохранять ясность и остроту ума, моск надо постоянно тренировать.</span></p><p><span style="line-height: 1.45em;"><br></span></p><p><span style="line-height: 1.45em;">Чистая математика оперирует абстрактными вещами (которые впрочем по мере накопления знаний "выстреливают" в своем приложении к реальной жизни - появляются новые алгоритмы, методы, прикладные исследования).&nbsp;</span></p><p><span style="line-height: 1.45em;"><br></span></p><blockquote><span style="line-height: 1.45em;">Пользу в повседневной жизни приносит мудрость , полученная из математических идей и подходов.</span></blockquote><p><span style="line-height: 1.45em;">Например, &nbsp;пытаюсь следовать в реальной жизни (хотя это довольно непросто!) стратегии, "вы никогда не решите возникшую проблему, если будете ее решать теми способами и в той системе координат, которые привели вас к этой проблеме" (Эйнштейн).</span></p><p><br></p>', '1'),
(924, 82, 322, '<p>Я помогаю людям широко смотреть на свою жизнь и возможности в ней. Обучаю пользоваться своими ресурсами, которые даны каждому из нас.</p>', '0'),
(925, 82, 323, '<p>Я востроргаюсь людьми, их победами, их осознаниями, их эмоциями. Меня до мурашек пробивает, когда я говорю о чем-то поистине важном и глубоком на аудиторию и чувствую, что меня понимают!</p>', '0'),
(926, 82, 324, '<p></p><p>По образованию я педагог и сразу после окончания института пошла работать в школу учителем средних и старших классов, но в 22 года зарплата в 1 500 рублей меня совсем не радовала, поэтому я ушла работать в фитнес индустрию. Потом был опыт работы менеджером по продажам, менеджером по обучению, так как все-таки педагогические навыки давали о себе знать.&nbsp;<br>\n<br>\nПосле первого в своей жизни Тренинга личностного роста, я поняла, что все чем я занималась раньше, не ведет меня ни к какому результату, я не понимала кто я и что мне по настоящему приносит удовольствие. Проделав над собой определенную работу, я поняла, что все-таки педагогика - это моя стезя, но надо было перевести ее в разряд деятельности приносящей еще и достойный доход. И я пошла получать дополнительное образование на бизнес-тренера. Я всегда была достаточно амбициозной: выбирала лучшие места работы, лучшее образование. Пройдя двухгодичное обучение, сначала в Высшей школе экономики, а потом и в Международном университете коучинга, я начала работать в крупнейшей страховой компании, где занималась построением системы обучения персонала и быстро росла по карьерной лестнице. Мне нравилось работать с людьми, раскрывать их возможности, верить в них, быть может, больше, чем они сами могут себе это позволить. Я видела их ресурс, потенциал и горела сама их изменениями.&nbsp;<br>\n<br>\nНо, к сожалению, бизнес-деятельность ради зарабатывания денег для женщины разрушительна. Годы шли, я развивалась, достигала новых вершин, но внутри росло недовольство. Я работала корпоративным тренером, потом руководителем отдела обучения, потом заместителем директора по продажам. Внешне я выглядела вполне женственно, но внутри чувствовала себя"мужиком в юбке". Принципы "сама-сама" и "если не я, то - кто?" были моим кредо.&nbsp;<br>\n<br>\nМоя первая семья распалась, так как я конкурировала по успешности с мужем, давила на его и он проигрывал, а я шла еще дальше, зарабатывала больше денег. Был период, когда мой доход исчислялся сотнями тысяч, а я не помню на что я их тратила. При этом я умудрялась еще иметь кредитную карту, в которую регулярно влезала. Я ничего существенного не покупала, только в шкафу росло количество все более и более дорогих платьев. Ими я заполняла внутреннюю неудовлетворенность.&nbsp;<br>\n<br>\nПосле двух нервных срывов, сломанной руки, я поняла, что все, хватит, наигралась. Всем все доказала. Могу. Сильная. Но не счастливая. И я ушла из страхования в тренинговую компанию. Это был переходный период в становлении моей профессиональной независимости. У меня был гибкий график, но при этом я выполняла требования работодателя. Мне казалось, какое-то время, что я самостоятельная, пока я не осознала, что так же придерживаюсь обязательств собственника. И я свободна условно.&nbsp;<br>\n<br>\nЧто бы "созреть" на уход мне понадобилось еще 4 года, в течении которых я создавала свои программы, развивала себя, обретала внутреннюю уверенность и жизненный опыт. Я не могу учить и транслировать что-то людям, если не испытала это на себе, не убедилась, что это работает через истории моих учениц. Мне крайне важна конгруэнтность тренера.&nbsp;<br>\n<br>\nТолько отпустив контроль, расслабившись, я смогла стать настоящей женщиной. Которая знает и принимает себя, наслаждается тем, что делает. И именно в таком состоянии я встретила своего будущего мужа, с которым мы гармонично дополнили жизни друг друга. Мы подали заявление, через 4 месяца после встречи и сейчас решили обвенчаться.&nbsp;<br>\n<br>\nИ вот, обретя себя, выстроив благополучную личную жизнь, я сделала этот шаг. Я стала свободным тренером, работающим на себя. И теперь я радостно и легко встаю по утрам, у меня множество идей, проектов. Ощущение, что тот потолок, в который я упиралась раньше, растворился, а мне теперь даны безграничные возможности воплощения любых желаний. Муж говорит, что любуется на меня счастливую. Я могу быть с ним в любое время. Мы много познаем вместе: ходим на различные семинары, встречи с интересными людьми. Мы продолжаем развиваться вместе.</p><br><p></p>', '0'),
(927, 82, 331, '<p>Я считаю, что самое главное, это соответствовать тому, о чем говоришь и обучаешь других людей. Сейчас много псевдогуру вокруг, которые не могут сами на практике, в своей жизни подтвердить свои слова и идеи. Я стараюсь быть максимально искренней и рассказывать, в том числе и на своих примерах, о победах и неудачах.</p>', '0'),
(928, 82, 332, '<p>Я верю, что останутся лучшие, которые успешно будут помогать людям развиваться и строить осознанную жизнь.</p>', '0'),
(929, 82, 333, '<p>Да, отличный вопрос!)) Часто, когда я говорю, что я &nbsp;тренер и прежде всего работаю с женщинами, мне говорят: "ААА, учишь мужиками манипулировать!!"" ...</p><p>Сегодня много тренингов по сексу, по стервологии и вот они то и определяют чаще всего отноешние к тренерам и отрасли. Мол, плохому учите..))&nbsp;</p><p>А как на счет того, чтобы люди умели слышать себя, понимать других, договариваться. Этому не учат в школе. &nbsp;<span style="line-height: 1.45em;">А семейные ценности, отношения в паре?! Это часто тоже оставляют без внимания, что "как нибудь разберемся".. И реальность такова, что процент разводов в России &nbsp;зашкаливает...</span></p><p><br></p><p><br></p>', '0'),
(930, 82, 336, '<p>Всему свое время..</p>', '0'),
(931, 82, 339, '<p><p>У меня много энергии, я чувствую страсть к жизни и мне очень хочется делиться этим с людьми. С моими проектами вы можете ознакомиться на страницах: <a href="http://vk.com/public_varvarakosova"><span>http://vk.com/public_varvarakosova</span></a> и <a href="http://vk.com/barbaris_pro">http://vk.com/barbaris_pro</a></p>\n<p>Я верю, у каждого есть все ресурсы для исполнения своих самых заветных мечтаний. И это подтверждается в моей практике постоянно!</p><br></p>', '0'),
(943, 75, 322, '<p>Как раз ребенку в этом возрасте ничего объяснять не надо, он прекрасно все понимает сам и с большим интересом и удовольствием готов принять участие в этом занятии. Если он видит что˗то нераскрашенное, ему хочется это исправить. Для него это естественно. Пока...&nbsp;Могут даже расплакаться, если в силу малого возраста им не доверяют кисти и краски.&nbsp;Так что дети мои большие союзники.&nbsp;</p><p>В ожидании...</p><p><p><img src="/web//upload/images/ecbad1bdbaa6771f1ae9718eec467e5c.jpg" style="width: 227.25px; height: 303px;"></p><br></p><p>Объяснять приходится &nbsp;взрослым.</p><p><br></p><p><br></p>', '0'),
(944, 75, 323, '<p>Наибольшее удовлетворение мне приносит возможность соприкоснуться, встретиться с человеком на глубоком, психоэмоциональном уровне. Хотя эта встреча довольно кратковременна, она может оказаться очень энерго˗информационно&nbsp;&nbsp;насыщенной. И если наше сотворчество оказывается успешным (а я каждый раз всерьез борюсь за это), то человек благодарен мне, а я ему еще больше за доверие, им оказанное &nbsp;(это очень тонкие и прихотливые материи, никого нельзя принуждать), &nbsp;Но если все получается, я испытываю состояние, близкое к эйфории.&nbsp;</p>', '0'),
(945, 75, 324, '<p>Идея именно "пришла": я ее не "ловила".&nbsp;</p><p>Просто, когда в 30˗летнем возрасте я только обучалась росписи, моя наставница ушла в декретный отпуск. Группа детей. обучением которых она руководила в лицее искусств, оказалась под угрозой распада. Я поддалась на уговоры и подставила свое хрупкое еще плечо, взяв на себя ответственность по дальнейшему обучению этих детей и небольшой группы взрослых. Это был период становления: некоторые дети к тому моменту имели больший опыт в росписи, чем я! И с тех пор я четко осознала, что мне гораздо интереснее открывать мир росписи новичкам, знакомить людей с этим искусством, чем работать, как машина или конвейер по росписи тех же матрешек.&nbsp;</p>', '0'),
(946, 75, 325, '<p>Главный ВДОХ˗НОВ˗итель &nbsp;природа, шире сама жизнь.&nbsp;</p><p>Конкретному ремеслу росписи мне посчастливилось обучаться у замечательного мастера Зинаиды Владимировны Голубевой.&nbsp;</p>', '0'),
(947, 75, 326, '<p>1.&nbsp;<span style="line-height: 1.45em; background-color: initial;">В</span><b style="line-height: 1.45em; background-color: initial;"><i>И</i></b><span style="line-height: 1.45em; background-color: initial;">ДЕНИЕ: это главное необходимое условие, с чего начинается путь в изобразительном искусстве. &nbsp;Без этого на холст, бумагу и т.п. будет выплескиваться лишь внутренняя грязь и мусор (хотя это тоже неизбежно).&nbsp;</span></p><p><span style="line-height: 1.45em; background-color: initial;">Подкреплю свое мнение цитатой Г. Нейгауза: "Прежде чем начать учиться на каком бы то ни было инструменте, обучающийся — будь то ребенок, отрок или взрослый — должен уже духовно владеть какой-то музыкой; так сказать, хранить ее в своем уме, носить в своей душе и слышать своим слухом. "</span></p><p>2. ОБУЧЕНИЕ: я была достаточно благоразумна, чтобы ценить возможность учиться у настоящего мастера.&nbsp;</p><p>3. СТАНОВЛЕНИЕ: опыт, опыт и еще раз опыт... Его не бывает слишком много!</p><p>4. СВОБОДА: в творчестве позволяет достигать состояния упоения, когда становится доступной возможность пробовать, создавать новое, необычное, неожиданное. Это похоже на интересную игру. Желаю всем достичь &nbsp;состояния свободы в сфере Вашей профессиональной деятельности!&nbsp;</p><p>Мои успехи на этой стадии весьма скромны: сейчас я в начале этого этапа.</p>', '0'),
(948, 75, 329, '<p>Матрешки, которые расписаны мною:</p><p><p><img src="/web//upload/images/552d30bf49c15c6d0b88976a09234737.jpg" style="width: 307.702702702703px; height: 276px;"></p><p><p><br>&nbsp;<p><img src="/web//upload/images/0813b59dfb676787731f8766ba7f57be.jpg" style="width: 183.752252252252px; height: 361px;"></p></p><br></p><p><br></p><p><p><img src="/web//upload/images/8887bf7a27c60088f06188b3f2d30616.jpg" style="width: 277.866108786611px; height: 229px;"></p><br></p><br></p><p>Матрешки, которые расписаны с моей помощью:</p><p></p><p><p><img src="/web//upload/images/2d834370fba68907d4b60cb883167f5a.jpg" style="width: 262.39312039312px; height: 349px;"></p><br></p><p></p><p><p><img src="/web//upload/images/2cebe983b2d4835432c04ecaf86d64fa.jpg" style="width: 224.4px; height: 330px;"></p><br></p><p><br></p><p><img src="/web//upload/images/6ea0d02c14496ab564040c622271866a.jpg" style="width: 241.593495934959px; height: 323px;"></p><p><br></p><p>Роспись стен на кухне у моей подруги:</p><p></p><p><img src="/web//upload/images/d11c9e8a44be73e2d694ebe2189c0f3b.jpg" style="width: 352px; height: 264px;"></p><p><br></p><p></p><p><img src="/web//upload/images/d2a15b96ba9e45bf630becf3ee0ffd9b.jpg" style="width: 354.666666666667px; height: 266px;"></p><p><br></p><p>Расписные изделия:</p><p></p><p><img src="/web//upload/images/3123a8b1f4d4a260f45a2f52520454de.jpg" style="width: 138.498023715415px; height: 219px;"></p><p></p><p><img src="/web//upload/images/162b68a83fcd6179814a5409940b7f45.jpg" style="width: 292.769230769231px; height: 132px;"></p><p></p><p><img src="/web//upload/images/423ee82f501f609b6a2acc8ea8d9b1bb.jpg" style="width: 169.398907103825px; height: 155px;"></p><p><p><br></p></p><br><p></p><br><p></p><br><p></p><br><p></p>&nbsp;<p></p><br><p></p><p><br></p><p><br></p><br><p></p><p><br></p><p></p>', '0'),
(949, 75, 330, '<p>Настойчиво пытаюсь находить способы превращения "неприятных" жизненных ситуаций в "приятные".&nbsp;</p><p>Стремление помогать близким и друзьям в сложных для них ситуациях: чтобы не впадали в отчаяние и сохраняли веру в свои силы и возможности.&nbsp;</p><p><br></p><p><br></p>', '0'),
(950, 75, 331, '<p>Настоящее мастерство не "пропьешь"!&nbsp;</p><p>В первые годы моего увлечения росписью часто случались перерывы в моих занятиях. После этого приходилось восстанавливать навыки: руки их "забывали". &nbsp;Со временем я обнаружила, что перестала "терять" свои умения. Вот эта стадия, когда мастерство достигает "физического", телесного уровня, для меня является "настоящей".&nbsp;</p>', '0'),
(951, 75, 332, '<p>По поводу будущего ремесел вообще и росписи в частности я испытываю противоречивые чувства и мысли.&nbsp;</p><p>С одной стороны, кустарное рукоделие не может конкурировать с поставленным на поток массовым производством. Подавляющая масса матрешек, предлагаемых в магазинах России, производится поточным, конвейерным способом в Китае: один "художник" рисует только один элемент. И так дальше по конвейеру. Матрешки эти получаются "механистическими", правда довольно яркими, но часто безвкусными. Они призваны удовлетворить спрос невзыскательных любителей сувениров и стоят дешево.</p><p>С другой стороны, в обществе увеличивается заинтересованность в межличностном общении, получении персональных услуг, в том числе и в сфере ремесел. Есть спрос на переживание, получение личного опыта: не просто прочитать о том, как изготавливается, например, матрешка, а самому принять участие в ее создании. Этот слой, конечно, намного <i><b>у</b></i>же.&nbsp;</p><p>Ну а какие тенденции станут преобладающими не так уж важно: важно, чтобы у каждого была возможность выбора. &nbsp; &nbsp;</p><p><br></p>', '0'),
(952, 75, 333, '<p>Главный стереотип&nbsp;˗ что художниками могут быть лишь "избранные". Когда я встречаюсь с таким отношением людей к их способностям, пытаюсь мягко убедить их в том, что они были когда˗то&nbsp;&nbsp;кем˗то обмануты. Рисовать, изображать&nbsp;˗ это врожденное свойство каждого человека. Хотя способности, конечно, различны.&nbsp;</p><p>Но это никак не может служить препятствием для рисования.</p>', '0'),
(953, 75, 337, '<p>Ссылка на мой сайт:&nbsp;<a href="http://matryoshkamc.ru/index.php/ru/master-klass/galereya" class="active">http://matryoshkamc.ru/index.php/ru/master-klass/galereya</a></p><p>Учиться надо у мастеров, владеющих искусством росписи. По книгам научиться трудно. Анализируя позже процесс своего обучения, я поняла, что воспринимала не столько то, что должно родиться на бумаге или дереве, сколько пыталась копировать само движение, которым достигался этот результат. Думаю, интуитивно я делала очень правильно: "ухватывала" движение и старалась его повторить.&nbsp;</p><p>И еще одно наблюдение: многим моим подругам доставляло настоящее удовольствие просто наблюдать за тем, как я расписываю. Если есть такая возможность, не упускайте ее: даже если не станете художником, все же обогатитесь пониманием.</p><p>Вот вспомнила, что еще в детстве, лет в пять, у меня была возможность наблюдать за стеклодувами, выдувающими изделия из стекла или хрусталя. Это завораживало! Настоящее волшебство!</p><p><br></p>', '0'),
(956, 85, 322, '<p><p>Я спасаю Францию, дитя моё.</p></p>', '0'),
(957, 85, 323, '<p><p>Когда меч в моей руке, движимой святым духом, пронзает доспех англичанина, когда в глазах солдат, идущих со мной плечом к плечу, сияет отвага, когда на стенах Орлеана поднимаются первые знамёна, я чувствую, что не зря живу на этой святой земле.</p><p><br></p><p><img src="/web//upload/images/aa3cb8227eae653f9f4d5774c4eebb8e.jpg" style="width: 257.0621468926554px; height: 364px;"></p><br></p>', '0'),
(958, 85, 324, '<p><p>Однажды, закончив приготовление очередной порции утиного паштета, я вышла прогуляться&nbsp;<span style="line-height: 1.45em;">до старой водяной мельницы. Путь был неблизкий, и я прилегла отдохнуть под деревом в шёлковых зарослях кресс-салата. Сон сморил меня, и я услышала голос господа-бога нашего,&nbsp;</span><span style="line-height: 1.45em;">и приказал он мне вести французскую армию к победе над древним врагом.</span></p><p>Я решила отнестись к божественному провидению с полной серьезностью. К тому же пасторальная Лотарингия мне уже порядком надоела.</p><br></p>', '0'),
(959, 85, 325, '<p><p>Архангел Михаил, святая Екатерина Александрийская и Дофин Карл, истинный король наш.</p>\n<p>\n</p><p>Михаил — с виду обычный человек, от которого исходит сила непонятной природы. Когда я была совсем юной, матушка говорила что-то про пылающий меч. Не заметила ничего подобного.&nbsp;</p>\n<p>Екатерина поражает своей красотой, правда, при встрече я не поняла многое из того, что она говорила.</p>\n<p>Дофин — еще почти ребенок, но я знаю, что он предан Франции и будет жить во благо её.</p><br></p>', '0'),
(960, 85, 326, '<p><p>Когда у меня появилась цель, я думала, что всё будет просто, так как небеса поддерживали меня. Однако, всё оказалось сложнее. Сначала я столкнулась с непониманием родителей.&nbsp;</p>\n<p>В нашей деревеньке война не казалось такой значительной, подумаешь, английские солдаты украли несколько кур. Поэтому осенняя заготовка сыров казалась моей семье более важным делом, чем возвращение чести королевству. Пришлось ждать, пока мне не исполнилось 16 и я не стала слишком старой для замужества. Тогда я отправилась к капитану города Вакулёр господину Роберу де Бодрикуру и выложила всё начистоту. Это подвыпившее ничтожество долго смеялось (конечно, чего еще можно было ожидать от провинциального вояки?!).</p>\n<p>Но я не сдавалась и повторила попытку через год. Пораженный моей настойчивостью и возможностью предсказывать будущее, он дал мне солдат, сопроводивших меня в Орлеан.</p><p><br></p><p><p><img src="/web//upload/images/c30f61a4d65151bc74dbcc7aec854274.jpg" style="width: 278.0671875px; height: 433px;"></p><br></p>\n<p>Именем господа мне удалось доказать будущему королю и придворным псам своё предназначение, и мне передали командование осажденным гарнизоном города. Я считаю это переломным этапом на моем жизненном пути. Наверное, не обошлось без моего врожденного обаяния.&nbsp;</p><br></p>', '0'),
(961, 85, 333, '<p><p>Я женщина — солдат. Иногда сложно добиться, чтобы меня воспринимали всерьез.</p>\n<p>В первый раз отправившись в поход, я была вынуждена сменить платье на шаперон, хук и шоссы, чтобы оградить себя от излишнего мужского внимания (к тому же так стало легче воевать). Но всё равно, даже когда я освободила Орлеан и меня стали уважать при дворе, я продолжала замечать мужские взгляды, брошенные украдкой.</p><p><br></p><br></p>', '0'),
(962, 85, 338, '<p><p>Однажды в своих новеньких доспехах (к счастью, к тому времени я уже получила от церковников разрешение на ношение мужской одежды) я прибыла в военный лагерь.</p>\n<p>Обсуждение тактики следующего боя велось, что бывает редко, в непринужденной атмосфере, и я в ответ на чье-то смехотворное предложение сказала: «Ну тогда, может быть, Вы еще и катапульты будете заряжать камнями, а не толстяками!». Меня встретил взрыв хохота.&nbsp;</p>\n<p>Но потом кто-то из офицеров воскликнул: «А почему бы не попробовать?!»&nbsp;</p>\n<p>Так был взят бастион Сен-Лу.&nbsp;</p><br></p>', '0'),
(963, 85, 339, '<p><p>Первое, что приходит в голову, - моё дело не такое, каким я себе его представляла.</p>\n<p>Я думала, что все пойдут за мной, произнеси я первое слово, но встретила недоверие и насмешки.</p>\n<p>Вместо изысканности при дворе я столкнулась с презрением и интригами.</p>\n<p>Когда солдаты и капитаны приняли меня, я почувствовала воодушевление, видя, как отчаяние в их глазах уступает место надежде, но радость постепенно блекла, когда я испытывала тяготы походов,&nbsp; пыталась смириться со смертью моих братьев по оружию.&nbsp;</p>\n<p>Но это не имеет значения, когда ты твердо знаешь, что каждый свой шаг ты делаешь во имя Франции и во имя господа нашего; в конце концов я уверена, что поступаю правильно.</p>\n<p>Даже если все отвернутся, церковь не даст меня в обиду.&nbsp;</p><p><br></p><p><p><img src="/web//upload/images/8f028f3d075814229d5e690e7adf2e9a.jpg" style="width: 533.0184696569921px; height: 387px;"></p><br></p><br></p>', '0'),
(964, 86, 349, '<p>Вот есть далеко от нас большой и яркий шарик - Солнце. Оно греет всё вокруг, а мы хотим сделать такой-же шарик, только маленький и чтобы он грел нас всегда когда мы захотим.</p>', '1'),
(965, 86, 350, '<p>Осознание того, что ты знаешь что-то уникальное.</p><p>Причем подразумевается не то знание, которое ты получил из книги или лекции, а то, которое ты получил сам, вот вчера никто вообще не знал как это работает, а сегодня ты, возможно, единственный у кого есть представление о том как это устроено.</p>', '1'),
(966, 86, 351, '<p>Если не отбрасывать детское любопытство и не стремиться к безграничному потреблению, то наука это, возможно, единственное место, где можно существовать.</p>', '1'),
(967, 86, 352, '<p>Вдохновляют старшие коллеги, доктора, профессора.&nbsp;</p>', '0'),
(968, 86, 353, '<p>При поступлении в вуз у меня была возможность выбора. Причем вариантов специальностей было около пяти: от нефтяной промышленности, до разработчика ПО, математики и физики.&nbsp;</p><p>Меркантильность тянула в нефть, друзья говорили, - Пойдем на программистов.&nbsp;</p><p>А по итогу не смог позволить себе отказаться от физики.</p><p><br></p><p>Еще были моменты, когда появлялись различные предложения на трудоустройство. Приглашали туда, где моя специализация не имела бы применения, но предлагали то от чего было сложно отказаться - большие деньги, путешествия, корпоративные машины.&nbsp;</p><p><br></p><p><br></p>', '1'),
(969, 86, 354, '<p>Признаваться в поражениях, в том, что проделанная работа не привела к желаемому результату.</p><p>Постоянно иметь дело с рутинными действиями, которые необходимы для работы с данными.</p>', '1'),
(970, 86, 355, '<p>Эксперимент это вообще сплошные провалы и неудачи.&nbsp;</p>', '1'),
(971, 86, 357, '<p>Доверять только надежным данным</p>', '1'),
(972, 86, 359, '<p>Если и когда решим ту проблему, которая была для нашей отрасли поставлена более 60 лет назад, то будем думать. А пока работать надо</p>', '0'),
(973, 86, 360, '<p>"Ученые это скучно"&nbsp;</p><p>"Ты физик а значит, наверное, умный"&nbsp;</p><p><br></p>', '0'),
(974, 86, 361, '<p>Над тем-же над чем и обычные люди, местечковый юмор присущ любой области, но углубляться в него бессмысленно.&nbsp;</p>', '0'),
(975, 86, 363, '<p>Учи высшую математику столько, сколько можешь и еще немного.</p>', '0'),
(978, 88, 322, '<p>Когда ты пойдешь в школу, я стану твоим папой... и мамой, и старшим братом, и сестрой. Я буду в курсе всех твоих проблем. Я буду рассказывать тебе о мире, который тебя окружает, и в котором тебе придется выживать.</p>', '0');
INSERT INTO `post_answer` (`id`, `post_id`, `question_id`, `answer`, `lego`) VALUES
(979, 88, 323, '<p>Самое увлекательное в моей профессии - это игра. Игра в начальника, в руководителя, в гуру, которого слушают, открыв рот. Рекомендации которого хватают на лету и бегут исполнять, и готовы положить уйму сил и энергии только, чтобы выслужиться перед Вами. Но это по Фрейду, а если серьезно, то есть несколько вещей, которые приносят удовольствие в этой работе:</p><p><br></p><p>- высокая эмоциональность. Такой концентрации эмоций, как в школе, вы не получите больше нигде. Настоящая привязанность и любовь, материнская или отцовская, по отношению к детям. Настоящее сопереживание. Настоящая радость за успех и настоящее горе из-за поражения. В общем, спектр положительных и отрицательных эмоций, который в обычной жизни вы бы испытали только годам к 50, вы испытаете весь и сразу, еще и помноженный на количество учеников у вас в классе.</p><p><br></p><p>- невероятная отдача. Вы вбрасываете в детей лишь капельку, а они возвращают вам фонтан. Иногда даже ревущий водопад Виктория. Говорят, поэтому учителя так молодо выглядят.</p><p><br></p><p>- творчество. Ощущение не начальника, нет. Скорее скульптора с глиной в руках или художника перед чистым полотном.</p><p><br></p><p>- саморазвитие. Столько мыслей, книг и письменных сочинений, как на работе, я не передумал, не перечитал и не написал за время всей своей учебы в школе и в университете вместе взятых. Эта профессия любого здравомыслящего человека прямо-таки заставляет развиваться.</p>', '0'),
(980, 88, 324, '<p>Эта идея есть у любого человека, которому нравилась его собственная школа. Который понял, как много она ему дала в жизни. У меня это чувство переросло в ощущение долга перед школой. Я здесь учился, я знаю, что здесь хорошо, и я хочу быть частью того, как эти люди готовят детей к жизни, я хочу внести свой вклад. Потому что школам всегда было нелегко в их большом деле, им всегда требуются профессионалы и энтузиасты.</p>', '0'),
(981, 88, 325, '<p>Это очень важный вопрос. Для моей профессии решающий, я бы сказал. У всех была какая-нибудь Марфа Васильевна, скажем, математичка, которая постоянно вызывала вас к доске, чтобы унизить перед всем классом. Вопрос в том, сколько таких Марф у вас преподавало, и как сильно у вас профессия учителя теперь ассоциируется с тем, что нужно быть толстой, с пучком на голове и в очках, постоянно орать на детей и водить всех провинившихся к директору. Мне очень повезло с примерами для подражания. У меня были учителя, харизма которых появлялась в кабинете раньше, чем они сами. Эти святые Существа, которые, просто опустив глаза к полу и тихо произнеся: "Как же вы меня сегодня расстроили...", вызывали желание у всего класса выпрыгнуть из окна, застрелиться или просто тут же провалиться сквозь землю от стыда. У меня в учителях были не просто хорошие люди, но и прирожденные лидеры и очень грамотные манипуляторы.&nbsp;</p>', '0'),
(982, 88, 326, '<p>Решающий этап на профессиональном пути учителя - каждый рабочий день. И я не утрирую. Если вы работаете в хорошем учебном заведении, еще и специализирующемся на вашем предмете, у вас будет все: и высокая конкуренция между коллегами по предмету, профессиональный рост (3 категории, которые нужно заработать, а потом и постоянно подтверждать), и, наконец, дети, сдающие ЕГЭ по вашему предмету. Первый мой выпуск 11классников состоялся в прошлом году. Это и было таким большим знаковым событием для моей профессиональной жизни. А так, будьте готовы каждый день доказывать, что вы чего-то стоите.</p>', '0'),
(983, 88, 327, '<p>- стремление к объективности. Мы, учителя, травмируем огромное количество детских душ своей несправедливостью, читай необъективностью. А на этапе юношеского максимализма восприятие именно этой категории обострено. Поэтому очень легко потерять контроль над ситуацией в группе, когда у вас есть откровенные любимчики и аутсайдеры. Хотя все мы люди, и именно так привыкли оценивать "подчиненных".</p><p><br></p><p>- отпускать "своих" детей. В неизвестность. В быстро меняющийся жестокий мир. В разочарование. В потерю мечты. К сожалению, хорошая школа сегодня - это всего лишь отдушина: анклав свободы, интеллектуального роста, творчества. Все это слишком ретиво и бесцеремонно вымывается уже на этапе университетского образования.</p>', '0'),
(984, 88, 328, '<p>Провалы в преподавании почти всегда оцениваются, как крах в личных отношениях с одним конкретным ребенком. Я понял, что есть дети, которым ты просто не нравишься. Какой бы ты ни был умный, красивый, энергичный и харизматичный, он не возьмет от тебя ровным счетом ничего, потому что бесишь ты его, а преподаватель всегда ассоциируется с предметом, который он преподает, А значит, "опять эта сволочь чего-то от меня хочет со своим французским языком" - вполне реальный вариант. И ничего вы с этим не сделаете. Если не хотите, конечно, докапываться, почему этот ребенок так к вам лично относится. Не хотите, я вас уверяю.</p>', '0'),
(985, 88, 329, '<p>Собственно прошлогодний ЕГЭ по французскому языку моих учеников. Средний балл - 85 из 100. Одна даже на 94 написала. А ощущения, как будто сам сдавал.</p>', '0'),
(986, 88, 330, '<p>Так как вы уже поняли, что я учитель французского, то моя привычка сугубо лингвистическая: переводить русскую действительность на французские рельсы. Перевожу про себя практически все с русского языка на французский: рекламу или выпуск новостей по телевизору, разговор с сестрой по телефону или посиделки с друзьями в уютном местечке. Полезно. Правда ощущение, что работа всегда со мной, меня не покидает.</p>', '0'),
(987, 88, 331, '<p>В нашей профессии есть два условных направления: "злой" и "добрый" полицейский. Традиционная авторитарная система (более характерная для советской школы) зиждется на тотальном контроле, дисциплине учащихся и авторитете учителя. Коммуникативная система (пришедшая из Европы, более демократичная) стоит на свободе выражения мысли, на утилитарности знаний, на грамотно и четко сформулированных критериях оценивания и на роли учителя-гида в предмете. С учетом разных типов личности преподавателя и учащегося можно разработать абсолютно разные направления. Поэтому поймите, кто вы. А педагогический подход приложится. Затем, развивая соответствующие вашему подходу качества, вы добьетесь идеальной подачи материала. Наконец, в любом случае, своим предметом вы должны владеть на очень высоком уровне.</p>', '0'),
(988, 88, 332, '<p>Видимо, печальное. Пока что мы все время в состоянии реформы образовательной системы. Может быть все, что я написал выше станет неактуальным уже года через 2.</p>', '0'),
(989, 88, 333, '<p>см. пункт про Марфу Васильевну.</p>', '0'),
(990, 88, 334, '<p>Над перлами учеников, над чем же еще. Но знали бы вы, что некоторые индивиды порой выдают...</p>', '0'),
(991, 88, 335, '<p>Учителя очень хорошо знают, что происходит с ребенком, который у них занимается. Знают они это зачастую лучше, чем родители этого ребенка. Через наше сито в 11 классах проходит около 40 детей, и мы почти всегда в курсе всего, что в их жизни происходит, и куда это все ведет. По-моему, родителям логично обсуждать многие вещи с преподавателями и даже спрашивать советы.</p>', '0'),
(992, 88, 338, '<p>Про стереотипы. Мне 26 лет, рост мой 175 см. Если я достаточно гладко выбрит, то многие принимают меня за 9-10классника. Одна заботящаяся о здоровье учащихся мамочка, которая меня не знала, хотела отвести меня к завучам за курение перед школой (самая моя отвратительная привычка, но только во время уроков, когда рядом нет детей, и все по закону). Спросила у меня класс, в котором я учусь, а когда услышала ответ "я учитель французского", разъярилась, сама побежала к завучам и нажаловалась на ученика-курильщика-враля. Через три минуты выбежала из здания школы с лицом цвета закатного солнца. Убежала прочь. Обожаю ломать стереотипы.</p>', '0'),
(993, 88, 339, '<p>Свободное, творческое, интересное и достаточно сложное дело, которое будет занимать ваше время и мысли не только в стенах школы, если вы ответственно подойдете к его выполнению. Ощущение, что работаешь на государство, то есть на благо всех его граждан, не мараясь при этом ни коррупцией, ни волокитой, ни бюрократией. Ты - светлый рыцарь этой бездушной, давно прогнившей системы, без которого наверняка бы все рухнуло. Но между приступами осознания собственной важности и впрямь нужно помнить о том, какое большое и ответственное дело тебе поручили.</p>', '0'),
(1112, 100, 323, '<p>Эсэмэска из банка дважды в месяц. Отпуск.</p>', '0'),
(1113, 100, 324, '<p>Остальные профессии казались ещё более сложными.</p>', '0'),
(1114, 100, 326, '<p>ИнЯз финишт.</p>', '0'),
(1115, 100, 327, '<p>Не унывать, глядя на огромный скучный документ, который нужно перевести.</p>', '0'),
(1116, 100, 328, '<p>Давайте не будем об этом.</p>', '0'),
(1117, 100, 329, '<p>Премии размером в оклад.</p>', '0'),
(1118, 100, 330, '<p>Читаю.</p>', '0'),
(1119, 100, 332, '<p><img src="http://upload.wikimedia.org/wikipedia/commons/d/d3/IBM_Blue_Gene_P_supercomputer.jpg" style="">.</p>', '0'),
(1120, 100, 334, '<p><a href="http://www.youtube.com/watch?v=QNKn5ykP9PU" class="active">http://www.youtube.com/watch?v=QNKn5ykP9PU</a></p><p>:/</p>', '0'),
(1121, 100, 336, '<p>"Учись программировать!"</p>', '0'),
(1122, 100, 337, '<p><img src="https://07.img.avito.st/1280x960/839791507.jpg" style="">.</p>', '0'),
(1141, 101, 322, '<p>Помогаю большим дядям выбрать место куда денежки положить, что бы их больше стало.<br></p>', '0'),
(1142, 101, 323, '<p>Видеть, что инвестиционная идея оправдывает себя, на глазах растет доходность. Это прям будоражит и радует!)<br></p>', '0'),
(1143, 101, 324, '<p>Мне всегда хотелось работать в сфере PR, образование соответствующее. Это прекрасно, что в работе мне удается сочетать знания о финансовых рынках и заниматься продвижением продуктов и бренда в целом.<br></p>', '0'),
(1144, 101, 325, '<p>Есть, в первую очередь это люди, с которыми я ежедневно тружусь во благо компании. Например,<a href="https://yasoon.ru/#/post/49"> Иван Клыков</a>. Наставник, вдохновитель и просто хороший человек. Многому меня научил. :)<br></p>', '0'),
(1145, 101, 327, '<p>Сосредоточиться на одной задаче. <br></p>', '0'),
(1146, 101, 333, '<p>"Неужто такая симпатичная девушка разбирается в финансах"?)</p><p>Это, пожалуй, основной стереотип с которым я пытаюсь бороться на обучающих семинарах. И вы знаете, неплохо получается. :)<br></p>', '0'),
(1147, 101, 334, '<p> </p>', '0'),
(1148, 101, 336, '<p>Попытайся попробовать силы во всех возможных сферах: юриспруденция, реклама, недвижимость, маркетинг, PR, финансовые рынки. Все, что хоть немного может быть тебе интересно. :)<br></p>', '0'),
(1149, 101, 337, '<p>Приходите <a href="http://www.alpari.ru/ru/school/courses/structured_products/">на семинар</a> по структурированным продуктам!=D<br></p>', '0'),
(1210, 105, 322, '<p>Я делаю так, чтобы газеты писали&nbsp;о людях, компаниях и продуктах только&nbsp; правильные вещи&nbsp;</p>', '0'),
(1211, 105, 323, '<p>Когда ты уже предвкушаешь провал мероприятия, и вдруг появляются микроавтобусы с камерами федеральных телеканалов</p>', '0'),
(1212, 105, 327, '<p>Достучаться до газеты "КоммерсантЪ"</p>', '0'),
(1213, 105, 330, '<p>Азарт пополнять копилку личных контактов. Люди всегда приносят что-то новое и позитив.</p>', '0'),
(1214, 105, 332, '<p>Мир коммуникаций активно развивается, люди все больше зависят от IT и информации. Хотелось бы, чтобы появилось больше специалистов, которые создали &nbsp;бы безопасное медиапространство.</p>', '0'),
(1215, 105, 333, '<p>Что пиарщик - это распространенная специальность, для которой не требуется квалификации. Отчасти это правильно, но хороших специалистов в отрасли не так много.</p>', '0'),
(1216, 105, 335, '<p>Медиа - это определенный механизм, который функционирует по своим законам, поэтому новости далеко не всегда можно воспринимать как истину в последней инстанции.</p>', '0'),
(1217, 105, 336, '<p>Занимайся тем, что нравится, и не слушай других. Не бойся рисковать и отделяйся от семьи при первой возможности.</p>', '0'),
(1218, 105, 337, '<p>PR на 100% - самая известная и пока самая лучшая книга.</p>', '0'),
(1238, 110, 322, '<p>Я убеждаю людей, что лучше знаю, что им нужно, и заставляю их за это платить</p>', '0'),
(1239, 110, 323, '<p>Азарт, когда ты видишь свой процент выполнения плана</p>', '0'),
(1240, 110, 325, '<p>Мой первый супервайзер Таня всегда могла найти нужные слова, чтобы успокоить меня в трудной ситуации, и нужные идеи, кому еще и как можно предложить товар, когда уже все возможности испробованы.</p>', '0'),
(1241, 110, 326, '<p>Я начала работать в косметической компании торговым представителем, где отвечала за представленность марки и прямые продажи в одном из районов Москвы. Я всегда много работала, но никогда ранее не сталкивалась с такими завышенными требованиями. Эта работа сделала меня на 100%.</p><p>Первый большой коллектив со своими традициями, сложностями и корпоративными особенностями дал мне дополнительную платформу, на которую я могла опираться, будучи одна в большом мегаполисе.</p><p>Регулярные тренинги и обучающие семинары, которые все торговые воспринимали несерьезно, в конечном итоге сделали из меня профессионального продажника с пониманием, как можно натаскивать команду</p><p>Это были первые два года. Потом был период ступора, когда я боялась что-то изменить сама, а на работе никаких повышений либо ротаций не предлагали.</p><p>Потом неожиданно предложили работу на более высококй должности у конкурента. Сейчас я всем довольна.&nbsp;</p>', '0'),
(1242, 110, 327, '<p>Если вы впечатлительная натура со слабыми нервами - вам не надо в продажи.</p>', '0'),
(1243, 110, 329, '<p>Как-то мы продвигали очень важную новинку в розничные сети, и всем было сказано ставить клиентов перед фактом: отгружаем минимум по три штуки! Это блеф, конечно. Отгрузить могли и одну. Но, так или иначе - новинка есть новинка.&nbsp;Для наибольшей эффективности среди торговых устроили конкурс с призом - поездка на море для пяти победителей.</p><p>В общем, я попала в число счастливчиков. Получилось просто: раз можно "минимально" по три отгружать, то почему бы не сказать - по пять? Главное потом быть убедительной.</p>', '0'),
(1244, 110, 331, '<p>Знать точно, сколько ты сможешь продать и кому и как это соотносится с квартальными планами&nbsp;</p>', '0'),
(1245, 110, 335, '<p>Если подумать, мне приходится довольно много врать. В бизнесе все преследуют свои цели, и в этом суть конкуренции. Если будешь чересчур мягкотелым, тебя просто пнут и задвинут.</p>', '0'),
(1248, 111, 343, '<p>\n</p><p>Когда я приехала «покорять Москву», работу торговым представителем мне оказалось получить проще всего. В моем родном городе я работала с промоутерами\nи подрабатывала на акциях. Общалась. Больше ничего не умела. Меня и взяли на\nоклад плюс процент на аутсорс в одну крупную косметическую компанию. Не сказала\nбы, что «мерчить» каждый день по пыльным полкам и «толкать» косметику\nзаведующим аптек было очень романтично. Для меня это была рутина, заработок. Тренинги\n– повод посидеть в офисе, а не бегать по точкам. Потом – планы, склад, и опять\nв «поля». Перспективы я особо не видела, как и личностного роста – не ощущала.</p>\n<p>Этот мелкий случай произошел, когда я помогала искать\nквартиру в Москве сестре из Красноярска. Она еще была как неоперившийся\nворобышек в этом гигантском мегаполисе. У нее увели из-под носа несколько\nхороших предложений, после чего, собственно, пришлось ее выручать. Глядя, как\nона нерешительно общается с хозяином, я начала понимать, как выглядела сама со\nстороны три года назад…</p>\n<p>«Знаете, я согласен, но дайте время до завтра подумать».</p>\n<p>«Конечно, давайте!»&nbsp; -\nпокорно соглашается сестра.</p>\n<p>Провал! Тот, кто занимается продажами, знает – НИКОГДА! – не\nоткладывайте продажу. Если клиент почти согласен, дожимайте. Любой ценой.\nПочему-то раньше я никогда не поступала в обычной жизни так, как на\nпереговорах.</p>\n<p>«А давайте сегодня». </p>\n<p>Надо ли говорить, что я его «дожала». Было нетрудно: его\nпрофподготовка была значительно ниже моей. Куда там, попробуй «загрузить»\nклиенту грузовик новинок, когда у него «пересток» товара на два месяца вперед,\nа потом спорь со мной.</p>\n<p>Это было первое осознание: благодаря моей профессии я могу делать\nтак, чтобы люди вели себя в соответствии с моими потребностями. Я могу\nДЕЙСТВОВАТЬ, когда надо, и ни черта меня не волнует, что кто-то при этом испытывает\nнеудобства.</p>\n<p>Спустя некоторое время меня переманил конкурент – возглавить\nрегиональное подразделение по продажам. Хотя в своей компании я была далеко не\nсамой лучшей, как мне казалось.</p>\n\n<br><p></p>', '0'),
(1254, 112, 344, '<p>\n</p><p>Я человек творческий, но с рациональным зачином. Мне никогда не удавалось приучить себя вести ежедневник в соответствии с известными\nсистемами планирования.&nbsp;<span style="line-height: 1.45em; background-color: initial;">Для меня недостаток существующих систем в том, что они очень\nсухие, имперсональные и заточены под решение задач. Мне нужна была яркая система,\nкоторая стала бы отражением моей личности, &nbsp;визуализировала бы мои мысли, идеи, вдохновляла и копила для меня полезную информацию.</span></p><p>Вот такой метод - сын ошибок трудных - родился в самолете в очередной командировке. Очень помог мне новый Молескин на 2015 год, в котором я с неописуемым восторгом обнаружила наклейки с условными обозначениями.</p><p>Делюсь опытом.</p><p><span style="line-height: 1.45em; background-color: initial;">Для начала стоит определить, какие у Вас как у личности есть потребности, и подумать, в каких ситуациях Вы их удовлетворяете. Это касается всего - работы, жизни, желаний, семьи и т.п.&nbsp;</span></p><p><span style="line-height: 1.45em; background-color: initial;">Итак, Задайте себе простой вопрос: что мне\nнужно от ежедневника?</span></p>\n<p>У меня получилось:</p>\n<p>-&nbsp;\nОрганизация рабочего процесса (встречи, проекты,\nдедлайны)</p>\n\n<p>-&nbsp;\nФиксация важных дат (дни рождения, праздники,\nпоездки)</p>\n\n<p>-&nbsp;\nРешение бытовых вопросов (оплата счетов,\nподдержание дома и имущества в порядке)</p>\n\n<p>-&nbsp;\nПриятные дела (уход за собой, любые приятные\nмелочи и мысли)</p>\n\n<p>-&nbsp;\nСаморазвитие (полезные мысли и творческие идеи) </p>\n\n<p>-&nbsp;\nВдохновение</p><p></p><p><img src="/web//upload/images/67232c81da3672148d464ea5955db2f3.jpg" style=""></p><p></p>\n<p></p><p></p><p></p><p>Затем, необходимо сгруппировать эти потребности в четыре\nкатегории и присвоить им цвета: </p>\n<p>-&nbsp;\nОбязанности - важное и срочные (красный)</p>\n\n<p>-&nbsp;\nДаты - неважное и срочное (зеленый)</p>\n\n<p>-&nbsp;\nСаморазвитие - важное и несрочное (красный)</p>\n\n<p>-&nbsp;\nУдовольствие - неважное и несрочное (зеленый)</p><p></p><p></p><p><img src="/web//upload/images/1a1a1b15186e4c8f1ccdcde7739e00e8.jpg" style=""></p><br><p></p><p></p><p></p><p></p>\n<p>Последнее – определить, в каком порядке заниматься всеми потребностями, которые, по сути своей, в равной степени важны для Вашей личности. У Молескина очень продуманная структура, в соответствии с которой такой порядок выстроить несложно.</p><p>Первый шаг - запланировать все важное и срочное в квартальном календаре.</p><p></p><p></p><div><p><img src="/web//upload/images/6aae82f70bdebe5de3c6b5dd980305d0.jpg" style=""></p></div>Неважное и срочное - даты и праздники - лучше зафиксировать в отдельном календаре для праздников.<p></p><p>Теперь - самое главное - выполнение запланированных задач. Это, по сути, то, что представляет собой Ваша жизнь, текущий момент. Поэтому очень важно именно эту часть сделать яркой и интересной. На мой взгляд, удобнее работать с ежедневником, где на одном развороте можно выставить задачи на неделю, а на другом - делать заметки к ним. Тогда Вы сможете не только выполнять свои дела, но и анализировать их и делать полезные заметки к каждой неделе.</p><p></p><p></p><p></p><p></p><p><img src="/web//upload/images/da8c944b04faa5c209cf71957ebf371f.jpg" style=""></p><p></p><p>И, наконец, - вдохновение! Слушайте себя и пишите то, что для Вас важно. В понедельник я пишу себе фразу недели. Готов и слоган для 2015 года.</p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p><img src="/web//upload/images/66c2dea409b66dcc6d8e6689bb7357f3.jpg" style=""></p><p></p><p>Конечно, не существует формата тайм-менеджмента, который подошел бы всем, и вполне вероятно, что данный способ не подойдет именно Вам. Моей задачей было показать\nпуть, а не дать Вам готовый механизм. Старайтесь сделать повседневность ярче.</p><p></p>', '0'),
(1273, 107, 343, '<p>\n</p><p>До 30 лет организм (и окружающие)\nактивно пытаются привить тебе свое видение, чего тебе надо делать в жизни и\nкак. Из-за этого люди сбиваются с пути, теряют себя и страдают. Скажете, это не\nтак?</p>\n<p>Подумайте, ведь для многих делать то, что им хочется –\nнепосильная задача. Вот человек с детства рисовал картины… А потом родители\nдобились-таки того, что он пошел учиться на менеджмент. И что? Промучил себя\nнесколько лет, а потом ведь исплевался и бросил это дело. А бросить не так\nпросто, когда тебе 25: надо что-то зарабатывать. И получается, что плывем мы по\nтечению, и в нашей жизни все так: работа, друзья такие же… Знакомо?</p><p>Тут скажу банальную вещь – каждый человек делает выбор сам.\nНе один раз в жизни и не два. Жизнь дает ему много шансов. Открою секрет: как\nтолько человек начинает слушать себя и поступать в соответствии со своими\nжеланиями, ненужные люди и ненужные дела из его жизни уходят сами.&nbsp;</p><p>Главное –\nпонимать, что желания даны, чтобы <i>развивать\n</i>человека, а не реализоваться именно в той форме, в какой они появились.\nКогда приходит это понимание, исчезает страх следовать своему настоящему пути.</p><p>Каждый из знает лучше, чем кто-либо другой, что для него\nправильно.</p><p></p>', '0'),
(1274, 113, 322, '<p>Детям не обязательно знать нюансы и различия между коммерческой и некоммерческой деятельностью, поэтому с ними я разговариваю о том, что они видят. Если они видят организованное событие, то я организатор, если видят, как я читаю лекцию - учитель.&nbsp;</p>', '0'),
(1275, 113, 323, '<p>Наибольшее удовольствие получаешь, когда придумываешь, разрабатываешь и запускаешь проект. Творческий процесс - это прекрасно. Результат тоже приносит удивительные эмоции, но другого рода. Все поначалу приглядываются, а затем начинают жить, зная, что проект существует, начинают считаться с ним, использовать идеи, понятия, слова, которые ты составлял в предложения, закладывал в концепцию сайта, образовательной программы, фестиваля.&nbsp;</p>', '0'),
(1276, 113, 324, '<p>Занимаясь музыкой в Санкт-Петербурге, лет через 5-10 я понял, что коммерческих целей ставить практически невозможно, жить по понятиям монетарной системы сложнее, чем без них. Пришлось переучиваться, перестать верить в экономику, осваивать культурологию, регистрировать некоммерческую организацию.</p>', '0'),
(1277, 113, 325, '<p>В России так мало достойных людей занимается социальным предпринимательством. Если кто-то и делает что-то некоммерческое, то это, в основном, благотворительность. Бездомные собаки, больные дети - все это важно и интересно, но не вдохновляет лично меня на созидательную деятельность. А из коммерческих предпринимателей... Раньше я думал, что Павел Дуров создал ВКонтакте по зову сердца ради изменения социокультурной ситуации в Санкт-Петербурге и русскоязычном мире в целом, следил за всеми его действиями, развитием идей.&nbsp;</p>', '0'),
(1278, 113, 326, '<p>Долго не решался зарегистрировать некоммерческую организацию, работали подпольно, в социальных сетях. Курсы, серии событий, сообщества, музыкальные СМИ... В 2014 году побороли все страхи, теперь вот осваиваемся в правовом поле, постепенно легализуемся.</p>', '0'),
(1279, 113, 327, '<p>Россия с ее переходной экономикой еще не прошла все этапы коммерциализации, не говоря о развитом "третьем секторе" (некоммерческом). Было бы гораздо удобнее, конечно, если бы у нас в стране уже была устоявшаяся культура меценатства, волонтерства, попечительства и вообще желание ставить некоммерческие цели и достигать.&nbsp;</p>', '0'),
(1280, 113, 328, '<p>Со стороны кто-то про мою деятельность, возможно, говорит, что она неудачная, какие-то проекты провальные, но если я не могу ничего такого вспомнить, значит этого не было. Из всех проектов стараюсь извлечь все, что они могут дать, ни один из них не закрыт окончательно, они часть меня и всегда могут переродиться. Вне зависимости от того, оценил я их как успешные или нет.</p>', '0'),
(1281, 113, 329, '<p>Все результаты приятно вспоминать, как и процессы, которые им предшествовали. Приятно. когда люди продолжают жить и творить, не сворачивают с пути, находят себя, и во всем это есть твоя заслуга. Например, мы занимаемся развитием музыкальных проектов, артистов и коллективов. Если музыкальный проект не разваливается, выпускает все новые и новые синглы, альбомы, и продолжает сотрудничать с нами - это замечательно.&nbsp;</p>', '0'),
(1282, 113, 330, '<p>Когда ты культуролог, ты поневоле анализируешь все субкультуры, ценности, которые тебя окружают. Смотрю, к примеру, юмористическую передачу или даже спорт, думаю о том, ради чего люди занимаются этими видами деятельности, что их объединяет, оцениваю какие-то тенденции, думаю о субкультурах юмора и спорта в России. Не знаю, можно ли это считать профессиональной привычкой. Наверняка любой думающий человек делает то же самое</p>', '0'),
(1283, 113, 331, '<p>Создать что-то типа Википедии</p>', '0'),
(1284, 113, 332, '<p>Будущее зависит от того, как и в каком виде мир, наша страна и наш город смогут преодолеть затянувшийся кризис культуры. Прямо сейчас некоммерческая деятельность крайне необходима, потому что коммерческая не решает социокультурных задач, а государство и муниципальные власти должны иметь надежных партнеров&nbsp;</p>', '0'),
(1285, 113, 333, '<p>Стереотипов, кстати, никаких нет. Как и представления о том, чем мы можем заниматься в нашем фонде. Но это у среднестатистических людей. У представителей некоммерческой сферы все адекватно, все все понимают.</p>', '0'),
(1289, 114, 343, '<p></p>\n<p><span style="line-height: 1.45em; background-color: initial;">Умение вести переговоры, убеждать и продавать - это\nкомпетенции, которые определяют успех начинающего коммерсанта и делают его со\nвременем руководителем отдела.</span><br></p>\n<p>Процесс продажи делится на семь этапов, каждый из которых\nтребует отдельного внимания:</p>\n<p>1.&nbsp;\nПодготовка.</p>\n\n<p></p><ul><li><span style="line-height: 1.45em; background-color: initial;">Определение цели</span><br></li><li><span style="line-height: 1.45em; background-color: initial;">Подготовка тем для обсуждения и презентационных\nматериалов</span><br></li><li><span style="line-height: 1.45em; background-color: initial;">Выбор нужных ключевых сообщений и необходимых\nресурсов</span></li><li><span style="line-height: 1.45em; background-color: initial;">Предвидение возможных возражений и подготовка\nзапасного плана действий</span></li></ul><p></p>\n\n<p>2.&nbsp;\nУстановление контакта</p>\n\n<p></p><ul><li><span style="line-height: 1.45em; background-color: initial;">Создание первого впечатления – самое важное</span><br></li><li><span style="line-height: 1.45em; background-color: initial;">Формулировка цели сотрудничества и встречи,\nдемонстрация выгоды для партнера или клиентов</span><br></li><li><span style="line-height: 1.45em; background-color: initial;">Создание сердечной и дружественной атмосферы,\nчтобы вести дискуссию с партнером в открытой манере</span><br></li></ul><p></p>\n\n\n\n\n\n<p>3.&nbsp;\nВыявление и подтверждение потребностей</p>\n\n<p></p><ul><li><span style="line-height: 1.45em; background-color: initial;">Определение потребностей путем задавания\nвопросов</span><br></li><li><span style="line-height: 1.45em; background-color: initial;">Наблюдение за настроением партнера, подстройка\nповедения</span><br></li><li><span style="line-height: 1.45em; background-color: initial;">Определение возможных возражений</span><br></li></ul><p></p>\n\n\n\n\n\n<p>4.&nbsp;\nПрезентация</p>\n\n<p></p><ul><li><span style="line-height: 1.45em; background-color: initial;">Своевременная демонстрация предложения – от общего\nк конкретному</span><br></li><li><span style="line-height: 1.45em; background-color: initial;">Демонстрация преимущества нашего предложения для\nпартнера</span><br></li><li><span style="line-height: 1.45em; background-color: initial;">Построение аргументации таким образом, чтобы\nизбежать возможных возражений</span><br></li><li><span style="line-height: 1.45em; background-color: initial;">Убедительное использование экономических\nпоказателей</span><br></li></ul><p></p>\n\n\n\n\n\n\n\n<p>5.&nbsp;\nВыяснение отношения к предложению</p>\n\n<p></p><ul><li><span style="line-height: 1.45em; background-color: initial;">Удостовериться, что партнер правильно понял предложение</span><br></li><li><span style="line-height: 1.45em; background-color: initial;">Признание того, что партнер может иметь и свое\nмнение, возражения и сомнения</span><br></li><li><span style="line-height: 1.45em; background-color: initial;">Изменение точки зрения – работа с возражениями</span><br></li></ul><p></p>\n\n\n\n\n\n<p>6.&nbsp;\nЗавершение встречи</p>\n\n<p></p><ul><li><span style="line-height: 1.45em; background-color: initial;">Получение измеримых обязательств (где, когда, с\nкем)</span><br></li><li><span style="line-height: 1.45em; background-color: initial;">Достижение соглашения о целях на следующий визит\nи формирование ожидания партнера от дальнейшего сотрудничества</span><br></li><li><span style="line-height: 1.45em; background-color: initial;">Согласование времени следующей встречи</span><br></li></ul><p></p>\n\n\n\n\n\n<p>7.&nbsp;\nАнализ и развитие клиента</p>\n\n<p></p><ul><li><span style="line-height: 1.45em; background-color: initial;">Контроль соответствия данных о партнере,\nдополнение и уточнение</span><br></li><li><span style="line-height: 1.45em; background-color: initial;">Анализ деятельности конкурентов</span><br></li><li><span style="line-height: 1.45em; background-color: initial;">Определение целей на следующий визит</span></li></ul><span style="line-height: 1.45em; background-color: initial;">Таким образом, чем качественнее вы спланируете свою работу с клиентом, тем более результат будет соответствовать поставленным вами целям и задачам. Подробнее о правилах поведения на этапах продажи я расскажу в следующих постах.</span><br><p></p>\n\n\n\n\n\n<p></p>', '0');
INSERT INTO `post_answer` (`id`, `post_id`, `question_id`, `answer`, `lego`) VALUES
(1305, 115, 322, '<p></p><p>Никак. Я с трудом это могу\nобъяснить своим двадцатилетним студентам. Это настолько сложная профессия, что\nони хоть что-то начинают понимать к 4-5 курсу. Если бы ко мне подошел мой внук,\nи спросил, чем я занимаюсь, я бы ответила коротко: «Руковожу хором».</p><br><p></p>', '0'),
(1306, 115, 323, '<p></p><p>Удовлетворение получаешь, когда есть тот результат, который был &nbsp;задуман. Когда удается «зажечь» своих\nисполнителей, и &nbsp;происходит то, что\nназывается «проживанием музыки» на сцене. К сожалению, это бывает не часто. Но\nкогда все состоялось&nbsp; - это самое\nвдохновляющее. Наверное, как в любой творческой профессии.&nbsp;</p><br><p></p>', '0'),
(1307, 115, 324, '<p></p><p>Я училась в музыкальном училище на музыкально-теоритическом отделении,\nна хоровое меня привел случай.&nbsp; Возможно\nсыграло роль то, что моя мама была профессиональный хоровик. Но это все-таки\nбыл случай, который с годами подтвердил , что с выбором профессии я попала «в\nдесятку». Мой более чем 40-летний опыт работы в этой профессии говорит о том,\nчто выбрать эту специальность осознанно в юности не возможно. Этой\nспециальности начинают учить в 15 лет, но это скорее обучение механическим\nдвижениям, а истинное понимание приходит позже с опытом.</p><br><p></p>', '0'),
(1308, 115, 325, '<p></p><p>Это - прежде всего моя мама, которая занималась этим всю жизнь, и\nвдохновляла меня своим отношением к профессии. Моим учителем был замечательный хоровой\nдирижер Юрлов Александр Александрович, художественный руководитель\nРеспубликанской русской хоровой капеллы, Минин Владимир Николаевич – дирижер,\nхормейстер, народный артист СССР. И еще, конечно, Владимир Локтев – создатель и\nруководитель детского ансамбля песни и танца на Ленинских горах. Это люди не\nтолько профессионалы в своей области, а &nbsp;это\nлюди, которые служили своему делу. Есть большая разница между «служить» и «работать».\nРаботать – это быть хорошим ремесленником и можно быть помощником режиссера или\nхормейстером, а дирижером или исполнителем может быть только человек истово\nлюбящий и бескорыстно служащий своему делу.</p><br><p></p>', '0'),
(1309, 115, 326, '<p></p><p>Переход в музыкальном\nучилище с музыковедческого отделения на дирижерско-исполнительское, поступление\n&nbsp;в\nинститут им. Гнесиных в Москве, где я в течение 5 лет училась &nbsp;у Юрлова А.А. и 1.5 года в аспирантуре у\nМинина В.Н. Затем решение о переезде из Москвы для работы в Уральской\nконсерватории. Организация камерного хора и межрегионального хорового союза,\nкогда я попробовала свои силы не только как педагог, художественный руководитель\nхора, но и как организатор конкурсов, фестивалей, праздников песен.&nbsp;</p><br><p></p>', '0'),
(1310, 115, 327, '<p></p><p>Собраться и сосредоточиться перед концертом, отрешиться от всех\nповседневных мыслей и неприятностей, и передать свою позитивную и творческую энергию исполнителям.&nbsp;</p><br><p></p>', '0'),
(1311, 115, 328, '<p></p><p>Такого не было в моей жизни, чтобы я вышла с концерта и сказала, что\nвсе удалось.</p><br><p></p>', '0'),
(1312, 115, 329, '<p></p><p>Конечно, отдельные концерты, когда максимально получилось, как\nзадумано. Например, концерт, когда мы вместе с приглашенными солистами из\nФранции исполняли Рождественскую ораторию Баха. На французов произвело сильное впечатление\nзвучание хора, как в музыкальном, так и в фонетическом исполнении на немецком\nязыке. </p>\n\n<p>Еще вспоминаю День Конституции, когда пел тысячный хор под проливным\nдождем. Слушатели и исполнители стояли под зонтами, и при этом все были очень\nсчастливы.&nbsp;</p><br><p></p>', '0'),
(1313, 115, 330, '<p></p><p>Командовать, умение брать на себя ответственность, принимать решения, &nbsp;потому что дирижер должен обладать очень\nсильной волей. В обычной жизни женщинам – дирижерам это часто мешает, потому\nчто, с одной стороны, хочется, что за тебя решали, а с другой стороны, не получается\nосвободиться от своей &nbsp;профессиональной\nпривычки руководить.&nbsp;</p><br><p></p>', '0'),
(1314, 115, 331, '<p></p><p>В нашей профессии есть такое понятие «воля к звуку», потому что если у тебя\nсвободные руки, пластичные, но они просто живут сами по себе и не выражают сути\nмузыкального сочинения, то они не могут заставить исполнителя сделать то, что\nнужно, и результата не будет.&nbsp;</p><br><p></p>', '0'),
(1315, 115, 332, '<p></p><p>На сегодня еще вижу будущее своей профессии, но что будет завтра, не\nзнаю. Вселяет оптимизм, что появляются молодые люди, которые осознанно выбирают\nэту профессию, и приезжают учиться из маленьких городов. Кроме того, для России\n(именно для России) жанр хорового пения находится в генетической памяти народа,\nтак как до 18 века не было других жанров, кроме &nbsp;хорового пения. Хор для России всегда был\nсоборным началом, это было бытовое и пение в церкви. Хоровое пение помогало в\nвоенное время. В годы Великой Отечественно войны в 1942 году на Урал\nвагонозаводе был создан хор. Репертуар состоял в основном из народной или\nпатриотической песни, и это людей мобилизовало, потому что в народной песне\nвсегда присутствует любовь к родной земле. &nbsp;Сейчас\nесть государственная программа по возрождению хорового пения в России, но пока\nне понятно, даст ли она результат.&nbsp;</p><br><p></p>', '0'),
(1316, 115, 333, '<p></p><p>Люди не считают это работой. И это началось после революции. У нас был\nпреподаватель, который закончил синоидальное училище в Москве рассказывал, что\nв русской деревне певец хора деревенской церкви был уважаемым человеком на селе\n.</p><br><p></p>', '0'),
(1317, 115, 335, '<p></p><p>Гимнастика Стрельниковой помогает не только певцам, но и всем людям для\nлечения многих заболеваний и просто для тонуса и хорошего настроения.</p><br><p></p>', '0'),
(1318, 115, 337, '<p></p><p>Кроме постоянного расширения профессиональных знаний, &nbsp;нужно много читать художественной литературы,\nдля того, чтобы пополнить свой жизненный опыт. Для молодого человека, у\nкоторого собственный жизненный багаж еще не велик, это необходимо. &nbsp;Очень полезно читать литературу по режиссуре, особенно\nмемуары великих режиссеров, потому что у профессии &nbsp;режиссера и дирижера много общего. Полезно разбираться\nв живописи, знать иностранные языки. И конечно, слушать много музыки. &nbsp;</p><br><p></p>', '0'),
(1319, 115, 339, '<p>Профессия дирижера хора – это очень сложный «замес» разных составляющих, одна из сложнейших специальностей в музыкальном исполнительстве, которая предполагает наличие высокого интеллекта, волевого характера, обширных знаний в разных областях, &nbsp;владение своим телом, чтобы рукой можно было выразить свое восприятие и толкование музыкального произведения. Кроме того, дирижер должен обладать сильной харизмой, чтобы от него шел поток энергии, который должен увлекать исполнителей.<br></p>', '0'),
(1371, 116, 322, '<p>Все &nbsp;в музей ходят отдыхать, а я работать.</p>', '0'),
(1372, 116, 323, '<p>До начала работы я не была особенным любителем музеев и ходила любоваться искусством нечасто. Но когда я начала работать в &nbsp;музее, то поняла, что искусство не может не затрагивать человека. Но восприятие искусства требует времени, контакта. Невозможно действительно чем-то проникнуться среди толп туристов в шуме и суматохе. Поэтому особенно меня привлекает возможность любоваться красотой вблизи и в спокойной обстановке. Искусство стало для меня гораздо более личным.</p><p><br></p>', '0'),
(1373, 116, 324, '<p>Я никогда, даже в самых смелых мечтах не думала работать в известном музее и сфере искусства. Потому что раньше мои профессии не были связаны с культурой. Я работала в туризме, потом в ай-ти. Но всегда была творческим человеком, и в свободное время начала делать что-то руками - шить, вышивать. Со временем я поняла, что надо двигаться дальше, и пошла учиться рисовать. &nbsp;Оказалось, что мой разноплановый набор умений и знаний сложился в джек-пот и мне предложили работу прямо созданную для меня! Я умею что-то делать руками, рисую, фотографирую, хорошо владею ПК, знаю английский, у меня большой опыт офисной работы... Все это я использую в работе лаборантом, где много работаю с документацией. Но в тоже время у меня есть перспективы развиваться дальше, так как работа реставратора требует терпения и умения работать руками. &nbsp;Не у каждого есть к этому задатки и склонности, кому то это дано, а кому-то нет. Моя прошлая работа - тестировщиком программ, требовала от меня большого сосредоточения, и сейчас эти умения мне очень помогают, потому что и на новой работе мне нужно большое внимание и усидчивость.</p>', '0'),
(1374, 116, 325, '<p>До начала работы у меня не было знаний о реставрации, я с этим не сталкивалась. Но теперь я восхищаюсь профессионалами в реставрации. Это тяжелый и трудоемкий труд. Как говорится "ювелирная работа", где любая ошибка может стать роковой. Такая работа требует огромного терпения, сосредоточенности. И люди, которые стали мастерами высшего порядка и делают особенно сложную работу, вызывают во мне огромное восхищение.</p>', '0'),
(1375, 116, 327, '<p>Моя работа лаборантом при реставраторах требует аккуратности, ответственности и внимания. В ней нет мелочей. &nbsp;Нельзя перепутать цифры или про что-то забыть. Или вовремя чего-то не сделать. Я записываю каждую мелочь. Практически, это как работа бухгалтера, требует такой же усидчивости. Лаборант - по сути секретарь, &nbsp;друг для всех, кто работает, организатор удобной жизни коллектива. &nbsp;Мне важно всегда быть приветливой, вовремя и четко передавать информацию. По природе своей я интроверт, но на работе я стараюсь быть более открытой, общительной, создавать у людей хорошее настроение.</p>', '0'),
(1376, 116, 328, '<p>Тьфу-тьфу, чтобы не сглазить, пока у меня не было жутких косяков. Бывают сложные и напряженные моменты, но я стараюсь их предусмотреть и обратиться за помощью к более знающим людям вовремя, а не когда возникла проблема.</p>', '0'),
(1377, 116, 329, '<p>У меня пока нет личных достижений, которые можно показать "я это сделала". В основном моя работа - облегчать жизнь других, быть на подхвате. Но когда завершаются проекты и я вижу их результат, то понимаю, что в этом есть и мой вклад.</p>', '0'),
(1378, 116, 330, '<p>Работа сделала меня более собранным человеком, чем я есть от природы. Поэтому и дома я стала аккуратнее, лучше планирую дела и время. &nbsp;Я стала гораздо увереннее в себе как личность, приобрела стиль, что называется. Стала больше интересоваться культурой. От работника музея ожидают определенного уровня, и необходимо ему соответствовать и образованностью и внешне. Нельзя работать в музее и ляпать какую-нибудь культурную безграмотность.</p>', '0'),
(1379, 116, 331, '<p>Мне сложно судить, что такое быть настоящим реставратором, ведь я пока только наблюдатель. Но мне кажется, это прежде всего быть сосредоточенным, увлеченным. Не творчески увлеченным, а увлеченным ремесленником. Ведь в реставрацию нельзя привносить "отсебятины". Ты должен идти за мастером, создавшим это произведение, чувствовать его руку, и &nbsp;только повторять его движения.</p>', '0'),
(1380, 116, 332, '<p>К счастью, реставрация была, есть и будет. Она не зависит от моды или увлечений. Эта стабильность меня очень радует!</p>', '0'),
(1381, 116, 333, '<p>Мне кажется люди очень мало знают о профессии реставратора, это работа невидимая глазу. Люди видят только отреставрированные вещи на витринах, но не задумываются, почему они так хорошо выглядят. Если работа реставратора видна - значит она не очень хорошо сделана.=)</p>', '0'),
(1382, 116, 334, '<p>У нас нет особых тематических шуток, вообще я бы не сказала, что реставраторы - шутники. Шутит у нас только молодежь, но как все люди шутят.</p>', '0'),
(1383, 116, 335, '<p>Люди недооценивают силу примитивных чистящих средств. Например, обычная стирательная резинка отлично чистит кожу без всяких химчисток.</p><p>Бумажные книги ни в коем случае нельзя чинить скотчем. Скотч въедается и оставляет масляные пятна. Лучше взять какой-то нейтральный клей и подклеить аккуратно бумагой.</p><p>Бумагу, например, рисунок акварелью легко разгладить если слегка спрыснуть водой и положить под некий пресс.</p><p><br></p>', '0'),
(1384, 116, 336, '<p>Мне кажется, важно не слушать советчиков и прислушаться к себе. В юности мы не знаем, что на самом деле хотим. Идем не по своей стезе, теряем время, потом очень сложно переучиваться. А ведь можно всю жизнь глубоко копать в одном направлении, если дело по душе!</p>', '0'),
(1385, 116, 337, '<p>По реставрации нет ни книг, ни курсов. Есть профильные училища, но все равно на практике много своих особенностей. Эта профессия передается как в средневековье &nbsp;- от мастера к подмастерью.</p>', '0'),
(1386, 116, 338, '<p>Меня часто просят рассказать "как там у нас в кулуарах". Но я молчу, потому что не хочу выносить сор из избы. На любой работе лучше все оставлять на работе, а в нашем деле - особенно. =)&nbsp;</p>', '0'),
(1387, 116, 339, '<p>Не каждому дано стать великим художником, но не менее достойно стать очень хорошим ремесленником. Реставрация - это ремесло, но когда она достигает высокого уровня, то становится наравне с искусством. Реставраторы - доктора для произведений, они позволяют сохранить прекрасное для будущих поколений.</p>', '0'),
(1388, 49, 325, '<p></p><p>Я благодарен многим людям, с которым мне посчастливилось сотрудничать. Главные знания в своем ремесле я получал не из книг, а от живых людей и из собственного опыта.</p><p>«Жадность порождает бедность» - любил повторять мой первый руководитель, Александр Михайлович Щетров. Простая звучная фраза - &nbsp;сама по себе - она полезный ключ к успешному трейдингу.</p><br><p></p>', '0'),
(1389, 49, 328, '<p></p><p>В какой-то момент я пришел к иллюзии, что все знаю и являюсь сильным профессионалом.&nbsp;</p><p>Потом&nbsp; я потерпел большую неудачу. Это было в августе 2011 года. Понижение рейтинга США, драматичное падение индексов.&nbsp;</p><p>Первая половина года до этого события была успешной, что, видимо, меня расслабило. Так или иначе, к дикому росту опционной волатильности я подошел с проданной "книжкой" по опционам. Говоря образно и простым языком, я &nbsp;распродал кучу страховых полисов от стихийного бедствия жителям прибрежного города, а теперь смотрел как на этот город идет цунами, сметающее все на своем пути. Не очень удачная сделка.</p><p>Та ситуация была настолько сильным ударом по моему эго, что даже повредила моему физическому здоровью, но в итоге она сделала меня сильнее.&nbsp;</p><p>Я осознал то, что произошло, сделал выводы, и начался новый этап моего профессионального роста. &nbsp;Говорят, подобный путь проходят многие. &nbsp;</p><br><p></p>', '0'),
(1390, 49, 330, '<p></p><p>В менеджементе существует правило десяти тысяч часов: если ты занимаешься чем-то 10 000 часов, то натренировываешь свою нейронную сеть между двух ушей и, может быть, начинаешь что-то в этом деле понимать. За это время не могут не появиться определенные профессиональные привычки или наблюдения. Например, такое:</p><blockquote>Многие процессы в жизни, если изобразить их графически, похожи на динамику котировок. &nbsp;</blockquote><p>У этих процессов также есть «уровни поддержки», «сопротивления» и прочее. Конечно, причинно-следственная связь состоит в том, что рынок похож на все остальное, а не все остальное похоже на рынок. Но это интересная игра. Вы можете как бы понимать, когда что-то "дорого", а когда "дешево".</p><p>Возьмите, например, график температуры воздуха по временам года. Из него бы вышел отличный торговый инструмент. В нем есть спады, подъемы, закономерности, исторические рекорды. Вы можете попытаться просчитать, когда начнется оттепель или заморозки, а можете просто одеваться по погоде. Это похоже на то, как создаются торговые стратегии. Стратегии действия по ситуации.&nbsp;</p><p>Трейдеры часто говорят, что «тени свечей проторговываются». Так говорят, когда происходит шальная сделка по нерыночной, казалось бы, случайной и глупой цене. Однако, впоследствии цена действительно часто направляется к данному значению. Как будто кто-то на миг указывает внимательным наблюдателям направление будущего движения. Это похоже на отношения между людьми.&nbsp;</p><blockquote>Если вы на секунду потеряли доверие к кому-то или чему-то, и у вас промелькнула лишь тень сомнения, вероятно, это интуиция вас предупредила, и когда-нибудь ваши опасения подтвердятся.</blockquote><p>Еще один пример того, как жизненные ситуации могут интерпретироваться на трейдерском языке. Знающие люди говорят, что существование любой новости в интернете часто имеет график «с двумя вершинами». &nbsp;Что это означает? Сначала интерес к событию растет, и в какой-то момент интерес достигает максимума. Потом следует небольшой спад - насыщение, за которым случается вторая волна интереса, однако, уже меньшая, чем первая. Далее интерес людей к событию начинает угасать и постепенно сходит на нет. Вчерашние новости никому не интересны! Так устроено современное информационное общество. Нужны горячие новости. График окончания растущего тренда, когда после достигнутого максимума вторая вершина меньше, чем первая, хорошо знаком всем трейдерам. Любой раздутый пузырь, в том числе информационный, хочется «зашортить» - «сыграть на понижение». Важно уметь отличать то, что действительно имеет смысл для тебя, справедливую долгосрочную ценность &nbsp;предмета, события от того, что тебе&nbsp; пытаются навязать и вложить в уши.</p><blockquote>В целом, что на рынке, что в жизни, я люблю контрендовые стратегии.&nbsp;</blockquote><p>Например, ездить "против потока" - &nbsp;когда все едут в город, ехать свободно за город. Это же так очевидно и естественно. Покупать когда дешево, продавать когда дорого.</p><br><p></p>', '0'),
(1391, 49, 331, '<p>Есть такое выражение, что управление активами - это бизнес, где большую часть времени надо ничего не делать. Это правда. Парадокс при этом состоит в том, что управление активами &nbsp;– ежедневный, тяжелый и нервный труд. Решения, принимаемые в оставшуюся, малую &nbsp;часть времени, требуют ответственности и осознания собственных действий. Если мы говорим об институциональных портфельных инвестициях, то большую часть времени вы сидите в укрытии и наблюдаете, анализируете, дожидаясь удачного времени для своевременного точного действия. Спокойно ждать, сохраняя ясность ума во всеобщей панике или эйфории, принимать свои ошибки и учиться исправлять их - это большая работа над своим эго.&nbsp;<br></p>', '0'),
(1392, 49, 333, '<p></p><p>Часто знакомые спрашивают меня: что будет с валютой, куда инвестировать. Мол, "ты же финансист". Я бы соврал, если бы сказал, что я в курсе. А если бы и знал, то не сказал. Все-таки моя работа - оперативно действовать по ситуации, а не предсказывать каждому его будущее.</p><blockquote>Часто клиенты не понимают рисков и имеют завышенные ожидания. Они думают, что фондовый рынок это магическая коробка. Я чувствую себя спокойнее, когда сообщаю им правду.</blockquote><p>Существует огромное число, казалось бы образованных и умных людей, которые верят в сказки и ждут от фондовых рынков аттракциона чуда: "хотелось бы удвоить счет за год". Или "терять не согласен нисколько, но хочу заказать 50% годовых с гарантией". Так не бывает.&nbsp;</p><p>Гарантированно зарабатывать на рынке можно двумя способами: если вы инсайдер или если вы один из организаторов инфраструктуры торгов. Если вы третье - то двам предстоит много трудиться и еще вам должно повезти. Хорошая новость в том, что обычно везет тем, кто трудится.</p><blockquote>В долгосрочной перспективе рынок может делать богатых еще богаче, богатых – беднее, но вряд ли бедных - богатыми.</blockquote><br><p></p>', '0'),
(1393, 49, 336, '<p>Никогда, слышишь, <i>никогда </i>&nbsp;не жалей о незаработанном. Рынок будет всегда. Он всегда даст возможность получить &nbsp;то, что ты заслужил. &nbsp;</p><p><br></p><p>Если ловишь "падающий нож", закладывай риск 100%. &nbsp;</p><p><br></p><p>То, что уже дорого имеет свойство становится еще дороже. То, что дешево имеет свойство становиться еще дешевле.</p>', '0'),
(1394, 49, 339, '<p></p><ul><li>Управляющие по облигациям обычно все такие основательные, спокойные и упитанные. Управляющие по опционам – нервные и дерганые. С годами мне все больше и больше нравится увеличивать долю облигаций в портфеле.</li><li>В разные периоды жизни я мечтал стать летчиком,&nbsp; математиком, музыкантом – видимо, я нашел нечто, одновременно похожее на все эти занятия.&nbsp;</li></ul><br><p></p>', '0'),
(1398, 119, 322, '<p>Малыш!Ты когда -нибудь рассказывал стишок деду Морозу? Или любишь показывать разных животных(котов,собак,ежика)? А ты любишь выскочить из угла шкафа в маске страшилы и громко испугать бабушку или деду?..Тогда это тебе ко мне нужно ходить на занятия) Мы будем сначала просто играть, потом учить стихи, а потом играть на сцене любые роли, кого захочешь...!И нам будет хлопать весь зал!!</p>', '0'),
(1399, 119, 323, '<p>Премьера!...Ее ждешь, к ней готовишься, переживаешь...а потом ..это происходит..и ты сразу понимаешь , угадал с произведением, с актерскими ролями, с мизансценой, с музыкой, с финалом!)..И цветы, цветы, цветы...</p>', '0'),
(1400, 119, 324, '<p>Поняла еще в младшем школьном возрасте-люблю творить, люблю детей и атмосферу праздника! Моя работа-праздник!</p>', '0'),
(1401, 119, 325, '<p>Моя мамочка положила начало театральной студии в школе, и заразила меня творчеством.</p><p>Моя крестная , которая работала в Психиатрической больнице им.Кащенко режиссером с больными людьми, и вскоре у них наблюдалась положительная динамика!</p><p>И , конечно, мой педагог-режиссер Славина Татьяна Михайловна, человек преданный делу и слову, благодаря ей я "заболела"театром на всю жизнь!Она помогала видеть-невидимое, слышать-неслышимое, и понять!</p>', '0'),
(1402, 119, 326, '<p>Одним из первых, закончить ЛОККиИ, на театральном отделении, и "влиться" в коллектив ,и получить любовь , признание и уважение от студийцев.</p>', '0'),
(1403, 119, 327, '<p>Самое трудное-начать постановку. Определиться с репертуаром, актерами, стилем спектакля, костюмами</p>', '0'),
(1404, 119, 329, '<p>В 2014 году Грандиозный успех со спектаклем "Маленький принц"</p><p>Гран-При на Всероссийском фестивале "За кулисами Петербурга"</p><p>1 место в районе, в области, 1 Место на Международном фестивале в г.Сочи</p>', '0'),
(1405, 119, 330, '<p>Часто организую конкурсы, игры для своих друзей в Дни рождения и в другие праздники.И, конечно, ребенок получает от меня заряд творческих идей , даже с погремушками)</p>', '0'),
(1406, 119, 331, '<p>Быть очень талантливым режиссером и уверенным организатором&nbsp;</p>', '0'),
(1407, 119, 332, '<p>Только все выше и выше!!!..Вперед и к звездам)</p>', '0'),
(1408, 119, 335, '<p>Научитесь пользоваться гримом!Это порадует вас и ваших деток.Он безопасный, и не нанесёт вред коже. Экспериментируйте )&nbsp;</p>', '0'),
(1409, 119, 336, '<p>Ты у себя одна! Поужинай вовремя, не растягивай репетицию</p>', '0'),
(1410, 119, 337, '<p>К.С.Станиславский"Моя жизнь в искусстве"&nbsp;</p>', '0'),
(1411, 119, 338, '<p>Один раз мы поехали выступать в Спб на фестиваль, и по приезду туда обнаружили, что забыли верхние костюмы всех героев...Шок был у всех...на сцену выходить через 30 мин...и тут в голову пришла гениальная идея!!В соседнем магазине я купила мешки для мусора!и мы сделали всем кофты) И спектакль был про бездомных животных"Фу", все прошло на -Ура!...никто про это даже не догадался, что это была спонтанная идея!</p>', '0'),
(1412, 119, 339, '<p>Я считаю своё дело, очень нужным и полезным...да, мы не гонимся за технологиями, да мы не разбираемся в курсах валют, и прочих кардиограммах, но зато..мы открываем с ребятами , такое новое, и такое вечное-человеческую душа-...а это бездонное море, из которого уже не выйдешь!</p>', '0'),
(1416, 120, 346, '<p>В государство - The UK (Великобританию), но страна Шотландия. Что очень-очень важно.... &nbsp;ибо упаси вас Бог назвать шотландца англичанином, а килт юбкой. Этого тут не прощают.</p><p>Уехала учиться. &nbsp;Учу право, тоже, к слову, очень специфическое, ибо Шотландия - это место смешения традиционного общего права и элементов еще кельтского (хотя так его тоже никто не называет) статутного.&nbsp;</p>', '1'),
(1417, 120, 347, '<p>Прилетела я в четверг, и уже в пятницу вечером меня настиг первый культурный шок.....дело в том, что на неделе они не отдыхают, в рестораны и в бары не ходят.... но в пятницу - &nbsp;святое дело. Отечественный вечер пятницы в разы проигрывает местному аналогу. И не то чтобы виною этого были студенты. Вовсе нет, это чисто шотландский колорит.</p>', '1'),
(1418, 120, 348, '<p>Переучиваться это слабо сказано: чтобы быть тут юристом - тут надо учиться. И пусть краткость курса (3 года бакалавриат + 1 год Магистратуры) не вводят в заблуждение. Метод познания общего права только один - читать огромное количество практики. Приехать и начать практиковать без учебы могут разве что специалисты международного частного права. Остальным - на учебу, причем строго по профилю - &nbsp;если недвижимость - то LLM должна быть именно на ней (а земля - это вообще иная категория!) &nbsp;</p><p>Но юристов тут уважают - даже в этом нефтезависимом городке - их больше, чем представителей любой другой профессии. Что очень лестно.</p>', '1'),
(1474, 121, 349, '<p>Проект, которым я сейчас руковожу, занимается изготовлением функциональных протезов - изделий, которые помогают людям с травмами кисти восстановить способность использовать такие обычные предметы как кружка, бутылка, ложка и многие другие.&nbsp;</p><p><img src="/web//upload/images/80ff299628c99decfa099a3c5e67f831.jpg" style=""></p><p></p><p>Мы стараемся вернуть человеку независимость в своем быту и максимально снять физические ограничения, возникающие вследствие частичной или полной потери кисти.</p>', '1'),
(1475, 121, 350, '<p>Большинство протезов которые мы делаем - уникальны. Они проектируются специально под каждого пользователя с учетом характера его травмы. И чем сложнее и безнадежнее для текущих технологий протезирования травма, тем больше наше желание помочь человеку. Часть рабочего времени над проектом я сам занимаюсь проектировкой и разработкой протеза и наибольшее удовольствие приносит понимание того, что твой труд сделает кого-то счастливее. А настоящее удовлетворение работой получаешь, когда пользователь одевает протез и начинает его использовать, пытаясь, поначалу чуть неуклюже, что-то взять или удержать.</p><iframe width="420" height="315" src="//www.youtube.com/embed/E2W2leA-cwc" frameborder="0" allowfullscreen=""></iframe><p><br></p>', '1'),
(1476, 121, 351, '<p>Я по образованию робототехник. И с момента поступления в ВУЗ я знал, что не буду работать в сфере продаж или услуг. Меня всегда привлекала механика, техника и то как ее развитие влияет на человека и его быт. Начинал свою профессиональную деятельность как и положено любому инженеру - на машиностроительном заводе, где занимался разработкой достаточно крупных комплексов для автоматизации производств. После окончания университета пришло понимание одной простой истины: если что-то вокруг тебя не устраивает - измени это. А реально что-то изменить&nbsp;можно только если ты сам устанавливаешь правила и руководишь процессом. Так я пришел к созданию своей собственной компании - <a href="http://www.weas-robotics.ru">W.E.A.S. Robotics</a>, которая пока еще находится на стадии становления. Одним из наших ключевых проектов как раз и является функциональное экспресс-протезирование. Мы начинали этот проект совместно с производственной компанией <a href="http://www.can-touch.ru">Can-touch.ru</a>. Сегодня он &nbsp;уже&nbsp;выливается в независимую компанию, которая будет фокусироваться непосредственно на реабилитационных медицинских технологиях различного назначения.</p>', '1'),
(1477, 121, 352, '<p>С профессиональной точки зрения меня вдохновляет Генри Форд, широко известный американский промышленник начала 20 века. Во всех своих начинаниях он придерживался одного главного принципа, который не был особо популярен как в те времена, так и сейчас: предприятие должно работать ради блага общества, а не ради прибыли предпринимателя. Если ставить перед собой правильные цели и задачи - в плюсе будут все. И общество, и предприниматель. Еще один весьма полезный принцип Форда относится к способу вести дела, основанный на максимально возможном снижении цен на производимые изделия. Не буду вдаваться в детали здесь, а просто порекомендую прочесть его автобиографию: "Генри Форд - моя жизнь, мои достижения".</p>', '0'),
(1478, 121, 353, '<p>Самым важным этапом лично для меня было принять решение отойти от работы по найму и начать развивать собственное дело. В любой ситуации самое сложное - принять решение. Все дальнейшее - дело техники.</p>', '1');
INSERT INTO `post_answer` (`id`, `post_id`, `question_id`, `answer`, `lego`) VALUES
(1479, 121, 354, '<p>Самое трудное в построении высокотехнологичной компании - не потерять интерес и не сдаться в первые несколько лет, когда приходится многим жертвовать, чтобы добиться начального результата. Почти также происходит и в университете: первые 2 года ты работаешь на зачетку, потом - зачетка на тебя. Важно напоминать себе, что все трудности временные.</p><p>Если говорить о текущем проекте по протезированию, то самое сложное это пожалуй работать с людьми, которые получили травму. Особенно если понимаешь, что в их конкретном случае ты помочь никак не сможешь, по крайней мере сейчас.</p>', '1'),
(1480, 121, 355, '<p>Особенных провалов в профессиональной деятельности пока не было. Все недочеты и ошибки исправляются в рабочем порядке. С точки зрения бизнеса - тоже, однако следует отметить, что я только встал на этот путь и провалы тут неизбежны. Остается только сделать так, чтобы они не были фатальны. Это одно из моих качеств - всегда иметь запасной план.</p>', '1'),
(1481, 121, 356, '<p>Самый приятный результат моей работы на сегодня это установленные нами протезы детям. Видео Даниила, нашего второго пользователя, вы видели в начале рассказа. Наблюдая как ребенок играет со своим протезом, пытается что-то взять и показать окружающим, понимаешь, что занимаешься действительно нужным делом.</p>', '0'),
(1482, 121, 363, '<p>Все, что невозможно сегодня, станет возможным завтра.&nbsp;</p>', '0'),
(1483, 121, 364, '<p>Как уже писал выше, всем предпринимателям рекомендую автобиографию Генри Форда - "Моя жизнь, мои достижения". Чем больше людей будут мыслить подобным образом, тем быстрее будет развиваться общество как морально, так и материально.&nbsp;</p><p>Из "общежизненных" книг могу особенно отметить одну - Адам Грант "Брать или отдавать". Очень интересные и поучительные взгляды на психологию межличностных и профессиональных отношений в обществе.</p>', '0'),
(1484, 121, 366, '<p>Занимайтесь в жизни тем, что вам нравится, и тогда вы будете счастливы. Если же вас что-то не устраивает - найдите в себе смелость это изменить. ;)</p>', '0'),
(1491, 122, 346, '<p>Швейцария. Вышла замуж.&nbsp;</p>', '1'),
(1492, 122, 347, '<p>У меня была масса впечатлений)))</p><p>- чистота везде (никто не ест &nbsp;и не пьет ни в одном виде транспорта и не бросает ничего на тротуаре)</p><p>- вежливость и приветливость ! - где бы ты ни был, сервис на высшем уровне, что-бы где-бы у кого-бы ни спросил, приветливы и вежливы; а автобусе никто никого не толкает;</p><p>- продукты питания - качество, конечно, очень отличается; и по вкусу, и по ассортименту; и сами местные рецепты для приготовления просто потрясающие</p><p>- быстрота обслуживания, поготовка документов разными службами и работа почты: работают как ракеты!</p><p>- почти каждый знает английский язык, не считая 2-3 местных</p><p>- медицина! особенно говоря о врачах в области медицины болезней сердца, ортопеды, онкологи - высший уровень!</p><p>- дизайн всего - стильно, красиво, приятные цвета, ничего лишнего.</p><p>- остановки: экраны, указывающие время прибытия автобуса</p><p>(в поезде предупреждают: поезд задерживается, просим прощения...на 2-3 минуты, сами местные жители смеются)</p><p>Сейчас вспомнилось это)))) Наверное была масса и другого)))))</p>', '0'),
(1493, 122, 348, '<p>Приехав в Швейцарию, я сразу столкнулась с рядом проблем при поиске работы. Я маркетолог. С этим огромная проблема. С финансами было бы может и проще, но я абсолютно не финансист. Сейчас подрабатывала в бухгалтерии, ухожу, не могу, не мое.</p><p>Во-первых работ по истинно такому направлению очень мало, и их сразу получают местные ребята с местными дипломами. Больше предлагается работ в области импорта-экспорта.</p><p>Очень сложно найти работу. Ищу 3 года. Причин, по которым отказывают много:</p><p>- диплом не распознать( бакалавриат - языки, магистратура - менеджмент, у них такая система не принята, может быть только 1 направление)</p><p>- диплом русский не особо тут ценится, ценится любой местный диплом</p><p>- вид на жит-во В, лучше иметь С или паспорт ( берут ограниченное колличество людей с В)</p><p>- языки: если ты работает в импорте-экспорте, это еще ничего, но такая профессия как маркетинг потребует знание местных 2 языков (немецкий и французский), английский, и все в совершенстве, почти на уровне носителя.</p><p>- писала в отделы закупок, ответили, что берут местных ( т.е. нужно тут родиться и выучиться было), а также нужны английский, немецкий, французский и швейцарский.</p><p>- мне говорят, устройся работать в магазин! а вот не возьмут) почему? потому что у меня должно быть образование кассира или консультанта по продажам или разгрузчика коробок))) Под каждый тип работы у них очень узкое направление в образовании.&nbsp;</p><p>- я работала в 2 русских фирмах и из обоих ушла. меня абсолютно не устраивает работа в выходные, вместо до 6 вечера до 2 часов ночи; часто тебя заставляют перерабатывать за бесплатно, грубят, угрожают и не дают взять отпускные, они просто накапливаются; у меня накопилось 2,5 мес. выходных, мне якобы переработки ими оплачивали, но взять их не давали.</p><p><br></p><p>В настоящий момент я иду на пролом и ищу ту работу, которую хочу я, а также пытаюсь воплотить в жизнь идеи собственных бизнес-проектов. Может что-то выйдет. Если все пойдет крахом, мне придется заново идти учиться, даже на продавца, как ни смешно это звучит))))) Но действительно, сервис на высочайшем уровне!!! Видимо, даже продавца учат чему-то такому особенному у них!!!))))</p><p><br></p>', '1'),
(1494, 123, 328, '<p>Никогда не идите на поводу у других!</p><p>Сколько раз родители, муж, подружки советовали мне, где мне работать и чем мне заниматься. Никогда! Не слушайте никого! Выбросите все советы! К черту их! Решайте сами! Даже если кому-то кажется, что ваша идея бредовая, или кто-то говорит вам, что ничего не выйдет. Не слушайте! У вас есть бизнес-план, есть большее количество "за", проект свежий, новый, вы им дышите? Пробуйте! Занимаясь тем, что вы любите, вы привлечете миллионы; занимаясь чем-то ради денег, по совету кого-то, вы будете страдать, ненавидеть свою работу, и все равно уйдете. Любите вышивать - вышивайте! Рисовать-рисуйте! Писать-пишите! Продавать - продавайте! Лечить- лечите! Не теряйте времени! Делайте дело своей жизни, то, что по душе!&nbsp;</p><p>и&nbsp;Никогда не идите на поводу у других!</p>', '0'),
(1554, 124, 322, '<p>Я занимаюсь тем, что стараюсь сделать людей довольными) Например, если человек хочет попутешествовать, я сделаю всё, чтобы у него это получилось и понравилось. Если человек хочет сделать фотографию - я сделаю всё, чтобы он хорошо получился, а если он получится плохо, то у меня есть секретные волшебные методы, которые помогут улучшить фотографию)<br></p>', '0'),
(1555, 124, 323, '<p>Когда клиент удовлетворён моей работой)<br></p>', '0'),
(1556, 124, 324, '<p>Идея пришла с появлением возможностей. Я привыкла работать в сфере продаж, занимала различные должности, получала хорошую зарплату и имела отпуск два раза в год. Отпуск я свой тратила всегда на путешествия. За несколько лет я многое узнала о сфере туризма, разобралась до мелочей) И параллельно меня (как обычно с течением времени) стала угнетать моя работа. Обычно я не задерживалась на одном месте дольше года, на последнем же задержалась на три. У меня был неплохой график - неполный рабочий день. Но пятидневка. А для меня самое негативное в любой работе - это график. Обязательное его соблюдение. Даже если работа очень хороша, со временем я устаю от графика. Так вот, я нашла способ уйти от этой проблемы. В сфере туризма можно спокойно работать фрилансером) То есть, работать удалённо. Это поставило точку на моей высокооплачиваемой работе и я получила свободу! Я стала зарабатывать меньше, но зато бОльшую часть времени я уделяю ребенку. Реализуюсь как мать. И при этом в работе с людьми стараюсь сделать их счастливыми, а не просто продать туристический продукт.&nbsp; А ещё, благодаря моей нынешней профессии, у меня появилась вторая работа, также со свободным графиком - фотографирую в фотостудии) <br></p>', '0'),
(1557, 124, 325, '<p>Нет таких людей. Меня всегда вдохновляют и двигают обстоятельства непреодолимой силы))<br></p>', '0'),
(1558, 124, 327, '<p>Выдержать позитивную паузу, когда работы совсем мало<br></p>', '0'),
(1559, 124, 331, '<p>Быть настоящем мастером в моём деле или в каком-либо другом - не работать на результат. Не в плохом смысле, а именно в таком, чтобы делать то, что делаешь, с удовольствием, бескорыстно и с целью помочь, послужить своим клиентам. С таким умонастроением результаты деятельности будут хорошими)<br></p>', '0'),
(1560, 124, 332, '<p>Люди никогда не перестанут путешествовать и фотографироваться, я так думаю)) <br></p>', '0'),
(1561, 124, 336, '<p>Делай всё так, как делаешь и будет тебе счастье)<br></p>', '0'),
(1562, 124, 339, '<p>Я не скажу, что с детства мечтала зарабатывать на жизнь тем, чем зарабатываю...Я хотела танцевать, играть на музыкальных инструментах,быть водителем автобуса, проводником в поезде.... Но мне сказали, что после школы я должна обязательно поступить как минимум в институт, чтобы получить супер-профессию. Когда я чуть подросла и поняла, что с гуманитарными предметами мне в школе не очень-то повезло, значит геологом-археологом или историком мне не стать, ВУЗ надо выбирать с математическим уклоном. Да и с математикой у меня всё было прекрасно. Моим ВУЗом оказался Университет Кино и Телевидения. Звучит интересно, но выпустилась я оттуда инженером...Это всё такой длинный пролог. Когда я выбрала для себя туризм - я поняла, что... чёрт возьми, почему я не пошла учиться в какое-нибудь училище на повара, у меня бы уже давно был свой ресторан! :)))) О том, как по жизни можно пролететь с образованием, вернее, с получением знаний - это уже истории дней минувших. Я к тому, что моё дело может меняться, но это будет всегда любимое дело ;) <br></p>', '0'),
(1563, 125, 346, '<p><p>Переехал в ближайшую (по месторасположению и по духу) европейскую страну-соседку, в Финляндию. В моём свидетельство о рождении родители не побоялись записать в графу национальность - "финн". Поясню. Этнические \nфинны-лютеране поселились в Ленинградской области в начале 17 века после того, как\n Швеция завоевала эти земли в результате войны с Россией. В годы \nсталинских репрессий ингерманландцы подверглись репрессиям, их в большом\n количестве ссылали в Сибирь. В 1943 году Финляндия приняла \nингерманландцев, оказавшихся на оккупированной немцами территории. В \n1944 Финляндия под давлением Советского Союза отправила ингерманландцев \nобратно в Советский Союз, где они снова подверглись репрессиям.</p>\n<p>Президент Мауно Койвисто в начале 90-х годов попросил у \nингерманландцев прощения за эту историческую несправедливость и \nпредложил оплатить этот «долг чести» путем предоставления им права \nпереехать в Финляндию в статусе репатриантов.</p><p>Опираясь именно на такое право я и многие мои родственники, переехали на ПМЖ в Финляндию. И не жалеют.&nbsp; <br></p><p>Переезд в близкую по "крови" страну не стал сложным, ведь почти с рождения мне близка и культура, и быт финнов. <br></p><p><br></p><br></p>', '1'),
(1564, 125, 347, '<p>Впечатлила политика "всеобщего благосостояния". <br></p><p>Именно так в дословном переводе звучит название программы по развитию Финляндии на долгие десятилетия. Всеобщее равенство, всеобщее обучение, всеобщая ответственность за сохранение природы и того, что нас окружает. Все это впечатляет и этому хочется учиться, с этим хочется жить.<br></p>', '1'),
(1565, 125, 348, '<p>"Где поселился, там и пригодился". <br></p><p>Живя в любой стране хочется быть полезным и успешным. Имея за плечами два высших образования, мне не сложно было начать все заново. <br></p><p>Да, да. Учиться, учиться и еще раз учиться! Здесь, в Финляндии, эта мысль очень актуальна. Уровень безработицы очень умело изменяется с помощью постоянного обучения работающего населения. Будь ты юноша или опытный работник, никому не запрещается идти в ногу со временем и искать новые знания, наоборот это поощряется.&nbsp;</p><p>Сначала я освоил язык, потом новую для себя профессию в области логистики и очень доволен.&nbsp; Хотя честно понимаю, что и это не предел!</p><p><br></p><p><br></p>', '1'),
(1566, 126, 346, '<p>В Финляндию. Вышла замуж.<br></p>', '1'),
(1567, 126, 347, '<p>После бурного ритма города Санкт-Петербурга Хельсинки показался мне спокойным небольшим городом. Со своим укладом и неспешно текущей жизнью. <br></p><p>Особо поразили белки и зайцы, бегающие чуть ли не под ногами в спальных районах. <br></p><p>А еще... чистый воздух, транспорт по расписанию, часы работы магазинов (большинство из низ закрыты после 9 вечера и после 6 вечера в воскресенье), культура вождения на дорогах, жилые районы, разделенные между собой лесом. С появлением ребенка я оценила возможность попасть с коляской куда угодно: любой магазин/банк/кафе/метро/автобус... совершенно без проблем. К тому же, проезд с коляской бесплатно.<br></p>', '1'),
(1568, 126, 348, '<p>По профессии я социолог, преподаватель социологии. <br></p><p>Диплом подтвердила. Как мне было сказано в министерстве образования, социологи здесь работают только в университете. Я туда преподавать не рвусь, это точно. ) Душа лежит помогать людям. И образование дает мне такую возможность. Социальная сфера здесь развита достаточно хорошо. В настоящее время являюсь руководителем организации, деятельность которой направлена на поддержку русскоязычных семей, живущих в столичном регионе.<br></p>', '1'),
(1569, 127, 346, '<p>Я долгое время ездила на Кипр отдыхать. Этот остров изменил всю мою жизнь. В первый раз приехала сюда в 2011 году после трагедии разрядиться так сказать и поняла, что жить без этого места не могу! Жизнь здесь отличается от Российской реальности. Но жить здесь постоянно я не хотела никогда, так сложилась судьба, я встретила здесь свою вторую половину. Правду говорят, что это остров любви! В общем в 2014 счастье нагрянуло незаметно, приехала на лето пожить, а осталась на долго, хотя муж у меня румын, и он тоже никогда не хотел жить тут. Подумываем о переезде в Испанию теперь, ну через пару лет.</p>', '0'),
(1570, 127, 347, '<p>Первое, что я заметила, что люди здесь живут, а не существуют как у нас в РФ. Хотя и кризис здесь нешуточный, и проблем у людей валом своих. Но они все равно наслаждаются жизнью и умеют жить красиво! А климат здесь просто потрясающий! Зимы не существует;)&nbsp;</p>', '0'),
(1571, 127, 348, '<p>С работой на острове в принципе беда. Для неграждан ЕС работы здесь нет! Вообще! Совсем! Да и ЕС гр<span style="line-height: 1.45em; -webkit-text-size-adjust: 100%;">аждане работают лишь в тур зоне в барах, ресторанах и отелях... Если в браке с ЕС, то тоже можно найти что-то сезонное, но о работе в офисах и коммерческих организациях даже и думать не стоит!&nbsp;</span></p>', '1'),
(1572, 128, 346, '<p>Я живу в Финляндии, в прекрасном городе Хельсинки. Переехала сюда еще подростком, высшее образование получила в Финляндии и Бельгии, ездила на стажировки Чехию, Швецию и Китай.&nbsp;В будущем вижу для себя перспективы карьерного роста как в Европе, так и за ее приделами, в том числе и в России.&nbsp;<br></p>', '0'),
(1573, 128, 347, '<p><p>Как и каждая страна, Финляндия обладает своим собственным, уникальным калоритом. Люди здесь уважают индивидуальность и личное пространство.&nbsp;</p><p>Национальный менталитет нашел свое отражение в финском искусстве, современном дизайне, основной чертой которого является красота в простоте.&nbsp;</p><br></p>', '0'),
(1574, 129, 346, '<p>Я уехал вскоре после получения ВУЗовского диплома в России. Появилась возможность продолжить обучение в Финляндии на IT-специалиста на английском языке. Я и согласился.<br></p>', '1'),
(1575, 129, 347, '<p>Везде поддерживается чистота и порядок. В северных мелких городишках вещи можно было оставлять на вокзале без присмотра и идти гулять по городу.<br>Также поначалу было непривычно спокойное, я бы сказал, "неагрессивное" население. Правда, потом узнал, что агрессия у финнов все-таки проявляется&nbsp;- в отдельных случаях в состоянии сильного алкогольного опьянения. То, что мы называем - в состоянии "в дрова".<br>Другое явное отличие от России - абсолютная пустота в выходные на улицах.&nbsp;Я учился в небольшом городке на севере Финляндии, где такая обстановка является нормальной.<br>Занимательно, что учиться в ВУЗе на бакалавра или магистра здесь можно хоть десять лет (до недавних пор).<br><br></p>', '1'),
(1576, 129, 348, '<p>Профессия - Java разработчик - устроена хорошо. Переучиваться мне пришлось самостоятельно с инженера-электронщика, что и было моей первой профессией. Поскольку я фактически получил в Финляндии профильное образование, проблем с трудоустройством не возникло.<br></p>', '1'),
(1597, 130, 322, '<p>Дети это самое чисто и белоснежное , что есть в нашем мире... Объяснить ребенку. что такое ветеринарный врач легко. &nbsp;В 5 лет у каждого из нас было много синяков, ссадин и царапин. В этом возрасте многие уже знаю, что такое доктор.&nbsp;</p><p>Рассказать малышу, что кошечки и собачки так же болеют, им также больно и им тоже требуется доктор очень легко.&nbsp;Гораздо&nbsp;труднее&nbsp;добиться&nbsp;сострадания... Очень часто на прием в вет клинику вместе с собой родители берут детей. и дети очень сопереживают питомцу, просят его потерпеть, гладят... Это очень мило...</p>', '0'),
(1598, 130, 323, '<p>Когда кот или собака, которые буквально умирали и надежды практически не было, начинает кушать, проявлять признаки жизни и выздоравливают.</p>', '0'),
(1599, 130, 324, '<p>Мне было около 5-6 лет. Возле нашего дома машина сбила кошку, мы с мамой в этот момент проходили рядом. Мы взяли эту кошку и понесли ее в вет клинику. Там кошку забрал врач, а долго ходила и рассматривала картинки на стенах клиники. Потом кошку отдали, но мы еще каждый день ходили туда и делали кошки уколы.</p><p>Когда врач на последнем приеме сказал, что все, кошка здорова и больше приходить не надо, я сказала, что когда вырасту так же буду лечить зверей)</p>', '0'),
(1600, 130, 327, '<p>Самое трудное... Это, наверно , люди... Большинство животных попадают к ветеринару, только потому, что хозяева неправильно о них заботились...&nbsp;</p><p>самое трудное, это доказать владельцы, что болячка его питомца лечится, что не нужно его усыплять...</p><p>Самое трудное это смотреть в глаза безнадежным кошкам и собакам, которых нельзя вылечить...</p><p>Самое трудное... это последний укол...</p>', '0'),
(1601, 130, 328, '<p>Серьезных провалов не было. Самое главное в&nbsp;профессии&nbsp;ветеринарного врача - внимательность.</p>', '0'),
(1602, 130, 331, '<p>внимательно относить к своим&nbsp;пушистым&nbsp;клиентам, не упустить ни одной мелочи, правильно диагностировать заболевание и назначить лечение.</p>', '0'),
(1603, 130, 333, '<p>ветеринарный врач - это экстрасенс, который может вылечить животное, только посмотрев на его фото, или услышав от&nbsp;владельца&nbsp;сведения о болезни по телефону.</p>', '0'),
(1604, 130, 335, '<p>Все беспородные животные подлежат кастрации!!!!!!!! Таким образом уменьшая численность безнадзорных животных мы делаем мир добрее и лучше.&nbsp;</p>', '0'),
(1605, 130, 337, '<p><b>"О всех созданиях&nbsp;— больших и малых" - Джеймс Хэрриот</b><br></p>', '0'),
(1606, 130, 338, '<p>Принести кошку на кастрацию, ввела в наркоз, побрила живот и каким-то 6 чувством решила все-таки удостоверится, что это кошка. Подняла хвост, а там 2 боооольший семенника) ))) Кастрировала кота. вышла к хозяевам&nbsp;со словами: "Поздравляю, у Вас мальчик!"</p>', '0'),
(1607, 131, 346, '<p>\n<p>Так случается,\nчто жизнь меняется с ног до головы в один миг. У кого-то в связи с хорошими\nсобытиями, у кого-то с печальными…Вот и моя жизнь в миг стала другой.</p>\n\n<p>Упуская всю\nпредысторию того, что, как и почему произошли те или иные события, могу\nсказать, что именно переезд в другую страну дал мне новый прилив сил.</p>\n\n<p>Ровно за пару\nнедель я собрала необходимые документы и переехала в Финляндию. Думая, на год…</p>\n\n<p>Прошло уже 4\nгода, и я могу с уверенностью сказать, что Финляндия стала моим настоящим\nдомом. Много чего произошло за это время, но главное что я ни на секунду не\nсомневаюсь, что тогда , наверное, за пару дней, я приняла важное решение в\nсвоей жизни.&nbsp;</p>\n\n<br></p>', '1'),
(1608, 131, 347, '<p>\n<p>Ничего не\nприходит в голову о первых впечатлениях, может быть потому, что Финляндия была\nмне хорошо знакома, еще до переезда сюда, я путешествовала по Финляндии на\nпротяжении многих лет. Все было привычно, эта страна всегда оставляла хорошие\nвпечатления. </p>\n\n<p>Ну а парковкой\nдля собак возле супермаркетов здесь никого не удивишь :)</p>\n\n<p>Ну а самое,\nпожалуй, ни для кого не секрет, приятное впечатление о стране – это чистота, и\nс этим не поспоришь.</p><p>Ах да и транспорт по расписанию! :)</p>\n\n<br></p>', '0'),
(1609, 131, 348, '<p>\n<p>Так складывались\nжизненные обстоятельства, что через год после моего пребывания в Финляндии я\nзахотела остаться здесь. Встал вопрос с визой.</p>\n\n<p>Но я понимала,\nчто с моим дипломом историка я здесь никому не нужна. Да и ту историю, которую\nпреподают здесь ученикам, я не хочу и не буду никогда преподавать.&nbsp; И, конечно, без серьезного финского языка\nбыло бы просто невозможно устроиться в школу на работу. Отсюда вытекала\nнеобходимость получения финского диплома для работы в школе и так далее и тому\nподобное...</p>\n\n<p>И я решила пойти\nосваивать новую профессию.&nbsp; Я понимала,\nчто без финского диплома мне не видать рабочего места. Быстро подумав куда я\nхочу, я выбрала сферу косметологии, на тот момент казавшуюся мне интересной и\nглавное востребованной. Меня приняли в Хельсинскую школу косметологии, учеба\nбыла платная, поэтому я без проблем получила место, даже практически не зная\nфинского языка.&nbsp; Могу сказать, что было\nочень тяжело, первые пол года я ничего не понимала, приходилось зубрить.&nbsp; Закончила я учебу не хуже финок, даже, так\nсказать, в топе :) Проработав\nпо новой специальности не многим больше чем 3 месяца, я поняла, что\nкосметология, все эти процедурки красоты - не мое! На этом мои отношения с\nкосметологией закончились. Но мне повезло, без работы я была, наверное, пол\nмесяца. </p>\n\n<p>Сейчас спустя\nвремя я поняла одну вещь…когда жизнь что-то отнимает, она обязательно дает что-то взамен, нужно только подождать. Вот и мне она подарила замечательных людей\nздесь в Финляндии, которым я безумно благодарна, которые мне дали и дают\nвозможность работать и развиваться. Сейчас, вот уже второй год, я работаю в\nинвестиционной компании. Могу сказать, что нашла свое место и безумно этому рада!</p></p>', '1'),
(1610, 132, 346, '<p>Это Польша :) Уехала туда ради того, чтобы работать в Google! Однако позже открыла массу других преимуществ этой, казалось бы непривлекательной страны.</p>', '0'),
(1611, 132, 347, '<p>Очень похожа на Россию, но гораздо комфортнее!</p>', '0'),
(1612, 132, 348, '<p>Я бы не сказала, что пришлось переучиваться, пришлось многому учиться, но это не связано со страной, больше с компанией и рабочими обязанностями.</p>', '0'),
(1613, 133, 346, '<p>Германия.&nbsp;</p><p>Я не видела будущего для себя и ребенка в России. Работая в рекламе, постоянно видела объявления о вакансиях с пометкой "до 40 лет". Обстановка в стране стала не самой доброжелательной. Я снимала квартиру в Москве, бывший начальник не отдавал мне долг по зарплате больше 200 000 рублей. Я никогда не получала алименты, живя одна с ребенком. В общем, ситуация казалась бесперспективной. Нужно было все поменять..</p><p>Мой отец живет в Германии около 20 лет, поэтому я воспользовалась возможностью, освоила базовый уровень немецкого, сдала 2 экзамена, собрала справки и получила ВНЖ.</p>', '1'),
(1614, 133, 347, '<p>Тихо, спокойно, очень чисто, зелено, парки, природа, очень доброжелательные люди вокруг. &nbsp;Все улыбаются, все почему-то рады тебя видеть, даже работники госструктур.&nbsp;</p><p>Я как будто оказалось на другой планете...</p>', '1'),
(1615, 133, 348, '<p>Я приехала по еврейской линии. Это дает льготы. Государство оплатило мне сначала курсы немецкого, потом еще одни курсы с более профессиональным уклоном, потом я узнала про Umschulung: школу переобучения, и опять благодаря госсистеме я прошла обучение в Wirtschaftsschule ( экономическая школа) на офис-менеджера (Bürokauffrau). Эта профессия сертифицируется IHK (Промышленная палата). По окончании можно работать HR, бухгалтером, офис менеджером, на ресепшн, в отделе закупок и продаж. Вариантов много. Я проходила практику в японской строительной фирме, и по окончанию практики они предложили мне контракт. Коллеги вкладывают силы и время в мою интеграцию и повышение квалификации, со мной проводят на фирме частные уроки английского и отдельно тематические уроки (английский плюс немецкий) по специфике моей работы.</p><p>Я не ожидала, что всего за 3 года моя жизнь изменится таким коренным образом! :)</p>', '1'),
(1658, 135, 322, '<p>я рисую рисунки</p><p>Я работаю на машине которая имеет в длину более 100 метров, в ней есть комнаты в которых на бумагу наносится разные цвета, цвета складываются друг с другом, и получаются картинки, дальше картинки разрезаются и получаются упаковка, которую сворачивают в коробочки. Эти коробочки мы потом видим на прилавках наших магазинах, они разноцветные красивые и заманчивые.</p>', '0'),
(1659, 135, 323, '<p>чувство удовлетворения от выполнения работы очень качественно и на высоком уровне. Изо дня в день стремиться достижению наивысшего результата!!! Постоянно совершенствоваться! Работая более 10 лет на данном производстве я понимаю что достичь абсолютного мастерства не возможно, каждый день не похож на другой.</p>', '0'),
(1660, 135, 324, '<p>там работали мои друзья и это была моя первая работа, после того как я пришел с армии . Я был очень удивлен что за выполнение этой работы платят деньги, я настолько втянулся в эту работу что работаю тут по сей день......</p>', '0'),
(1661, 135, 325, '<p>есть, это люди, которые вдохновляли меня своим примером на протяжении многих лет, своим отношением к работе и к коллективу</p>', '0'),
(1662, 135, 326, '<p>подъем по карьерной лестнице на моем любимом производстве</p>', '0'),
(1663, 135, 327, '<p>бывают такие моменты, когда не найти ответа на возникающие проблемы</p>', '0'),
(1664, 135, 328, '<p>невнимательность и лень, присуще любому человеку. мы учимся на своих ошибках</p>', '0'),
(1665, 135, 329, '<p>когда я могу решить имея большой опыт на производстве, возникающие трудности</p>', '0'),
(1666, 135, 330, '<p>доделывать дела до конца</p>', '0'),
(1667, 135, 331, '<p>постигнуть профессию со всех ее многогранных сторон</p>', '0'),
(1668, 135, 334, '<p>над коллегами, которые допускают ошибки, которые приводят к финансовым потерям</p>', '0'),
(1669, 135, 336, '<p>соблюдение техники безопасности является наивысшем приоритетом в достижение поставленных целей</p>', '0'),
(1670, 135, 337, '<p>основы офссетной печати</p>', '0'),
(1671, 135, 338, '<p>у нас на фабрики работают тройняшки...</p>', '0'),
(1672, 135, 339, '<p>сейчас на нее пойду, (на работу)</p>', '0'),
(1673, 134, 322, '<p>Я привожу вам домой вкусную еду, которую вы с мамой готовите для папы.&nbsp;</p>', '0'),
(1674, 134, 323, '<p>Неопределенность и возможность удивлять клиента</p>', '0'),
(1675, 134, 324, '<p>Я увидела большой потенциал на рынке, плюс лучший способ проверить себя - начать что-то создавать, даже если не получится - это опыт.&nbsp;</p>', '0'),
(1676, 134, 325, '<p>Мой муж и по совместительству партнер подтолкнул меня на открытие своего бизнеса и даже предложил идею - доставка продуктов с рецептами. Ему хотелось сделать сервис, где клиенту на дом привозят пакет с продуктами (консервы, мясо, фрукты и т.д.) и какие-то простые рецепты - в общем очень мужской вариант. Я его немного видоизменила до более сложных рецептов, интересных блюд, хороших продуктов, и получилась "Корзина на дом".&nbsp;</p>', '0'),
(1677, 134, 326, '<p>Поверить в себя - самый важный этап. Поверить в то, что твоей идее есть место в реальной жизни, и это - не просто галлюцинация. Это, конечно, надо проверить, но много инновационных идей и технологий не существовали пока не появились. Не все можно проверить.&nbsp;</p>', '0'),
(1678, 134, 327, '<p>Сервис и поддержка его высокого уровня. Компании в России (за малым исключением) не знают, что такое сервис. Они думают, что если продают продукт, который можно потрогать - это все, за что платит клиент. На самом деле клиент помнит, как с ним обошлись, какой был сервис, даже если были "косяки" с продуктом. И вернется туда, где сервис был. В нашем случае важен каждый клиент, особенно повторный, а этот клиент приходит за хорошим сервисом.&nbsp;</p>', '0');
INSERT INTO `post_answer` (`id`, `post_id`, `question_id`, `answer`, `lego`) VALUES
(1679, 134, 328, '<p>Были провалы с заказами (что-то забыли положить, качество какого-то продукта не понравилось клиенту), и мы исправляли их, чего бы нам это не стоило. По сути невозможно избежать мелких ошибок. особенно на объемах, хотя мы к этому стремимся, но чего точно стоит избегать - споров с клиентов и срезания углов. То есть надежды, что этот маленький недочет не будет заметен, или вдруг клиент подумает, что в целом все было хорошо, простит нам отсутствия одной детали. Это пассивный сервис, в краткосрочной перспективе он несет меньше затрат, в долгосрочной - это провал.&nbsp;</p>', '0'),
(1680, 134, 329, '<p>Когда нам лично в соц сетях пишут клиенты и говорят, что все было волшебно, что они были удивлены.&nbsp;</p>', '0'),
(1681, 134, 330, '<p>Когда работаешь сам на себя, сложно с утра себя мотивировать, особенно если что-то не получается и все стоит на месте. Сложно вообще мотивировать себя, так как никто от тебя не требует выполнения дедлайна, написания отчета. Лучшим способом является начать делать что-то утром, самую рутинную даже работу, и постепенно мозг настраивается на рабочий лад и настроение улучшается.&nbsp;</p>', '0'),
(1682, 134, 332, '<p>Думаю, самое большое. Сейчас вообще идет вторая ступень бума фуд контента. Сначала это была просто возможность писать о своих кулинарных шедеврах миру, делать фото, делиться рецептами. Каждый может ощутить себя шеф-поваром. Вторая стадия, люди стали думать, как на этом можно заработать - масса сайтов, популярных блоггеров. Теперь идет консолидация и монетизация этой сферы. Люди уже считают, что приготовить дома, а не пойти в ресторан - это круто. Хотя не так давно выйти в ресторан считалось престижным. Сегодня появляется потребность в сервисе, который поможет каждому получать удовольствие от приготовления пищи.&nbsp;</p>', '0'),
(1683, 134, 336, '<p>Идти работать в любое свободное время, потому что нет ничего ценнее реального опыта. Можно иметь 5 образований, и прийти на работу "сырым", а можно иметь одно, но понимать, о чем говорит профессор с прикладной точки зрения. Я думаю, что ничто так не мотивирует двигаться быстро, как реальный опыт, реальное ощущение, что ты что-то делаешь головой, руками, создаешь добавленную стоимость.&nbsp;</p>', '0'),
(1684, 134, 337, '<p>Я не сторонник читки книг, так как опять же это все лирика, вряд ли она поможет. если вы лежите на диване и читает. Но параллельно с работой я прочла одну замечательную книгу, и она мне помогла двигаться вперед. Тони шей, Доставляя счастье. Про успех Заппос - доставка обуви и уже не только. Ну есть бесплатные ресурсы типа udacity.com, где можно что-то слушать по предмету. Но опять же не забывайте, что это не главное.&nbsp;</p>', '0'),
(1685, 136, 322, '<p>\n\n<p>It is kind\nof like a&nbsp;being a&nbsp;babysitter. I am watching over bunch of kids to make sure\nthey play nicely and don''t hurt themselves as well as don''t bring shame and\nembarrassment to&nbsp;their rich and well&nbsp;off parents))). If something\ngoes wrong, I have to let parents know and make poor kid to sit down, figure\nout &amp; write a plan&nbsp;on how he will avoid bad behavior or danger going\nforward. From outside my job looks very simple - I sit and point to computer screen\nall day long as well as meet and talk on the phone with bunch of people)))</p>\n\n<br></p>', '0'),
(1686, 136, 323, '<p>\n\n<p>My salary...;)) Kidding))) Besides\nthat)) My job is very\ndynamic with multiple projects running at the same time, short timelines and low tolerance for an error.\n&nbsp;It gives me a great satisfaction when it all falls in place and it all happens on time. </p>\n\n<p>Another one&nbsp; - when auditors\ncome in&nbsp;and they can''t find anything&nbsp;in my area of responsibilities &nbsp;that could translate into\naudit issue - always a great feeling.&nbsp;As to a former\nauditor – this one is very special to me;))</p>\n\n&nbsp;Also -&nbsp;"figuring things out"&nbsp; i.e. process improvement that allows spend less time on particular task going forward which translates into&nbsp;having a little more work to life balance brings great feeling to everyone on the team)). <br></p>', '0'),
(1687, 136, 324, '<p>\n\n<p>It was\ncompletely coincidental. I worked&nbsp;at internal Audit department as a\ntechnology auditor when my former coworker asked me if I &nbsp;would be\ninterested in position that just opened up on her team. This is how I ended\nup&nbsp;in Corporate Operational Risk. It was a great next step for me because\nafter being in audit for about 7 years, I was ready to move to business side\nand at a time was looking for an opportunity to "own" something i.e. platform, program, process.. Internal\nAudit experience gave me a great exposure into multiple businesses within the\nbank and I was ready to get into one of those businesses so I can become\nsubject&nbsp;matter expert, own, run and improve -)). With audit background I felt\nthat when I get into business side I knew where my focus should be and what the\nultimate goal should look like. </p>\n\n<br></p>', '0'),
(1688, 136, 325, '<p>\n\n<p>My immediate family has always\nbeen great inspiration to me. I have\nvery smart parents and two brilliant brothers. I always felt I needed to do something\nto measure up or at least try;))</p>\n\n<br></p>', '0'),
(1689, 136, 326, '<p>\n\n<p>Continuous education was very\nimportant. I&nbsp;tried to&nbsp;use opportunity to go back to school to&nbsp;get new\nskills and certifications. I&nbsp;did it between jobs as well as while working\nfinding study time during evenings and on weekends. The second option was\nchallenging but looking back I feel that every time when I made an effort it\npaid off for me. It helped&nbsp;me to compete for a better &amp; more interesting\njobs and eventually get&nbsp;into areas and positions that otherwise would have\nbeen out of reach..</p>\n\n<br></p>', '0'),
(1690, 136, 327, '<p>\n\n<p>The most difficult part of my job for me is not an actual\njob itself, but art of achieving balance between work and my private life. I\nalways tend to slip into mode when job takes precedence. Long hours, working\nweekends. Still working on figuring out how to avoid that. I think once I figure\nthis one out, that’s when I could honestly say “I love my job”;))</p>\n\n<br></p>', '0'),
(1691, 136, 328, '<p>\n\n<p>Luckily I can’t recall an episode that could classify\nas a total failure)). I certainly had few when looking back I could say “I could\nhave done it better”.</p><p>&nbsp;Actually good example is my most recent project that I just\nfinished last week)). That particular Initiative took our team few months to\nimplement with lots of late nights &amp; weekends due to very tight timeline. After\nproject completion, while discussing project results with my manager, comment\nwas made that made me realize that it WAS possible to push timeline of this project\none month back. As a business lead on the project it was up to me to post that\nquestion on timeline extension. Looking back it was my intention at one point, but for\nvarious reasons i&nbsp;decided that it would never fly. Lesson here – never just assume that you will get a “no”\nfor an answer. You might just get a green light. Boy IF I HAVE DONE THAT having\nthat extra month would have made a huge difference to many people and to me\npersonally.. </p>\n\nAnother lesson – do not to take&nbsp;your&nbsp;job\ntoo seriously. Do your best, but we all human beings and mistakes do and will\nhappen. Learn and move forward. This is why I could never be a doctor)) I could\nnot be in profession that has a human life as a potential payout factor&nbsp;for\nyour potential mistake. How can they sleep at night ;))?<br></p>', '0'),
(1692, 136, 330, '<p>\n\n<p>Attention to detail.. This one is handy))..<span>&nbsp; I think importance of detail is not to be\noverestimated. What’s going on around you, your loved ones, your kids, your relationships.\nJust paying attention.. Identify mistakes, make conclusion, do not repeat, do not repeat...</span></p>\n\n<br></p>', '0'),
(1693, 136, 331, '<p>\n\n<p>Have a sound knowledge of a&nbsp;business you are in, related risks, understanding\nhow risk can be measured.&nbsp;Knowing how to&nbsp;correctly identify&nbsp;risk appetites. Understanding what is\nnecessary to mitigate each risk identified. Communicate clearly.</p>\n\n<br></p>', '0'),
(1694, 136, 332, '<p>\n\n<p>I work in banking industry. Banking will always be\nneeded as we all understand, the banking process is morphing very rapidly into\nless manual &amp; more cyber like experience. I am looking forward each year to\nsee what my Bank comes up with next i.e. online banking already in place (long\ntime) and there is hardly a need ever now&nbsp;to go into actual bank location. Paying\nfor your purchases with your phone is already here, still getting used to it &nbsp;and\nnot all merchants participate yet, but it is happening. Risks associated with banks\noperations will always be present and always be a need there to identify,\nmeasure and mitigate risks. So the future is bright))</p>\n\n<br></p>', '0'),
(1695, 136, 333, '<p>Some\npeople think that if all you do all day is sitting in the nice office starring\nat computer screen all day long then your job must be easy. Why could you ever be\ntired, right?;)) <br></p>', '0'),
(1696, 136, 334, '<p>\n\n<p>Something like – </p>\n\n<p>Everything should take no more than 15 minutes in opinion of\nsomeone who is not doing the actual job (aka manager or executive);))</p>\n\n<p>or</p><p>Do your best project timeline estimation, then\nmultiply it times three and you still will\nprobably come up with timeline that is not nearly enough to&nbsp;realistically complete\nyour project. This one never fails..</p>\n\n<br></p>', '0'),
(1697, 136, 335, '<p>Nothing new there, but not&nbsp;all people master that - </p><p>\n\n<p>Risks are all around us, right?. Mitigate! Mitigate!\nMitigate! Meaning if you could calculate few steps forward and come up with the\nplan how to avoid risk or if unavoidable how to soften the blow in your day to\nday life would not that be nice? So why not do it?</p>\n\n<br></p>', '0'),
(1698, 136, 336, '<p>\n\n<p>Just go for it! Don’t be shy, NEVER be intimidated;\ntrust in your instincts and abilities.</p>\n\n<br></p>', '0'),
(1699, 136, 339, '<p>\n\n<p>All above))</p>\n\n<br></p>', '0'),
(1700, 137, 346, '<p>I moved to US in 1992 with my family. Why did we do it?&nbsp;There&nbsp;was not a one single reason, but few. But&nbsp;I think the main one was that we had an opportunity legally move to US. Family members were already&nbsp;living in US&nbsp;and they invited us to join them.&nbsp; <br></p>', '1'),
(1701, 137, 347, '<p>I just wrote "we arrived in New York city" and I stopped there having difficult time to identify one or two single things that impressed me the most.. I think it was so different overall that everywhere I turned i&nbsp;saw a huge difference between what we left behind and what we arrived to.. But i think what impressed me the most was the energy of the place - &nbsp;stress level, people&nbsp;are going about their business, cars moving, impressions, language.. New York is a place where life is moving at very high speed. It is not an easy. relaxed city. It is a city with very dense and strong energy&nbsp; which&nbsp;sucks you in and you find yourself having no choice but&nbsp;adopting to that rhythm very fast.</p><p><br></p>', '1'),
(1702, 137, 348, '<p>I have been living in US for almost 23 years. During that time I had a chance to reinvent myself few times.&nbsp; I got an engineering degree in Russia before moving to US. </p><p>In US here is my professional progression&nbsp;over the&nbsp;last 16 years -&nbsp;&nbsp; *Computer Programmer to&nbsp;*Business Analyst to *IT&nbsp;Project Manager&nbsp; to *IT Audit Consultant to *Technology Auditor to *Operational Risk Program Manager.</p><p>During&nbsp;that time&nbsp;I went to school, took various trainings and completed some certifications. That helped me to progress and get to next levels where i wanted to be.</p><p>Currently I work for a&nbsp;large bank in Corporate Operational Risk department as a Risk Program Manager. See my story.. </p><p><br></p>', '1'),
(1703, 138, 349, '<p>Самое горячее, что вы видите в жизни - это солнце, Мы же создаем настолько кипящее вещество, что солнце по сравнению с ним - это кусок льда где-то на Северном полюсе.&nbsp;<br>У нас ходит поговорка, что если ты не можешь объяснить школьнику чем конкретно ты занимаешься, то ты занимаешься какой-то полной ерундой.&nbsp;</p>', '1'),
(1704, 138, 350, '<p>Быть на передней грани развития человечества.&nbsp;<br>Осознавать, что то, что ты делаешь, до тебя ни делал никто.</p>', '1'),
(1705, 138, 351, '<p>Первая книга, которую я прочитал была фантастической, с первого класса&nbsp;<br>я грезил о иных мирах и космических путешествиях. Когда я стал изучать физику, ко мне пришло осознание того, что на данном этапе развития человечества такие путешествия невозможны, поэтому занятие физикой было логическим шагом. Я лишь выбрал как можно более фундаментальную область.&nbsp;</p>', '1'),
(1706, 138, 352, '<p>Ричард Фейнман, один из величайших физиков двадцатого века, он сделал очень многое для науки, при этом умудряясь интересоваться буквально всем вокруг: психологией, девушками, барабанами ... . Своей жизнью он показал, что великий ученый может быть чрезвычайно интересным человеком во всех областях.<br>Есть замечательная книга о его жизни: "Вы, конечно же, шутите, Мистер Фейнман". Почитайте, Вам обязательно понравится.&nbsp;</p>', '0'),
(1707, 138, 353, '<p>Первый этап - это отъезд от родителей и переезд в СПб после восьмого класса для обучения в Академической Гимназии при СПбГУ. Участие в Турнире Юных Физиков. ТЮФ - это такой турнир, где командам примерно на 9 месяцев дается 17 физических задач, каждая из которых требует построения теоретической модели и проведения ряда экспериментов. Думаю, именно тогда у меня появилась склонность к экспериментальным исследованиям.&nbsp;<br>Второй этап - первые два курса на Физическом факультете СПбГУ. В первый день учебы у нас был тест, по результатам которого нас распределяли по группам. В анкете перед тестом надо было написать желательную группу, и я, подумав и решив "почему бы и нет", написал СуперЦИПС (супер целевая интенсивная подготовка студентов) - самая сильная группа на ФФ, обычно с нее в теоретическую физику идут, и поступил.&nbsp;<br>Третий этап - это работа в Лаборатории физики сверхвысоких энергий СПбГУ, которая продолжается и сейчас. Так же важным этапом для меня была первая поездка в CERN на два месяца летом 2013 и работа в Вейцманском институте наук в Израиле летом 2014.&nbsp;<br></p>', '1'),
(1708, 138, 354, '<p>Если мы говорим конкретно про Россию, то это выживать, не захлебнуться в потоке бюрократии, не сдаться и не уйти в бизнес. Это действительно трудно.</p>', '1'),
(1709, 138, 355, '<p>Думаю, это изучение английского языка, в школе и на начальных курсах я благополучно клал на него болт, поэтому у меня были большие проблемы, когда я начал ездить в заграничные командировки. Сейчас я много трачу времени на развитие своих разговорных навыков.&nbsp;</p>', '0'),
(1710, 138, 356, '<p>Я только в самом начале профессионального пути, еще все впереди.&nbsp;</p>', '0'),
(1711, 138, 357, '<p>Стараюсь докапываться до мельчайших подробностей и понимать все, что происходит вокруг. Это очень часто мешает при общении с людьми)&nbsp;</p>', '1'),
(1712, 138, 359, '<p>Самое светлое, чем больше растет островок нашего знания, тем длиннее береговая линия нашего незнания.&nbsp;</p>', '0'),
(1713, 138, 360, '<p>Ученые - скучные люди, далекие от реальной жизни, свысока смотрящие на все происходящее вокруг.&nbsp;<br></p>', '0'),
(1714, 138, 362, '<p>Пользу в повседневной жизни? Вы что, шутите?)&nbsp;</p>', '1'),
(1715, 138, 363, '<p>Меньше играть в компьютерные игры, меньше "косить" лекции и записаться на курсы по английскому.&nbsp;<br></p>', '0'),
(1716, 138, 364, '<p>Хоккинг "Кратчайшая история времени"&nbsp;<br>Окунь "Элементарное введение в физику элементарных частиц"&nbsp;<br>Фейнмановские лекции&nbsp;</p>', '0'),
(1717, 138, 365, '<p>В Дубне на ускорителе сломалась лампочка, которая сигнализировала о появлении пучка высокоэнергетичных заряженных частиц. Один физик пошел в зону эксперимента что-то там наладить, заглянул в детектор, и в это время появился пучок ... прожег ему тоненькую дырку сквозь всю голову ...&nbsp;<br>Ничего, говорят до сих пор там работает.&nbsp;</p>', '0'),
(1718, 103, 322, '<p>Тот случай, когда объяснять ничего не надо, достаточно показать.&nbsp;<br></p>', '0'),
(1719, 103, 323, '<p>Само дело. Музыка всегда доставляет удовольствие. Несмотря ни на какие трудности обучения, да и вообще, трудности. А самое большое удовольствие - это сотворчество с хорошими музыкантами, это никакими словами не передать и ни с чем не сравнить.<br></p><p></p><p><img src="/web//upload/images/7ed5359ac3b5c288c43b611722732ba1.jpg" style=""></p><br><p></p>', '0'),
(1720, 103, 324, '<p>Эта идея никогда не приходила. Я помню, как в садике года в три представляла себе, как я выросла и пришла в нашу группу, и пою нашей группе какие-то красивые песни в микрофон. В красивом платье, естественно. Откуда тогда взялась эта картинка, не знаю. Возможно, по телевизору что-то увидела или на концерте была с родителями. Гораздо позже появилось много идей насчет того, что в этой&nbsp;профессии работать не нужно. Потому что "а вдруг недостаточно таланта", "это не профессия", "не бывает музыки кроме классической", "это невероятно трудно", "получи нормальную профессию и занимайся музыкой как хобби", ну и&nbsp;"будь лучшей или убирайся". А ведь объективно всегда будет кто-то, кто лучше. Просто по-другому не бывает. И осознание, что я хочу заниматься этим и только этим, пришло уже после многих лет опыта совмещения с другими профессиями.<br></p>', '0'),
(1721, 103, 325, '<p>О да, но это получится огромный список. Потому что любого хорошего музыканта, искусство которого трогает, можно назвать вдохновителем. А в эфире отыскиваются чуть ли не каждый день какие-нибудь незнакомые вещи, которые действуют подобно вспышке. <br>Ну, когда-то в средней школе для меня лично Машина времени сыграла роль, которую сыграли Битлз для самой Машины времени. Потому что после уже никогда не было как до, и теперь я точно знала, чего хочу. Потом были сами Битлз, Секрет, Аквариум, и уже за ними Queen, Pink Floyd, и дальше-больше, прочая мировая музыка - рок, джаз, блюз, фьюжн, этно... <br>Другое ярчайшее впечатление - это группа Yes, чье творчество поддерживало в самые непростые времена, и до сих пор это группа - одна из любимых. А вообще, можно привести длинный-длинный список. И он действительно огромен.<br></p>', '0'),
(1722, 103, 326, '<p>Наверное, еще рано оглядываться на этот путь. Еще ничего толком не сделано. Наверное, во-первых, это была возможность записать свой авторский альбом с отличными музыкантами. Это был огромный шаг с поддержкой многих людей, и я очень им благодарна.<br>Другим этапом был этап "впитывания", путешествий и молчания. Это тоже оказалось очень важно.<br>Затем уже сознательная учеба, переучивание и понимание, насколько необъятен мир музыки. Пришлось принять себя как есть, со всеми недостатками, неумениями, незнаниями и начать буквально заново.<br></p><p>Ну и следующим этапом было увольнение с "правильной" работы, которая давала чувство стабильности и постоянства. Преподавание и заработок исполнителя - не самый стабильный источник дохода. Приходится все время что-то искать, заниматься саморекламой, что для меня не самый лучший род деятельности. Но от занятий музыкой и преподаванием есть моральная отдача. Есть начатые проекты, есть несделанные песни. Так что, надеюсь, будут еще решающие этапы.</p>', '0'),
(1723, 103, 327, '<p>Самое трудное, наверное,&nbsp;это&nbsp;преодолевать чье-то мнение. В том числе и устоявшееся свое. потому что это может здорово мешать двигаться вперед. Трудности технические - ничто по сравнению с этим. Звучит кощунственно, но иногда техническое несовершенство при полной уверенности позволяет делать чудеса. Мне не очень повезло со стеснительностью - ее больше, чем надо, и это самое сложное, по-настоящему сложное.</p>', '0'),
(1724, 103, 328, '<p>Удивительно, но провалы и неудачи помнятся лучше. А иногда&nbsp;ты что-то воспринимаешь как неудачу, хотя другие это так не видят. Это когда ты не сделал того, что наметил, чего-то не выразил, не добился нужного звука. <br>Эти неудачи у вокалиста часто связаны с психологическим состоянием. То есть такой парадокс: надо расслабиться, чтобы быть собранным. Надо быть в состоянии удовольствия от жизни, чтобы передать слушателю, и вместе с тем оставаться серьезным и адекватным. То есть, нужно культивировать в себе ощущение счастья. Быть счастливым - не цель, а работа, чуть ли не обязанность. Похоже на то, как в семье. Ты приносишь свое внутреннее счастье, а не требуешь его от других. Как я сейчас понимаю, большинство неудач связано с отсутствием этого состояния и со страхом. Тогда тело на сцене перестает слушаться. <br>Мне повезло, по-настоящему ужасных провалов то ли не было, то ли не помню. Но были не очень удачные выступления, которые показывали, чем надо больше заниматься, а о чем не стоит беспокоиться.<br></p><p>Ну и школьный "страх ошибки" до сих пор мешает. В школе учат "не ошибаться". а на живых выступлениях ты учишься выходить из разных положений. Особенно когда выступаешь с живыми музыкантами, самое главное - не избегание ошибок, а чувство момента и друг друга. И то, как ты в случае чего из этой ошибки выйдешь. Или как поможешь партнеру, если ошибся он. Есть расхожая байка, что стиль скэт родился, когда кто-то из звезд, по одной из версий - Армстронг - забыл текст, и запел всякую "белиберду", подражая трубе. А вот в школе ошибка - это ужас, это красные уши, дрожащие руки, ощущение ужаса. Вот с этими последствиями до сих пор приходится бороться.</p>', '0'),
(1725, 103, 329, '<p>Когда что-то получилось. Когда удалось преодолеть страх. Когда удалось сотрудничество. Когда публике понравилась песня, которую страшно было "выносить на свет". Когда попросили провести праздничный вечер, хотя до этого не занималась ни конферансом, ни режиссурой, уже по ходу поняла, что написанный текст к этой ситуации не подходит, сбивчиво попыталась что-то переделать на ходу, потом плюнула и просто между песнями говорила от себя, как можно сердечнее. А потом подходили люди и благодарили. Такие вещи.<br></p>', '0'),
(1726, 103, 330, '<p>Говорят, слушать вполоборота. Вообще, об этом сложно судить, так как профессиональные привычки не отслеживаются. Но люди иногда косятся. И вдруг ты понимаешь, что, например, отстукиваешь ритм в транспорте. Наверное, я себя не могу сравнить с привычками и без, поэтому не знаю, что сказать.<br></p>', '0'),
(1727, 103, 331, '<p>О, до этого мне еще идти и идти. Нужно прекрасно слышать самые мелкие нюансы, иметь отличное чувство ритма, кучу всяких знаний, и ассимилировать их на уровне тела. Нужно уметь управлять эмоциями и звуком, нужно знать массу всякой музыки, разбираться в стилях и использовать их особенности всегда к месту, нужно обладать вкусом и мерой, нужно все время учиться чему-то новому. мастер - это тот, кто в совершенстве владеет языком музыки и может выражать с его помощью свои мысли и чувства.&nbsp;<br></p>', '0'),
(1728, 103, 332, '<p>Человеку нужна музыка. Каким бы это легкомысленным ни казалось. Она лечит, поддерживает, развивает. Мало того, с помощью музыки происходит действие рекламы, массовых мероприятий, телепередач и т д. (Тут хороший музыкальный вкус и образованность может помочь человеку не поддаваться на тот посыл, который ему не нужен.)&nbsp;так что у этой отрасли определенно есть будущее. А вот какое? Наверное, самое разнообразное.<br></p>', '0'),
(1729, 103, 333, '<p>Стереотип, что есть "талант" в виде такого пирожка, который одному дали, а другому - нет. Конечно, бывают уникальные случаи, но часто оправдывается расхожее выражение&nbsp;о 10 процентах таланта и 90 - труда. Да и любой талант требует условий для развития. Сколько знаю тех, кому в детстве нанесли удар по психике, говоря фразы типа: "нету слуха, голоса, таланта"... Знаю и лично тех, чье состояние на начальном этапе, мягко говоря, никак не намекало на тот уровень мастерства, которого люди достигли годами практики и преданности делу.<br>Стереотип о преодолении через боль. В вокале боль - сигнал того, что что-то не так. С техникой, со здоровьем. Через боль идти нельзя, нужно остановиться и понять, а если продолжать "упорно трудиться", можно повредить что-нибудь. Хорошо, если не фатально.<br></p><p>Стереотип, что нужно победить других. Что кто-то у тебя может что-то "отобрать". Сейчас идея конкуренции очень популярна, но по факту сотрудничество или просто доброжелательное отношение к коллегам дает гораздо больше бонусов. Наверное, бывают какие-то другие ниши, особые ситуации. Но это я понимаю умозрительно. Сама сталкивалась с этим в другой профессии (когда собеседование двоих на одну хорошо оплачиваемую должность было одновременно, и выбрали другого человека.) Мне очень нужна была работа, было очень обидно, но все равно все обернулось к лучшему. А в музыке вообще лучше дружить - это мой личный вывод.<br>Стереотип, что надо быть таким-то и таким-то. Тут вообще сколько людей, столько и мнений. Жаль, что я не понимала этого раньше.<br>Вообще, стереотипов масса. И есть среди них самые неожиданные.<br></p>', '0'),
(1730, 103, 334, '<p>Ну например.&nbsp;<br></p><p>Идет человек (по некоторым версиям это известный гитарист Роберт Фрипп из группы King Crimson, такой несколько погруженный в себя товарищ) по Лондону, весь ушедши в мысли. Что-то тихонько себе дирижирует. Навстречу ему прохожий. Прохожий:<br>- E[cuse me, sir, can You show me the way to the Albert hall?<br>(Простите, сэр, можете ли Вы указать мне путь в Альберт Холл?)</p><p>Музыкант медленно возвращается к реальности, с серьезным лицом поднимает кверху палец и изрекает:&nbsp;<br>- Practice, practice and practice!<br>(Практика, практика и еще раз практика).<br></p>', '0'),
(1731, 103, 335, '<p>Что альтерированный доминантсептаккорд... А-а, в повседневной...<br>Что голос имеет, условно говоря, несколько режимов звукоизвлечения, и оперирование этими режимами позволяет сохранять голосовой аппарат при смене высоты или громкости (иначе можно, к примеру, сорвать голос на крике). Поэтому не нужно бояться "пустить петуха", а лучше научиться с этими "кукареками" управляться. <br>Что расслабление области желудка или гортани очень помогает стабилизировать психологическое состояние, что освобождая дыхание и позволяя ему "спускаться в живот", мы делаем подарок своему здоровью.<br>Что музыку надо уметь слушать, а для этого надо УЧИТЬСЯ ее слушать. И тогда вещи, как бы сложные и скучные поначалу, раскрываются такими драгоценными россыпями, только диву даешься, как раньше этого не замечал?&nbsp;</p>', '0'),
(1732, 103, 336, '<p>Слушай себя, только по-настоящему. Делай то, что ты по-настоящему хочешь делать. Не думай, что ты уже все умеешь и все знаешь, но знай, что дорога перед тобой. Там, впереди, не пустота, которая мерещится сейчас и так пугает! Ты сейчас даже представить не можешь, какие чудеса на ней случаются. Иди по ней без сомнений, иди, никто, кроме тебя, не даст тебе зеленый свет. И при любой возможности будь ближе к мастерам. Впитывай во все глаза и во все уши, постарайся проникать на репетиции, как-нибудь попасть в этот мир. И научись учиться.<br></p>', '0'),
(1733, 103, 337, '<p>Ох. Их так много, и они такие разные. Если профессионально, лучше пойти в профессиональное учебное заведение и читать все, что попадается на глаза. Или хотя бы просматривать и читать все, что покажется интересным.&nbsp;Хотя у меня читать получается меньше, чем смотреть видео. Потому что у нас очень важна практика. Сейчас масса видео. Можно выбирать, а направления нужны всякие - и теория, и дыхание, и выступления артистов, и ритм. Все не пересмотреть.&nbsp;</p><p>Много материала по моему направлению - на английском.<br>Занятий с педагогом ничто заменить не может, потому что изнутри ощущаешь себя и звук совсем по-другому, чем снаружи. Но бывает, что все получается "так", само собой. Хотя профессионалы часто занимаются с педагогом и во взрослом возрасте.<br>Да! Живые концерты - САМАЯ ГЛАВНАЯ ВЕТВЬ ОБУЧЕНИЯ. Ходите на живые концерты, вот этого точно ничто не заменит!<br>Есть школы и курсы с более легкой программой, для разных возрастов и для людей с разной занятостью. Могу назвать в Москве C-jam club, джазовую студию, в которой сама избавлялась от школьных и училищных страхов. Нашла там много друзей, и вообще, очень рада, что пришла туда.<br>Насчет вокальных аудио, видеошкол, я бы не стала пропагандировать что-то вот так с ходу. Потому что, даже занимаясь по самой лучшей школе, очень легко делать что-то неправильно. Со мной такое тоже было. Часто нужно увидеть человека, чтобы ему что-то советовать. Ученикам, конечно, советую что-то в процессе. Мне лично нравятся сайт "вокальная механика", там можно многое почитать. Школа Сетта Риггса (вариант - Бретта Мэннинга, или у нас - разработки Виктора Емельянова), если понять суть и делать все правильно, но не стала бы говорить, что это единственный метод и 100 % панацея. А вот что никогда не вредно - это прислушиваться к себе. Потому что существует наше тело, наш голос как инструмент. И существуют ключи к использованию этого инструмента. Они у нас есть. Нужно наблюдать за собой, за животными, за младенцами. Проблема в том, что чем старше человек, тем больше у него "мышечных блоков". Очень часто. И нужны бывают долгие усилия, чтобы расслабиться. Да, вот такой парадокс. Усилия, чтобы расслабиться.<br>Слушать хорошие голоса и пытаться понять на уровне тела, что происходит. Вы в основе своей устроены так же. Вы можете многое, хотя, конечно, индивидуальные особенности и склонности у всех разные.<br></p>', '0'),
(1734, 103, 338, '<p>Что-то не приходят сейчас байки на ум.&nbsp;<br>Неожиданности были, например, в одном студийном концерте должны были играть дуэтом.&nbsp;В последний момент образовался басист. А уже на сцене в начале песни оказалось, что мы играем с барабанщиком! Ух и здорово было!<br><br></p><p>Курьез из звукорежиссерской практики:<br>Серьезнейший концерт, зал на 1200 мест, куча артистов по кулисам, команды в боевой позиции. Режиссер:<br></p><p>- Свук и звет готовы? Тьфу, то есть, Звет и свук готовы?<br>Напряженность немного спала, а концерт, кстати, прошел хорошо.<br></p>', '0'),
(1735, 103, 339, '<p>Мысли появляются и исчезают постоянно как облака ) Основные мысли о моей любимой профессии изложены в этой статье, а из остальных можно составить книгу, да не одну.Дело совершенно безграничного потенциала. Слушайте музыку, любите музыку, и вы найдете в ней что-то свое, обязательно.<br></p>', '0'),
(1743, 140, 371, '<p>Как ни странно, в школе я ненавидел бег. &nbsp;Я не мог пробежать даже 2 км. Причиной этому, конечно, была система школьного образования, где главное было сдать нормативы, но никто не учил детей собственно правильно бегать. Все бегали кросс и задыхались.&nbsp;</p><p>Наверное, в какой-то момент во мне родилось желание доказать самому себе, в первую очередь, что я могу. Решил попробовать.</p><p>И как ни удивительно, уже в течение полугода я добился хороших (для себя) результатов. Правильная тренировка приведет любого к успехам даже на небольшом промежутке времени! Это просто навык. Делаете. По чуть-чуть. Но регулярно. И постепенно с удивлением для себя видите прогресс. И начинаете получать удовольствие.&nbsp;</p><p>Достижение - пока 15 км по пересеченной местности. Я бегаю для себя, в соревнованиях пока не участвовал. Хочется иметь спокойную уверенность в своих силах. Ощущать себя на уровне . Конечно, когда-нибудь мечтаю пробежать марафон!</p><p><br></p>', '1'),
(1744, 140, 372, '<p>Есть четыре простых правила:</p><p><br></p><p>1) Обязательно разминка. </p><p>2) Правильная обувь. Причем она может быть разная для разных стилей бега и покрытия. Купите подходящую.</p><p>3) Правильное дыхание во время бега</p><p>4) Экономия сил. Часто видишь новичков, которые , например, пыхтят и размахивают руками. &nbsp;Надо, чтобы все движения были спокойные и эффективные.</p><p><br></p><p>Ну и  хороший ландшафт и свежий воздух, конечно ))</p>', '1');
INSERT INTO `post_answer` (`id`, `post_id`, `question_id`, `answer`, `lego`) VALUES
(1745, 140, 373, '<p>Для меня это уже как медитация. Я заряжаюсь энергией во время бега. Тело работает, а мозг отдыхает. После бега тело чувствует приятную усталость, а мозг - приятную расслабленность ) То, что нужно для того, чтобы вдохнуть жизнь полной грудью и принимать правильные решения.</p><p>Конечно, полностью отрешится от мыслей не получается, подсознательно мозг работает. Но если ситуацию отпустить, часто после бега правильные решения приходят сами собой.&nbsp;</p><p>Насчет влияния. Я люблю всякие гаджеты и статистику. Поэтому мне нравится все замерять &nbsp;с помощью различных устройств: дистанции, &nbsp;скорость, рекорды и прочее. &nbsp;Бегать люблю по утрам перед работой. Это заряжает на весь день!</p><p><br></p>', '1'),
(1755, 141, 372, '<p>Мне запомнилась одна фраза тренера:</p><p><br></p><blockquote>Не бегай, чтобы быть в форме. Будь в форме, чтобы с удовольствием бегать.</blockquote><p>Если у вас цель - подготовиться к марафону или полумарафону , &nbsp; сначала приноровитесь к &nbsp;длине дистанции, а не &nbsp;к скорости и результату на время. Лучше пробежать длинную дистанцию с вашим собственным темпом. Когда будет легко получаться &nbsp;бегать на длинные расстояния, можно пробовать как-то ускоряться. &nbsp;с передышками, если тяжело. Вообще, меня учили что если вы не профессиональный спортсмен, то надо бегать в таком темпе, в каком вы могли бы поддерживать "спокойный" разговор)</p><p><br></p>', '1'),
(1756, 141, 373, '<p>Влияет самым лучшим образом.&nbsp;</p><p>Физически: лучшее самочувствие, заряд бодрости на день, интенсивный обмен веществ в организме )</p><p><br></p><p>В плане самоощущения: &nbsp;безусловно, бег этот тот вид активности, который &nbsp;помогает снимать стресс и поднимает самооценку!</p><p>Мозг точно очищается. Даже то, &nbsp;что ты встаешь и выходишь в 6 утра на пробежку. Вместе с &nbsp;солнцем, когда мир еще спит, &nbsp;есть что-то мотивирующее! Ты начал день раньше всех, ты уже с утра в чем-то преуспел) Есть время сосредоточиться и набраться сил перед трудовым днем.</p><p>В день, когда я делаю утреннюю пробежку - совершенно точно, моя производительность возрастает и, как ни странно, устаю за день я намного меньше!</p><p><br></p>', '1'),
(1757, 142, 371, '<p>Мне всегда нравилось бегать. Но на любительском уровне - моего энтузиазма на систематические занятия &nbsp;не хватало. Бегал редко, начинал регулярные тренировки, бросал.</p><p>Не помню уже , как у меня в голове появилась эта безумная мысль - пробежать марафон (42 км). Так бывает когда что-то приходит вам в голову и все меняется - вы точно знаете что сделаете это, и пока не сделаете - не успокоитесь :)</p><p>Сразу же появились силы и время на регулярные тренировки.</p><p>Рискнуть пробежать полумарафон я решил через полгода. В середине дистанции и в конце прошелся пешком, но все равно был доволен .</p><p>Невероятный жизненный и спортивный опыт!</p><p>Спустя еще несколько месяцев я повторил полумарафон, и уже преодолел всю дистанцию, все по-настоящему, &nbsp;1 час 32 минуты...</p><p>Большие изменения произошли в восприятии себя, осознания и исправления своих ошибок. И, конечно в том, как я ощущаю себя во время бега</p><p><br></p>', '1'),
(1758, 142, 372, '<p>В начале пути я пробовал читать разные книги, смотрел видео на тему бега.</p><p>Но как показал опыт: &nbsp;лучше один раз увидеть вживую, чем сто раз пересмотреть ролик на ютьюбе. Два -три занятия с тренером дают больше, чем все другие способы обучения. Главное - понять механику движения и работы тела. На базе этого, развивая этот фундамент регулярными &nbsp;тренировками, вы добьетесь &nbsp;любых желаемых успехов.</p><p><br></p><p><br></p>', '1'),
(1784, 143, 367, '<p>Я большая любительница сказок, фантастики и я с детства мечтала оказаться в волшебных мирах Толкиена и Гарри Поттера. Я влюбилась в квесты после первой же игры в "Побег из тюрьмы Синг-Синг". Сразу же захотелось попробовать самостоятельно воплотить в жизнь свои детские мечты.&nbsp;</p><p><br></p><p>Очень скоро мы поняли, что квестами стоит заниматься только под брендом "Клаустрофобия", первым и крупнейшим в этой индустрии.&nbsp;</p><p><br></p><p>Как житель Подмосковья, я сама всегда сталкивалась с проблемой, когда хочется отдохнуть с друзьями, но очень не хочется ехать в Москву. Поэтому я уверена, что в Королеве <b><a href="http://vk.com/phobiamsk">"Клаустрофобия"</a></b> будет пользоваться спросом и приносить нашим гостям столько же позитива, сколько эта сказка приносит нам.&nbsp;</p><p><br></p><p>Нам удалось воплотить в реальность волшебную сказку братьев Гримм "Гензель и Гретель", фактически мы построили целую избушку в жилом доме Королёва.&nbsp;</p><p>Квест получился совершенно уникальный - планировка пространства, декорации, контраст между пряничным миром и логовом ведьмы - все это приводит в восторг абсолютно всех игроков.&nbsp;</p><p><br></p><p>Мы с Андреем Саркисовым полгода воплощали эту сказку в жизнь и сейчас наконец понимаем, как сильно нам всем порой не хватает сказок и сколько радости они могут принести. Это ведь как детская мечта, оставшаяся мечтой: каждый из нас, будучи ребенком, представлял себя в роли героя сказки. Мы же даем возможность воплотить эту мечту в жизнь.&nbsp;</p>', '1'),
(1785, 143, 368, '<p>У каждой команды квест-мейкеров есть свои сильные стороны: кто-то придумывает сценарии, кто-то силен в инженерии квеста. Мы же, сосредоточившись на декорациях, наняли профессионального сценариста, который и написал квестовый вариант сказки. &nbsp;</p><p><br></p><p>Все фишки нашего квеста вы сможете понять, лишь поиграв и пережив его. Скажу лишь, что главное - это поверить в сказку и магию, отключиться от своих проблем, 21 века и погрузиться в этот волшебный мир.&nbsp;</p><p><br></p><p>Могу сказать, что все пряники в нашим квесте ручной работы, а их в нем больше 500 штук. Больше месяца мы выводили идеальный рецепт и три месяца безостановочно пекли, красили, декорировали... Многие из них можно смело назвать произведениями искусства.&nbsp;</p><p><br></p><p></p><p><img src="/web//upload/images/443c255c69de15e2577db6ecdb00b597.jpg" style="width: 562px; height: 281px;"></p><p><br></p><p>Квест получился уникальным в том числе благодаря совершенно нестандартной планировке, даже очень опытные игроки поражаются размерам нашей избушки.&nbsp;</p>', '1'),
(1786, 143, 369, '<p>Как-то, работая в субботу, я решила добавить кровавого антуража в одно из помещений квеста. Намешав краски и размазав ее по ладоням, я начала вдохновенно выводить руками по стенам следы детских ладошек.&nbsp;</p><p><br></p><p>Погрузившись в столь увлекательный процесс, я закрыла двери и в тот же момент вспомнила, что я в игре. Так я оказалась заперта в субботу вечером в самом дальнем помещении квеста.&nbsp;</p><p><br></p><p>Взывая к помощи инженера, который работал в операторской за четырьмя стенами от меня, я начала колотить по всем звонким предметам: трубе, горшкам, крышкам.... Пятнадцать минут таких шаманских танцев не привели ни к чему, кроме сорванного голоса.&nbsp;</p><p><br></p><p>Поняв, что пришло время менять стратегию, я, вздохнув, открыла окно и выпрыгнула в метель. Надо сказать, что одета я была по-рабочему: спортивки и майка. Вот так вот, в тонюсенькой майке, с окровавленными руками, я побежала под снегом вокруг дома ко входу в квест.&nbsp;</p><p><br></p><p>Когда же инженер увидел меня на пороге, трясущуюся и с бордовыми ладошками, он по-моему сначала подумал, что уснул за рабочим столом и ведьма похоже все-таки добралась до нас.&nbsp;</p>', '1'),
(1787, 143, 370, '<p>Отрасль развивается очень активно, "Клаустрофобия" уже открылась в таких европейских городах, как Таллин и Амстердам и в ближайшее время нам следует ожидать расцвет квестов по всей Европе: поиграть в Клаустрофобию можно будет в Вене, Берлине, Барселоне, Милане, Праге... Бренд активно выходит на американский рынок, хотя первые квесты других брендов там уже появились.</p><p><br></p><p>Что же касается более близких к нам территорий, могу сказать, что в России Клаустрофобия открывается или уже открыта практически в каждом крупном городе, от Тулы до Владивостока.&nbsp;</p><p><br></p><p>В данный момент начали активно открываться квесты в Подмосковье: Клаустрофобию уже можно посетить в Королеве и Химках, в ближайшее время ожидается открытие квеста "Гарри Поттер и Философский камень" в Мытищах.&nbsp;</p><p><br></p><p>Балашиха, Электросталь, Реутов, Люберцы - скоро у жителей Подмосковья появится возможность играть в квесты, не выезжая в Москву. При этом уже сейчас мы понимаем, что многим москвичам тоже удобно приехать поиграть в Королев.&nbsp;</p>', '1'),
(1788, 139, 344, '<p><b>1. &nbsp;Простота&nbsp;</b></p><p><br></p><p>Ясун стал проще.&nbsp;</p><p><span style="line-height: 1.45em;">Мы ушли от глобального интервью из 20+ вопросов. Когда мы запускали Ясун, то думали, что наводящие вопросы помогут авторам, которые не знают с чего начать свою историю. Однако, оказалось, что многим ближе короткие формат отзыва.</span><br></p><p><span style="line-height: 1.45em;">Любители крупных форм и жанра интервью по-прежнему могут высказываться&nbsp;<b><a href="https://yasoon.ru/#/interviews/">в тематических потоках</a>.</b></span></p><p><b><br></b></p><p><b>2. Легкие Отзывы вместо Интервью</b></p><p><br></p><p>Мы использовали опыт сайтов с отзывами о путешествиях, где люди рассказывают о достопримечательностях и странах.&nbsp;Мы добавили к историям "оценщики" - кнопки для голосования о Вашем впечатлении занятии тем или иным делом.&nbsp;</p><p><br></p><p>Мы решили представить профессиональный путь человека как путешествие.&nbsp;</p><p>Отправляйтесь в новые отрасли смелее. Все не так страшно, как кажется на первый взгляд. Опыт других путешественников Вам поможет!</p><p><br></p><p><span style="line-height: 1.45em;">Напишите отзывы о любых деятельностях, которыми Вы занимаетесь или когда-либо занимались. У каждого из нас в запасе есть ни одна деятельность, о которой есть, что рассказать.</span><br></p><p><br></p><p>Расскажите 4 истории: о том, как Вы бегаете по утрам, о том, как Вы играли в рок-группе в университете, о том, как сейчас на работе проектируете электромобили, попутно создавая свой стартап для он-лайн бронирования юрт у эскимосов на Крайнем Севере.&nbsp;</p><p><br></p><p>Ваш опыт поможет тем, кто ищет себя. Мы будем учитывать все знания, чтобы лучше понимать, какие потенциальные активности предлагать людям с определенными интересами.</p><p><br></p><p><b>3. Написать отзыв без регистрации</b></p><p><span style="line-height: 1.45em;">Наверху сайта теперь есть кнопка "написать обзор". С ее помощью Вы можете создать свой отзыв, даже не будучи залогиненным на Ясуне. Просто зайдите и напишите!</span><br></p><p>В этом случае Ваш обзор опубликуется на сайте в статусе анонимного. Расскажите все правду о Вашей работе, сорвите покровы!</p><p><br></p><p><b>4. Теги с узкой сегментацией по отраслям и занятиям</b></p><p><b><br></b></p><p>Количество категорий, или отраслей, на Ясуне выросло в 10 раз и будет продолжать расти по мере появления новых историй. Мы хотим охватить все уголки человеческой деятельности.</p><p>Вы можете написать обзор по своей узкой теме, например, "Классическая музыка" и быть уверенным, что Ваша история будет доставлена до правильной аудитории, которой интересна именно эта тема.&nbsp;</p><p><br></p><p>Ах да, мы сказали, что благодаря этому на Ясуне теперь есть поиск по сайту, который найдет для Вас ровно то, что Вы ищете?</p><p><br></p><p>Если Вы не нашли своей темы в каталоге, обязательно напишите нам на info@yasoon.ru, и мы ее добавим.</p><p><br></p><p><br></p><p></p><p><img src="/web/upload/content/d53badf990804829d335ed816e62a548.jpg" style=""></p><div><br></div>У всех бывают профессиональные кризисы. Мы хотим, чтобы Ясун доставлял Вам <i>правильные истории</i> в правильные моменты времени. Что значит <i>правильные истории</i>? Те, которые будут полезны и подбодрят Вас в конкретной ситуации.&nbsp;<div><span style="line-height: 1.45em;"><br></span></div><div><span style="line-height: 1.45em;">Кто-то уже проходил этот путь до Вас, и может дать дельный совет. Что-то Вы знали сами, но забыли.&nbsp;</span></div><div><span style="line-height: 1.45em;">Мы стремимся сделать Ясун дружественным советником, который в случае профессионального кризиса, поможет Вам ответить на вопрос:</span><br></div><div><p></p><p>&nbsp;</p><blockquote>"ОК, Ясун... Чем бы мне заняться новеньким &nbsp;с учетом всего моего опыта?"</blockquote><p><br></p></div>', '0');

-- --------------------------------------------------------

--
-- Table structure for table `post_category`
--

CREATE TABLE IF NOT EXISTS `post_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=1638 AUTO_INCREMENT=343 ;

--
-- Dumping data for table `post_category`
--

INSERT INTO `post_category` (`id`, `post_id`, `category_id`) VALUES
(120, 50, 60),
(121, 51, 60),
(124, 53, 62),
(130, 53, 53),
(148, 49, 85),
(149, 55, 61),
(150, 56, 54),
(151, 57, 85),
(154, 57, 61),
(155, 49, 61),
(156, 58, 79),
(157, 59, 58),
(158, 59, 76),
(160, 60, 72),
(162, 60, 56),
(164, 61, 61),
(165, 62, 1),
(166, 62, 11),
(168, 62, 19),
(171, 65, 53),
(172, 65, 62),
(173, 66, 56),
(181, 74, 56),
(189, 74, 59),
(192, 75, 54),
(197, 76, 60),
(207, 76, 91),
(208, 75, 66),
(210, 78, 71),
(214, 79, 20),
(215, 80, 56),
(216, 80, 62),
(217, 80, 53),
(218, 81, 60),
(219, 81, 60),
(220, 82, 58),
(223, 85, 0),
(224, 86, 56),
(225, 86, 72),
(227, 88, 58),
(240, 100, 60),
(241, 101, 21),
(243, 103, 54),
(245, 105, 60),
(246, 106, 6),
(247, 107, 6),
(251, 110, 20),
(252, 111, 20),
(253, 112, 6),
(255, 113, 54),
(259, 114, 20),
(260, 115, 68),
(261, 115, 54),
(262, 116, 54),
(263, 117, 44),
(264, 118, 44),
(265, 119, 54),
(267, 120, 10),
(268, 120, 11),
(270, 121, 59),
(272, 121, 80),
(283, 126, 60),
(289, 129, 59),
(291, 130, 74),
(292, 130, 57),
(298, 133, 60),
(299, 134, 60),
(301, 136, 61),
(302, 137, 61),
(303, 138, 56),
(304, 103, 68),
(305, 50, 82),
(306, 51, 82),
(307, 55, 85),
(308, 56, 68),
(309, 58, 59),
(310, 61, 84),
(311, 66, 72),
(312, 78, 55),
(313, 82, 78),
(314, 88, 76),
(315, 105, 81),
(316, 116, 66),
(317, 119, 93),
(318, 126, 91),
(319, 129, 79),
(320, 133, 89),
(321, 134, 89),
(322, 138, 72),
(323, 136, 86),
(324, 139, 53),
(325, 139, 54),
(326, 139, 55),
(327, 139, 56),
(328, 139, 57),
(329, 139, 58),
(330, 139, 59),
(331, 139, 60),
(332, 139, 61),
(333, 140, 77),
(334, 140, 117),
(335, 140, 58),
(336, 141, 58),
(337, 141, 77),
(338, 141, 117),
(339, 142, 58),
(340, 142, 77),
(341, 142, 117),
(342, 143, 54);

-- --------------------------------------------------------

--
-- Table structure for table `post_likes`
--

CREATE TABLE IF NOT EXISTS `post_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `user_ip` varchar(20) NOT NULL,
  `last_date` datetime NOT NULL,
  `count_likes` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=1365 AUTO_INCREMENT=251 ;

--
-- Dumping data for table `post_likes`
--

INSERT INTO `post_likes` (`id`, `post_id`, `author_id`, `user_ip`, `last_date`, `count_likes`) VALUES
(1, 7, 192, '0', '2014-08-13 23:50:11', 1),
(2, 7, 0, '83.220.239.75', '2014-08-26 00:34:22', 5),
(3, 15, 0, '37.144.189.45', '2014-08-25 12:10:46', 2),
(4, 12, 0, '37.144.189.45', '2014-08-24 23:11:24', 3),
(5, 15, 192, '0', '2014-08-25 12:11:00', 2),
(6, 12, 0, '93.10.155.159', '2014-08-22 20:29:24', 1),
(8, 12, 0, '93.170.155.159', '2014-08-22 20:36:03', 1),
(9, 12, 0, '93.170.155.159', '2014-08-22 20:36:09', 1),
(10, 16, 0, '77.244.212.61', '2014-08-28 11:41:23', 3),
(11, 16, 216, '0', '2014-08-25 12:10:17', 1),
(12, 12, 232, '0', '2014-08-29 09:44:52', 1),
(13, 17, 232, '0', '2014-08-29 17:54:50', 1),
(16, 65, 262, '0', '2014-10-07 22:44:23', 1),
(17, 65, 0, '178.255.200.61', '2014-10-12 22:04:02', 3),
(18, 53, 0, '178.124.203.249', '2014-10-09 21:34:58', 1),
(19, 57, 0, '178.255.200.61', '2014-10-15 02:45:57', 2),
(20, 74, 0, '93.80.37.46', '2014-10-28 22:33:02', 2),
(21, 74, 192, '0', '2014-10-19 00:24:23', 4),
(22, 75, 0, '77.244.212.61', '2014-10-23 23:59:38', 6),
(23, 76, 229, '0', '2014-10-19 17:32:24', 3),
(24, 76, 0, '93.80.37.46', '2014-10-19 21:36:39', 1),
(25, 75, 283, '0', '2014-10-19 22:26:50', 1),
(26, 78, 0, '77.244.212.61', '2014-10-20 19:07:41', 1),
(27, 66, 0, '77.244.212.61', '2014-11-15 13:07:29', 2),
(28, 66, 192, '0', '2014-10-20 19:43:56', 1),
(29, 78, 192, '0', '2015-04-06 23:55:30', 2),
(30, 50, 0, '5.18.175.42', '2014-10-21 00:21:51', 1),
(31, 79, 0, '37.144.177.69', '2014-10-24 18:49:15', 1),
(32, 79, 229, '0', '2014-10-24 21:30:04', 1),
(33, 80, 0, '37.144.177.69', '2014-10-27 15:27:26', 2),
(34, 61, 0, '75.83.145.29', '2014-10-25 01:06:54', 1),
(35, 49, 0, '217.118.78.33', '2014-10-27 00:25:07', 1),
(36, 81, 0, '37.144.177.69', '2014-10-29 14:03:08', 2),
(37, 82, 0, '95.27.235.174', '2014-10-31 00:40:01', 1),
(38, 82, 0, '178.255.200.61', '2014-11-10 17:30:03', 2),
(40, 49, 0, '94.230.167.232', '2014-11-02 21:56:19', 1),
(41, 55, 0, '188.143.149.125', '2014-11-04 21:16:11', 1),
(42, 81, 192, '0', '2014-11-12 22:37:32', 1),
(43, 75, 0, '31.207.75.83', '2014-11-16 17:48:49', 1),
(44, 57, 0, '213.87.143.21', '2014-11-18 20:51:55', 1),
(45, 62, 0, '176.213.127.9', '2014-11-18 21:17:41', 1),
(46, 86, 0, '109.188.127.73', '2014-11-19 01:12:17', 1),
(47, 88, 0, '109.188.124.11', '2014-11-19 21:38:47', 1),
(48, 86, 0, '109.188.124.9', '2014-11-19 23:14:11', 1),
(49, 88, 0, '217.66.159.104', '2014-11-20 12:36:28', 1),
(50, 57, 307, '0', '2014-11-20 16:55:34', 1),
(51, 56, 0, '195.230.85.5', '2014-11-21 14:49:13', 1),
(52, 100, 0, '109.188.125.221', '2014-11-21 21:45:31', 1),
(53, 81, 264, '0', '2014-11-23 01:03:46', 1),
(54, 61, 0, '217.66.158.90', '2014-11-24 08:14:56', 1),
(55, 100, 0, '109.188.126.175', '2014-11-24 23:57:37', 1),
(56, 101, 259, '0', '2014-11-27 10:37:08', 1),
(57, 100, 0, '84.201.230.196', '2014-12-01 22:14:35', 1),
(58, 88, 0, '46.158.51.15', '2014-12-03 00:44:35', 1),
(59, 88, 0, '5.228.250.65', '2014-12-05 12:48:57', 1),
(60, 100, 0, '5.228.250.65', '2014-12-05 12:49:08', 1),
(61, 51, 325, '0', '2014-12-06 19:09:38', 1),
(62, 88, 326, '0', '2014-12-07 03:42:33', 1),
(63, 103, 0, '178.255.200.61', '2015-01-19 18:00:47', 2),
(64, 103, 0, '109.188.125.66', '2014-12-12 00:34:12', 1),
(65, 103, 0, '77.244.212.61', '2015-01-02 11:06:06', 2),
(66, 103, 0, '109.188.125.70', '2014-12-15 01:12:16', 1),
(67, 88, 0, '5.18.118.141', '2014-12-15 20:41:36', 1),
(68, 53, 0, '195.70.205.179', '2014-12-16 18:06:26', 1),
(69, 86, 0, '5.18.84.16', '2014-12-19 02:53:55', 1),
(70, 59, 0, '5.18.84.16', '2014-12-19 02:56:56', 1),
(71, 57, 0, '81.88.222.83', '2014-12-20 12:45:54', 1),
(72, 88, 0, '81.88.222.83', '2014-12-20 12:48:10', 1),
(73, 57, 0, '5.18.96.36', '2014-12-21 18:47:26', 1),
(74, 86, 335, '0', '2014-12-21 19:01:00', 1),
(75, 57, 0, '178.70.181.170', '2014-12-21 20:25:57', 1),
(76, 103, 0, '83.220.239.12', '2014-12-22 01:09:39', 1),
(77, 49, 0, '89.110.32.71', '2014-12-22 12:57:12', 1),
(78, 107, 0, '109.188.124.18', '2014-12-24 00:26:31', 1),
(79, 107, 0, '188.143.149.125', '2014-12-24 01:08:05', 1),
(80, 107, 0, '77.244.212.61', '2014-12-24 09:24:28', 1),
(81, 105, 0, '178.255.200.61', '2014-12-24 13:44:13', 1),
(82, 105, 0, '89.110.32.71', '2014-12-24 19:00:33', 1),
(83, 107, 0, '62.76.98.10', '2014-12-25 03:31:34', 1),
(84, 107, 0, '81.88.222.83', '2014-12-25 15:13:20', 1),
(85, 86, 192, '0', '2014-12-25 16:11:28', 1),
(86, 105, 192, '0', '2014-12-25 16:13:05', 1),
(87, 110, 338, '0', '2014-12-25 16:21:31', 1),
(88, 111, 338, '0', '2014-12-25 16:25:44', 1),
(89, 111, 192, '0', '2014-12-25 16:34:21', 1),
(90, 57, 0, '78.25.120.26', '2014-12-25 20:05:48', 1),
(91, 49, 0, '78.25.120.26', '2014-12-25 20:07:26', 1),
(92, 107, 334, '0', '2015-02-19 16:48:37', 2),
(93, 103, 0, '178.70.135.245', '2014-12-26 01:42:02', 1),
(94, 49, 334, '0', '2015-02-19 16:49:05', 2),
(95, 86, 0, '213.87.143.162', '2014-12-27 12:06:07', 1),
(96, 112, 0, '109.188.125.2', '2014-12-28 01:24:29', 1),
(97, 103, 192, '0', '2015-03-29 19:42:17', 3),
(98, 103, 334, '0', '2014-12-28 13:52:55', 1),
(99, 113, 0, '109.188.126.5', '2014-12-29 00:34:43', 1),
(100, 49, 0, '212.98.165.216', '2014-12-29 13:37:46', 1),
(101, 113, 334, '0', '2014-12-29 20:35:51', 1),
(102, 112, 334, '0', '2015-02-19 16:48:35', 3),
(103, 113, 0, '109.188.124.4', '2014-12-29 23:31:46', 1),
(104, 113, 0, '178.255.200.61', '2014-12-30 17:01:46', 1),
(105, 114, 0, '178.255.200.61', '2014-12-30 19:17:26', 1),
(106, 103, 0, '178.162.203.245', '2014-12-31 14:17:30', 1),
(107, 115, 0, '178.255.200.61', '2014-12-31 18:20:39', 1),
(108, 116, 0, '109.188.127.6', '2015-01-03 02:18:40', 1),
(109, 115, 0, '178.70.181.184', '2015-01-03 13:16:01', 1),
(110, 116, 0, '178.70.181.184', '2015-01-03 13:38:14', 1),
(111, 116, 0, '83.149.8.188', '2015-01-03 14:50:52', 1),
(112, 116, 0, '77.244.212.61', '2015-01-03 14:51:06', 1),
(113, 115, 0, '81.88.222.83', '2015-01-03 22:32:17', 1),
(114, 103, 0, '80.247.189.68', '2015-01-04 16:28:49', 1),
(115, 116, 0, '109.252.26.208', '2015-01-05 11:10:30', 1),
(116, 116, 0, '109.188.124.25', '2015-01-06 00:56:10', 1),
(117, 115, 0, '109.188.124.25', '2015-01-06 00:58:32', 1),
(118, 113, 192, '0', '2015-01-07 13:54:55', 1),
(119, 74, 0, '81.88.222.83', '2015-01-16 11:26:31', 1),
(120, 82, 0, '5.18.102.250', '2015-01-18 11:18:18', 1),
(121, 115, 0, '178.70.137.19', '2015-01-21 00:12:21', 1),
(122, 119, 192, '0', '2015-01-22 02:23:19', 1),
(123, 119, 363, '0', '2015-01-22 16:03:16', 1),
(124, 51, 220, '0', '2015-01-23 03:49:17', 1),
(125, 120, 192, '0', '2015-01-23 15:24:07', 1),
(126, 121, 192, '0', '2015-01-25 19:36:41', 2),
(127, 123, 0, '109.188.125.3', '2015-01-23 23:04:44', 1),
(128, 122, 0, '109.188.125.3', '2015-01-23 23:25:19', 1),
(129, 122, 369, '0', '2015-01-24 02:30:59', 1),
(130, 123, 369, '0', '2015-01-24 02:31:01', 1),
(131, 121, 0, '109.188.125.7', '2015-01-24 15:41:10', 1),
(132, 121, 0, '178.71.210.4', '2015-01-25 14:47:43', 1),
(133, 121, 334, '0', '2015-01-25 19:50:37', 1),
(134, 88, 0, '109.167.200.231', '2015-01-25 21:41:24', 1),
(135, 125, 0, '94.19.249.109', '2015-01-25 22:40:37', 1),
(136, 125, 192, '0', '2015-01-26 00:23:44', 1),
(137, 126, 192, '0', '2015-01-26 01:37:45', 1),
(138, 126, 349, '0', '2015-01-26 01:46:44', 1),
(139, 126, 0, '213.87.134.106', '2015-01-26 09:30:57', 1),
(140, 127, 377, '0', '2015-01-26 09:50:33', 1),
(141, 126, 0, '178.255.200.61', '2015-01-26 17:52:53', 1),
(142, 101, 0, '178.255.200.61', '2015-01-26 18:07:06', 1),
(143, 119, 0, '188.227.20.161', '2015-01-26 22:55:33', 1),
(144, 119, 0, '188.227.20.154', '2015-02-14 14:40:15', 2),
(145, 119, 0, '78.25.123.230', '2015-01-26 23:02:50', 1),
(146, 119, 406, '0', '2015-01-26 23:03:40', 1),
(147, 119, 0, '188.227.20.147', '2015-01-26 23:16:00', 1),
(148, 119, 0, '188.227.20.157', '2015-01-26 23:16:18', 1),
(149, 119, 0, '188.227.20.170', '2015-01-26 23:18:25', 1),
(150, 119, 0, '188.227.20.180', '2015-01-26 23:24:15', 1),
(151, 119, 0, '178.67.64.153', '2015-01-26 23:39:21', 1),
(152, 53, 0, '95.161.239.151', '2015-01-27 11:24:31', 1),
(153, 121, 0, '89.110.32.71', '2015-02-02 18:44:46', 2),
(154, 129, 0, '178.255.200.61', '2015-01-27 16:42:29', 1),
(155, 130, 0, '178.255.200.61', '2015-01-28 18:06:01', 2),
(156, 130, 0, '213.87.138.3', '2015-01-27 17:37:52', 1),
(157, 119, 0, '93.170.121.1', '2015-01-27 18:12:55', 1),
(158, 121, 0, '78.37.150.100', '2015-01-27 19:21:10', 1),
(159, 130, 0, '91.219.180.214', '2015-01-27 20:20:04', 1),
(160, 126, 405, '0', '2015-01-27 22:46:26', 1),
(161, 130, 0, '83.220.239.105', '2015-01-28 00:01:15', 1),
(162, 131, 0, '83.220.239.105', '2015-01-28 00:03:07', 1),
(163, 131, 0, '178.70.167.44', '2015-01-28 00:16:01', 1),
(164, 121, 0, '95.161.239.151', '2015-01-28 00:21:53', 1),
(165, 121, 0, '77.67.180.170', '2015-01-28 18:23:32', 1),
(166, 131, 0, '178.255.200.61', '2015-01-28 18:24:56', 1),
(167, 119, 0, '95.25.36.39', '2015-01-28 18:34:21', 1),
(168, 131, 0, '178.70.191.118', '2015-01-28 19:49:58', 1),
(169, 131, 363, '0', '2015-01-28 22:59:22', 1),
(170, 121, 0, '77.67.177.59', '2015-01-29 00:56:21', 1),
(171, 131, 0, '89.110.32.71', '2015-01-29 12:34:13', 1),
(172, 130, 0, '94.100.85.206', '2015-01-29 14:01:13', 1),
(173, 82, 0, '94.100.85.206', '2015-01-29 16:43:20', 1),
(174, 124, 0, '193.111.255.235', '2015-01-30 00:41:58', 1),
(175, 121, 0, '109.246.167.43', '2015-01-30 08:22:15', 1),
(176, 119, 0, '176.99.71.119', '2015-01-30 20:36:28', 1),
(177, 129, 192, '0', '2015-01-31 14:06:19', 1),
(178, 126, 0, '178.70.173.27', '2015-01-31 17:51:35', 1),
(179, 132, 0, '91.65.158.111', '2015-02-02 19:03:56', 1),
(180, 133, 0, '78.37.156.164', '2015-02-02 22:35:42', 1),
(181, 132, 0, '178.71.212.221', '2015-02-02 22:47:37', 1),
(182, 133, 0, '109.188.126.21', '2015-02-02 23:41:12', 1),
(183, 121, 0, '77.244.212.61', '2015-02-03 01:46:30', 1),
(184, 130, 0, '77.244.212.61', '2015-02-03 01:54:19', 1),
(185, 133, 0, '89.110.32.71', '2015-02-03 11:57:30', 1),
(186, 133, 0, '109.188.127.5', '2015-02-04 00:06:16', 1),
(187, 133, 422, '0', '2015-02-04 13:53:05', 1),
(188, 134, 0, '89.110.32.71', '2015-02-13 13:41:34', 2),
(189, 134, 0, '178.255.200.61', '2015-02-04 19:07:52', 1),
(190, 134, 0, '178.70.160.99', '2015-02-05 00:59:19', 1),
(191, 134, 0, '109.205.249.166', '2015-02-05 13:25:00', 1),
(192, 134, 420, '0', '2015-02-05 16:24:17', 1),
(193, 133, 0, '46.39.232.17', '2015-02-05 18:50:51', 1),
(194, 134, 0, '178.70.167.114', '2015-02-07 17:33:55', 1),
(195, 135, 409, '0', '2015-02-07 19:04:40', 1),
(196, 135, 0, '62.118.135.62', '2015-02-07 19:06:24', 1),
(197, 135, 0, '78.25.123.84', '2015-02-07 19:53:37', 1),
(198, 112, 0, '94.50.5.160', '2015-02-10 17:38:18', 1),
(199, 134, 417, '0', '2015-02-12 13:06:49', 1),
(200, 136, 0, '77.244.212.61', '2015-02-15 21:47:18', 1),
(201, 137, 0, '83.220.238.249', '2015-02-15 22:30:08', 1),
(202, 134, 0, '77.244.212.61', '2015-02-15 23:40:56', 1),
(203, 137, 0, '109.188.127.13', '2015-02-15 23:41:44', 1),
(204, 136, 0, '109.188.127.13', '2015-02-15 23:41:45', 1),
(205, 137, 0, '178.255.200.61', '2015-02-18 15:37:41', 1),
(206, 120, 0, '178.255.200.61', '2015-02-19 10:15:49', 1),
(207, 137, 0, '89.110.32.71', '2015-02-19 16:47:55', 1),
(208, 119, 0, '89.110.32.71', '2015-02-19 17:09:30', 1),
(209, 137, 0, '78.25.120.94', '2015-02-19 19:42:57', 1),
(210, 49, 0, '178.70.183.32', '2015-02-19 20:53:56', 1),
(211, 138, 192, '0', '2015-02-21 23:56:48', 1),
(212, 49, 0, '78.25.123.178', '2015-02-22 14:56:48', 1),
(213, 136, 192, '0', '2015-02-23 17:12:54', 1),
(214, 65, 0, '95.153.180.87', '2015-02-24 23:51:22', 1),
(215, 138, 0, '178.255.200.61', '2015-02-26 18:58:31', 1),
(216, 137, 0, '109.86.124.209', '2015-03-03 20:15:49', 1),
(217, 88, 0, '87.239.29.114', '2015-03-10 22:36:59', 1),
(218, 133, 0, '195.82.56.39', '2015-03-20 20:31:33', 1),
(219, 121, 0, '81.88.222.83', '2015-03-24 12:33:43', 1),
(220, 119, 0, '81.88.222.83', '2015-03-24 12:35:29', 1),
(221, 134, 0, '81.88.222.83', '2015-03-24 12:47:54', 1),
(222, 103, 0, '194.85.9.14', '2015-03-25 12:15:17', 1),
(223, 112, 0, '89.184.29.142', '2015-03-27 13:07:36', 1),
(224, 130, 192, '0', '2015-03-28 02:35:30', 1),
(225, 136, 0, '174.108.113.31', '2015-03-29 00:11:13', 1),
(226, 139, 192, '0', '2015-03-29 21:15:46', 1),
(227, 139, 0, '188.162.64.15', '2015-04-02 19:54:26', 1),
(228, 140, 442, '0', '2015-04-05 19:52:39', 1),
(229, 127, 0, '109.188.127.12', '2015-04-05 19:55:13', 1),
(230, 139, 0, '89.110.32.71', '2015-04-06 13:12:47', 1),
(231, 139, 0, '77.244.212.61', '2015-04-08 19:13:42', 1),
(232, 140, 0, '109.188.124.14', '2015-04-08 19:55:20', 1),
(233, 141, 443, '0', '2015-04-08 20:33:50', 1),
(234, 142, 444, '0', '2015-04-09 19:59:36', 1),
(235, 142, 334, '0', '2015-04-10 12:36:25', 1),
(236, 140, 192, '0', '2015-04-13 00:56:54', 1),
(237, 143, 0, '109.188.125.7', '2015-04-18 01:19:11', 1),
(238, 143, 192, '0', '2015-04-22 14:54:52', 3),
(239, 143, 0, '109.188.127.11', '2015-04-19 00:21:42', 1),
(240, 142, 0, '109.124.104.234', '2015-04-21 14:10:14', 1),
(241, 120, 0, '109.124.104.234', '2015-04-21 14:12:52', 1),
(242, 112, 0, '109.62.166.154', '2015-05-17 22:40:31', 1),
(243, 113, 0, '95.140.92.169', '2015-05-20 02:00:36', 1),
(244, 86, 0, '195.191.73.48', '2015-08-02 23:52:05', 1),
(245, 141, 0, '91.211.144.5', '2015-09-18 15:56:26', 1),
(246, 57, 0, '83.222.218.121', '2015-10-19 16:56:27', 1),
(247, 61, 0, '93.187.187.15', '2015-12-23 18:53:37', 1),
(248, 133, 0, '46.98.106.225', '2016-01-08 16:52:28', 1),
(249, 129, 0, '93.170.148.48', '2016-06-30 15:08:28', 1),
(250, 78, 0, '93.187.187.211', '2016-08-18 11:45:55', 1);

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE IF NOT EXISTS `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `ask_authorId` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  `answer` text COLLATE utf8_unicode_ci,
  `notified` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  KEY `IDX_B6F7494EF675F31B` (`author_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AVG_ROW_LENGTH=16384 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `author_id`, `ask_authorId`, `date`, `text`, `answer`, `notified`) VALUES
(2, 232, 192, '2014-09-28 21:39:55', 'Какой самый сложный объект тебе приходилось запускать и как это было?', 'Всегда в момент начала работы над новым объектом, объект кажется очень сложным. А в момент окончания работы все кажется элементарным и абсолютно понятным. Поэтому наиболее сложным объектом я считаю новый объект. Ну а если вспомнить наиболее интересные объекты, то в первую очередь вспоминаются объекты на металлургических предприятиях. Например: вагоноопрокидователь - устройство для опрокидования железнодорожного вагона с целью высыпания груза. Поражает как человек с помощью небольшого джойстика управляет механизмом около ста тон (плюс вес груженого жд. вагона порядка 82-х тон). С технической же точки зрения наиболее интересным объектом в практике является наладка объекта реализованного на базе платформы Гью-Стюарта. Данный объект обладает 6-ю степенями свободы что является достаточно сложным для управления.', 0),
(3, 233, 192, '2014-09-28 21:39:55', 'Верите ли вы в работу теоретических моделей на реальном рынке? Могу ли академические знания в риск-менеджменте помочь в реальной жизни, или в ней важно что-то другое?', 'Периодически верю, а периодически полностью в них разочаровываюсь. Думаю, что модели (дошедшие до практиков и мне известные) пока еще не в состоянии достаточно точно описать рыночные процессы. Но это отрасль науки молодая, над ней много работают может что-то интересное и получится. (Но повторюсь, вряд ли смогут делать прогнозы). Отличные книжки о слепой вере в мат. модели Нассим Талеб "Черный лебедь" и "Одураченные случайностью". А про академические знания... Как и в любой другой сфере академические (научные) знания часто далеки от реальной жизни. Вроде бы умение брать интегралы и подробные знания по классификации насекомых не помогает лучше парковаться, планировать свой домашний бюджет или выбирать средство от комаров.', 0),
(4, 283, 229, '2014-10-19 17:58:03', 'Хотелось бы увидеть Ваши работы. Вставьте в текст несколько фотографий пожалуйста. ', NULL, 0),
(5, 229, 283, '2014-10-19 22:48:16', 'Я испытываю дискомфорт, когда издали глядя на растение, украшающее какой либо интерьер, не могу сразу определить, искуственное оно или живое. Мне становится страшновато от мысли, что имитации могут внедряться в окружающий меня мир, а я этого могу и не заметить. Может придумаете программу тренажер, чтобы развивать это умение различать?', 'Лучшего тренажера,  чем человек со своими органами чувств и умом вряд ли можно создать. По крайней мере на современном уровне развития компьютерного анализа изображений. Подойдя ближе все равно отличишь искусственное от живого.: слишком уж искусственное совершенно, и блеск не тот, и на ощупь не так и не пахнет землей. А если не отличишь, то может этого тебе и не нужно?', 0),
(6, 192, 234, '2014-10-20 15:34:40', 'Иван, а как ты думаешь, эта история побудить людей отдать деньги тебе в управление?', 'Я думаю, что идеи и  темы из этой истории я бы включил в годовые письма акционерам своего хедж-фонда или что-то подобное.\n', 0),
(7, 342, 192, '2015-01-07 13:49:01', 'Марго,  а верно ли что правильном уходе  картина или другой предмет старины будет жить вечно?  Или у каждого объекта старины  есть свой предел , после которого дальнейшая реставрация начинает вредить,  а не спасать?', 'Конечно произведения изнашиваются и зависит от предмета. Например, у нас реставрируют книги. Сохранность книги зависит от техники изготовления и книга 16 века может быть сохраннее книги 20-х годов 20-го века, т.к. тогда была бедность, у книг плохое качество и они просто на руках рассыпаются...\nТакже я узнала, что вещам очень вредит постоянное экспонирование. И часто если вещь только что выставлялась, делают перерыв и потом выставляют другую, аналогичную. У нас реставрируют графику, и графику вообще очень сложно держать много на выставках - акварель выцветает, бумага деформируется и т.д.', 0),
(8, 338, 192, '2015-01-07 13:51:33', 'Можно ли сделать эффективного продажника из нелюдимого интроверта?  Продажа - это больше "технология", которую можно отработать, или все-таки больше искусство -  кому-то дано, а кому-то нет?', 'Привет!\n\nХороший вопрос. Человек не будет хорошо продавать, хорошо рисовать или хорошо конструировать промышленное оборудование, если эта деятельность не созвучна его природе. Так и умение продавать - лишь одно из умений, но не лучше или не хуже, чем перечисленные. Надо этого интроверта сперва спросить - а чего он, интроверт, собственно, сам хочет?', 1),
(9, 404, 377, '2015-01-26 09:55:14', 'А чем зарабатывает на жизнь на Кипре ваш муж? ', NULL, 0),
(10, 405, 192, '2015-01-29 14:21:47', 'Елизавета , а какую историю преподают в Финляндии и почему вы не хотели ее преподавать?', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE IF NOT EXISTS `reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `likes` int(11) NOT NULL DEFAULT '0',
  `visits` int(11) NOT NULL DEFAULT '0',
  `expert` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `rating` smallint(2) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `question1` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `question2` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0',
  `prospects` int(11) DEFAULT '1',
  `status` enum('draft','saved') COLLATE utf8_unicode_ci DEFAULT 'saved',
  PRIMARY KEY (`id`),
  KEY `IDX_5A8A6C8DF675F31B` (`author_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `author_id`, `category_id`, `title`, `text`, `date`, `likes`, `visits`, `expert`, `rating`, `description`, `question1`, `question2`, `prospects`, `status`) VALUES
(1, 0, 64, '1', '<p>1</p>', '2015-05-29 00:09:37', 0, 0, '1', 5, '1', '0', '0', 4, 'draft'),
(2, 0, 64, '1', '<p>1</p>', '2015-05-29 00:09:44', 0, 0, '1', 5, '1', '0', '0', 4, 'draft');

-- --------------------------------------------------------

--
-- Table structure for table `reviews_timeline`
--

CREATE TABLE IF NOT EXISTS `reviews_timeline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `review_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `review_likes`
--

CREATE TABLE IF NOT EXISTS `review_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `review_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `user_ip` varchar(20) NOT NULL,
  `last_date` datetime NOT NULL,
  `count_likes` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=1365 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `review_types`
--

CREATE TABLE IF NOT EXISTS `review_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `review_types`
--

INSERT INTO `review_types` (`id`, `name`, `description`) VALUES
(1, 'учился(лась) этому', 'учился(лась) этому'),
(2, 'работал(а)', 'работал(а)'),
(3, 'интересуюсь темой', 'интересуюсь темой');

-- --------------------------------------------------------

--
-- Table structure for table `review_types_relation`
--

CREATE TABLE IF NOT EXISTS `review_types_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `review_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=19 ;

--
-- Dumping data for table `review_types_relation`
--

INSERT INTO `review_types_relation` (`id`, `review_id`, `type_id`) VALUES
(5, 3, 1),
(6, 3, 2),
(7, 4, 3),
(8, 5, 1),
(9, 5, 3),
(12, 6, 2),
(13, 6, 3),
(14, 7, 1),
(15, 8, 1),
(16, 8, 2),
(17, 1, 2),
(18, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `story_of_the_day`
--

CREATE TABLE IF NOT EXISTS `story_of_the_day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `assigned` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AVG_ROW_LENGTH=8192 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `story_of_the_day`
--

INSERT INTO `story_of_the_day` (`id`, `post_id`, `assigned`) VALUES
(1, 2, '2014-08-07 23:31:38'),
(2, 7, '2014-08-13 23:44:06'),
(5, 57, '2014-08-13 23:44:06'),
(6, 57, '2014-10-05 01:20:22'),
(7, 57, '2014-10-12 23:16:42'),
(8, 57, '2014-10-13 00:17:48'),
(9, 57, '2014-10-14 00:16:38'),
(10, 57, '2014-10-16 01:21:41'),
(11, 103, '2014-12-28 02:12:25'),
(12, 121, '2015-01-25 20:57:07');

-- --------------------------------------------------------

--
-- Table structure for table `timeline`
--

CREATE TABLE IF NOT EXISTS `timeline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `posts_count` int(11) NOT NULL,
  `answers_count` int(11) NOT NULL,
  `questions_count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `timeline`
--

INSERT INTO `timeline` (`id`, `author_id`, `posts_count`, `answers_count`, `questions_count`) VALUES
(1, 234, 0, 0, 0),
(2, 245, 0, 0, 0),
(3, 259, 0, 0, 0),
(4, 310, 0, 0, 0),
(5, 192, 0, 0, 0);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `FK_5A8A6C8DF675F31B` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`);

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `FK_B6F7494EF675F31B` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
