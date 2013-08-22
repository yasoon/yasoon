var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['admin_blank_page'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<header class=\"log-in\"></header>\n\n<div id = \"center\">\n    <article>\n        <h3 class=\"t-center\">Изменяйте вопросы и их последовательность</h3>\n        <div id='queue'></div>\n        <div id='new'></div>\n    </article>\n</div>\n\n<footer></footer>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['admin_blank_question_template_active'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, stack2, functionType="function", escapeExpression=this.escapeExpression, self=this;

function program1(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "\n            <div style='float:left'>\n                "
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.place)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + ")\n            </div>\n        ";
  return buffer;
  }

function program3(depth0,data) {
  
  
  return "\n        <a class=\"btn  close-question mLeft10\" data-delete-button>Удалить!</a>\n    ";
  }

  buffer += "<div class=\"di t-center\">\n\n    <div class = 'a-quertion'>\n        ";
  stack2 = helpers['if'].call(depth0, ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.place), {hash:{},inverse:self.noop,fn:self.program(1, program1, data),data:data});
  if(stack2 || stack2 === 0) { buffer += stack2; }
  buffer += "\n        <input type='text' value='"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.text)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "' autofocus=\"true\" id ='text' data-field='text'/>\n    </div>\n\n    <a class=\"btn\" data-send-button>Отправить!</a>\n    ";
  stack2 = helpers['if'].call(depth0, ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.id), {hash:{},inverse:self.noop,fn:self.program(3, program3, data),data:data});
  if(stack2 || stack2 === 0) { buffer += stack2; }
  buffer += "\n    <a class=\"mLeft10\" data-to-mode='passive'>Превью</a>\n\n</div>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['admin_blank_question_template_button'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<div class=\"di t-center\">\n    <div class=\"btn\" data-to-mode='active'>Новый вопрос</div>\n</div>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['admin_blank_question_template_passive'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, stack2, functionType="function", escapeExpression=this.escapeExpression, self=this;

