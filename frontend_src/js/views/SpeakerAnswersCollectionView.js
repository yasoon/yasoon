(function() {
  define(['views/SpeakerAnswerView', 'backbone'], function(SpeakerAnswerView) {
    return Backbone.View.extend({
      tagName: 'section',
      answered: function() {
        return _.where(this.collection.toJSON(), {
          hasAnswer: true
        });
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
        speakerAnswerView = new SpeakerAnswerView({
          model: answer
        });
        return this.$el.append(speakerAnswerView.render().$el);
      }
    });
  });

}).call(this);
