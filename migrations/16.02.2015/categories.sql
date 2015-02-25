DROP TABLE `categories`;

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `lft` int(11),
  `lvl` int(11),
  `rgt` int(11),
  `root` int(11),
  `parent_id` int(11),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `description`, `lft`, `rgt`, `root`, `parent_id`) VALUES
(1, 'Безопасность', 'Все о безопасности', ),
(2, 'Дизайн', 'Тут творчиства не занимать'),
(3, 'Добыча полезных ископаемых', 'Для тех кто любит нефть'),
(4, 'Интернет', 'нтернет он и в Африке интернет'),
(5, 'Искусство', 'Любителям искуства'),
(6, 'Медиа', 'Все начиная от фильмов и заканчивая дудками'),
(7, 'Медицина', ''),
(8, 'Музыка', 'Для людей с музыкальным слухом'),
(9, 'Наука', 'Ученым'),
(10, 'Образование', 'Всем кому интиресно обучение'),
(11, 'Право', 'Что бы знать хоть парочку законов'),
(12, 'Природа и животные', 'Любителям всего живого'),
(13, 'Программирование', 'Ну это святое, как не крути'),
(14, 'Производство', 'Специально для самоделкиных'),
(15, 'Психология и тренинги', 'Для тех кто любит отдыхать'),
(16, 'Развлечения и туризм', 'Про всякие машинки и телефончики'),
(17, 'Строительство и недвижимость', 'Про всякие машинки и телефончики'),
(18, 'Технологии', 'Все услуги которые вообще можно представить'),
(19, 'Транспорт и связь', 'Деньги, они всем нужны'),
(20, 'Услуги', 'Для тех кто любит создавать красоту из подручных предметов'),
(21, 'Финансы', 'Финансы'),
(22, 'Работать руками', 'Работать руками'),
(23, 'Спорт', 'Спорт');