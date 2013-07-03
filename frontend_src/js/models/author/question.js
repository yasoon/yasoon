// Generated by CoffeeScript 1.6.1
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['chaplin', 'models/base/model'], function(Chaplin, Model) {
  'use strict';
  var Question,
    _this = this;
  return Question = (function(_super) {

    __extends(Question, _super);

    function Question() {
      var _this = this;
      this.addInterview = function(callback) {
        return Question.prototype.addInterview.apply(_this, arguments);
      };
      return Question.__super__.constructor.apply(this, arguments);
    }

    Question.prototype.initialize = function(obj) {
      Question.__super__.initialize.apply(this, arguments);
      this.data = {};
      if ((obj != null) && (obj.authorId != null)) {
        return this.data.authorId = obj.authorId;
      }
    };

    Question.prototype.update = function(callback) {
      var editCallback,
        _this = this;
      this.fetchParams = {};
      this.fetchParams.method = "POST";
      this.fetchParams.data = {
        model: {
          id: this.data.id,
          caption: this.data.caption,
          answer: this.data.answer
        }
      };
      this.url = function() {
        return "api/question/update";
      };
      editCallback = function() {
        return callback();
      };
      return this.request(editCallback);
    };

    Question.prototype.addInterview = function(callback) {
      var addCallback,
        _this = this;
      this.fetchParams = {};
      this.fetchParams.method = "POST";
      this.fetchParams.data = {
        model: {
          caption: this.data.caption,
          authorId: this.data.authorId,
          answer: this.data.answer
        }
      };
      this.url = function() {
        return "api/question/add_interview";
      };
      addCallback = function() {
        var addedQuestion;
        addedQuestion = new Question;
        addedQuestion.data = {
          id: _this.data.id,
          caption: _this.data.caption,
          date: _this.data.date,
          answer: _this.data.answer
        };
        _this.publishEvent('questionAdded', addedQuestion);
        _this.data.id = void 0;
        _this.data.caption = '';
        _this.data.text = '';
        return typeof callback === "function" ? callback() : void 0;
      };
      return this.request(addCallback);
    };

    Question.prototype.add = function(callback) {
      var addCallback,
        _this = this;
      this.fetchParams = {};
      this.fetchParams.method = "POST";
      this.fetchParams.data = {
        model: {
          caption: this.data.caption,
          authorId: this.data.authorId
        }
      };
      this.url = function() {
        return "api/question/add";
      };
      addCallback = function() {
        var addedQuestion;
        addedQuestion = new Question;
        addedQuestion.data = {
          id: _this.data.id,
          caption: _this.data.caption,
          date: _this.data.date
        };
        _this.publishEvent('questionAdded', addedQuestion);
        _this.data.id = void 0;
        _this.data.caption = '';
        _this.data.text = '';
        return callback();
      };
      return this.request(addCallback);
    };

    Question.prototype["delete"] = function(callback) {
      var deleteCallback,
        _this = this;
      this.fetchParams = {};
      this.fetchParams.method = "POST";
      this.fetchParams.data = {
        model: {
          id: this.data.id
        }
      };
      this.url = function() {
        return "api/question/delete";
      };
      deleteCallback = function() {
        _this.publishEvent('questionDeleted', _this);
        return typeof callback === "function" ? callback() : void 0;
      };
      return this.request(deleteCallback());
    };

    return Question;

  })(Model);
});
