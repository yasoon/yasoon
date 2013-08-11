// Generated by CoffeeScript 1.6.3
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['models/base/queue', 'models/author/questions/question'], function(Queue, QuestionModel) {
  'use strict';
  var AuthorPostsNewBlankQuestionQueueModel, _ref;
  return AuthorPostsNewBlankQuestionQueueModel = (function(_super) {
    __extends(AuthorPostsNewBlankQuestionQueueModel, _super);

    function AuthorPostsNewBlankQuestionQueueModel() {
      _ref = AuthorPostsNewBlankQuestionQueueModel.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    AuthorPostsNewBlankQuestionQueueModel.prototype.name = 'AuthorPostsNewBlankQuestionQueue';

    AuthorPostsNewBlankQuestionQueueModel.prototype.elementName = 'AuthorPostsNewBlankQuestion';

    AuthorPostsNewBlankQuestionQueueModel.prototype.initialize = function(params) {
      AuthorPostsNewBlankQuestionQueueModel.__super__.initialize.apply(this, arguments);
      return this.authorId = params.authorId;
    };

    AuthorPostsNewBlankQuestionQueueModel.prototype.load = function(callback) {
      this.url = function() {
        return 'api/author/get_blank/' + this.authorId;
      };
      this.method = 'GET';
      return AuthorPostsNewBlankQuestionQueueModel.__super__.load.call(this, callback);
    };

    AuthorPostsNewBlankQuestionQueueModel.prototype.updatePlaces = function(callback) {
      this.url = function() {
        return 'api/author/update_questions_places/' + this.authorId;
      };
      this.method = 'POST';
      return AuthorPostsNewBlankQuestionQueueModel.__super__.updatePlaces.call(this, callback);
    };

    AuthorPostsNewBlankQuestionQueueModel.prototype.createElementModel = function(elData) {
      var model;
      model = new QuestionModel({
        authorId: elData.authorId
      });
      model.data = elData;
      return model;
    };

    return AuthorPostsNewBlankQuestionQueueModel;

  })(Queue);
});