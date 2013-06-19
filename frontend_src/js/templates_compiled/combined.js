var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['admin_blank-page'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<header class=\"log-in\">\n</header>\n<div id = \"left\"></div>\n<div id = \"center\">\n    <article>\n        <h3 class=\"t-center\">Edit template questions</h3>\n        <div id='queue'></div>\n        <div id='new'></div>\n    </article>\n</div>\n<footer>\n</footer>\n\n";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_info'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, stack2, functionType="function", escapeExpression=this.escapeExpression, self=this;

function program1(depth0,data) {
  
  
  return "\n    <i></i>\n    ";
  }

  buffer += "<div class=\"open-area\"></div>\n\n<img src=\"./_temp/a1.jpg\" alt=\"\">\n<h4 class=\"usr-name editable\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.author),stack1 == null || stack1 === false ? stack1 : stack1.name)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "\n    ";
  stack2 = helpers['if'].call(depth0, depth0.authorized, {hash:{},inverse:self.noop,fn:self.program(1, program1, data),data:data});
  if(stack2 || stack2 === 0) { buffer += stack2; }
  buffer += "\n</h4>\n<p class=\"u-description\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.author),stack1 == null || stack1 === false ? stack1 : stack1.description)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</p>\n<div class=\"hr\"></div>\n<div class=\"pub\">\n    <h4 class=\"p-label\">published on</h4>\n    "
    + escapeExpression(((stack1 = ((stack1 = depth0.author),stack1 == null || stack1 === false ? stack1 : stack1.publicationDate)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "\n    <div class=\"hr\"></div>\n</div>\n\n<div class=\"media-hidden\">\n    <div class=\"inner\">\n        <div class=\"b-indent\">Job:<br>\n            <span class=\"t-under c-black\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.author),stack1 == null || stack1 === false ? stack1 : stack1.job)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</span>\n        </div>\n        <div class=\"b-indent\">Interest:<br>\n            <span class=\"t-under c-black\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.author),stack1 == null || stack1 === false ? stack1 : stack1.interest)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</span>\n        </div>\n        <div class=\"b-indent\">Dream:<br>\n            <span class=\"t-under c-black\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.author),stack1 == null || stack1 === false ? stack1 : stack1.dream)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</span>\n        </div>\n        <div class=\"hr\"></div>\n        <div class=\"d-box\">\n            <div><p class=\"p-label\">posts</p> <a href=\"\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.author),stack1 == null || stack1 === false ? stack1 : stack1.posts)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</a></div>\n            <div><p class=\"p-label\">answers</p> <a href=\"\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.author),stack1 == null || stack1 === false ? stack1 : stack1.answers)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</a></div>\n        </div>\n        <div class=\"clearfix\"></div>\n        <div class=\"hr\"></div>\n        <div class=\"hdi\">\n            <a href=\"\" class=\"btn\">Follow</a>\n        </div>\n    </div>\n</div>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_interviewQueue'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<div class='auth-area'>\n    <div class=\"di\"><input type=\"text\" placeholder=\"Заголовок интервью\" id=\"caption\" value='"
    + escapeExpression(((stack1 = ((stack1 = depth0.post),stack1 == null || stack1 === false ? stack1 : stack1.caption)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "'></div>\n    <div class=\"di\">\n        <select>\n            <option>Computers</option>\n            <option>Economy</option>\n            <option>Art</option>\n            <option>Science</option>\n            <option>Manufactory</option>\n            <option>Museums</option>\n            <option>Airplanes</option>\n            <option>Hand made with love</option>\n            <option>Hobbies</option>\n            <option>House riding</option>\n            <option>Racing sports</option>\n            <option>Olympic sports</option>\n        </select>\n    </div>\n</div>\n\n<div id=\"list\"></div>\n\n<div class='auth-area'>\n    <div id = 'new'></div>\n</div>\n";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_newInterviewQuestion_viewActive'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<h3>\n    <a><input type='text' value='"
    + escapeExpression(((stack1 = ((stack1 = depth0.question),stack1 == null || stack1 === false ? stack1 : stack1.caption)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "' id='caption'></a>\n    <span class='post-date'>"
    + escapeExpression(((stack1 = ((stack1 = depth0.question),stack1 == null || stack1 === false ? stack1 : stack1.date)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</span>\n</h3>\n<div class=\"content\">\n    <p>\n        <textarea id='body'>"
    + escapeExpression(((stack1 = ((stack1 = depth0.question),stack1 == null || stack1 === false ? stack1 : stack1.answer)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</textarea>\n    </p>\n    <p id=\"buttons\">\n        <a class=\"btn\" id=\"sendButton\">Send</a>\n        <a id=\"declineButton\" class=\"btn close-question mLeft10\">Decline</a>\n        <a class=\"mLeft10\" id='previewButton'>Preview</a>\n    </p>\n</div>\n<div class=\"hr\"></div>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_newInterviewQuestion_viewButton'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<div class=\"content\">\n    <p>\n        <a class=\"btn\" id='askQuestionButton'>Добавьте свой вопрос</a>\n    </p></div>\n<div class=\"hr\"></div>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_newPost-page'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<header class=\"log-in\">\n</header>\n    <section id=\"page-layout\"  class='m-page'>\n        <div class='post-edit'>\n            <nav class=\"navigate\">\n                <a id=\"toInterview\">Write with our help</a>\n                <a class=\"active\"  id=\"toPost\">Write by yourself</a>\n            </nav>\n            <div class=\"post-edit\" id = \"post\">\n                <article>\n                    <h3 class=\"t-center\">Write your own post</h3>\n                    <div class=\"hr\"></div>\n                </article>\n            </div>\n        </div>\n    </section>\n<footer>\n</footer>\n\n";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_newPostInterview-page'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<header class=\"log-in\">\n</header>\n    <section id=\"page-layout\" class='m-page'>\n        <div class='post-edit'>\n        <nav class=\"navigate\">\n            <a class=\"active\" id=\"toInterview\">Write with our help</a>\n            <a id=\"toPost\">Write by yourself</a>\n        </nav>\n        <div id='queue'>\n        </div>\n        </div>\n    </section>\n<footer>\n</footer>\n\n";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_newQuestion_viewActive'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<h3>\n    <a><input type='text' value='"
    + escapeExpression(((stack1 = ((stack1 = depth0.question),stack1 == null || stack1 === false ? stack1 : stack1.caption)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "' id='caption'></a>\n    <span class='post-date'>"
    + escapeExpression(((stack1 = ((stack1 = depth0.question),stack1 == null || stack1 === false ? stack1 : stack1.date)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</span>\n</h3>\n<div class=\"content\">\n    <p id=\"buttons\">\n        <a class=\"btn\" id=\"sendButton\">Send</a>\n    </p>\n</div>\n<div class=\"hr\"></div>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_newQuestion_viewButton'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<div class=\"content\">\n    <p>\n        <a class=\"btn\" id='askQuestionButton'>Задайте свой вопрос</a>\n    </p></div>\n<div class=\"hr\"></div>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_post_viewActive'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<div class=\"di\"><input type=\"text\" placeholder=\"Header of the story\" id=\"caption\" value='"
    + escapeExpression(((stack1 = ((stack1 = depth0.post),stack1 == null || stack1 === false ? stack1 : stack1.caption)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "'></div>\n<div class=\"di\">\n    <select>\n        <option>Computers</option>\n        <option>Economy</option>\n        <option>Art</option>\n        <option>Science</option>\n        <option>Manufactory</option>\n        <option>Museums</option>\n        <option>Airplanes</option>\n        <option>Hand made with love</option>\n        <option>Hobbies</option>\n        <option>House riding</option>\n        <option>Racing sports</option>\n        <option>Olympic sports</option>\n    </select>\n</div>\n\n<div class=\"di\">\n    <textarea placeholder=\"Description. Questions that help user to write a story\" id='preview'>"
    + escapeExpression(((stack1 = ((stack1 = depth0.post),stack1 == null || stack1 === false ? stack1 : stack1.preview)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</textarea>\n</div>\n\n<div class=\"di\">\n    <div class=\"post-edit-tools\">\n        <div class=\"item\"><b>b</b></div>\n        <div class=\"item\"><b><i>It</i></b></div>\n        <div class=\"item\"><b>Quote</b></div>\n        <div class=\"item\">Upload a picture</div>\n        <div class=\"clearfix\"></div>\n    </div>\n    <textarea class=\"big\" placeholder=\"Description. Questions that help user to write a story\" id='body'>"
    + escapeExpression(((stack1 = ((stack1 = depth0.post),stack1 == null || stack1 === false ? stack1 : stack1.text)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</textarea>\n</div>\n<div class=\"di t-center\">\n    <a class=\"btn\" id='sendButton'>Post it!</a> <a class=\"mLeft10\" id='previewButton'>Preview</a>\n</div>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_post_viewPassive'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, stack2, self=this, functionType="function", escapeExpression=this.escapeExpression;

function program1(depth0,data) {
  
  var buffer = "", stack1, stack2;
  buffer += "\n    <div class=\"di t-center\">\n            <a class=\"btn\" id='editButton'>Edit</a>\n        ";
  stack2 = helpers['if'].call(depth0, ((stack1 = depth0.post),stack1 == null || stack1 === false ? stack1 : stack1.id), {hash:{},inverse:self.noop,fn:self.program(2, program2, data),data:data});
  if(stack2 || stack2 === 0) { buffer += stack2; }
  buffer += "\n    </div>\n";
  return buffer;
  }
function program2(depth0,data) {
  
  
  return "\n            <a class=\"btn btn-danger\"  id='deleteButton'>Delete</a>\n        ";
  }

  buffer += "<article>\n    <div class=\"like-title\">\n        <span class=\"like-this\"></span>\n        <h1>"
    + escapeExpression(((stack1 = ((stack1 = depth0.post),stack1 == null || stack1 === false ? stack1 : stack1.caption)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + " <span class=\"media-pub\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.post),stack1 == null || stack1 === false ? stack1 : stack1.date)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</span></h1>\n    </div>\n    <div class=\"content\">\n        "
    + escapeExpression(((stack1 = ((stack1 = depth0.post),stack1 == null || stack1 === false ? stack1 : stack1.text)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "\n    </div>\n</article>\n";
  stack2 = helpers['if'].call(depth0, depth0.authorized, {hash:{},inverse:self.noop,fn:self.program(1, program1, data),data:data});
  if(stack2 || stack2 === 0) { buffer += stack2; }
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_posts-page'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<header class=\"log-in\">\n</header>\n    <section id=\"page-layout\">\n        <nav class=\"navigate\">\n            <a class=\"active\" id=\"toStories\">Stories</a>\n            <a id=\"toAnswers\">Answers</a>\n        </nav>\n        <div class=\"postinfo\" id=\"authorInfo\">\n        </div>\n        <div id=\"queue\">\n        </div>\n\n    </section>\n<footer>\n</footer>\n\n";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_postsQueue'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression, self=this;

function program1(depth0,data) {
  
  
  return "\n<article class=\"cat-title\">\n    <div class=\"content\"><p><a href=\"#posts/new\" class=\"btn\">Write a new post</a></p></div>\n    <div class=\"hr\"></div>\n</article>\n";
  }

function program3(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "\n    <article>\n        <div class=\"like-title\">\n            <span class=\"like-this\"><i></i> 0 <span>likes</span></span>\n            <h2><a href=\"#author/";
  if (stack1 = helpers.authorId) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.authorId; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "/posts/";
  if (stack1 = helpers.id) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.id; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "\">";
  if (stack1 = helpers.caption) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.caption; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "</a> <span class=\"post-date\">";
  if (stack1 = helpers.date) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.date; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "</span></h2>\n        </div>\n        <div class=\"content\">\n            <p>";
  if (stack1 = helpers.preview) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.preview; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "</p>\n        </div>\n        <div class=\"hr\"></div>\n    </article>\n    ";
  return buffer;
  }

  stack1 = helpers['if'].call(depth0, depth0.authorized, {hash:{},inverse:self.noop,fn:self.program(1, program1, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n\n<div class ='posts'>\n    ";
  stack1 = helpers.each.call(depth0, depth0.posts, {hash:{},inverse:self.noop,fn:self.program(3, program3, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n</div>\n";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_question_viewActive'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<h3>\n    <a><input type='text' value='"
    + escapeExpression(((stack1 = ((stack1 = depth0.question),stack1 == null || stack1 === false ? stack1 : stack1.caption)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "' id='caption'></a>\n    <span class='post-date'>"
    + escapeExpression(((stack1 = ((stack1 = depth0.question),stack1 == null || stack1 === false ? stack1 : stack1.date)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</span>\n</h3>\n<div class=\"content\">\n    <p>\n        <textarea id='body'>"
    + escapeExpression(((stack1 = ((stack1 = depth0.question),stack1 == null || stack1 === false ? stack1 : stack1.answer)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</textarea>\n    </p>\n    <p id=\"buttons\">\n        <a class=\"btn\" id=\"sendButton\">Send</a>\n        <a id=\"declineButton\" class=\"btn close-question mLeft10\">Decline</a>\n        <a class=\"mLeft10\" id='previewButton'>Preview</a>\n    </p>\n</div>\n<div class=\"hr\"></div>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_question_viewPassive'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<h3>\n    <a>"
    + escapeExpression(((stack1 = ((stack1 = depth0.question),stack1 == null || stack1 === false ? stack1 : stack1.caption)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</a>\n    <span class='post-date'>"
    + escapeExpression(((stack1 = ((stack1 = depth0.question),stack1 == null || stack1 === false ? stack1 : stack1.date)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</span>\n</h3>\n<div class=\"content\">\n    <p>"
    + escapeExpression(((stack1 = ((stack1 = depth0.question),stack1 == null || stack1 === false ? stack1 : stack1.answer)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</p>\n</div>\n<div class=\"hr\"></div>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_questions-page'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<header class=\"log-in\">\n</header>\n    <section id=\"page-layout\">\n        <nav class=\"navigate\">\n            <a id=\"toStories\">Stories</a>\n            <a class=\"active\"  id=\"toAnswers\">Answers</a>\n        </nav>\n        <div class=\"postinfo\" id=\"authorInfo\">\n        </div>\n        <div id=\"queue\">\n        </div>\n\n    </section>\n<footer>\n</footer>\n\n";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_questionsQueue'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<div id = 'new'></div>\n\n<div id=\"list\"></div>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['blank-page'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<header class=\"log-in\">\n</header>\n<section id=\"page-layout\">\n    <div class=\"postinfo\" id=\"authorInfo\">\n    </div>\n    <div id=\"queue\">\n    </div>\n\n</section>\n<footer>\n<footer>\n</footer>\n\n";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['blankQuestion_queue'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<ul id=\"list\"></ul>\n\n";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['blankQuestion_viewActive'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, stack2, functionType="function", escapeExpression=this.escapeExpression, self=this;

function program1(depth0,data) {
  
  
  return "\n        <div id='deleteButton' class='btn-danger'>delete</div>\n        ";
  }

  buffer += "<div class = 'question' id='"
    + escapeExpression(((stack1 = ((stack1 = depth0.question),stack1 == null || stack1 === false ? stack1 : stack1.id)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "'>\n    <textarea id='"
    + escapeExpression(((stack1 = ((stack1 = depth0.question),stack1 == null || stack1 === false ? stack1 : stack1.id)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "' class='body'>"
    + escapeExpression(((stack1 = ((stack1 = depth0.question),stack1 == null || stack1 === false ? stack1 : stack1.text)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</textarea>\n    <div id=\"buttons\">\n        <div id='sendButton' class='btn'>send</div>\n        ";
  stack2 = helpers['if'].call(depth0, ((stack1 = depth0.question),stack1 == null || stack1 === false ? stack1 : stack1.id), {hash:{},inverse:self.noop,fn:self.program(1, program1, data),data:data});
  if(stack2 || stack2 === 0) { buffer += stack2; }
  buffer += "\n    </div>\n</div>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['blankQuestion_viewButton'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<div id=\"newButton\" class='btn'>Add question</div>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['blankQuestion_viewPassive'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<div id='"
    + escapeExpression(((stack1 = ((stack1 = depth0.question),stack1 == null || stack1 === false ? stack1 : stack1.id)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "' class='question'>\n    <b>"
    + escapeExpression(((stack1 = ((stack1 = depth0.question),stack1 == null || stack1 === false ? stack1 : stack1.place)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + ") </b>"
    + escapeExpression(((stack1 = ((stack1 = depth0.question),stack1 == null || stack1 === false ? stack1 : stack1.text)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "\n</div>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['footer'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<div class=\"left aus\">© 2013 yasoon</div>\n    <nav>\n        <a href=\"\">About us</a>\n        <a href=\"\">Contact us</a>\n    </nav>\n    <div class=\"right\">\n    </div>\n<div class=\"clearfix\"></div>\n\n\n";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['header_admin_blank'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<a class=\"logo\" href=\"#\">yasoon</a>\n<div class=\"org-nav\">\n    <nav>\n        <a>form questions</a>\n    </nav>\n</div>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['header_author_newPost'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, self=this;

function program1(depth0,data) {
  
  
  return "\n            <a id='logoutButton'>Log out</a>\n        ";
  }

function program3(depth0,data) {
  
  
  return "\n            <a id='loginButton'>Log in</a>\n        ";
  }

  buffer += "<a class=\"logo\" href=\"#\">yasoon</a>\n<div class=\"org-nav\">\n    <nav>\n        <a>stories</a>\n        <a>people</a>\n    </nav>\n</div>\n<div class=\"my-nav\">\n    <a> <img src=\"./_temp/a1.jpg\" alt=\"\"> <span>0</span></a>\n    <nav>\n        ";
  stack1 = helpers['if'].call(depth0, depth0.authorized, {hash:{},inverse:self.program(3, program3, data),fn:self.program(1, program1, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n    </nav>\n</div>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['header_author_posts'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, self=this;

function program1(depth0,data) {
  
  
  return "\n            <a id='logoutButton'>Log out</a>\n        ";
  }

function program3(depth0,data) {
  
  
  return "\n            <a id='loginButton'>Log in</a>\n        ";
  }

  buffer += "<a class=\"logo\" href=\"#\">yasoon</a>\n<div class=\"org-nav\">\n    <nav>\n        <a>stories</a>\n        <a>people</a>\n    </nav>\n</div>\n<div class=\"my-nav\">\n    <a> <img src=\"./_temp/a1.jpg\" alt=\"\"> <span>0</span></a>\n    <nav>\n        ";
  stack1 = helpers['if'].call(depth0, depth0.authorized, {hash:{},inverse:self.program(3, program3, data),fn:self.program(1, program1, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n    </nav>\n</div>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['newPostButton'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<div id=\"newPostButton\">Write a new post</div>\n";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['newQuestionButton'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<div id=\"newQuestionButton\">Ask a question</div>\n";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['newtest'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "noch einmal";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['post-page'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<header class=\"log-in\">\n</header>\n<section id=\"page-layout\">\n    <div class=\"postinfo\" id=\"authorInfo\">\n    </div>\n    <div id=\"queue\" class='post-edit'>\n    </div>\n\n</section>\n<footer>\n<footer>\n</footer>\n\n";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['postActive'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<div class = 'activePost'>\n    <input type='text' class ='activePostCaption' value='"
    + escapeExpression(((stack1 = ((stack1 = depth0.post),stack1 == null || stack1 === false ? stack1 : stack1.caption)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "' placeholder='caption'/>\n    <textarea class ='activePostPreview' placeholder=\"preview\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.post),stack1 == null || stack1 === false ? stack1 : stack1.preview)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</textarea>\n    <textarea class ='activePostBody' placeholder=\"body\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.post),stack1 == null || stack1 === false ? stack1 : stack1.text)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</textarea>\n    <div id=\"sendPostButton\">send!</div>\n</div>\n";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['postPage'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<div id=\"post\"></div>\n<div id=\"newQuestion\"></div>\n<div id=\"questions\"></div>\n";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['postPassive'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<div class = 'passivePost'>\n    <div class ='passivePostCaption'>"
    + escapeExpression(((stack1 = ((stack1 = depth0.post),stack1 == null || stack1 === false ? stack1 : stack1.caption)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</div>\n    <div class ='passivePostBody'>"
    + escapeExpression(((stack1 = ((stack1 = depth0.post),stack1 == null || stack1 === false ? stack1 : stack1.text)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</div>\n    <div id=\"editPostButton\">edit</div>\n    <div id=\"deletePostButton\">delete</div>\n</div>\n";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['postQuestionsQueue'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var stack1, self=this;

function program1(depth0,data) {
  
  
  return "\n";
  }

  stack1 = helpers.each.call(depth0, depth0.questions, {hash:{},inverse:self.noop,fn:self.program(1, program1, data),data:data});
  if(stack1 || stack1 === 0) { return stack1; }
  else { return ''; }
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['questionActive'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<div class = 'activeQuestion'>\n    <textarea class ='activeQuestionBody' placeholder=\"body\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.question),stack1 == null || stack1 === false ? stack1 : stack1.text)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</textarea>\n    <div id=\"sendQuestionButton\">send!</div>\n</div>\n";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['test'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "something new?";
  });
