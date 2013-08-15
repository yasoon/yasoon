// Generated by CoffeeScript 1.6.1
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['views/base/page', 'JST', 'views/common/footer', 'views/author/posts/header', 'views/author/posts/post', 'models/author/posts/post'], function(PageView, JST, FooterView, HeaderView, PostView, PostModel) {
  'use strict';
  var AuthorPostsReadPageView;
  return AuthorPostsReadPageView = (function(_super) {

    __extends(AuthorPostsReadPageView, _super);

    function AuthorPostsReadPageView() {
      return AuthorPostsReadPageView.__super__.constructor.apply(this, arguments);
    }

    AuthorPostsReadPageView.prototype.className = 'postPage';

    AuthorPostsReadPageView.prototype.regions = {
      '#post': 'post',
      'footer': 'footer',
      'header': 'header'
    };

    AuthorPostsReadPageView.prototype.templateName = 'author_posts_read_page';

    AuthorPostsReadPageView.prototype.initialize = function(params) {
      AuthorPostsReadPageView.__super__.initialize.call(this, params);
      this.authorId = params.authorId;
      return this.postId = params.postId;
    };

    AuthorPostsReadPageView.prototype.render = function() {
      var fv, hv,
        _this = this;
      AuthorPostsReadPageView.__super__.render.apply(this, arguments);
      hv = new HeaderView();
      fv = new FooterView();
      this.pModel = new PostModel({
        authorId: this.authorId,
        id: this.postId
      });
      return this.pModel.load(function() {
        var pView;
        return pView = new PostView({
          model: _this.pModel
        }).setRegion('post').setMode('full');
      });
    };

    AuthorPostsReadPageView.prototype.getTemplateData = function() {
      return {
        authorId: this.authorId
      };
    };

    return AuthorPostsReadPageView;

  })(PageView);
});
