var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['admin_blank_page'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<header class=\"log-in\"></header>\n\n<div id = \"center\">\n    <article>\n        <h3 class=\"t-center\">Изменяйте вопросы и их последовательность</h3>\n        <div id='queue'></div>\n        <div id='new'></div>\n    </article>\n</div>\n\n<footer></footer>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['admin_blank_question_template_active'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
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
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<div class=\"di t-center\">\n    <div class=\"btn\" data-to-mode='active'>Новый вопрос</div>\n</div>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['admin_blank_question_template_passive'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
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
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<div class='di sortable' id ='elements'></div>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['admin_content_page'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<header class=\"log-in\"></header>\n\n    <section id='main-layout'>\n        <div id = \"center\">\n            <article>\n                <div id='queue'></div>\n            </article>\n        </div>\n    </section>\n\n<footer></footer>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['admin_content_row_active'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
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
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  var buffer = "", stack1, stack2, functionType="function";


  buffer += "<article>\n\n    <div class=\"content\">\n        <b>";
  stack2 = ((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.id)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1);
  if(stack2 || stack2 === 0) { buffer += stack2; }
  buffer += "</b><h4>";
  stack2 = ((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.description)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1);
  if(stack2 || stack2 === 0) { buffer += stack2; }
  buffer += "<a class='editable'><i  data-to-mode='active'></i></a></h4>\n        <p>";
  stack2 = ((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.text)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1);
  if(stack2 || stack2 === 0) { buffer += stack2; }
  buffer += "</p>\n    </div>\n\n    <div class=\"hr\"></div>\n\n</article>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['admin_content_row_queue'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<div class='di sortable' id ='elements'></div>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['admin_header'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<a class=\"logo\" href=\"#\">yasoon</a>\n\n<div class=\"org-nav\">\n    <nav>\n        <a href='#admin/blank'>вопросы в анкете</a>\n        <a href='#admin/stories'>история дня</a>\n        <a href='#admin/timeline'>лента</a>\n        <a href='#admin/content'>контент</a>\n    </nav>\n</div>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['admin_stories_page'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<header class=\"log-in\"></header>\n\n<section id='main-layout'>\n    <div id = \"center\">\n        <article>\n            <h3 class=\"t-center\">Добавляйте постам лайки и выбирайте историю дня</h3>\n            <div id='queue'></div>\n        </article>\n    </div>\n</section>\n\n<footer></footer>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['admin_stories_post'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
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
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<div class='di' id ='elements'></div>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['admin_timeline_blank'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
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
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
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
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<div id ='elements'></div>\n\n<article class=\"bottom-toolbar t-center\">\n    <a class=\"btn\" data-more-button>Дальше</a>\n</article>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['admin_timeline_question'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
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
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<div class='barrier'>\n    <div class=\"p-box login auth_login\">\n        <h3>Войти используя аккаунт</h3>\n\n    <div class=\"connect\">\n        <ul>\n            <li><a href=\"\" class=\"login-btn twt\">Войти из твиттера</a></li>\n            <li><a href=\"\" class=\"login-btn fb\">Войти из фейсбука</a></li>\n            <li class=\"last\">Нет аккаунта? <a href=\"#register\" class=\"go_register\"><b>Зарегистрироваться</b></a></li>\n        </ul>\n    </div>\n    <div class=\"connect login-form\">\n        <ul>\n            <li><input type=\"text\" placeholder=\"Введите свой email\" data-field=\"email\"></li>\n            <div class=\"hhdi hide-warning data_email login-warning\">Поле обязательно для заполнения</div>\n            <li ><input type=\"password\" placeholder=\"Пароль\" data-field=\"password\"></li>\n            <div class=\"hhdi hide-warning data_password login-warning\">Поле обязательно для заполнения</div>\n            <li><a href=\"\">Забыли пароль?</a> <a class=\"btn\" data-send-button>Войти</a></li>\n        </ul>\n    </div>\n    </div>\n</div>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['auth_login_notify'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<div class='barrier'>\n    <div class=\"p-box login auth_login\"  style = 'text-align: center'>\n        <h3>Напомнить пароль</h3>\n            <br>\n            <input type=\"text\" placeholder=\"Введите свой email\" data-field=\"email\" value='"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.email)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "'><br>\n            <br>\n            <div class='content'>\n                <a class=\"btn\" id=\"notify\">Напомнить</a>\n                <a data-to-mode=\"active\">Уже вспомнил</a>\n            </div>\n\n    </div>\n</div>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['auth_login_sent'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<div class='barrier'>\n    <div class=\"p-box login auth_login\" style = 'text-align: center'>\n        <h3>Напомнить пароль</h3>\n        <br><br>\n        Напоминание отправлено на ваш email<br><br>\n        <a class=\"btn\" id='closeButton'>OK</a>\n    </div>\n</div>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_posts_blank_page'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<header class=\"log-in\"></header>\n\n<section id=\"page-layout\" class=\"m-page\">\n    <div class=\"post-edit\">\n        <div id='queue'></div>\n    </div>\n</section>\n\n<footer></footer>\n";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_posts_header'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  var buffer = "", stack1, stack2, functionType="function", escapeExpression=this.escapeExpression, self=this;

function program1(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "\n                    <img src=\"upload/avatar/"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.img)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "\" alt=\"\"/>\n                ";
  return buffer;
  }

function program3(depth0,data) {
  
  
  return "\n                    <img src=\"./_temp/a1.jpg\" alt=\"\" />\n                ";
  }

function program5(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "\n                    "
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.questions)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "\n                ";
  return buffer;
  }

