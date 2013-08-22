// Generated by CoffeeScript 1.6.3
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['views/base/queue', 'JST', 'views/author/questions/question'], function(QueueView, JST, QuestionView) {
  'use strict';
  var AuthorQuestionsQuestionQueueView, _ref;
  return AuthorQuestionsQuestionQueueView = (function(_super) {
    __extends(AuthorQuestionsQuestionQueueView, _super);

    function AuthorQuestionsQuestionQueueView() {
      _ref = AuthorQuestionsQuestionQueueView.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    AuthorQuestionsQuestionQueueView.prototype.className = 'authorQuestionsQuestionQueue';

    AuthorQuestionsQuestionQueueView.prototype.templateName = 'author_questions_question_queue';

    AuthorQuestionsQuestionQueueView.prototype.sortable = true;

    AuthorQuestionsQuestionQueueView.prototype.createElementView = function(model) {
      return new QuestionView({
        model: model
      });
    };

    return AuthorQuestionsQuestionQueueView;

  })(QueueView);
});
