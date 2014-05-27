(function() {
  define(['text!templates/speakerAnswerTpl.htm', 'backbone', 'mediator', 'stickit'], function(speakerAnswerTpl) {
    return Backbone.View.extend({
      tagName: 'article',
      className: 'lim',
      template: _.template(speakerAnswerTpl),
      bindings: {
        '#questionAnswerText': 'questionAnswerText'
      },
      events: function() {
        return {
          'submit form': 'addQuestionAnswer',
          'click .js-delete': 'deleteQuestion'
        };
      },
      render: function() {
        this.$el.html(this.template(this.model.toJSON()));
        this.stickit();
        return this;
      },
      addQuestionAnswer: function(event) {
        event.preventDefault();
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
      },
      deleteQuestion: function(event) {
        event.preventDefault();
        return $.post('/api/question/delete', {
          model: {
            id: this.model.get('id')
          }
        }, (function(_this) {
          return function(data) {
            if (!data.error) {
              console.log(data);
              return $(event.currentTarget).closest('article').remove();
            }
          };
        })(this));
      }
    });
  });

}).call(this);
