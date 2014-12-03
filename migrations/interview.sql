ALTER TABLE interview ADD `status` enum('visible', 'invisible') default 'invisible';
ALTER TABLE interview ADD `order` int(11);