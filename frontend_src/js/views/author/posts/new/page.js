// Generated by CoffeeScript 1.6.1
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['views/base/page', 'JST', 'views/common/footer', 'views/author/posts/header', 'views/author/posts/post', 'models/author/posts/post'], function(PageView, JST, FooterView, HeaderView, PostView, PostModel) {
  'use strict';
  var AuthorPostsNewPageView;
  return AuthorPostsNewPageView = (function(_super) {

    __extends(AuthorPostsNewPageView, _super);

    function AuthorPostsNewPageView() {
      return AuthorPostsNewPageView.__super__.constructor.apply(this, arguments);
    }

    AuthorPostsNewPageView.prototype.className = 'postPage';

    AuthorPostsNewPageView.prototype.regions = {
      '#post': 'post',
      'footer': 'footer',
      'header': 'header'
    };

    AuthorPostsNewPageView.prototype.templateName = 'author_posts_new_page';

    AuthorPostsNewPageView.prototype.initialize = function(params) {
      AuthorPostsNewPageView.__super__.initialize.call(this, params);
      return this.authorId = params.authorId;
    };

    AuthorPostsNewPageView.prototype.render = function() {
      var fv, hv, pModel, pView;
      AuthorPostsNewPageView.__super__.render.apply(this, arguments);
      hv = new HeaderView();
      fv = new FooterView();
      pModel = new PostModel({
        authorId: this.authorId
      });
      return pView = new PostView({
        model: pModel
      }).setRegion('post').setMode('active');
    };

    AuthorPostsNewPageView.prototype.getTemplateData = function() {
      return {
        authorId: this.authorId
      };
    };

    return AuthorPostsNewPageView;

  })(PageView);
});
