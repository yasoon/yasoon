ALTER TABLE author ADD `interviews_moderate` varchar(255) COLLATE utf8_unicode_ci DEFAULT '';

INSERT INTO content (id, text, description, tagId) VALUES ('82', 'Нет модерируемых потоков!', 'Текст для модератора потоков', 'NULL');