function program1(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "\n            <div style='float:left'>"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.place)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + ")</div>\n        ";
  return buffer;
  }

  buffer += "<div class=\"di t-center element\" id='"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.id)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "'>\n\n    <div class = 'a-quertion'>\n        ";
  stack2 = helpers['if'].call(depth0, ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.place), {hash:{},inverse:self.noop,fn:self.program(1, program1, data),data:data});
  if(stack2 || stack2 === 0) { buffer += stack2; }
  buffer += "\n\n        <div contenteditable=\"false\" id='text'>\n            "
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.text)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "\n            <a class='editable'><i  data-to-mode='active'></i></a>\n        </div>\n    </div>\n\n</div>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['admin_blank_question_template_queue'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<div class='di sortable' id ='elements'></div>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['admin_content_page'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<header class=\"log-in\"></header>\n\n    <section id='main-layout'>\n        <div id = \"center\">\n            <article>\n                <div id='queue'></div>\n            </article>\n        </div>\n    </section>\n\n<footer></footer>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['admin_content_row_active'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<article>\n\n    <div class=\"content\">\n        <h4><textarea data-field='description'>"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.description)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</textarea></h4>\n        <p><textarea data-field='text'>"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.text)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</textarea></p>\n    </div>\n\n    <a class=\"btn\" data-send-button>Отправить!</a>\n    <a class=\"mLeft10\" data-to-mode='passive'>Отмена</a>\n\n    <div class=\"hr\"></div>\n\n</article>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['admin_content_row_passive'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<article>\n\n    <div class=\"content\">\n        <h4>"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.description)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "<a class='editable'><i  data-to-mode='active'></i></a></h4>\n        <p>"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.text)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</p>\n    </div>\n\n    <div class=\"hr\"></div>\n\n</article>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['admin_content_row_queue'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<div class='di sortable' id ='elements'></div>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['admin_header'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<a class=\"logo\" href=\"#\">yasoon</a>\n\n<div class=\"org-nav\">\n    <nav>\n        <a href='#admin/blank'>вопросы в анкете</a>\n        <a href='#admin/stories'>история дня</a>\n        <a href='#admin/timeline'>лента</a>\n        <a href='#admin/content'>контент</a>\n    </nav>\n</div>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['admin_stories_page'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<header class=\"log-in\"></header>\n\n<section id='main-layout'>\n    <div id = \"center\">\n        <article>\n            <h3 class=\"t-center\">Добавляйте постам лайки и выбирайте историю дня</h3>\n            <div id='queue'></div>\n        </article>\n    </div>\n</section>\n\n<footer></footer>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['admin_stories_post'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<article>\n\n    <div class=\"p-label\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.authorName)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</div>\n    <h4 class=\"p-label\">Рейтинг: <a class=\"green\" id='rating'>"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.likes)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</a></h4>\n    <h2><a href=\"\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.caption)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</a></h2>\n    <div class=\"content\">\n        <p>"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.preview)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</p>\n    </div>\n    <div class='content'>\n        <a class=\"btn\" id='likeButton'>Лайк</a>\n        <a class=\"btn\" id='assignAsDaystoryButton'>Сделать историей дня</a>\n    </div>\n    <div class=\"hr\"></div>\n\n</article>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['admin_stories_post_queue'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<div class='di' id ='elements'></div>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['admin_timeline_blank'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<article>\n    <img src=\"./_temp/a1.jpg\" class=\"usr-ic\" alt=\"\">\n    <h4><a href=\"#author/"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.id)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "/posts\" class=\"p-label\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.authorName)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</a></h4>\n    <h2><a href=\"#author/"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.id)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "/posts/blank\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.caption)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</a> <span class=\"post-date\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.date)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</span></h2>\n    <div class=\"content lic\">\n        <p>"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.text)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</p>\n    </div>\n    <div class='content'>\n        <a class=\"btn\" data-check-button>Проверено</a>\n    </div>\n    <div class=\"hr\"></div>\n</article>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['admin_timeline_post'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<article>\n    <img src=\"./_temp/a1.jpg\" class=\"usr-ic\" alt=\"\">\n    <h4><a href=\"#author/"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.authorId)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "/posts\" class=\"p-label\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.authorName)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</a></h4>\n    <h2><a href=\"#author/"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.authorId)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "/posts/"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.id)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.caption)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</a> <span class=\"post-date\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.date)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</span></h2>\n    <div class=\"content lic\">\n        <p>"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.text)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</p>\n    </div>\n    <div class='content'>\n        <a class=\"btn\" data-check-button>Проверено</a>\n    </div>\n    <div class=\"hr\"></div>\n</article>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['admin_timeline_post_queue'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<div id ='elements'></div>\n\n<article class=\"bottom-toolbar t-center\">\n    <a class=\"btn\" data-more-button>Дальше</a>\n</article>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['admin_timeline_question'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<article>\n    <img src=\"./_temp/a1.jpg\" class=\"usr-ic\" alt=\"\">\n    <h4><a href=\"#author/"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.authorId)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "/posts\" class=\"p-label\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.authorName)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</a></h4>\n    <h2><a href=\"#author/"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.authorId)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "/questions\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.caption)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</a> <span class=\"post-date\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.date)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</span></h2>\n    <div class=\"content lic\">\n        <p>"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.text)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</p>\n    </div>\n    <div class='content'>\n        <a class=\"btn\" data-check-button>Проверено</a>\n    </div>\n    <div class=\"hr\"></div>\n</article>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['auth_login_active'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<div class=\"p-box login auth_login\">\n    <h3>Войти используя аккаунт</h3>\n\n    <div class=\"connect\">\n        <ul>\n            <li><a href=\"\" class=\"login-btn twt\">Войти из твиттера</a></li>\n            <li><a href=\"\" class=\"login-btn fb\">Войти из фейсбука</a></li>\n            <li class=\"last\">Нет аккаунта? <a href=\"#register\"><b>Зарегистрироваться</b></a></li>\n        </ul>\n    </div>\n    <div class=\"connect login-form\">\n        <ul>\n            <li><input type=\"text\" placeholder=\"Введите свой email\" data-field=\"email\"></li>\n            <div class=\"hhdi hide-warning data_email login-warning\">Поле обязательно для заполнения</div>\n            <li ><input type=\"password\" placeholder=\"Пароль\" data-field=\"password\"></li>\n            <div class=\"hhdi hide-warning data_password login-warning\">Поле обязательно для заполнения</div>\n            <li><a href=\"\">Забыли пароль?</a> <a class=\"btn\" data-send-button>Войти</a></li>\n        </ul>\n    </div>\n</div>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_posts_blank_page'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<header class=\"log-in\"></header>\n\n<section id=\"page-layout\" class=\"m-page\">\n    <div class=\"post-edit\">\n        <div id='queue'></div>\n    </div>\n</section>\n\n<footer></footer>\n";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_posts_header'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<a class=\"logo\" href=\"#\">yasoon</a>\n\n<div class=\"org-nav\">\n    <nav>\n        <a href=\"#explore\">Истории</a>\n        <a href=\"#people\">Люди</a>\n    </nav>\n</div>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_posts_info'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<div class=\"open-area\"></div>\n\n<img src=\"./_temp/a1.jpg\" alt=\"\">\n<h4 class=\"usr-name editable\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.name)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "<i></i></h4>\n<p class=\"u-description\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.description)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</p>\n<div class=\"hr\"></div>\n<div class=\"pub\">\n    <h4 class=\"p-label\">зарегистрирован</h4>\n    8/7/2013\n    <div class=\"hr\"></div>\n</div>\n\n<div class=\"media-hidden\">\n    <div class=\"inner\">\n        <div class=\"b-indent\">Работаю:<br>\n            <a href=\"\" class=\"t-under c-black\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.job)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</a>\n        </div>\n        <div class=\"b-indent\">Интересно:<br>\n            <a href=\"\" class=\"t-under c-black\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.interest)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</a>\n        </div>\n        <div class=\"b-indent\">Мечта:<br>\n            <a href=\"\" class=\"t-under c-black\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.dream)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</a>\n        </div>\n        <div class=\"hr\"></div>\n        <div class=\"d-box\">\n            <div><p class=\"p-label\">постов</p> <a href=\"\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.posts)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</a></div>\n            <div><p class=\"p-label\">ответов</p> <a href=\"\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.questions)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</a></div>\n        </div>\n\n        <div class=\"clearfix\"></div>\n        <div class=\"social\">\n            <div class=\"hr\"></div>\n                <a class=\"btn\" id='follow'>Подписаться</a>\n                <a class=\"btn close-question mLeft10\" id='unfollow' style='display:none'>Отписаться</a>\n        </div>\n        <div class=\"hr\"></div>\n    </div>\n</div>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_posts_new_blank_caption_active'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression, self=this, helperMissing=helpers.helperMissing;

