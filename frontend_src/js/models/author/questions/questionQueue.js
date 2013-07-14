// Generated by CoffeeScript 1.6.1
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['models/base/queue', 'models/author/questions/question'], function(Queue, QuestionModel) {
  'use strict';
  var AuthorQuestionsQuestionQueueModel;
  return AuthorQuestionsQuestionQueueModel = (function(_super) {

    __extends(AuthorQuestionsQuestionQueueModel, _super);

    function AuthorQuestionsQuestionQueueModel() {
      return AuthorQuestionsQuestionQueueModel.__super__.constructor.apply(this, arguments);
    }

    AuthorQuestionsQuestionQueueModel.prototype.name = 'AuthorQuestionsQuestionQueue';

    AuthorQuestionsQuestionQueueModel.prototype.elementName = 'AuthorQuestionsQuestion';

    AuthorQuestionsQuestionQueueModel.prototype.initialize = function(params) {
      AuthorQuestionsQuestionQueueModel.__super__.initialize.apply(this, arguments);
      return this.authorId = params.authorId;
    };

    AuthorQuestionsQuestionQueueModel.prototype.load = function(callback) {
      this.url = function() {
        return 'api/author/get_questions/' + this.authorId;
      };
      this.method = 'GET';
      return AuthorQuestionsQuestionQueueModel.__super__.load.call(this, callback);
    };

    AuthorQuestionsQuestionQueueModel.prototype.updatePlaces = function(callback) {
      this.url = function() {
        return 'api/author/update_questions_places/' + this.authorId;
      };
      this.method = 'POST';
      return AuthorQuestionsQuestionQueueModel.__super__.updatePlaces.call(this, callback);
    };

    AuthorQuestionsQuestionQueueModel.prototype.createElementModel = function(elData) {
      var model;
      model = new QuestionModel({
        authorId: elData.authorId
      });
      model.data = elData;
      return model;
    };

    return AuthorQuestionsQuestionQueueModel;

  })(Queue);
});