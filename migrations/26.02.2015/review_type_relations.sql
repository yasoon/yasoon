CREATE TABLE IF NOT EXISTS `review_types_rel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `review_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;