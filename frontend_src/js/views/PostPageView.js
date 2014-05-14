(function() {
  define(['views/PostPageModelView', 'views/PostAuthorModelView', 'models/PostPageModel', 'models/PostAuthorModel', 'backbone'], function(PostPageModelView, PostAuthorModelView, PostPageModel, PostAuthorModel) {
    return Backbone.View.extend({
      tagName: 'section',
      className: 'page-layout',
      events: function() {
        return {
          'click .like-this': 'addLike'
        };
      },
      initialize: function(options) {
        this.options = options || {};
        return this.createHistoryPage();
      },
      addLike: function(event) {
        event.preventDefault();
        return $.post('/api/post/add_likes', {
          'postlike': {
            postId: this.options.id,
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
      createHistoryPage: function() {
        return $.post("/api/post/getPost", {
          postid: this.options.id
        }, (function(_this) {
          return function(data) {
            data = data[0];
            if (_this.postPageModelView == null) {
              _this.postPageModelView = new PostPageModelView({
                model: new PostPageModel(data)
              });
            } else {
              _this.postPageModelView.delegateEvents();
            }
            _this.createHistoryAuthor(data.authorId);
            return _this.$el.append(_this.postPageModelView.render().$el);
          };
        })(this), 'json');
      },
      createHistoryAuthor: function(id) {
        return $.post("/api/author/getAuthorInfo", {
          author_id: id
        }, (function(_this) {
          return function(data) {
            data = data[0];
            if (_this.postAuthorModelView == null) {
              _this.postAuthorModelView = new PostAuthorModelView({
                model: new PostAuthorModel(data)
              });
            } else {
              _this.postAuthorModelView.delegateEvents();
            }
            return _this.$el.append(_this.postAuthorModelView.render().$el);
          };
        })(this), 'json');
      }
    });
  });

}).call(this);
