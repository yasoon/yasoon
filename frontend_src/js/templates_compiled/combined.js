var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['admin_blank_header'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<a class=\"logo\" href=\"#\">yasoon</a>\n\n<div class=\"org-nav\">\n    <nav>\n        <a>вопросы в анкете</a>\n    </nav>\n</div>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['admin_blank_page'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<header class=\"log-in\"></header>\n\n<div id = \"center\">\n    <article>\n        <h3 class=\"t-center\">Изменяйте вопросы и их последовательность</h3>\n        <div id='queue'></div>\n        <div id='new'></div>\n    </article>\n</div>\n\n\n<footer></footer>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['admin_blank_question_template_active'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<div class=\"di t-center\">\n\n    <div class = 'a-quertion'>\n        <div style='float:left'>"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.place)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</div>\n        <div contenteditable=\"true\" id='text'>"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.text)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</div>\n    </div>\n\n    <div class=\"btn\" data-send-button>Отправить!</div>\n</div>";
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
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<div class=\"di t-center\">\n\n    <div class = 'a-quertion'>\n        <div style='float:left'>"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.place)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</div>\n        <div contenteditable=\"false\" id='text'>"
    + escapeExpression(((stack1 = ((stack1 = depth0.model),stack1 == null || stack1 === false ? stack1 : stack1.text)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</div>\n    </div>\n\n    <div class=\"btn\" data-send-button>Отправить!</div>\n</div>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['common_footer'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<div class=\"left aus\">© 2013 yasoon</div>\n<nav>\n    <a href=\"\">About us</a>\n    <a href=\"\">Contact us</a>\n</nav>\n<div class=\"right\">\n</div>\n<div class=\"clearfix\"></div>";
  });
