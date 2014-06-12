(function() {
  define(['text!templates/speakerPostTpl.htm', 'backbone'], function(speakerPostTpl) {
    return Backbone.View.extend({
      tagName: 'article',
      className: 'lim',
      template: _.template(speakerPostTpl),
      events: function() {
        return {
          'click .like-this': 'addLike'
        };
      },
      addLike: function(event) {
        event.preventDefault();
        return $.post('/api/post/add_likes', {
          'postlike': {
            postId: this.model.id,
            type: 'add'
          }
        }, (function(_this) {
          return function(data) {
            if (!data.error && data.count) {
              return _this.$el.find('.like-this .counter').text(data.count);
            }
          };
        })(this));
      },
      render: function() {
        this.$el.html(this.template(this.model.toJSON()));
        return this;
      }
    });
  });

}).call(this);
