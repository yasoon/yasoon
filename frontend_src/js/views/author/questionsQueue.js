// Generated by CoffeeScript 1.6.1
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['views/base/view', 'JST', 'views/author/question', 'views/author/newQuestion', 'models/author/question'], function(View, JST, QuestionView, NewQuestionView, Question) {
  'use strict';
  var AuthorQuestionsQueue;
  return AuthorQuestionsQueue = (function(_super) {

    __extends(AuthorQuestionsQueue, _super);

    function AuthorQuestionsQueue() {
      return AuthorQuestionsQueue.__super__.constructor.apply(this, arguments);
    }

    AuthorQuestionsQueue.prototype.className = 'questionsQueue';

    AuthorQuestionsQueue.prototype.autoRender = true;

    AuthorQuestionsQueue.prototype.region = 'queue';

    AuthorQuestionsQueue.prototype.regions = {
      '#list': 'list',
      '#new': 'newQuestion'
    };

    AuthorQuestionsQueue.prototype.templateName = 'author_questionsQueue';

    AuthorQuestionsQueue.prototype.initialize = function() {
      AuthorQuestionsQueue.__super__.initialize.apply(this, arguments);
      this.subscribeEvent('questionAdded', this.addQuestion);
      return this.subscribeEvent('questionDeleted', this.deleteQuestion);
    };

    AuthorQuestionsQueue.prototype.addQuestion = function(question) {
      this.model.questions.splice(0, 0, question);
      return this.render();
    };

    AuthorQuestionsQueue.prototype.deleteQuestion = function(question) {
      var key, qst, _i, _len, _ref;
      _ref = this.model.questions;
      for (key = _i = 0, _len = _ref.length; _i < _len; key = ++_i) {
        qst = _ref[key];
        if (qst.data.id === question.data.id) {
          this.model.questions.splice(key, 1);
          break;
        }
      }
      return this.$el.find("#" + question.data.id).remove();
    };

    AuthorQuestionsQueue.prototype.getTemplateData = function() {
      return {
        questions: this.model.questions,
        authorized: this.authorized,
        isNotAuthorsPage: !this.authorized
      };
    };

    AuthorQuestionsQueue.prototype.addSortable = function() {
      var _this = this;
      this.$el.find('#list').sortable({
        cursor: 'move',
        update: function() {}
      });
      if (this.authorized) {
        return this.$el.find('#list').sortable('enable');
      } else {
        return this.$el.find('#list').sortable('disable');
      }
    };

    AuthorQuestionsQueue.prototype.softRender = function() {
      var view, _i, _len, _ref;
      _ref = this.views;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        view = _ref[_i];
        view.softRender();
      }
      this.manageAuthAreas();
      return this.addSortable();
    };

    AuthorQuestionsQueue.prototype.render = function() {
      var question, _i, _len, _ref;
      AuthorQuestionsQueue.__super__.render.apply(this, arguments);
      this.newQuestionView = new NewQuestionView({
        model: new Question({
          authorId: this.model.authorId
        })
      });
      this.views = [];
      _ref = this.model.questions;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        question = _ref[_i];
        this.views.push((new QuestionView({
          model: question
        })).setRegion('list').setPassiveMode());
      }
      this.manageAuthAreas();
      return this.addSortable();
    };

    return AuthorQuestionsQueue;

  })(View);
});
