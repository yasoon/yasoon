// Generated by CoffeeScript 1.6.1
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['views/base/page', 'JST', 'views/common/footer', 'views/author/questions/header', 'views/author/questions/questionQueue', 'models/author/questions/questionQueue', 'views/author/questions/question', 'models/author/questions/question'], function(PageView, JST, FooterView, HeaderView, QuestionQueueView, QuestionQueueModel, QuestionView, QuestionModel) {
  'use strict';
  var BlogBlogQuestionsPageView;
  return BlogBlogQuestionsPageView = (function(_super) {

    __extends(BlogBlogQuestionsPageView, _super);

    function BlogBlogQuestionsPageView() {
      return BlogBlogQuestionsPageView.__super__.constructor.apply(this, arguments);
    }

    BlogBlogQuestionsPageView.prototype.className = 'postPage';

    BlogBlogQuestionsPageView.prototype.regions = {
      'queue': '#queue',
      'new': '#new',
      'footer': 'footer',
      'header': 'header'
    };

    BlogBlogQuestionsPageView.prototype.templateName = 'blog_blog_questions_page';

    BlogBlogQuestionsPageView.prototype.initialize = function(params) {
      BlogBlogQuestionsPageView.__super__.initialize.call(this, params);
      return this.authorId = 0;
    };

    BlogBlogQuestionsPageView.prototype.render = function() {
      var fv, hv, qqModel, qtv,
        _this = this;
      BlogBlogQuestionsPageView.__super__.render.apply(this, arguments);
      hv = new HeaderView();
      fv = new FooterView();
      qtv = new QuestionView({
        model: new QuestionModel({
          authorId: this.authorId
        })
      });
      qtv.setRegion('new').setMode('button');
      return qqModel = (new QuestionQueueModel({
        authorId: this.authorId
      })).load(function() {
        var qqView;
        return qqView = new QuestionQueueView({
          model: qqModel
        });
      });
    };

    BlogBlogQuestionsPageView.prototype.getTemplateData = function() {
      return {
        authorId: this.authorId
      };
    };

    return BlogBlogQuestionsPageView;

  })(PageView);
});
