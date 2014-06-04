(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['text!templates/speakerAnswerTpl.htm', 'views/ValidationView', 'backbone', 'mediator', 'stickit'], function(speakerAnswerTpl, ValidationView) {
    var SpeakerAnswerView;
    return SpeakerAnswerView = (function(_super) {
      __extends(SpeakerAnswerView, _super);

      function SpeakerAnswerView() {
        return SpeakerAnswerView.__super__.constructor.apply(this, arguments);
      }

      SpeakerAnswerView.prototype.tagName = 'article';

      SpeakerAnswerView.prototype.className = 'lim';

      SpeakerAnswerView.prototype.template = _.template(speakerAnswerTpl);

      SpeakerAnswerView.prototype.bindings = {
        '#questionAnswerText': 'questionAnswerText'
      };

      SpeakerAnswerView.prototype.events = function() {
        return {
          'submit form': 'addQuestionAnswer',
          'click .js-delete': 'deleteQuestion'
        };
      };

      SpeakerAnswerView.prototype.render = function() {
        this.$el.html(this.template(this.model.toJSON()));
        this.stickit();
        return this;
      };

      SpeakerAnswerView.prototype.addQuestionAnswer = function(event) {
        event.preventDefault();
        this.hideErrors;
        if (this.model.isValid()) {
          return $.post('/api/question/addAnswer', {
            model: this.model.toJSON()
          }, (function(_this) {
            return function(data) {
              if (!data.error) {
                _this.model.set('hasAnswer', true);
                Backbone.Mediator.publish('question:answered', _this.model);
                return $(event.currentTarget).closest('article').remove();
              }
            };
          })(this));
        } else {
          return this.showErrors(this.model.validationError);
        }
      };

      SpeakerAnswerView.prototype.deleteQuestion = function(event) {
        event.preventDefault();
        return $.post('/api/question/delete', {
          model: {
            id: this.model.get('id')
          }
        }, function(data) {
          if (!data.error) {
            console.log(data);
            return $(event.currentTarget).closest('article').remove();
          }
        });
      };

      return SpeakerAnswerView;

    })(ValidationView);
  });

}).call(this);