function program1(depth0,data,depth1) {
  
  var buffer = "", stack1, stack2, options;
  buffer += "\n        <option id='"
    + escapeExpression(((stack1 = data.key),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "'\n        ";
  options = {hash:{},inverse:self.noop,fn:self.program(2, program2, data),data:data};
  stack2 = ((stack1 = helpers.equals),stack1 ? stack1.call(depth0, data.key, ((stack1 = depth1.model),stack1 == null || stack1 === false ? stack1 : stack1.categoryId), options) : helperMissing.call(depth0, "equals", data.key, ((stack1 = depth1.model),stack1 == null || stack1 === false ? stack1 : stack1.categoryId), options));
  if(stack2 || stack2 === 0) { buffer += stack2; }
  buffer += "\n        >"
    + escapeExpression((typeof depth0 === functionType ? depth0.apply(depth0) : depth0))
    + "</option>\n\n        ";
  return buffer;
  }
function program2(depth0,data) {
  
  
  return "\n        selected=\"selected\"\n        ";
  }

  buffer += "<div class=\"di\">\n    <h3>заголовок:</h3>\n    <input type='text' placeholder=\"Название истории\"/>\n</div>\n\n<div class=\"di\">\n    <h3>отрасль:</h3>\n    <select data-field=\"categoryId\">\n        ";
  stack1 = helpers.each.call(depth0, depth0.categories, {hash:{},inverse:self.noop,fn:self.programWithDepth(1, program1, data, depth0),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n    </select>\n</div>\n\n\n<div class='content'>\n    <a class=\"btn\" data-send-button>Отправить!</a>\n</div>\n";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_posts_new_blank_caption_passive'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<h2>\n    Как я стал тестовым чуваком<a class='editable'><i  data-to-mode='active'></i></a>\n</h2>\n<h3>Государственная служба</h3>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_posts_new_blank_page'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<header class=\"log-in\"></header>\n\n<section id=\"page-layout\" class=\"m-page\">\n\n    <div class=\"post-edit\">\n        <nav class=\"navigate\">\n            <a href=\"#author/";
  if (stack1 = helpers.authorId) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.authorId; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "/posts/new/blank\" class=\"active\">Написать с нашей помощью</a>\n            <a href=\"#author/";
  if (stack1 = helpers.authorId) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.authorId; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "/posts/new\" >Написать самостоятельно</a>\n        </nav>\n\n        <div id='caption'></div>\n\n        <div id='queue'></div>\n\n        <div id='new'></div>\n\n    </div>\n\n</section>\n\n<footer></footer>\n";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_posts_new_blank_question_active'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, stack2, functionType="function", escapeExpression=this.escapeExpression, self=this;

function program1(depth0,data) {
  
  
  return "\n            <a  class=\"btn close-question mLeft10\" data-delete-button>Удалить</a>\n        ";
  }

  buffer += "<div class='element' id='"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.id)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "'>\n\n    <article>\n        <h3 ><input type='text' value='"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.caption)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "' data-field='caption' placeholder='Заголовок'/></h3>\n    </article>\n\n    <div class=\"di\">\n        <div class=\"post-edit-tools\">\n            <div class=\"item\"><b>b</b></div>\n            <div class=\"item\"><b><i>It</i></b></div>\n            <div class=\"item\"><b>Quote</b></div>\n            <div class=\"item\">Upload a picture</div>\n            <div class=\"clearfix\"></div>\n        </div>\n        <textarea class=\"big\" placeholder=\"Ваш ответ\" data-field='answer' >"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.answer)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</textarea>\n    </div>\n\n    <div class=\"di t-center\">\n        <a  class=\"btn\" data-send-button>Опубликовать!</a>\n        ";
  stack2 = helpers['if'].call(depth0, ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.id), {hash:{},inverse:self.noop,fn:self.program(1, program1, data),data:data});
  if(stack2 || stack2 === 0) { buffer += stack2; }
  buffer += "\n        <a  class=\"mLeft10\" data-to-mode=\"passive\">Отмена</a>\n    </div>\n\n</div>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_posts_new_blank_question_button'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<div class='hr'></div>\n    <div class=\"di t-center\">\n        <div class=\"btn\" data-to-mode='active'>Добавьте вопрос</div>\n    </div>\n<div class='hr'></div>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_posts_new_blank_question_passive'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<div class=\"a-quertion element\" id='"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.id)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "'>\n    <h3><a>"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.caption)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</a><a class='editable'><i  data-to-mode='active'></i></a></h3>\n    <div class=\"content\">\n        <p>"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.answer)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</p>\n    </div>\n</div>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_posts_new_blank_question_queue'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<div class='di sortable' id ='elements'></div>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_posts_new_page'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<header class=\"log-in\"></header>\n\n<section id=\"page-layout\" class=\"m-page\">\n\n    <div class=\"post-edit\">\n        <nav class=\"navigate\">\n            <a href=\"#author/";
  if (stack1 = helpers.authorId) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.authorId; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "/posts/new/blank\" >Написать с нашей помощью</a>\n            <a href=\"#author/";
  if (stack1 = helpers.authorId) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.authorId; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "/posts/new\" class=\"active\">Написать самостоятельно</a>\n        </nav>\n        <div id='post'></div>\n    </div>\n\n</section>\n\n<footer></footer>\n";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_posts_page'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, stack2, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<header class=\"log-in\"></header>\n\n<section id=\"page-layout\">\n\n    <nav class=\"navigate\">\n        <a class=\"active\">Посты</a>\n        <a data-link='author/"
    + escapeExpression(((stack1 = ((stack1 = depth0.author),stack1 == null || stack1 === false ? stack1 : stack1.authorId)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "/questions'>Вопросы</a>\n    </nav>\n\n    <div class=\"postinfo\" id ='author'></div>\n\n    <article class=\"lim cat-title\">\n        <div class=\"content\"><p><a class=\"btn\" data-link='author/";
  if (stack2 = helpers.authorId) { stack2 = stack2.call(depth0, {hash:{},data:data}); }
  else { stack2 = depth0.authorId; stack2 = typeof stack2 === functionType ? stack2.apply(depth0) : stack2; }
  buffer += escapeExpression(stack2)
    + "/posts/new'>Написать новый пост</a></p></div>\n        <div class=\"hr\"></div>\n    </article>\n\n    <div id='queue'></div>\n\n</section>\n<footer></footer>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_posts_post_active'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, stack2, functionType="function", escapeExpression=this.escapeExpression, self=this, helperMissing=helpers.helperMissing;

function program1(depth0,data,depth1) {
  
  var buffer = "", stack1, stack2, options;
  buffer += "\n                    <option id='"
    + escapeExpression(((stack1 = data.key),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "'\n                            ";
  options = {hash:{},inverse:self.noop,fn:self.program(2, program2, data),data:data};
  stack2 = ((stack1 = helpers.equals),stack1 ? stack1.call(depth0, data.key, ((stack1 = depth1.model),stack1 == null || stack1 === false ? stack1 : stack1.categoryId), options) : helperMissing.call(depth0, "equals", data.key, ((stack1 = depth1.model),stack1 == null || stack1 === false ? stack1 : stack1.categoryId), options));
  if(stack2 || stack2 === 0) { buffer += stack2; }
  buffer += "\n                            >"
    + escapeExpression((typeof depth0 === functionType ? depth0.apply(depth0) : depth0))
    + "</option>\n                ";
  return buffer;
  }
function program2(depth0,data) {
  
  
  return "\n                                selected=\"selected\"\n                            ";
  }

function program4(depth0,data) {
  
  
  return "\n        <a class=\"btn\" data-delete-button>Удалить</a>\n        ";
  }

  buffer += "<div class=\"post-edit\">\n    <div class=\"di\">\n\n        <div class=\"di\">\n            <h3>заголовок:</h3>\n            <input type=\"text\" placeholder=\"Название истории\" data-field=\"caption\" value='"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.caption)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "'>\n        </div>\n\n        <div class=\"di\">\n            <h3>отрасль:</h3>\n            <select data-field=\"categoryId\">\n                ";
  stack2 = helpers.each.call(depth0, depth0.categories, {hash:{},inverse:self.noop,fn:self.programWithDepth(1, program1, data, depth0),data:data});
  if(stack2 || stack2 === 0) { buffer += stack2; }
  buffer += "\n            </select>\n        </div>\n    </div>\n\n    <div class=\"di\">\n        <h3>текст:</h3>\n        <div class=\"post-edit-tools\">\n            <div class=\"item\"><b>b</b></div>\n            <div class=\"item\"><b><i>It</i></b></div>\n            <div class=\"item\"><b>Quote</b></div>\n            <div class=\"item\">Загрузить картинку</div>\n            <div class=\"clearfix\"></div>\n        </div>\n        <textarea class=\"big\" placeholder=\"Тело поста\" data-field=\"text\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.text)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</textarea>\n    </div>\n\n    <div class=\"di\">\n        <h3>аннотация:</h3>\n        <textarea placeholder=\"Краткая аннотация к Вашей истории, которую будут видеть другие пользователи\" data-field='preview'>"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.preview)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</textarea>\n    </div>\n\n\n    <div class=\"di t-center\">\n\n        <a class=\"btn\" data-send-button>Опубликовать</a>\n        ";
  stack2 = helpers['if'].call(depth0, ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.id), {hash:{},inverse:self.noop,fn:self.program(4, program4, data),data:data});
  if(stack2 || stack2 === 0) { buffer += stack2; }
  buffer += "\n        <a class=\"mLeft10\" data-to-mode=\"preview\">Превью</a>\n    </div>\n</div>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_posts_post_full'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<article class=\"lim\">\n\n    <div class=\"like-title\">\n        <span class=\"like-this\"><a ><i></i></a> "
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.likes)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + " <span>likes</span></span>\n        <h1>"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.caption)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</a> <a class='editable'><i  data-to-mode='active'></i></a><span class=\"media-pub\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.date)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</span></h1>\n    </div>\n    <div class=\"content\">\n        <p>\n            "
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.text)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "\n        </p>\n    </div>\n    <div class=\"q-box\">\n        <span class=\"like-this\"><a ><i></i></a> "
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.likes)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + " <span>likes</span></span>\n        <span class=\"q-post\"><a href='#author/"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.authorId)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "/questions'><i></i></a> Вопросов автору: "
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.questions)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</span>\n    </div>\n    <div class=\"bottom-toolbar t-center\">\n        <a href=\"#author/"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.authorId)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "/posts\" class=\"btn\">Читать другие посты</a>\n    </div>\n\n</article>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_posts_post_passive'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<article class='lim'>\n\n    <div class=\"like-title element\" id='"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.id)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "'>\n        <span class=\"like-this\"><a><i></i></a> "
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.likes)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + " <span>лайков</span></span>\n        <h2><a href='#author/"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.authorId)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "/posts/"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.id)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "'>"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.caption)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</a><span class=\"post-date\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.date)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</span></h2>\n    </div>\n\n    <div class=\"content\">\n        <p>"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.preview)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</p>\n    </div>\n\n    <div class=\"hr\"></div>\n\n</article>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_posts_post_preview'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<div class='preview'>\n\n    <article class=\"lim\">\n        <div class=\"like-title\">\n            <h1>"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.caption)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</h1>\n        </div>\n        <div class=\"content\">\n            <p>\n                "
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.text)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "\n            </p>\n        </div>\n        <div class='hr'></div>\n        <div class=\"di t-center\">\n            <a class=\"btn\" data-send-button>Опубликовать</a>\n            <a class=\"mLeft10\" data-to-mode=\"active\">Редактировать</a>\n        </div>\n        <div class='hr'></div>\n    </article>\n\n</div>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_posts_post_queue'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<div class='di sortable' id ='elements'></div>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_posts_read_page'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<header class=\"log-in\"></header>\n\n<section id=\"page-layout\">\n\n    <div class=\"postinfo\">\n        <div class=\"open-area\"></div>\n\n        <img src=\"./_temp/a1.jpg\" alt=\"\">\n        <h4 class=\"usr-name editable\">Тестовый чувак<i></i></h4>\n        <p class=\"u-description\">Я дизайнер собачих причёсок</p>\n        <div class=\"hr\"></div>\n        <div class=\"pub\">\n            <h4 class=\"p-label\">зарегистрирован</h4>\n            8/7/2013\n            <div class=\"hr\"></div>\n        </div>\n\n        <div class=\"media-hidden\">\n            <div class=\"inner\">\n                <div class=\"b-indent\">Работаю:<br>\n                    <a href=\"\" class=\"t-under c-black\">Дизайнер</a>\n                </div>\n                <div class=\"b-indent\">Интересно:<br>\n                    <a href=\"\" class=\"t-under c-black\">Учитель</a>\n                </div>\n                <div class=\"b-indent\">Мечта:<br>\n                    <a href=\"\" class=\"t-under c-black\">Фермер</a>\n                </div>\n                <div class=\"hr\"></div>\n                <div class=\"d-box\">\n                    <div><p class=\"p-label\">постов</p> <a href=\"\">3</a></div>\n                    <div><p class=\"p-label\">ответов</p> <a href=\"\">4</a></div>\n                </div>\n                <div class=\"clearfix\"></div>\n                <div class=\"social\">\n                    <div class=\"hr\"></div>\n                    <div class=\"social-links\">\n                        <a href=\"\" class=\"ws\"></a>\n                        <a href=\"\" class=\"wf\"></a>\n                        <a href=\"\" class=\"wb\"></a>\n                        <div class=\"clearfix\"></div>\n                    </div>\n                </div>\n                <div class=\"hr\"></div>\n            </div>\n        </div>\n    </div>\n\n    <div id='post'></div>\n\n\n</section>\n\n<footer></footer>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_questions_header'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<a class=\"logo\" href=\"#\">yasoon</a>\n\n<div class=\"org-nav\">\n    <nav>\n        <a href=\"#explore\">Истории</a>\n        <a href=\"#people\">Люди</a>\n    </nav>\n</div>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_questions_page'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<header class=\"log-in\"></header>\n\n<section id=\"page-layout\" class=\"m-page\">\n    <article class=\"cat-title\">\n        <nav class=\"navigate\">\n            <a data-link='author/";
  if (stack1 = helpers.authorId) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.authorId; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "/posts'>Посты</a>\n            <a class=\"active\">Вопросы</a>\n        </nav>\n    </article>\n\n    <div id='new'></div>\n    <div id='queue'></div>\n</section>\n\n<footer></footer>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_questions_question_active'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<h3>\n    <input type='text' data-field=\"caption\" value='"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.caption)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "'>\n</h3>\n\n<br>\n\n<textarea data-field=\"answer\" autofocus>"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.answer)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</textarea>\n<div class=\"content\">\n    <p>\n        <a class=\"btn\" data-send-button>Ответить</a>\n        <a class=\"btn close-question mLeft10\" data-delete-button>Удалить</a>\n        <a class=\"mLeft10\" data-to-mode=\"passive\">Отмена</a>\n    </p>\n</div>\n<div class=\"hr\"></div>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_questions_question_button'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<div class=\"btn\" data-to-mode='new_active'>Новый вопрос</div>\n<div class=\"hr\"></div>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_questions_question_new_active'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<article>\n    <h3><input type='text' data-field=\"caption\" autofocus></h3>\n    <div class=\"content\">\n        <p>\n            <a class=\"btn\" data-send-button>Отправить</a>\n            <a class=\"mLeft10\" data-to-mode=\"button\">Отмена</a>\n        </p>\n    </div>\n    <div class=\"hr\"></div>\n</article>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_questions_question_passive'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<div class ='element' id='"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.id)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "'>\n\n    <h3>\n        <a>"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.caption)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</a>\n        <a class='editable'><i  data-to-mode='active'></i></a>\n        <span class=\"post-date\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.date)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</span>\n    </h3>\n\n    <div class=\"content\">\n        <p>"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.answer)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</p>\n    </div>\n\n    <div class=\"hr\"></div>\n\n</div>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_questions_question_queue'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<div class='di sortable' id ='elements'></div>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_questions_question_sent'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<div class=\"content\">\n        Ваш вопрос отправлен. Он появится в ленте после того, как автор даст на него ответ\n</div>\n\n<div class=\"content\">\n    <p>\n        <a class=\"btn\" data-to-mode='button'>Ок</a>\n    </p>\n</div>\n\n<div class=\"hr\"></div>\n";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['blog_about_page'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<header class=\"log-in\"></header>\n\n<section id=\"page-layout\">\n\n    <div class=\"postinfo\" id=\"nt\">\n        <div class=\"open-area\"></div>\n\n        <img src=\"./_temp/a1.jpg\" alt=\"\">\n        <h4><a class=\"usr-name\">Наши контакты</a></h4>\n        <p class=\"u-description\">Пишите нам</p>\n        <div class=\"hr\"></div>\n\n\n        <div class=\"media-hidden\">\n            <div class=\"inner\">\n                <div class=\"b-indent\">Первый:<br>\n                    <a class=\"t-under c-black\">support@yasoon.ru</a>\n                </div>\n                <div class=\"b-indent\">Второй:<br>\n                    <a class=\"t-under c-black\">support@yasoon.ru</a>\n                </div>\n                <div class=\"b-indent\">Третий:<br>\n                    <a class=\"t-under c-black\">support@yasoon.ru</a>\n                </div>\n                <div class=\"hr\"></div>\n            </div>\n        </div>\n    </div>\n\n    <article class=\"lim\">\n        <div class=\"like-title\">\n            <h1 data-managed-content=\"1\"></h1>\n        </div>\n        <div class=\"content\">\n            <p data-managed-content=\"2\"></p>\n\n        </div>\n        <div class=\"bottom-toolbar t-center\">\n            <a href=\"#blog\" class=\"btn\">Читать блог администрации</a>\n        </div>\n    </article>\n\n\n</section>\n\n<footer></footer>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['blog_blog_page'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<header class=\"log-in\"></header>\n\n<section id=\"page-layout\">\n\n    <nav class=\"navigate\">\n        <a class=\"active\">Новости</a>\n        <a href='#blog/questions'>Отзывы</a>\n    </nav>\n    <div class=\"postinfo\" id=\"nt\">\n        <div class=\"open-area\"></div>\n\n        <img src=\"./_temp/a1.jpg\" alt=\"\">\n        <h4><a class=\"usr-name\">Блог администрации</a></h4>\n        <div class=\"hr\"></div>\n\n\n        <div class=\"media-hidden\">\n            <div class=\"inner\">\n                <div class=\"b-indent\">Первый:<br>\n                    <a class=\"t-under c-black\">support@yasoon.ru</a>\n                </div>\n                <div class=\"b-indent\">Второй:<br>\n                    <a class=\"t-under c-black\">support@yasoon.ru</a>\n                </div>\n                <div class=\"b-indent\">Третий:<br>\n                    <a class=\"t-under c-black\">support@yasoon.ru</a>\n                </div>\n                <div class=\"hr\"></div>\n            </div>\n        </div>\n    </div>\n\n    <article class=\"lim cat-title\">\n        <div class=\"content\"><p><a class=\"btn\" href='#blog/new'>Написать новый пост</a></p></div>\n        <div class=\"hr\"></div>\n    </article>\n\n    <div id='queue'>\n\n    </div>\n\n</section>\n\n<footer></footer>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['blog_blog_questions_page'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<header class=\"log-in\"></header>\n\n<section id=\"page-layout\" class=\"m-page\">\n\n    <article class=\"cat-title\">\n        <nav class=\"navigate\">\n            <a data-link='blog/posts'>Новости</a>\n            <a class=\"active\">Отзывы</a>\n        </nav>\n    </article>\n\n    <div id='new'></div>\n    <div id='queue'></div>\n\n</section>\n\n<footer></footer>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['common_footer'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<div class=\"inside\">\n    <div class=\"left aus\">© 2013 yasoon</div>\n\n    <nav>\n        <a href=\"#about\">Что это?</a>\n        <a href=\"#blog\">Блог</a>\n    </nav>\n\n    <div class=\"clearfix\"></div>\n</div>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['common_message'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<div class='p-box message'>\n\n    <h3>";
  if (stack1 = helpers.caption) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.caption; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "</h3>\n\n    <div class=\"content\">\n        <p> ";
  if (stack1 = helpers.text) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.text; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "</p>\n    </div>\n\n    <div class=\"t-center\">\n        <a class=\"btn\" id='disposeButton'>Ok</a>\n    </div>\n\n</div>\n";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['index_daystory'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<div class=\"postinfo\">\n    <img src=\"./_temp/a1.jpg\" alt=\"\">\n    <h4 class=\"usr-name\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.authorName)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</h4>\n    <p class=\"u-description\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.authorDescription)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</p>\n    <div class=\"hr\"></div>\n    <div class=\"pub\">\n        <h4 class=\"p-label\">зарегистрирован</h4>\n        "
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.authorDate)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "\n        <div class=\"hr\"></div>\n    </div>\n</div>\n\n<article class=\"lim\">\n    <div class=\"like-title\">\n        <span class=\"like-this\"><a href=\"\"><i></i></a> "
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.likes)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + " <span>лайков</span></span>\n        <h1>"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.caption)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + " <span class=\"media-pub\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.data)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</span></h1>\n    </div>\n    <div class=\"content\">\n        <p>"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.text)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</p>\n\n    </div>\n    <div class=\"q-box\">\n        <span class=\"like-this\"><a href=\"\"><i></i></a> "
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.likes)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + " <span>лайков</span></span>\n        <span class=\"q-post\"><a href=\"#author/"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.authorId)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "/questions\"><i></i></a> Вопросов автору: "
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.questions)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</span>\n    </div>\n    <article class=\"bottom-toolbar t-center\">\n        <a href=\"#explore\" class=\"btn\">Больше историй</a>\n    </article>\n</article>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['index_header'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<div id=\"bg-main\">\n    <div class=\"bg bg-panoram\" style=\"background-image: url(_temp/i6.jpg);\">bg</div>\n    <div class=\"inside\">\n        <a class=\"logo\" href=\"/\">yasoon</a>\n        <a class=\"sign-in\" href=\"/\">login</a>\n        <div class=\"main-w\">\n            <p data-managed-content=\"0\"></p>\n            <a href=\"#explore/date/0\" class=\"btn\">Узнать больше</a>\n        </div>\n        <nav>\n            <a href=\"explore/date/0\">профессии</a>\n            <a href=\"people/0\">люди</a>\n        </nav>\n    </div>\n</div>\n";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['index_page'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<header></header>\n\n<section id=\"main-layout\">\n    <nav class=\"navigate\">\n        <a href=\"#\" class=\"active\">История дня</a>\n        <a href=\"#stories\">Лучшие истории</a>\n    </nav>\n\n    <div id='daystory'>\n    </div>\n</section>\n\n<footer></footer>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['index_stories_page'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<header></header>\n\n<section id=\"main-layout\">\n    <nav class=\"navigate\">\n        <a href=\"#\" >История дня</a>\n        <a href=\"#stories\" class=\"active\">Лучшие истории</a>\n    </nav>\n\n    <div id='queue'>\n    </div>\n</section>\n\n<footer></footer>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['index_stories_post'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<article>\n    <div class=\"p-label\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.authorName)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</div>\n\n    <h2><a href=\"\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.caption)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</a></h2>\n\n    <div class=\"content\">\n        <p>"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.preview)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</p>\n    </div>\n\n    <div class=\"hr\"></div>\n\n</article>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['index_stories_post_queue'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<div class='di' id ='elements'></div>\n\n<article class=\"bottom-toolbar t-center\">\n    <a class=\"btn\" href='#explore/date/0'>Больше историй</a>\n</article>\n";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['info_info_edit'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<div class=\"info-form\">\n    <form name=\"info-form\">\n        <article class=\"cat-title\">\n            <h3>Редактирование личной информации</h3>\n            <p class=\"fs c-grey\">Отредактируйте свой профиль и допишите истории</p>\n            <div class=\"hr\"></div>\n        </article>\n        <div class=\"di\"><input type=\"text\" placeholder=\"Имя\" data-field='name' value='"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.name)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "'>\n            <div class=\"hhdi hide-warning data_name\">Обязательно для заполнения</div>\n        </div>\n        <div class=\"di\"><input type=\"text\" placeholder=\"Фамилия\"  data-field='lastName' value='"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.name)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "'>\n            <div class=\"hhdi hide-warning data_lastName\">Обязательно для заполнения</div>\n        </div>\n        <div class=\"di\"><input type=\"text\" placeholder=\"Email\"  data-field='email' value='"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.email)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "'>\n            <div class=\"hhdi hide-warning data_email\">Обязательно для заполнения</div>\n            <div class=\"hhdi\"><label> <input type=\"checkbox\" checked=\"\">Подписаться на обновления</label></div>\n        </div>\n        <div class=\"di\"><input type=\"password\" placeholder=\"Пароль\" data-field=\"password\" value='"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.password)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "'>\n            <div class=\"hhdi hide-warning data_password\">Обязательно для заполнения</div>\n        </div>\n        <div class=\"di\"><textarea placeholder=\"Напишите краткую историю о себе\" data-field=\"shortHistory\" value='"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.description)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "'></textarea></div>\n        <div class=\"hr di\"></div>\n        <article class=\"cat-title\">\n            <p class=\"c-grey\">Здесь вы можете описать выбор вашей професии, интересы или мечты будущей работы</p>\n        </article>\n        <div class=\"di\"><input type=\"text\" placeholder=\"Ваша работа\" data-field=\"job\" value="
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.description)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "></div>\n        <div class=\"di\"><input type=\"text\" placeholder=\"Интересы\" data-field=\"interests\" value="
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.description)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "></div>\n        <div class=\"di\"><input type=\"text\" placeholder=\"Мечты\" data-field=\"dreams\" value="
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.description)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "></div>\n        <div data-send-button class=\"regbtn di\">Завершить правки</div>\n    </form>\n</div>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['info_page'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<header class=\"log-in\"></header>\n<section id=\"page-layout\" class=\"m-page\">\n</section>\n\n<footer></footer>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['people_author'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<article class=\"lim\">\n    <img src=\"./_temp/a1.jpg\" class=\"usr-ic\" alt=\"\">\n    <h4 class=\"p-label\">Постов по теме: <a class=\"green\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.posts)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</a>\n        &nbsp;&nbsp;&nbsp; Лайков: <a class=\"green\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.likes)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</a></h4>\n    <h2><a href=\"#author/"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.id)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "/posts\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.name)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</a></h2>\n    <div class=\"content lic\">\n        <p>"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.topPostPreview)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</p>\n    </div>\n    <div class=\"hr\"></div>\n</article>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['people_author_queue'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<div id ='elements'></div>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['people_author_queue_placeholder'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<article class=\"lim\">\n    <img src=\"./_temp/a1.jpg\" class=\"usr-ic\" alt=\"\">\n\n    <h2><a>пусто</a></h2>\n\n    <div class=\"content lic\">\n        <p>К сожалению, на эту тему ещё нет историй</p>\n        <p><a href='#register' class='btn'>Напишите свою</a></p>\n    </div>\n\n    <div class=\"hr\"></div>\n</article>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['people_explore_page'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression, self=this;

