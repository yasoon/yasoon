// Generated by CoffeeScript 1.6.3
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['views/base/page', 'JST', 'views/common/footer', 'views/author/posts/header', 'views/author/posts/new/blank/question', 'models/author/posts/new/blank/question', 'views/author/posts/new/blank/questionQueue', 'models/author/posts/new/blank/questionQueue'], function(PageView, JST, FooterView, HeaderView, QuestionView, QuestionModel, QuestionQueueView, QuestionQueueModel) {
  'use strict';
  var AuthorPostsBlankPageView, _ref;
  return AuthorPostsBlankPageView = (function(_super) {
    __extends(AuthorPostsBlankPageView, _super);

    function AuthorPostsBlankPageView() {
      _ref = AuthorPostsBlankPageView.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    AuthorPostsBlankPageView.prototype.className = 'postPage';

    AuthorPostsBlankPageView.prototype.regions = {
      '#queue': 'queue',
      'footer': 'footer',
      'header': 'header'
    };

    AuthorPostsBlankPageView.prototype.templateName = 'author_posts_blank_page';

    AuthorPostsBlankPageView.prototype.initialize = function(params) {
      AuthorPostsBlankPageView.__super__.initialize.call(this, params);
      return this.authorId = params.authorId;
    };

    AuthorPostsBlankPageView.prototype.render = function() {
      var fv, hv, qqModel,
        _this = this;
      AuthorPostsBlankPageView.__super__.render.apply(this, arguments);
      hv = new HeaderView();
      fv = new FooterView();
      return qqModel = (new QuestionQueueModel({
        authorId: this.authorId
      })).load(function() {
        var qqView;
        qqView = new QuestionQueueView({
          model: qqModel
        });
        return qqView.setRegion('queue').render();
      });
    };

    AuthorPostsBlankPageView.prototype.getTemplateData = function() {
      return {
        authorId: this.authorId
      };
    };

    return AuthorPostsBlankPageView;

  })(PageView);
});
