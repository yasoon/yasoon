(function() {
  define(['views/SpeakerAnswerView', 'backbone'], function(SpeakerAnswerView) {
    return Backbone.View.extend({
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
        speakerAnswerView = new SpeakerAnswerView({
          model: answer
        });
        return this.$('section').append(speakerAnswerView.render().$el);
      },
      answered: function() {
        return _.where(this.collection.toJSON(), {
          hasAnswer: true
        });
      }
    });
  });

}).call(this);
