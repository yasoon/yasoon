// Generated by CoffeeScript 1.6.1
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['controllers/base/controller', 'models/authorInfo', 'views/authorInfo-view', 'models/post', 'views/post-view', 'models/postQuestionsQueue', 'views/postQuestionsQueue-view', 'views/postPage-view', 'models/question', 'views/question-view'], function(Controller, AuthorInfo, AuthorInfoView, Post, PostView, PostQuestionsQueue, PostQuestionsQueueView, PostPageView, Question, QuestionView) {
  'use strict';
  var PostController;
  return PostController = (function(_super) {

    __extends(PostController, _super);

    function PostController() {
      return PostController.__super__.constructor.apply(this, arguments);
    }

    PostController.prototype.postAction = function(params) {
      var _this = this;
      this.post = new Post({
        id: params.id
      });
      return this.post.fetch(function() {
        var postPageView, postView;
        postPageView = new PostPageView();
        postView = new PostView({
          model: _this.post
        });
        postView.region = 'post';
        postView.setPassiveMode();
        _this.authorInfo = new AuthorInfo({
          id: _this.post.data.authorId
        });
        _this.authorInfo.fetch(function() {
          var infoView;
          return infoView = new AuthorInfoView({
            model: _this.authorInfo
          });
        });
        _this.postQuestionsQueue = new PostQuestionsQueue({
          id: params.id
        });
        _this.postQuestionsQueue.fetch(function() {
          var queueView;
          return queueView = new PostQuestionsQueueView({
            model: _this.postQuestionsQueue
          });
        });
        _this.newQuestion = new Question();
        _this.newQuestion.data.postId = params.id;
        _this.newQuestion.data.authorId = _this.post.data.authorId;
        _this.newQuestionView = new QuestionView({
          model: _this.newQuestion
        });
        _this.newQuestionView.region = 'newQuestion';
        return _this.newQuestionView.setButtonMode();
      });
    };

    return PostController;

  })(Controller);
});
