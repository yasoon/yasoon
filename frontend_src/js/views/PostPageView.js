(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['views/PostPageModelView', 'views/PostAuthorModelView', 'models/PostPageModel', 'models/PostAuthorModel', 'models/PostViewModel', 'backbone'], function(PostPageModelView, PostAuthorModelView, PostPageModel, PostAuthorModel, PostViewModel) {
    var PostPageView;
    return PostPageView = (function(_super) {
      __extends(PostPageView, _super);

      function PostPageView() {
        return PostPageView.__super__.constructor.apply(this, arguments);
      }

      PostPageView.prototype.tagName = 'section';

      PostPageView.prototype.className = 'page-layout row';

      PostPageView.prototype.events = function() {
        return {
          'click .like-this': 'addLike'
        };
      };

      PostPageView.prototype.initialize = function(options) {
        this.model = new PostViewModel();
        this.model.set({
          'postId': options.id
        });
        this.setHandlers();
        return this.getPostData();
      };

      PostPageView.prototype.setHandlers = function() {
        this.listenTo(this.model, 'change:postData', this.getAuthorData);
        return this.listenTo(this.model, 'change:userData', this.createPostAuthor);
      };

      PostPageView.prototype.getPostData = function() {
        return $.post("/api/post/getPost", {
          postid: this.model.get('postId')
        }, (function(_this) {
          return function(data) {
            return _this.model.set('postData', data[0]);
          };
        })(this));
      };

      PostPageView.prototype.getAuthorData = function() {
        var author;
        author = this.model.get('postData');
        return $.post("/api/author/getAuthorInfo", {
          author_id: author.authorId
        }, (function(_this) {
          return function(data) {
            return _this.model.set('userData', data[0]);
          };
        })(this));
      };

      PostPageView.prototype.createPostAuthor = function() {
        var authorModel;
        authorModel = new PostAuthorModel(this.model.get('userData'));
        if (this.postAuthor == null) {
          this.postAuthor = new PostAuthorModelView({
            model: authorModel
          });
        } else {
          this.postAuthor.delegateEvents();
        }
        this.$el.append(this.postAuthor.render().$el);
        return this.createPostContent();
      };

      PostPageView.prototype.createPostContent = function() {
        var postModel;
        postModel = new PostPageModel(this.setPostModel());
        if (this.postPage == null) {
          this.postPage = new PostPageModelView({
            model: postModel
          });
        } else {
          this.postPage.delegateEvents();
        }
        return this.$el.append(this.postPage.render().$el);
      };

      PostPageView.prototype.setPostModel = function() {
        this.model.set('text', this.changePostText());
        return _.extend({}, this.model.get('postData'), {
          'questionCount': this.model.get('userData').answers_count
        });
      };

      PostPageView.prototype.changePostText = function() {
        var article;
        return article = $(this.model.get('text')).find('article');
      };

      PostPageView.prototype.addLike = function(event) {
        event.preventDefault();
        return $.post('/api/post/add_likes', {
          'postlike': this.likeData()
        }, (function(_this) {
          return function(data) {
            return _this.changeLikeCount(data);
          };
        })(this));
      };

      PostPageView.prototype.likeData = function() {
        return _.extend({}, {
          postId: this.model.get('postId'),
          type: 'add'
        });
      };

      PostPageView.prototype.changeLikeCount = function(data) {
        if (!data.error && data.count) {
          return this.$el.find('.like-this .counter').text(data.count);
        }
      };

      return PostPageView;

    })(Backbone.View);
  });

}).call(this);
