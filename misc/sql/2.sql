/** DATABASE FILL */

--
-- Установка базы данных по умолчанию
--
USE yasoon;

INSERT INTO content VALUES
  ('0', 'У нас лучшее место, чтобы читать истории и делиться вдохновением', 'Надпись на главной'),
  ('1', 'Что такое Ясун?  ', 'Заголовок страницы О нас'),
  ('2', 'Это такой сайт. Тут можно писать истории и всё такое', 'Содержимое страницы О нас');


INSERT INTO yasoon.author (id, name, email, subscribed, description, publication_date, job, dream, interest, img, interview_caption, password) VALUES (1, 'sdf', 'dsf', 'sdfs', 'dfsd', '2013-08-20 08:18:15', 'dsfs', 'dfsdf', 'dsf', 'dsf', '', '')