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

1) установить composer.phar

1)      composer install

3)      npm install less // если нету 

3.1) Открыть пыхшторм и открыть любой файл ./frontend_src/less/...*less, 
     далее справа сверху будет светится желтым "добавить вотчера", откроется окошко, 
     и там указать куда компилить "output paths" ../css/$FileNameWithoutExtension$.css
     Не забыть указать сам less в поле Program примерно /usr/local/bin/lessc

4)      grunt watch

5)      coffee -w -b -o js coffee/

### Настройка nginx 

Мои настройки

      server {
        listen 127.0.0.1:80;
      	server_name yasoon.loc;
      	root /srv/yasoon/web;
      	 
      	try_files $uri @rewriteapp;
      
        rewrite ^/app_dev\.php/?(.*)$ /$1 permanent;
      	 
      	location @rewriteapp {
      		rewrite ^(.*)$ /app_dev.php/$1 last;
      	}
      	 
      	 
      	location ~ ^/(app|app_dev)\.php(/|$) {
      		fastcgi_split_path_info ^(.+\.php)(/.*)$;
      		include fastcgi_params;
      		fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
      		fastcgi_index app_dev.php;
      		send_timeout 1800;
      		fastcgi_read_timeout 1800;
      		#fastcgi_pass unix:/var/run/php-fpm/php-fpm.sock;
      		fastcgi_pass 127.0.0.1:9001;
      	}
      	 
      	# Statics
      	location ~* \.(js|css|html|tpl|gif|hbs|eot|ttf|woff|jpg|jpeg|png) {
                  root /srv/yasoon/frontend_src/;
                  access_log off;
              }
      
      }




