(function() {
  define(['views/SpeakerAnswerView', 'backbone', 'mediator'], function(SpeakerAnswerView) {
    return Backbone.View.extend({
      initialize: function(options) {
        return this.options = options || {};
      },
      subscriptions: {
        'question:answered': 'addOne'
      },
      render: function() {
        this.collection.each((function(_this) {
          return function(answer) {
            return _this.addOne(answer);
          };
        })(this));
        return this;
      },
      addOne: function(answer) {
        var speakerAnswerView;
        if (this.options.id === window.userId) {
          answer.set('author', true);
        }
        speakerAnswerView = new SpeakerAnswerView({
          model: answer
        });
        return this.$el.prepend(speakerAnswerView.render().$el);
      },
      answered: function() {
        return _.where(this.collection.toJSON(), {
          hasAnswer: true
        });
      }
    });
  });

}).call(this);
