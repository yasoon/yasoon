(function() {
  define(['views/PostPageModelView', 'views/PostAuthorModelView', 'models/PostPageModel', 'models/PostAuthorModel', 'models/PostViewModel', 'backbone'], function(PostPageModelView, PostAuthorModelView, PostPageModel, PostAuthorModel, PostViewModel) {
    return Backbone.View.extend({
      tagName: 'section',
      className: 'page-layout row',
      events: function() {
        return {
          'click .like-this': 'addLike'
        };
      },
      initialize: function(options) {
        this.options = options || {};
        this.model = new PostViewModel();
        this.listenTo(this.model, 'change:postData', this.getAuthorData);
        this.listenTo(this.model, 'change:userData', this.createPostAuthor);
        return this.getPostData();
      },
      getPostData: function() {
        return $.post("/api/post/getPost", {
          postid: this.options.id
        }, (function(_this) {
          return function(data) {
            return _this.model.set('postData', data[0]);
          };
        })(this));
      },
      getAuthorData: function() {
        var author;
        author = this.model.get('postData');
        return $.post("/api/author/getAuthorInfo", {
          author_id: author.authorId
        }, (function(_this) {
          return function(data) {
            return _this.model.set('userData', data[0]);
          };
        })(this));
      },
      createPostContent: function() {
        var data, questions;
        questions = this.model.get('userData');
        data = _.extend({}, this.model.get('postData'), {
          'questionCount': questions.answers_count
        });
        if (this.postPageModelView == null) {
          this.postPageModelView = new PostPageModelView({
            model: new PostPageModel(data)
          });
        } else {
          this.postPageModelView.delegateEvents();
        }
        return this.$el.append(this.postPageModelView.render().$el);
      },
      createPostAuthor: function() {
        if (this.postAuthorModelView == null) {
          this.postAuthorModelView = new PostAuthorModelView({
            model: new PostAuthorModel(this.model.get('userData'))
          });
        } else {
          this.postAuthorModelView.delegateEvents();
        }
        this.$el.append(this.postAuthorModelView.render().$el);
        return this.createPostContent();
      },
      addLike: function(event) {
        var data;
        event.preventDefault();
        data = _.extend({}, {
          postId: this.options.id,
          type: 'add'
        });
        return $.post('/api/post/add_likes', {
          'postlike': data
        }, (function(_this) {
          return function(data) {
            if (!data.error && data.count) {
              return _this.$el.find('.like-this .counter').text(data.count);
            }
          };
        })(this));
      }
    });
  });

}).call(this);
