
ALTER TABLE interview ADD `lego` enum('0', '1') default '0';
ALTER TABLE post_answer ADD `lego` enum('0', '1') default '0';
ALTER TABLE interview ADD `preview_img` varchar(60) COLLATE utf8_unicode_ci DEFAULT '';
ALTER TABLE interview ADD `lego_img` varchar(60) COLLATE utf8_unicode_ci DEFAULT '';
ALTER TABLE interview ADD `position` int(6) DEFAULT 0;