DROP TABLE IF EXISTS `review_likes`;
CREATE TABLE IF NOT EXISTS `review_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `review_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `user_ip` varchar(20) NOT NULL,
  `last_date` datetime NOT NULL,
  `count_likes` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=1365;