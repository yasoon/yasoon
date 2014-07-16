(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['views/SpeakerAnswerView', 'views/SpeakerAskedView', 'backbone', 'mediator'], function(SpeakerAnswerView, SpeakerAskedView) {
    var SpeakerAnswersCollectionView;
    return SpeakerAnswersCollectionView = (function(_super) {
      __extends(SpeakerAnswersCollectionView, _super);

      function SpeakerAnswersCollectionView() {
        return SpeakerAnswersCollectionView.__super__.constructor.apply(this, arguments);
      }

      SpeakerAnswersCollectionView.prototype.subscriptions = {
        'question:answered': 'addOneAnswer'
      };

      SpeakerAnswersCollectionView.prototype.renderQuestion = function() {
        _.each(this.asked(), (function(_this) {
          return function(question) {
            return _this.addOneQuestion(question);
          };
        })(this));
        return this;
      };

      SpeakerAnswersCollectionView.prototype.asked = function() {
        return this.collection.where({
          hasAnswer: false
        });
      };

      SpeakerAnswersCollectionView.prototype.addOneQuestion = function(question) {
        var speakerAskedView;
        speakerAskedView = new SpeakerAskedView({
          model: question
        });
        return this.$el.prepend(speakerAskedView.render().$el);
      };

      SpeakerAnswersCollectionView.prototype.renderAnswer = function() {
        _.each(this.answered(), (function(_this) {
          return function(answer) {
            return _this.addOneAnswer(answer);
          };
        })(this));
        return this;
      };

      SpeakerAnswersCollectionView.prototype.answered = function() {
        return this.collection.where({
          hasAnswer: true
        });
      };

      SpeakerAnswersCollectionView.prototype.addOneAnswer = function(answer) {
        var speakerAnswerView;
        speakerAnswerView = new SpeakerAnswerView({
          model: answer
        });
        return this.$el.prepend(speakerAnswerView.render().$el);
      };

      return SpeakerAnswersCollectionView;

    })(Backbone.View);
  });

}).call(this);