function program1(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "\n                <a id='"
    + escapeExpression(((stack1 = data.key),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "' class='category active' href='"
    + escapeExpression(((stack1 = data.key),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "'>\n                    "
    + escapeExpression((typeof depth0 === functionType ? depth0.apply(depth0) : depth0))
    + "\n                </a>\n            ";
  return buffer;
  }

  buffer += "<header class=\"log-in\"></header>\n\n<section id=\"page-layout\">\n\n    <div class=\"left-side\">\n        <div class=\"di\"><input type=\"text\" class=\"search\" placeholder=\"Поиск\"></div>\n        <div class=\"p-label di\"><b>Отрасль</b></div>\n\n        <nav class=\"nav-cat\" id='categories'>\n            ";
  stack1 = helpers.each.call(depth0, depth0.categories, {hash:{},inverse:self.noop,fn:self.program(1, program1, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n        </nav>\n\n    </div>\n    <article class=\"lim cat-title\">\n        <h3 id='activeCategory'>";
  if (stack1 = helpers.activeCategory) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.activeCategory; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "</h3>\n        <p>Истории людей, которые любят то, что делают</p>\n        <div class=\"hr\"></div>\n    </article>\n    <nav class=\"navigate\">\n        <a href='#explore/date/";
  if (stack1 = helpers.activeCatId) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.activeCatId; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "' id='dateButton'>По дате</a>\n        <a href='#explore/rating/";
  if (stack1 = helpers.activeCatId) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.activeCatId; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "' id='ratingButton'>По рейтингу</a>\n    </nav>\n\n    <div id='queue'>\n    </div>\n\n</section>\n\n<footer></footer>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['people_explore_post'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<article class=\"lim\">\n\n    <div class=\"p-label\"><a href=\"user.html\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.authorName)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</a></div>\n    <h2><a href=\"\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.caption)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</a></h2>\n    <div class=\"content\">\n        <p>"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.preview)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</p>\n    </div>\n    <div class=\"hr\"></div>\n\n</article>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['people_explore_post_queue'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<div id ='elements'></div>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['people_header'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<a class=\"logo\" href=\"#\">yasoon</a>\n\n<div class=\"org-nav\">\n    <nav>\n        <a href=\"#explore/";
  if (stack1 = helpers.mode) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.mode; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "/";
  if (stack1 = helpers.catId) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.catId; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "\">Истории</a>\n        <a href=\"#people/";
  if (stack1 = helpers.catId) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.catId; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "\">Люди</a>\n    </nav>\n</div>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['people_page'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression, self=this;

function program1(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "\n                <a id='"
    + escapeExpression(((stack1 = data.key),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "' class='category active' href='#people/"
    + escapeExpression(((stack1 = data.key),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "'>\n                    "
    + escapeExpression((typeof depth0 === functionType ? depth0.apply(depth0) : depth0))
    + "\n                </a>\n            ";
  return buffer;
  }

  buffer += "<header class=\"log-in\"></header>\n\n<section id=\"page-layout\">\n\n    <div class=\"left-side\">\n        <div class=\"di\"><input type=\"text\" class=\"search\" placeholder=\"Поиск\"></div>\n        <div class=\"p-label di\"><b>Отрасль</b></div>\n        <nav class=\"nav-cat\" id='categories'>\n            ";
  stack1 = helpers.each.call(depth0, depth0.categories, {hash:{},inverse:self.noop,fn:self.program(1, program1, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n        </nav>\n    </div>\n\n    <article class=\"lim cat-title\">\n        <h3 id='activeCategory'>";
  if (stack1 = helpers.activeCategory) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.activeCategory; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "</h3>\n        <p>Истории людей, которые любят то, что делают</p>\n        <div class=\"hr\"></div>\n    </article>\n\n    <div id='queue'></div>\n\n</section>\n\n<footer></footer>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['register_active'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<div class=\"register-form\">\n    <form name=\"register-form\">\n        <article class=\"cat-title\">\n            <h3>Регистрация</h3>\n            <p class=\"fs c-grey\">Создайте свой профиль и напишите истории</p>\n            <div class=\"hr\"></div>\n        </article>\n\n        <div class=\"di\"><input type=\"text\" placeholder=\"Имя\" data-field='name'>\n            <div class=\"hhdi hide-warning data_name\">Обязательно для заполнения</div>\n        </div>\n\n        <div class=\"di\"><input type=\"text\" placeholder=\"Фамилия\"  data-field='lastName'>\n            <div class=\"hhdi hide-warning data_lastName\">Обязательно для заполнения</div>\n        </div>\n\n        <div class=\"di\"><input type=\"text\" placeholder=\"Email\"  data-field='email'>\n            <div class=\"hhdi hide-warning data_email\">Не правильный формат email</div>\n            <div class=\"hhdi\"><label> <input type=\"checkbox\" checked=\"\">Подписаться на обновления</label></div>\n        </div>\n\n        <div class=\"di\"><input type=\"password\" placeholder=\"Пароль\" data-field=\"password\">\n            <div class=\"hhdi hide-warning data_password\">Обязательно для заполнения</div>\n        </div>\n\n        <div class=\"di\"><textarea placeholder=\"Напишите краткую историю о себе\" data-field=\"description\"></textarea></div>\n\n        <div class=\"hr di\"></div>\n\n        <article class=\"cat-title\">\n            <p class=\"c-grey\">Здесь вы можете описать выбор вашей професии, интересы или мечты будущей работы</p>\n        </article>\n\n        <div class=\"di\"><input type=\"text\" placeholder=\"Ваша работа\" data-field=\"job\"></div>\n        <div class=\"di\"><input type=\"text\" placeholder=\"Интересы\" data-field=\"interests\"></div>\n        <div class=\"di\"><input type=\"text\" placeholder=\"Мечты\" data-field=\"dreams\"></div>\n\n        <div data-send-button class=\"regbtn di\">Завершить регистрацию</div>\n    </form>\n</div>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['register_page'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<header class=\"log-in\"></header>\n\n<section id=\"page-layout\" class=\"m-page\">\n</section>\n\n<footer></footer>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['timeline_blank'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<article>\n\n    <img src=\"./_temp/a1.jpg\" class=\"usr-ic\" alt=\"\">\n    <h4><a href=\"#author/"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.id)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "/posts\" class=\"p-label\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.authorName)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</a></h4>\n    <h2><a href=\"#author/"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.id)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "/posts/blank\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.caption)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</a> <span class=\"post-date\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.date)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</span></h2>\n    <div class=\"content lic\">\n        <p>"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.text)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</p>\n    </div>\n    <div class=\"hr\"></div>\n\n</article>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['timeline_page'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<header class=\"log-in\"></header>\n\n<section id=\"page-layout\" class=\"m-page\">\n\n    <article class=\"cat-title\">\n        <h4>обновления</h4>\n        <div class=\"hr\"></div>\n    </article>\n\n    <div id='queue'></div>\n\n</section>\n\n\n<footer></footer>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['timeline_placeholder'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<article>\n    <img src=\"./_temp/a1.jpg\" class=\"usr-ic\" alt=\"\">\n\n    <h2><a>Пусто</a></h2>\n\n    <div class=\"content lic\">\n        <p>Ваша лента пуста</p>\n        <p><a href='#people' class='btn'>Добавьте интересных людей</a></p>\n    </div>\n\n    <div class=\"hr\"></div>\n</article>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['timeline_post'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<article>\n\n    <img src=\"./_temp/a1.jpg\" class=\"usr-ic\" alt=\"\">\n\n    <h4><a href=\"#author/"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.authorId)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "/posts\" class=\"p-label\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.authorName)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</a></h4>\n\n    <h2><a href=\"#author/"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.authorId)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "/posts/"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.id)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.caption)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</a> <span class=\"post-date\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.date)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</span></h2>\n\n    <div class=\"content lic\">\n        <p>"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.text)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</p>\n    </div>\n\n    <div class=\"hr\"></div>\n\n</article>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['timeline_post_queue'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<div id ='elements'></div>\n\n<article class=\"bottom-toolbar t-center\">\n    <a class=\"btn\" data-more-button>Дальше</a>\n</article>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['timeline_question'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<article>\n\n    <img src=\"./_temp/a1.jpg\" class=\"usr-ic\" alt=\"\">\n\n    <h4><a href=\"#author/"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.authorId)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "/posts\" class=\"p-label\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.authorName)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</a></h4>\n\n    <h2><a href=\"#author/"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.authorId)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "/questions\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.caption)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</a> <span class=\"post-date\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.date)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</span></h2>\n\n    <div class=\"content lic\">\n        <p>"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.text)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</p>\n    </div>\n\n    <div class=\"hr\"></div>\n\n</article>";
  return buffer;
  });
