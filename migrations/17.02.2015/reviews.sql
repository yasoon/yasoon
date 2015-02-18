ALTER TABLE categories ADD `isLast` enum('0', '1') default '0';
ALTER TABLE categories ADD `parent_id` int(11) DEFAULT 0;
ALTER TABLE categories ADD `level` int(11) DEFAULT 0;
ALTER TABLE categories ADD `searchField` varchar(255) COLLATE utf8_unicode_ci DEFAULT '';