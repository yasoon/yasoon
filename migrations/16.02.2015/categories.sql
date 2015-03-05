DROP TABLE `categories`;

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `lvl` int(11),
  `path` text,
  `parent_id` int(11),
  PRIMARY KEY (`id`),
  FOREIGN KEY (`parent_id`) REFERENCES categories(id)
	     ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;