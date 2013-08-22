// Generated by CoffeeScript 1.6.1
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['controllers/base/controller', 'views/author/questions/page', 'views/author/posts/page', 'views/author/posts/new/page', 'views/author/posts/new/blank/page', 'views/author/posts/read/page', 'views/author/posts/blank/page'], function(Controller, AuthorQuestionsPageView, AuthorPostsPageView, AuthorPostsNewPageView, AuthorPostsNewBlankPageView, AuthorPostsReadPageView, AuthorPostsBlankPageView) {
  'use strict';
  var AuthorController;
  return AuthorController = (function(_super) {

    __extends(AuthorController, _super);

    function AuthorController() {
      return AuthorController.__super__.constructor.apply(this, arguments);
    }

    AuthorController.prototype.questionsAction = function(params) {
      return this.questionsView = new AuthorQuestionsPageView({
        authorId: params.authorId
      });
    };

    AuthorController.prototype.postsAction = function(params) {
      return this.postsView = new AuthorPostsPageView({
        authorId: params.authorId
      });
    };

    AuthorController.prototype.newPostAction = function(params) {
      return this.postView = new AuthorPostsNewPageView({
        authorId: params.authorId
      });
    };

    AuthorController.prototype.newBlankPostAction = function(params) {
      return this.postView = new AuthorPostsNewBlankPageView({
        authorId: params.authorId
      });
    };

    AuthorController.prototype.readPostAction = function(params) {
      if (params.postId === 'blank') {
        return this.postView = new AuthorPostsBlankPageView({
          authorId: params.authorId
        });
      } else {
        return this.postView = new AuthorPostsReadPageView({
          authorId: params.authorId,
          postId: params.postId
        });
      }
    };

    return AuthorController;

  })(Controller);
});
