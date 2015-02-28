DROP TABLE IF EXISTS `reviews_timeline`;
CREATE TABLE IF NOT EXISTS `reviews_timeline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `review_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;