function program7(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "\n                    ("
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.questions)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + ")\n                ";
  return buffer;
  }

  buffer += "<!--<a class=\"logo\" href=\"#\">yasoon</a>-->\n\n<!--<div class=\"org-nav\">-->\n    <!--<nav>-->\n        <!--<a href=\"#explore/date/0\">Профессии</a>-->\n        <!--<a href=\"#people\">Люди</a>-->\n    <!--</nav>-->\n\n    <!--<a class=\"sign-in\" data-to-login >войти</a>-->\n<!--</div>-->\n\n\n<header class=\"log-in\">\n    <div class=\"inside\">\n        <a class=\"logo\" href=\"/\">yasoon</a>\n        <div class=\"org-nav\">\n            <nav>\n                <a href=\"#explore/date/0\">Профессии</a>\n                <a href=\"#people\">Люди</a>\n            </nav>\n        </div>\n        <div class=\"my-nav\" data-permission=\"US\">\n            <a href=\"#author/"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.id)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "/posts\">\n                ";
  stack2 = helpers['if'].call(depth0, ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.img), {hash:{},inverse:self.program(3, program3, data),fn:self.program(1, program1, data),data:data});
  if(stack2 || stack2 === 0) { buffer += stack2; }
  buffer += "\n                <span>\n                ";
  stack2 = helpers['if'].call(depth0, ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.questions), {hash:{},inverse:self.noop,fn:self.program(5, program5, data),data:data});
  if(stack2 || stack2 === 0) { buffer += stack2; }
  buffer += "</span></a>\n            <nav>\n                <a href=\"#author/"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.id)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "/posts\">Профиль</a>\n                <a href='#author/"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.id)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "/questions'>Вопросы\n                ";
  stack2 = helpers['if'].call(depth0, ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.questions), {hash:{},inverse:self.noop,fn:self.program(7, program7, data),data:data});
  if(stack2 || stack2 === 0) { buffer += stack2; }
  buffer += "\n                </a>\n                <a href=\"#timeline\">Лента</a>\n                <a id=\"logout\">Выйти</a>\n            </nav>\n        </div>\n        <div class=\"my-nav\" id='login' data-to-login data-permission=\"ANON\">\n            Войти\n        </div>\n    </div>\n</header>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_posts_info'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  var buffer = "", stack1, stack2, functionType="function", escapeExpression=this.escapeExpression, self=this;

function program1(depth0,data) {
  
  
  return "style=\"display:none\"";
  }

  buffer += "<div class=\"open-area\"></div>\n\n<img src=\"upload/avatar/"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.img)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "\" alt=\"Мой аватар\">\n<h4 class=\"usr-name editable\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.name)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "<a href=\"#editinfo\" data-permission=\"US,ADMIN\"><i></i></a></h4>\n<p class=\"u-description\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.description)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</p>\n<div class=\"hr\"></div>\n\n<div class=\"media-hidden\">\n    <div class=\"inner\">\n        <div class=\"b-indent\">Работаю:<br>\n            <a href=\"\" class=\"t-under c-black\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.job)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</a>\n        </div>\n        <div class=\"b-indent\">Интересно:<br>\n            <a href=\"\" class=\"t-under c-black\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.interest)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</a>\n        </div>\n        <div class=\"b-indent\">Мечта:<br>\n            <a href=\"\" class=\"t-under c-black\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.dream)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</a>\n        </div>\n        <div class=\"hr\"></div>\n        <div class=\"d-box\">\n            <div><p class=\"p-label\">постов</p> <a href=\"\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.posts)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</a></div>\n            <div><p class=\"p-label\">ответов</p> <a href=\"\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.questions)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</a></div>\n        </div>\n\n        <div class=\"clearfix\"></div>\n        <div class=\"social\">\n            <div class=\"hr\"></div>\n            <a class=\"btn\" id='follow' ";
  stack2 = helpers.unless.call(depth0, ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.is_friend), {hash:{},inverse:self.noop,fn:self.program(1, program1, data),data:data});
  if(stack2 || stack2 === 0) { buffer += stack2; }
  buffer += " data-permission=\"THEM\">Подписаться</a>\n            <a class=\"btn close-question mLeft10\" id='unfollow' ";
  stack2 = helpers['if'].call(depth0, ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.is_friend), {hash:{},inverse:self.noop,fn:self.program(1, program1, data),data:data});
  if(stack2 || stack2 === 0) { buffer += stack2; }
  buffer += " data-permission=\"THEM\">Отписаться</a>\n            <a class=\"btn\" id='follow.anon' data-to-login data-permission=\"ANON\">Подписаться</a>\n        </div>\n        <div class=\"hr\"></div>\n    </div>\n</div>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_posts_new_blank_caption_active'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression, self=this, helperMissing=helpers.helperMissing;

function program1(depth0,data,depth1) {
  
  var buffer = "", stack1, stack2, options;
  buffer += "\n        <option id='"
    + escapeExpression(((stack1 = ((stack1 = data),stack1 == null || stack1 === false ? stack1 : stack1.key)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "'\n        ";
  options = {hash:{},inverse:self.noop,fn:self.program(2, program2, data),data:data};
  stack2 = ((stack1 = helpers.equals || depth1.equals),stack1 ? stack1.call(depth0, ((stack1 = data),stack1 == null || stack1 === false ? stack1 : stack1.key), ((stack1 = depth1.model),stack1 == null || stack1 === false ? stack1 : stack1.categoryId), options) : helperMissing.call(depth0, "equals", ((stack1 = data),stack1 == null || stack1 === false ? stack1 : stack1.key), ((stack1 = depth1.model),stack1 == null || stack1 === false ? stack1 : stack1.categoryId), options));
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
  buffer += "\n    </select>\n</div>\n\n\n<div class='content'>\n    <a class=\"btn\" data-send-button>Отправить!</a><a  class=\"mLeft10\" data-to-mode=\"passive\">Отмена</a>\n</div>\n";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_posts_new_blank_caption_passive'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<h2>\n    Интервью<a class='editable'><i  data-to-mode='active'></i></a>\n</h2>\n<h3>Государственная служба</h3>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_posts_new_blank_page'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
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
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
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
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<div class='hr'></div>\n    <div class=\"di t-center\">\n        <div class=\"btn\" data-to-mode='active'>Добавьте вопрос</div>\n    </div>\n<div class='hr'></div>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_posts_new_blank_question_passive'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<div class=\"a-quertion element\" id='"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.id)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "'>\n    <h3><a>"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.caption)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</a><a class='editable' data-permission=\"USER\">><i  data-to-mode='active'></i></a></h3>\n    <div class=\"content\">\n        <p>"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.answer)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</p>\n    </div>\n</div>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_posts_new_blank_question_queue'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<div class='di sortable' id ='elements'></div>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_posts_new_page'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
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
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<header class=\"log-in\"></header>\n\n<section id=\"page-layout\">\n\n    <nav class=\"navigate\">\n        <a class=\"active\">Истории</a>\n        <a data-link='#author/";
  if (stack1 = helpers.authorId) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.authorId; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "/questions'>Ответы</a>\n    </nav>\n\n    <div class=\"postinfo\" id ='author'></div>\n\n    <article class=\"lim cat-title\" data-permission=\"US\">\n        <div class=\"content\"><p><a class=\"btn\" data-link='#author/"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.id)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "/posts/new'>Написать новый пост</a></p></div>\n        <div class=\"hr\"></div>\n    </article>\n\n    <div id='queue'></div>\n\n</section>\n<footer></footer>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_posts_post_active'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  var buffer = "", stack1, stack2, functionType="function", escapeExpression=this.escapeExpression, self=this, helperMissing=helpers.helperMissing;

