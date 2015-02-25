DROP TABLE IF EXISTS `reviews`;

CREATE TABLE IF NOT EXISTS `reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `likes` int(11) NOT NULL DEFAULT '0',
  `visits` int(11) NOT NULL DEFAULT '0',
  `review_type_id` int(11) NOT NULL DEFAULT '0',
  `expert` enum('0', '1') DEFAULT '0',
  `rating` smallint(2),
  PRIMARY KEY (`id`),
  KEY `IDX_5A8A6C8DF675F31B` (`author_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;