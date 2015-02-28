ALTER TABLE `reviews` ADD `question1` enum('0', '1') default '0';
ALTER TABLE `reviews` ADD `question2` enum('0', '1') default '0';
ALTER TABLE `reviews` ADD `prospects` int(11) default 1;
ALTER TABLE `reviews` ADD `status` enum('draft', 'saved') default 'saved';