function program1(depth0,data,depth1) {
  
  var buffer = "", stack1, stack2, options;
  buffer += "\n                    <option id='"
    + escapeExpression(((stack1 = ((stack1 = data),stack1 == null || stack1 === false ? stack1 : stack1.key)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "'\n                            ";
  options = {hash:{},inverse:self.noop,fn:self.program(2, program2, data),data:data};
  stack2 = ((stack1 = helpers.equals || depth1.equals),stack1 ? stack1.call(depth0, ((stack1 = data),stack1 == null || stack1 === false ? stack1 : stack1.key), ((stack1 = depth1.model),stack1 == null || stack1 === false ? stack1 : stack1.categoryId), options) : helperMissing.call(depth0, "equals", ((stack1 = data),stack1 == null || stack1 === false ? stack1 : stack1.key), ((stack1 = depth1.model),stack1 == null || stack1 === false ? stack1 : stack1.categoryId), options));
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
  buffer += "\n            </select>\n        </div>\n    </div>\n\n    <div class=\"di\">\n        <h3>текст:</h3>\n        <div class=\"btn-toolbar\" data-role=\"editor-toolbar\" data-target=\"#editor\">\n            <div class=\"btn-group\">\n                <div  class=\"item\" data-edit=\"bold\" title=\"Bold (Ctrl/Cmd+B)\"><b>Жирный</b></div>\n                <div  class=\"item\" data-edit=\"italic\" title=\"Italic (Ctrl/Cmd+I)\"><i>Курсив</i></div>\n                <div  class=\"item\" data-edit=\"strikethrough\" title=\"Strikethrough\"><s>Зачеркнутый</s></div>\n                <div  class=\"item\" data-edit=\"underline\" title=\"Underline (Ctrl/Cmd+U)\"><u>Подчеркнутый</u></div>\n                <div  class=\"item\" data-edit=\"indent\" title=\"Выделение\">Выделение</div>\n            </div>\n\n            <div class=\"btn-group\">\n                <div  class=\"item\" title=\"Вставить изображение\" id=\"pictureBtn\">Изображение</div>\n                <input type=\"file\" data-role=\"magic-overlay\" data-target=\"#pictureBtn\" class=\"pictureBtnInput\" data-edit=\"insertImage\"/>\n            </div>\n        </div>\n        <div id=\"editor\" data-field=\"text\" data-get-pre-send>"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.text)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</div>\n    </div>\n\n    <div class=\"di\">\n        <h3>аннотация:</h3>\n        <div id=\"cleartxt\" data-field='preview' data-get-pre-send>"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.preview)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</div>\n    </div>\n\n\n    <div class=\"di t-center\">\n\n        <a class=\"btn\" data-send-button>Опубликовать</a>\n        ";
  stack2 = helpers['if'].call(depth0, ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.id), {hash:{},inverse:self.noop,fn:self.program(4, program4, data),data:data});
  if(stack2 || stack2 === 0) { buffer += stack2; }
  buffer += "\n        <a class=\"mLeft10\" data-to-mode=\"preview\">Превью</a>\n    </div>\n</div>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_posts_post_full'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  var buffer = "", stack1, stack2, functionType="function", escapeExpression=this.escapeExpression, self=this;

function program1(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "<a href='#author/"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.authorId)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "/questions'><i></i></a>\n            ";
  return buffer;
  }

function program3(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "<a><i data-to-login=\"author/"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.authorId)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "/questions\"></i></a>";
  return buffer;
  }

  buffer += "<article class=\"lim\">\n\n    <div class=\"like-title\">\n        <span class=\"like-this\"><a ><i></i></a> "
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.likes)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + " <span>likes</span></span>\n        <h1>"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.caption)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</h1> <a class='editable' data-permission=\"USER\"><i  data-to-mode='active'></i></a><span class=\"media-pub\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.date)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</span></h1>\n    </div>\n    <div class=\"content\">\n        <p>\n            "
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.text)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "\n        </p>\n    </div>\n    <div class=\"q-box\">\n        <span class=\"like-this\"><a ><i></i></a> "
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.likes)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + " <span>likes</span></span>\n        <span class=\"q-post\">\n            ";
  stack2 = helpers['if'].call(depth0, depth0.isLoggedIn, {hash:{},inverse:self.program(3, program3, data),fn:self.program(1, program1, data),data:data});
  if(stack2 || stack2 === 0) { buffer += stack2; }
  buffer += "\n            Вопросов автору: "
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.questions)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</span>\n    </div>\n    <div class=\"bottom-toolbar t-center\">\n        <a href=\"#author/"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.authorId)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "/posts\" class=\"btn\">Читать другие посты</a>\n    </div>\n\n</article>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_posts_post_passive'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
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
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
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
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<div class='di sortable' id ='elements'></div>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_posts_read_page'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<header class=\"log-in\"></header>\n\n<section id=\"page-layout\">\n\n    <div class=\"postinfo\" id ='author'></div>\n\n    <div id='post'></div>\n\n\n</section>\n\n<footer></footer>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_questions_header'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<a class=\"logo\" href=\"#\">yasoon</a>\n\n<div class=\"org-nav\">\n    <nav>\n        <a href=\"#explore\">Истории</a>\n        <a href=\"#people\">Люди</a>\n    </nav>\n</div>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_questions_page'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<header class=\"log-in\"></header>\n\n<section id=\"page-layout\" class=\"m-page\">\n    <article class=\"cat-title\">\n        <nav class=\"navigate\">\n            <a data-link='author/";
  if (stack1 = helpers.authorId) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.authorId; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "/posts'>Посты</a>\n            <a class=\"active\">Вопросы</a>\n        </nav>\n    </article>\n\n    <div id='new' data-permission=\"ANON\"></div>\n    <div id='queue'></div>\n</section>\n\n<footer></footer>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_questions_question_active'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
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
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  var buffer = "", stack1, self=this;

function program1(depth0,data) {
  
  
  return "<div class=\"btn\" data-to-mode='new_active'>Новый вопрос</div>\n";
  }

