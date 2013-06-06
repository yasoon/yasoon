// Generated by CoffeeScript 1.6.1
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['views/base/view', 'JST', 'views/blankQuestion-view', 'models/blankQuestion'], function(View, JST, BlankQuestionView, BlankQuestion) {
  'use strict';
  var BlankQuestionsView;
  return BlankQuestionsView = (function(_super) {

    __extends(BlankQuestionsView, _super);

    function BlankQuestionsView() {
      return BlankQuestionsView.__super__.constructor.apply(this, arguments);
    }

    BlankQuestionsView.prototype.autoRender = true;

    BlankQuestionsView.prototype.className = 'blankQuestions';

    BlankQuestionsView.prototype.container = '#center';

    BlankQuestionsView.prototype.regions = {
      '#questions': 'questions'
    };

    BlankQuestionsView.prototype.templateName = 'blankQuestions';

    BlankQuestionsView.prototype.listen = {
      'updated model': 'render'
    };

    BlankQuestionsView.prototype.render = function() {
      var newView, question, view, _i, _len, _ref;
      BlankQuestionsView.__super__.render.apply(this, arguments);
      _ref = this.model.questions;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        question = _ref[_i];
        view = new BlankQuestionView({
          model: question
        });
      }
      return newView = (new BlankQuestionView({
        model: new BlankQuestion
      })).setButtonMode();
    };

    return BlankQuestionsView;

  })(View);
});
