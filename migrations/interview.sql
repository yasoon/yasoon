ALTER TABLE interview ADD `status` enum('visible', 'invisible') default 'invisible';
ALTER TABLE interview ADD `order` int(11);
ALTER TABLE interview ADD `lego` enum('0', '1') default '0';
ALTER TABLE post_answer ADD `lego` enum('0', '1') default '0';