function program3(depth0,data) {
  
  
  return "<div class=\"btn\" data-to-mode='new_active.anon' data-to-login>Новый вопрос</div>";
  }

  stack1 = helpers['if'].call(depth0, depth0.isLoggedIn, {hash:{},inverse:self.program(3, program3, data),fn:self.program(1, program1, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n<div class=\"hr\"></div>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_questions_question_new_active'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<article>\n    <h3><input type='text' data-field=\"caption\" autofocus></h3>\n    <div class=\"content\">\n        <p>\n            <a class=\"btn\" data-send-button>Отправить</a>\n            <a class=\"mLeft10\" data-to-mode=\"button\">Отмена</a>\n        </p>\n    </div>\n    <div class=\"hr\"></div>\n</article>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_questions_question_passive'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
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
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<div class='di sortable' id ='elements'></div>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_questions_question_sent'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<div class=\"content\">\n        Ваш вопрос отправлен. Он появится в ленте после того, как автор даст на него ответ\n</div>\n\n<div class=\"content\">\n    <p>\n        <a class=\"btn\" data-to-mode='button'>Ок</a>\n    </p>\n</div>\n\n<div class=\"hr\"></div>\n";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['blog_about_page'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<header class=\"log-in\"></header>\n\n<section id=\"page-layout\">\n\n    <div class=\"postinfo\" id=\"nt\">\n        <div class=\"open-area\"></div>\n\n        <img src=\"./_temp/a1.jpg\" alt=\"\">\n        <h4><a class=\"usr-name\">Yasoon (Ясун)</a></h4>\n        <p class=\"u-description\">Любим то, что делаем</p>\n        <div class=\"hr\"></div>\n        <div class=\"pub\">\n            <h4 class=\"p-label\">Сотрудничество</h4>\n              <a  class=\"t-under c-black\" data-managed-content=\"4\"></a>\n            <div class=\"hr\"></div>\n        </div>\n        <div class=\"hr\"></div>\n        <div class=\"d-box\">\n            <div><p class=\"p-label\">историй</p> <a href=\"#explore/date/0\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.posts)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</a></div>\n            <div><p class=\"p-label\">людей</p> <a href=\"#people\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.people)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</a></div>\n        </div>\n    </div>\n\n    <article class=\"lim\">\n        <div class=\"like-title\">\n            <h1 data-managed-content=\"1\"></h1>\n        </div>\n        <div class=\"content\">\n            <p data-managed-content=\"2\"></p>\n\n        </div>\n        <div class=\"bottom-toolbar t-center\">\n            <a href=\"#blog\" class=\"btn\">Читать блог администрации</a>\n        </div>\n    </article>\n\n\n</section>\n\n<footer></footer>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['blog_agreement_page'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<header class=\"log-in\"></header>\n\n<section id=\"page-layout\">\n    <div class=\"post-edit\">\n        <article>\n            <h3 class=\"t-center\">Пользовательское соглашение</h3>\n            <div data-managed-content=\"10\">\n\n            </div>\n            <div class=\"hr\"></div>\n        </article>\n    </div>\n\n\n</section>\n\n<footer></footer>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['blog_blog_page'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  var buffer = "", stack1, self=this;

function program1(depth0,data) {
  
  
  return "\n                        <a class=\"btn\" id='follow'>Подписаться</a>\n                        <a class=\"btn close-question mLeft10\" id='unfollow' style='display:none'>Отписаться</a>\n                    ";
  }

function program3(depth0,data) {
  
  
  return "<a class=\"btn\" id='follow.anon' data-to-login>Подписаться</a>";
  }

  buffer += "<header class=\"log-in\"></header>\n\n<section id=\"page-layout\">\n\n    <nav class=\"navigate\">\n        <a class=\"active\">Новости</a>\n        <a href='#blog/questions'>Отзывы</a>\n    </nav>\n    <div class=\"postinfo\" id=\"nt\">\n        <div class=\"open-area\"></div>\n\n        <img src=\"./_temp/a1.jpg\" alt=\"\">\n        <h4><a class=\"usr-name\">Блог администрации</a></h4>\n        <div class=\"hr\"></div>\n\n\n        <div class=\"media-hidden\">\n            <div class=\"inner\">\n                <div class=\"b-indent\">Первый:<br>\n                    <a class=\"t-under c-black\">support@yasoon.ru</a>\n                </div>\n                <div class=\"b-indent\">Второй:<br>\n                    <a class=\"t-under c-black\">support@yasoon.ru</a>\n                </div>\n                <div class=\"b-indent\">Третий:<br>\n                    <a class=\"t-under c-black\">support@yasoon.ru</a>\n                </div>\n                <div class=\"hr\"></div>\n                <div class=\"social\">\n                    <div class=\"hr\"></div>\n                    ";
  stack1 = helpers['if'].call(depth0, depth0.isLoggedIn, {hash:{},inverse:self.program(3, program3, data),fn:self.program(1, program1, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n                </div>\n            </div>\n        </div>\n    </div>\n\n    <article class=\"lim cat-title\">\n        <div class=\"content\"><p>\n            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce elit tellus, fringilla sit amet rutrum ut, rhoncus eget augue. Integer elementum pretium nibh, porttitor elementum nibh vulputate eu. Sed suscipit dolor nunc, eget molestie ligula consectetur in. Duis eget enim scelerisque, ornare ante quis, molestie lacus. Maecenas laoreet molestie lacus eget pellentesque. Pellentesque egestas eros ut nisl pharetra pretium. Vestibulum a lectus varius, hendrerit nisl in, aliquet mi. Ut nec tempus nibh. Praesent sollicitudin urna eget nibh feugiat ullamcorper. Maecenas iaculis porta elit quis ultricies. Aliquam erat volutpat. Fusce sit amet dolor vehicula, euismod turpis id, volutpat erat. Ut at dui et turpis placerat varius. Nam sit amet enim suscipit, laoreet diam ut, bibendum tortor. Nulla convallis dolor eu arcu commodo accumsan.\n\nUt pellentesque tellus ipsum, vel pretium massa luctus eu. Fusce fringilla ultricies metus ut ullamcorper. Morbi eleifend scelerisque tristique. Sed et dapibus massa. Etiam ut metus ac enim eleifend bibendum. Integer mollis dapibus ipsum, ac commodo lorem laoreet eu. Sed nec eros nec turpis tempor placerat. Nam semper molestie tortor sit amet auctor. Donec enim nibh, sollicitudin quis suscipit quis, malesuada sit amet risus.\n\nDonec sed augue aliquet, interdum sem at, semper mauris. Sed tincidunt, magna eget scelerisque pulvinar, turpis neque commodo massa, vitae auctor tellus quam at lorem. Quisque malesuada tortor a lorem faucibus bibendum. Aenean id odio et nisi fermentum ultrices et non tellus. Duis et fringilla ligula. Sed ultricies dignissim dui, at porta ligula dignissim tempor. Proin in adipiscing libero. Vestibulum in volutpat turpis, dictum molestie velit. Ut id augue mauris. Suspendisse ornare pellentesque tincidunt. Duis bibendum ornare magna in scelerisque. Proin at egestas massa, malesuada vulputate mi. Morbi eleifend est tincidunt, vulputate est in, vehicula nunc.\n\nNullam enim urna, commodo eu nisl sollicitudin, fermentum rutrum tellus. Curabitur quam odio, pulvinar a fringilla id, viverra sed nibh. Fusce vel lacus tristique, placerat nisi et, suscipit erat. Phasellus magna sapien, consequat sed augue sed, viverra semper sapien. Vestibulum cursus vel eros dapibus condimentum. Vestibulum mollis, sem ut fermentum feugiat, mi justo mollis metus, in venenatis urna tellus non orci. Morbi ornare quam dui, at dapibus est adipiscing ac. Sed vitae lorem sed velit eleifend semper eget eget metus. Proin eu facilisis turpis, eu consequat velit. Praesent accumsan erat sit amet ligula sollicitudin, eu iaculis massa mollis. Vivamus mi nunc, vehicula eget massa at, imperdiet sodales risus. Donec diam velit, bibendum et nisl sit amet, fermentum sagittis tortor. Etiam sollicitudin vehicula libero, vel cursus leo iaculis a. Praesent tortor sem, rhoncus eu lorem sed, dictum lobortis ligula. Nulla eleifend in nisi sed commodo.\n\nQuisque at lectus tempus, faucibus quam quis, hendrerit sapien. Etiam tellus arcu, commodo quis fringilla dapibus, commodo vitae lorem. Cras tristique malesuada dignissim. Aenean et posuere diam, nec dapibus ipsum. Sed massa ante, lacinia nec hendrerit vel, tristique quis ante. Sed vel condimentum massa, quis luctus sem. Cras auctor diam varius consectetur ultrices. Aenean vehicula ante cursus sapien laoreet, ut malesuada mauris dignissim. Aliquam erat volutpat.\n\nAenean sit amet mi velit. In sapien nibh, dictum nec nulla a, tempor mattis risus. Praesent semper scelerisque scelerisque. Praesent sit amet magna sed neque porttitor molestie. Duis id dui laoreet lacus rutrum pulvinar. Nunc molestie lobortis bibendum. Donec ac adipiscing est. Phasellus auctor erat in elit lacinia feugiat. Donec porttitor id sem vel placerat.\n\nDonec eget volutpat magna, ut luctus tortor. Integer mollis, tortor non sagittis lacinia, sapien lorem fermentum ante, convallis lacinia mi metus eu mauris. Donec pretium magna in convallis posuere. Phasellus pharetra volutpat erat. Donec mi magna, posuere at leo ut, venenatis bibendum nulla. Vivamus at adipiscing orci, ac ornare neque. Sed sed mattis urna. Aliquam tincidunt elit eros, vitae fermentum leo malesuada porta. Nunc eget auctor purus. Nullam venenatis condimentum metus nec dictum. Aliquam id libero quis mauris vestibulum varius. Nulla id adipiscing urna.\n\nNullam lacinia bibendum tortor, ac condimentum elit vehicula non. In porttitor imperdiet nibh, sit amet ornare diam. Praesent convallis at lorem ut tempus. Mauris tempor, odio vitae congue varius, nunc tellus congue turpis, nec ullamcorper lacus enim vitae sem. Nulla ut fermentum lorem. Quisque id commodo elit, in tristique orci. Curabitur et sapien fringilla, lacinia turpis lobortis, fermentum ipsum. In sed condimentum tellus. Etiam viverra tristique ligula, sed volutpat sem facilisis nec. Curabitur bibendum augue adipiscing ipsum auctor egestas. Nunc a erat laoreet, mattis elit eget, tempor dui.\n\nPhasellus libero magna, bibendum eu nisl ut, tristique sodales odio. Sed id ligula sed dolor facilisis bibendum. Sed non massa lorem. Mauris ac arcu porta massa rhoncus tempus. Morbi porta a risus et viverra. Cras cursus dui sed odio euismod laoreet. Praesent lacus ipsum, porta quis velit ut, mattis faucibus ipsum.\n\nAliquam non nisi non odio rhoncus semper. Proin id eros eget dolor porttitor aliquet. Suspendisse potenti. Sed vitae semper odio. In blandit, magna id suscipit rutrum, tortor nunc imperdiet erat, vitae varius nisl enim ac urna. Aenean id mi lorem. Phasellus sit amet congue nulla.\n\nProin libero ligula, ornare ac augue at, tincidunt ultricies justo. Nam sed elementum orci. Mauris vestibulum est quis ipsum consequat, eu sodales felis facilisis. Morbi aliquet urna id leo commodo, vitae commodo sem dictum. In ullamcorper sem mollis, posuere lectus et, dapibus orci. Mauris facilisis eu sapien vitae convallis. In tempus ligula ac arcu fermentum, nec tempor leo gravida.\n\nProin venenatis purus elit, sollicitudin mattis ipsum lacinia eu. Aliquam sit amet dui luctus, hendrerit enim eu, luctus odio. Suspendisse nisl arcu, gravida quis est ut, sollicitudin lacinia neque. Nunc fermentum laoreet lacinia. Vivamus vitae nunc at urna vestibulum faucibus in vel leo. Nullam laoreet vel est vitae aliquam. Nam tellus risus, tempus ut placerat nec, eleifend non nibh. Curabitur vitae eros venenatis, egestas arcu non, cursus ligula. Pellentesque in quam sed sapien ultrices malesuada. Vivamus in elementum quam. Suspendisse est felis, suscipit nec tempus quis, eleifend eu sem. Nam eu laoreet sapien, sed pretium nibh. Duis mattis, velit nec hendrerit adipiscing, justo nunc ullamcorper nulla, nec condimentum sem justo ac odio.\n\nNam vehicula lectus a faucibus condimentum. Aliquam erat volutpat. Duis cursus nibh ac metus mollis placerat. Etiam fringilla luctus nisl id suscipit. Nam eu nulla nunc. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Praesent convallis imperdiet feugiat.\n\nDuis ultrices sodales magna quis laoreet. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Phasellus lacus ante, porta fermentum mollis ut, viverra id ligula. Sed vitae erat ipsum. Nam dapibus, nulla id commodo cursus, mauris eros auctor lectus, et varius mauris quam nec arcu. Praesent sit amet enim eu elit sagittis adipiscing vel nec ipsum. Proin sit amet diam a sapien egestas hendrerit ac quis turpis. Morbi justo orci, condimentum a diam sed, porttitor ultricies diam. Proin id risus id est elementum facilisis. Vivamus et arcu sit amet nisl egestas interdum ac ac nunc. Fusce ultricies eros ac scelerisque mattis. In eu nisl eget libero pellentesque suscipit. Aliquam ullamcorper lacinia nisl, non elementum magna sodales a.\n\nMauris porta nisl nisl, nec hendrerit mauris commodo nec. Donec placerat congue fringilla. Aenean imperdiet nunc id gravida facilisis. Vivamus laoreet dolor vitae viverra rhoncus. Nulla dui leo, suscipit non urna nec, condimentum porta mi. Sed eget malesuada risus. Curabitur eu diam ac urna cursus hendrerit vel vitae urna. Morbi risus orci, molestie in elit ut, rutrum gravida ligula. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Suspendisse at pellentesque mi. Nam ac massa eu turpis blandit blandit quis quis mi. Proin vel urna commodo, hendrerit quam et, venenatis sem.\n\nDuis sit amet elementum metus. Fusce porttitor commodo turpis, in adipiscing mauris pellentesque vitae. Donec metus ipsum, dapibus in lacinia nec, mattis vel mi. Integer tortor magna, volutpat sit amet malesuada eu, malesuada ut erat. Aliquam dignissim nibh sit amet augue iaculis, quis consectetur ligula sagittis. Etiam velit enim, rutrum et semper id, scelerisque vitae magna. Nulla vitae elit a urna fringilla blandit. Aliquam at venenatis turpis. Quisque consequat tellus eu est varius, sit amet volutpat massa dignissim.\n\nAliquam interdum varius nisi, porttitor pellentesque lacus placerat sed. Sed porta mauris a felis iaculis tempus. Curabitur dignissim lectus et dolor dapibus, ac congue orci suscipit. In dictum pharetra ipsum, et faucibus turpis pellentesque vel. Suspendisse vel metus sapien. Aenean nec erat eu ipsum sagittis lobortis non ut nulla. In nibh nisl, sollicitudin eget felis ut, congue facilisis lacus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In lobortis imperdiet mi. Fusce id neque in arcu vulputate semper. Donec varius sem ut dictum vestibulum. Nulla venenatis semper odio, sed iaculis massa vehicula et. Nullam rhoncus, tortor id feugiat dignissim, est justo vulputate mi, quis pellentesque tortor tellus vitae purus.\n\nAliquam ut ante non dui tempor euismod sed nec odio. Suspendisse suscipit in tortor a tincidunt. Sed pharetra sapien eu tellus sodales volutpat. Nam ut venenatis diam, in rhoncus velit. Nunc eget mattis orci. In at bibendum nunc. Vestibulum interdum pulvinar ipsum, at adipiscing leo adipiscing eu. Quisque quis massa id nisi aliquam elementum. Proin tincidunt lacus eget odio molestie, at euismod velit lobortis. Ut malesuada fringilla elit, ac egestas lacus interdum at. Integer vehicula rhoncus pellentesque. Nam et tortor et lorem porta lacinia a eu lorem. In eget pretium massa, nec iaculis magna. Aliquam fermentum leo vel metus mattis posuere. Vivamus volutpat, libero vel bibendum vulputate, lacus massa\n            <a class=\"btn\" href='#blog/new' data-permission=\"ADMIN\">Написать новый пост</a></p></div>\n        <div class=\"hr\"></div>\n    </article>\n\n    <div id='queue'>\n\n    </div>\n\n</section>\n\n<footer></footer>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['blog_blog_questions_page'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<header class=\"log-in\"></header>\n\n<section id=\"page-layout\" class=\"m-page\">\n\n    <article class=\"cat-title\">\n        <nav class=\"navigate\">\n            <a href=\"#blog\">Новости</a>\n            <a class=\"active\">Отзывы</a>\n        </nav>\n    </article>\n\n    <div id='new'></div>\n    <div id='queue'></div>\n\n</section>\n\n<footer></footer>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['common_footer'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<div class=\"inside\">\n    <div class=\"left aus\">© 2013 yasoon</div>\n\n    <nav>\n        <a href=\"#about\">Что это?</a>\n        <a href=\"#blog\">Блог</a>\n        <a href=\"#agreement\">Пользовательское соглашение</a>\n    </nav>\n\n    <div class=\"clearfix\"></div>\n</div>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['common_message'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
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
templates['e404page'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<header class=\"log-in\">\n    <div class=\"inside\">\n        <a class=\"logo\" href=\"/\">yasoon</a>\n        <div class=\"org-nav\">\n            <nav>\n                <a href=\"\">stories</a>\n                <a href=\"\">people</a>\n            </nav>\n        </div>\n    </div>\n</header>\n<section id=\"page-layout\" class=\"m-page\">\n\n    <div class=\"post-edit\">\n        <article>\n            <h3 class=\"t-center\">404</h3>\n            <div class=\"hr\"></div>\n        </article>\n\n</section>\n\n<footer>\n    <div class=\"inside\">\n        <div class=\"left aus\">© 2013 yasoon</div>\n        <nav>\n            <a href=\"\">About us</a>\n            <a href=\"\">Contact us</a>\n        </nav>\n        <div class=\"clearfix\"></div>\n    </div>\n</footer>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['index_daystory'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<a class=\"postinfo\" href='#author/"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.authorId)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "/posts'>\n    <img src=\"./_temp/a1.jpg\" alt=\"\">\n    <h4 class=\"usr-name\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.authorName)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</h4>\n    <p class=\"u-description\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.authorDescription)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</p>\n    <div class=\"hr\"></div>\n</a>\n\n<article class=\"lim\">\n    <div class=\"like-title\">\n        <span class=\"like-this\"><a href=\"\"><i></i></a> "
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.likes)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + " <span>лайков</span></span>\n        <h1>"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.caption)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + " <span class=\"media-pub\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.data)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</span></h1>\n    </div>\n    <div class=\"content\">\n        <p>"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.text)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</p>\n\n    </div>\n    <div class=\"q-box\">\n        <span class=\"like-this\"><a href=\"\"><i></i></a> "
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.likes)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + " <span>лайков</span></span>\n        <span class=\"q-post\">\n            <a href=\"#author/"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.authorId)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "/questions\" data-permission=\"THEM\"><i></i></a>\n            <a><i data-to-login=\"author/"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.authorId)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "/questions\" data-permission=\"ANON\"></i></a>\n            Вопросов автору: "
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.questions)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</span>\n    </div>\n    <article class=\"bottom-toolbar t-center\">\n        <a href=\"#explore/date/0\" class=\"btn\">Больше историй</a>\n    </article>\n</article>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['index_header'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<div id=\"bg-main\">\n    <div class=\"bg bg-panoram\" style=\"background-image: url(_temp/i6.jpg);\">bg</div>\n    <div class=\"inside\">\n        <a class=\"logo\" href=\"/\">yasoon</a>\n\n\n        <a class=\"sign-in\" data-to-login data-permission='ANON'>войти</a>\n        <a class=\"sign-in\" id='logout' data-permission='US,THEM,ADMIN'>выйти</a>\n\n\n        <div class=\"main-w\">\n            <p data-managed-content=\"0\"></p>\n            <a href=\"#explore/date/0\" class=\"btn\" data-managed-content=\"3\"></a>\n        </div>\n        <nav>\n            <a href=\"explore/date/0\">профессии</a>\n            <a href=\"people/0\">люди</a>\n        </nav>\n    </div>\n</div>\n";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['index_page'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<header></header>\n\n<section id=\"main-layout\">\n    <nav class=\"navigate\">\n        <a href=\"#\" class=\"active\">История дня</a>\n        <a href=\"#stories\">Лучшие истории</a>\n    </nav>\n\n    <div id='daystory'>\n    </div>\n</section>\n\n<footer></footer>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['index_stories_page'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<header></header>\n\n<section id=\"main-layout\">\n    <nav class=\"navigate\">\n        <a href=\"#\" >История дня</a>\n        <a href=\"#stories\" class=\"active\">Лучшие истории</a>\n    </nav>\n\n    <div id='queue'>\n    </div>\n</section>\n\n<footer></footer>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['index_stories_post'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<article>\n    <div class=\"p-label\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.authorName)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</div>\n\n    <h2><a href=\"#author/"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.authorId)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "/posts/"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.id)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.caption)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</a></h2>\n\n    <div class=\"content\">\n        <p>"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.preview)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</p>\n    </div>\n\n    <div class=\"hr\"></div>\n\n</article>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['index_stories_post_queue'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<div class='di' id ='elements'></div>\n\n<article class=\"bottom-toolbar t-center\">\n    <a class=\"btn\" href='#explore/date/0'>Больше историй</a>\n</article>\n";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['info_info_edit'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<div class=\"info-form\">\n    <form name=\"info-form\">\n        <article class=\"cat-title\">\n            <h3>Редактирование личной информации</h3>\n            <p class=\"fs c-grey\">Отредактируйте свой профиль и допишите истории</p>\n            <div class=\"hr\"></div>\n        </article>\n        <div class=\"di\"><input type=\"text\" placeholder=\"Имя\" data-field='name' value='"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.name)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "'>\n            <div class=\"hhdi hide-warning data_name\">Обязательно для заполнения</div>\n        </div>\n\n        <div class=\"di\"><input type=\"text\" placeholder=\"Email\"  data-field='email' value='"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.email)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "'>\n            <div class=\"hhdi hide-warning data_email\">Неправильный формат email</div>\n            <div class=\"hhdi\"><label> <input type=\"checkbox\">Подписаться на обновления</label></div>\n        </div>\n\n        <div class=\"di\"><input type=\"password\" id='newpass' placeholder=\"Новый пароль\" data-field=\"new_password\">\n            <div id='oldpass' style='display: none'>Введите текущий пароль:\n                <input type=\"password\" placeholder=\"Старый пароль\" data-field=\"old_password\">\n            </div>\n        </div>\n\n\n        <div class=\"di\"><input type=\"text\" placeholder=\"Ваша профессия или деятельность\" data-field=\"job\" value='"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.job)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "'></div>\n        <div class=\"di\"><input type=\"text\" placeholder=\"Кем вы хотели стать в детстве\" data-field=\"dreams\" value='"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.job)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "'></div>\n        <div class=\"di\"><input type=\"text\" placeholder=\"Профессия, которая вас вдохновляет\" data-field=\"interests\" value='"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.job)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "'></div>\n\n        <div class=\"di\"><textarea placeholder=\"Напишите краткую историю о себе\" data-field=\"description\" value='"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.job)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "'></textarea></div>\n\n        <div class=\"di\"><input type=\"text\" placeholder=\"Личная страница\" data-field=\"homepage\"></div>\n        <div class=\"di file_upload_block\">\n            <div class=\"btn di btn_upload_img\">Загрузить Изображение</div>\n            <input id=\"fileupload\" type=\"file\" name=\"files[]\" data-url=\"api/author/upload_user_image\">\n            <div class=\"files_success_upload\"></div>\n        </div>\n\n        <div data-send-button class=\"regbtn di\">Завершить правки</div>\n    </form>\n</div>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['info_page'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<header class=\"log-in\"></header>\n<section id=\"page-layout\" class=\"m-page\">\n</section>\n\n<footer></footer>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['people_author'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
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
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<div id ='elements'></div>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['people_author_queue_placeholder'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<article class=\"lim\">\n    <img src=\"./_temp/a1.jpg\" class=\"usr-ic\" alt=\"\">\n\n    <h2><a>пусто</a></h2>\n\n    <div class=\"content lic\">\n        <p>К сожалению, на эту тему ещё нет историй</p>\n        <p><a href='#register' class='btn'>Напишите свою</a></p>\n    </div>\n\n    <div class=\"hr\"></div>\n</article>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['people_explore_page'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression, self=this;

function program1(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "\n                <a id='"
    + escapeExpression(((stack1 = ((stack1 = data),stack1 == null || stack1 === false ? stack1 : stack1.key)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "' class='category active' href='"
    + escapeExpression(((stack1 = ((stack1 = data),stack1 == null || stack1 === false ? stack1 : stack1.key)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
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
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<article class=\"lim\">\n\n    <div class=\"p-label\"><a href=\"user.html\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.authorName)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</a></div>\n    <h2><a href=\"#author/"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.authorId)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "/posts/"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.id)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.caption)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</a></h2>\n    <div class=\"content\">\n        <p>"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.preview)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</p>\n    </div>\n    <div class=\"hr\"></div>\n\n</article>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['people_explore_post_queue'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<div id ='elements'></div>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['people_header'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  var buffer = "", stack1, stack2, functionType="function", escapeExpression=this.escapeExpression, self=this;

function program1(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "\n                                    upload/avatar/"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.img)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "\n                                   ";
  return buffer;
  }

function program3(depth0,data) {
  
  
  return "\n                                     ./_temp/a1.jpg\n                                   ";
  }

function program5(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "\n                    ("
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.questions)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + ")\n                    ";
  return buffer;
  }

  buffer += "    <div class=\"inside\">\n        <a class=\"logo\" href=\"/\">yasoon</a>\n        <div class=\"org-nav\">\n            <nav>\n                <a href=\"#explore/";
  if (stack1 = helpers.mode) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.mode; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "/";
  if (stack1 = helpers.catId) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.catId; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "\">Профессии</a>\n                <a href=\"#people/";
  if (stack1 = helpers.catId) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.catId; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "\">Люди</a>\n            </nav>\n        </div>\n        <div class=\"my-nav\">\n            <a href=\"#author/"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.id)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "/posts\"> <img src=\"";
  stack2 = helpers['if'].call(depth0, ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.img), {hash:{},inverse:self.program(3, program3, data),fn:self.program(1, program1, data),data:data});
  if(stack2 || stack2 === 0) { buffer += stack2; }
  buffer += "\" alt=\"\"> <span>"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.questions)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</span></a>\n            <nav>\n                <a href=\"#author/"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.id)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "/posts\">Профиль</a>\n                <a href='#author/"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.id)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "/questions'>Вопросы\n                    ";
  stack2 = helpers['if'].call(depth0, ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.questions), {hash:{},inverse:self.noop,fn:self.program(5, program5, data),data:data});
  if(stack2 || stack2 === 0) { buffer += stack2; }
  buffer += "\n                </a>\n                <a href=\"#timeline\">Лента</a>\n                <a id=\"logout\">Выйти</a>\n            </nav>\n        </div>\n        <div class=\"my-nav\" id='login' data-to-login data-permission=\"ANON\">\n        Войти\n        </div>\n    </div>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['people_page'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression, self=this;

