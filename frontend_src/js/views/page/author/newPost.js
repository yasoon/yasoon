// Generated by CoffeeScript 1.6.1
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['views/base/page-view', 'JST', 'views/footer', 'views/header/author_newPost', 'views/author/post', 'models/author/post'], function(PageView, JST, FooterView, HeaderView, PostView, Post) {
  'use strict';
  var AuthorNewPostView;
  return AuthorNewPostView = (function(_super) {

    __extends(AuthorNewPostView, _super);

    function AuthorNewPostView() {
      return AuthorNewPostView.__super__.constructor.apply(this, arguments);
    }

    AuthorNewPostView.prototype.className = 'postPage';

    AuthorNewPostView.prototype.regions = {
      '#post': 'post',
      '#new': 'new',
      'footer': 'footer',
      'header': 'header'
    };

    AuthorNewPostView.prototype.templateName = 'author_newPost-page';

    AuthorNewPostView.prototype.events = {
      'click #toInterview': function() {
        return this.publishEvent('redirect', "#posts/new_interview");
      },
      'click #toPost': function() {
        return this.publishEvent('redirect', "#posts/new");
      }
    };

    AuthorNewPostView.prototype.render = function() {
      var footerView, headerView, newPost;
      AuthorNewPostView.__super__.render.apply(this, arguments);
      footerView = new FooterView();
      headerView = new HeaderView();
      newPost = new PostView({
        model: new Post
      });
      newPost.region = 'post';
      return newPost.setActiveMode();
    };

    return AuthorNewPostView;

  })(PageView);
});