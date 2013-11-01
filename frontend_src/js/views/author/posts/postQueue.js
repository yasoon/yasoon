// Generated by CoffeeScript 1.6.3
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['views/base/queue', 'JST', 'views/author/posts/post', 'models/author/posts/post'], function(QueueView, JST, PostView) {
  'use strict';
  var AuthorPostsPostQueueView, _ref;
  return AuthorPostsPostQueueView = (function(_super) {
    __extends(AuthorPostsPostQueueView, _super);

    function AuthorPostsPostQueueView() {
      _ref = AuthorPostsPostQueueView.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    AuthorPostsPostQueueView.prototype.className = 'authorPostsPostQueue';

    AuthorPostsPostQueueView.prototype.templateName = 'author_posts_post_queue';

    AuthorPostsPostQueueView.prototype.sortable = true;

    AuthorPostsPostQueueView.prototype.createElementView = function(model) {
      return new PostView({
        model: model
      });
    };

    return AuthorPostsPostQueueView;

  })(QueueView);
});