function program1(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "\n                <a id='"
    + escapeExpression(((stack1 = ((stack1 = data),stack1 == null || stack1 === false ? stack1 : stack1.key)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "' class='category active' href='#people/"
    + escapeExpression(((stack1 = ((stack1 = data),stack1 == null || stack1 === false ? stack1 : stack1.key)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
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
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<div class=\"register-form\">\n    <form name=\"register-form\">\n        <article class=\"cat-title\">\n            <h3>Регистрация</h3>\n            <p class=\"fs c-grey\" data-managed-content=\"8\"></p>\n            <div class=\"hr\"></div>\n        </article>\n\n        <div class=\"di\"><input type=\"text\" placeholder=\"Имя\" data-field='name'>\n            <div class=\"hhdi hide-warning data_name\">Обязательно для заполнения</div>\n        </div>\n\n        <div class=\"di\"><input type=\"text\" placeholder=\"Email\"  data-field='email'>\n            <div class=\"hhdi hide-warning data_email\">Неправильный формат email</div>\n            <div class=\"hhdi\"><label> <input data-field=\"subscribed\" type=\"checkbox\">Подписаться на обновления</label></div>\n        </div>\n\n        <div class=\"di\"><input type=\"password\" placeholder=\"Пароль\" data-field=\"password\">\n            <div class=\"hhdi hide-warning data_password\">Обязательно для заполнения</div>\n        </div>\n        <div data-send-button class=\"regbtn di\">Регистрация</div>\n    </form>\n</div>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['register_active_step2'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<div class=\"register-form\">\n    <form name=\"register-form\">\n        <article class=\"cat-title\">\n            <h3>Всё прошло успешно</h3>\n            <p class=\"fs c-grey\" data-managed-content=\"9\"></p>\n            <div class=\"hr\"></div>\n        </article>\n\n        <div class=\"di\"><input type=\"text\" placeholder=\"Ваша профессия или деятельность\" data-field=\"job\"></div>\n        <div class=\"di\"><input type=\"text\" placeholder=\"Кем вы хотели стать в детстве\" data-field=\"dreams\"></div>\n        <div class=\"di\"><input type=\"text\" placeholder=\"Профессия, которая вас вдохновляет\" data-field=\"interests\"></div>\n\n        <div class=\"di\"><textarea placeholder=\"Напишите краткую историю о себе\" data-field=\"shortHistory\"></textarea></div>\n\n        <div class=\"di\"><input type=\"text\" placeholder=\"Личная страница\" data-field=\"homepage\"></div>\n        <div class=\"di file_upload_block\">\n            <div class=\"btn di btn_upload_img\">Загрузить Изображение</div>\n            <input id=\"fileuploadr\" type=\"file\" name=\"files[]\" data-url=\"api/author/upload_user_image\">\n            <div class=\"files_success_upload\"></div>\n        </div>\n\n        <div class=\"regbtn di reg_srep2\" data-send-button>Завершить регистрацию</div>\n\n    </form>\n</div>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['register_page'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<header class=\"log-in\"></header>\n\n<section id=\"page-layout\" class=\"m-page\">\n</section>\n\n<footer></footer>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['timeline_blank'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
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
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<header class=\"log-in\"></header>\n\n<section id=\"page-layout\" class=\"m-page\">\n\n    <article class=\"cat-title\">\n        <h4>обновления</h4>\n        <div class=\"hr\"></div>\n    </article>\n\n    <div id='queue'></div>\n\n</section>\n\n\n<footer></footer>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['timeline_placeholder'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<article>\n    <img src=\"./_temp/a1.jpg\" class=\"usr-ic\" alt=\"\">\n\n    <h2><a>Пусто</a></h2>\n\n    <div class=\"content lic\">\n        <p>Ваша лента пуста</p>\n        <p><a href='#people' class='btn'>Добавьте интересных людей</a></p>\n    </div>\n\n    <div class=\"hr\"></div>\n</article>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['timeline_post'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
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
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<div id ='elements'></div>\n\n<article class=\"bottom-toolbar t-center\">\n    <a class=\"btn\" data-more-button>Дальше</a>\n</article>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['timeline_question'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
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
