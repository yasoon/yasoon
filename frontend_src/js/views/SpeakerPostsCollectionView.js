(function() {
  define(['views/SpeakerPostView', 'backbone'], function(SpeakerPostView) {
    return Backbone.View.extend({
      tagName: 'section',
      render: function() {
        this.collection.each((function(_this) {
          return function(post) {
            return _this.addOne(post);
          };
        })(this));
        return this;
      },
      addOne: function(post) {
        var speakerPostView;
        speakerPostView = new SpeakerPostView({
          model: post
        });
        return this.$el.prepend(speakerPostView.render().$el);
      }
    });
  });

}).call(this);
