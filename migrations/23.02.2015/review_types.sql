CREATE TABLE IF NOT EXISTS `review_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

INSERT INTO `review_types` (`id`, `name`, `description`) VALUES
(1, 'учился этому', 'учился этому'),
(2, 'профессионально занимаюсь', 'профессионально занимаюсь'),
(3, 'интересуюсь темой', 'интересуюсь темой');