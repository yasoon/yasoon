// Generated by CoffeeScript 1.6.1
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['views/base/page', 'JST', 'views/common/footer', 'views/author/posts/header', 'views/author/posts/postQueue', 'models/author/posts/postQueue'], function(PageView, JST, FooterView, HeaderView, PostQueueView, PostQueueModel) {
  'use strict';
  var AuthorPostsPageView;
  return AuthorPostsPageView = (function(_super) {

    __extends(AuthorPostsPageView, _super);

    function AuthorPostsPageView() {
      return AuthorPostsPageView.__super__.constructor.apply(this, arguments);
    }

    AuthorPostsPageView.prototype.className = 'postPage';

    AuthorPostsPageView.prototype.regions = {
      '#queue': 'queue',
      'footer': 'footer',
      'header': 'header'
    };

    AuthorPostsPageView.prototype.templateName = 'author_posts_page';

    AuthorPostsPageView.prototype.initialize = function(params) {
      AuthorPostsPageView.__super__.initialize.call(this, params);
      return this.authorId = params.authorId;
    };

    AuthorPostsPageView.prototype.render = function() {
      var fv, hv, qqModel,
        _this = this;
      AuthorPostsPageView.__super__.render.apply(this, arguments);
      hv = new HeaderView();
      fv = new FooterView();
      return qqModel = (new PostQueueModel({
        authorId: this.authorId
      })).load(function() {
        var qqView;
        qqView = new PostQueueView({
          model: qqModel
        });
        return qqView.setRegion('queue').render();
      });
    };

    AuthorPostsPageView.prototype.getTemplateData = function() {
      return {
        authorId: this.authorId
      };
    };

    return AuthorPostsPageView;

  })(PageView);
});
