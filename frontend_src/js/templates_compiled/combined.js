var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['admin_blank-page'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<header class=\"log-in\">\n</header>\n<div id = \"left\"></div>\n<div id = \"center\">\n    <article>\n        <h3 class=\"t-center\">Edit template questions</h3>\n        <div id='queue'></div>\n        <div id='new'></div>\n    </article>\n</div>\n<footer>\n</footer>\n\n";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['authorInfo'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "Photo\n<h4>"
    + escapeExpression(((stack1 = ((stack1 = depth0.author),stack1 == null || stack1 === false ? stack1 : stack1.name)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</h4>\nPosts: "
    + escapeExpression(((stack1 = ((stack1 = depth0.author),stack1 == null || stack1 === false ? stack1 : stack1.posts)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + " Answers: "
    + escapeExpression(((stack1 = ((stack1 = depth0.author),stack1 == null || stack1 === false ? stack1 : stack1.answers)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1));
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['authorPosts'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<div id=\"switcher\">\n    <div id=\"posts\" class = 'active'>Stories</div>\n    <div id=\"questions\">Questions</div>\n</div>\n<div id=\"newPost\">\n</div>\n<div id=\"postsQueue\">\n</div>";
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['authorPostsQueue'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var stack1, functionType="function", escapeExpression=this.escapeExpression, self=this;

function program1(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "\n    <div class=\"post\" id=";
  if (stack1 = helpers.id) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.id; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + ">\n        <div class=\"caption\">";
  if (stack1 = helpers.caption) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.caption; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "</div>\n        <div class=\"preview\">";
  if (stack1 = helpers.preview) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.preview; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "</div>\n    </div>\n";
  return buffer;
  }

  stack1 = helpers.each.call(depth0, depth0.posts, {hash:{},inverse:self.noop,fn:self.program(1, program1, data),data:data});
  if(stack1 || stack1 === 0) { return stack1; }
  else { return ''; }
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_info'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<div class=\"open-area\"></div>\n\n<img src=\"./_temp/a1.jpg\" alt=\"\">\n<h4 class=\"usr-name\">"
    + escapeExpression(((stack1 = ((stack1 = depth0.author),stack1 == null || stack1 === false ? stack1 : stack1.name)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</h4>\n<p class=\"u-description\">I'am rock designer. I really love good interfaces.</p>\n<div class=\"hr\"></div>\n<div class=\"pub\">\n    <h4 class=\"p-label\">published on</h4>\n    17 April 2013\n    <div class=\"hr\"></div>\n</div>\n\n<div class=\"media-hidden\">\n    <div class=\"inner\">\n        <div class=\"b-indent\">Job:<br>\n            <span class=\"t-under c-black\">Designer</span> 5 years\n        </div>\n        <div class=\"b-indent\">Interest:<br>\n            <span class=\"t-under c-black\">Teacher</span>\n        </div>\n        <div class=\"b-indent\">Dream:<br>\n            <span class=\"t-under c-black\">Farmer</span>\n        </div>\n        <div class=\"hr\"></div>\n        <div class=\"d-box\">\n            <div><p class=\"p-label\">posts</p> <a href=\"\">24</a></div>\n            <div><p class=\"p-label\">answers</p> <a href=\"\">174</a></div>\n        </div>\n        <div class=\"clearfix\"></div>\n        <div class=\"hr\"></div>\n        <div class=\"hdi\">\n            <a href=\"\" class=\"btn\">Follow</a>\n        </div>\n    </div>\n</div>";
  return buffer;
  });

var Handlebars = require('handlebars');
var template = Handlebars.template, templates = JST = JST || {};
templates['author_posts-page'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<header class=\"log-in\">\n</header>\n    <section id=\"page-layout\">\n        <nav class=\"navigate\">\n            <a class=\"active\">Stories</a>\n            <a>Answers</a>\n        </nav>\n\n        <div class=\"postinfo\" id=\"authorInfo\">\n        </div>\n\n    </section>\n<footer>\n</footer>\n\n";
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
templates['blankQuestions'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<div id=\"questions\"></div>";
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
templates['header_author_posts'] = template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<a class=\"logo\" href=\"#\">yasoon</a>\n<div class=\"org-nav\">\n    <nav>\n        <a>stories</a>\n        <a>people</a>\n    </nav>\n</div>";
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
