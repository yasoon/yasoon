yasoon
======

Репозиторий сайта yasoon. Содержит бэкенд и фронтэнд часть.

## Структура:

### Бэкенд
REST-like API, принимает GET и POST запросы, возвращает ответы в JSON.

**Язык:** PHP5.4, 
**Платформа:** Symfony 2.2, взаимодействует с MySQL через Doctrine.

### Фронтэнд 
Независимое приложение, получающее данные от API ajax-запросами.

**Язык:** Coffeescript, компилирующийся в оптимизированный JavaScript при билде
**Платформа:** Chaplinjs, MVC-фреймворк, настройка над Backbonejs. Шаблонизатор - Handlebars.

## Развёртывание:
Все вендорские библиотеки подключаются через composer (backend) и npm (fronend)

npm install less // если нету
grunt watch
coffee -w -b -o js coffee/
