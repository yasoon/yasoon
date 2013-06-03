// Generated by CoffeeScript 1.6.1
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['views/base/view', 'JST'], function(View, JST) {
  'use strict';
  var AuthorPostsQueueView;
  return AuthorPostsQueueView = (function(_super) {

    __extends(AuthorPostsQueueView, _super);

    function AuthorPostsQueueView() {
      return AuthorPostsQueueView.__super__.constructor.apply(this, arguments);
    }

    AuthorPostsQueueView.prototype.autoRender = true;

    AuthorPostsQueueView.prototype.className = 'authorPosts';

    AuthorPostsQueueView.prototype.region = 'queue';

    AuthorPostsQueueView.prototype.templateName = 'authorPostsQueue';

    AuthorPostsQueueView.prototype.listen = {
      'updated model': 'render'
    };

    AuthorPostsQueueView.prototype.events = {
      'click .post': function(e) {
        var target;
        target = $(e.target);
        while (!target.hasClass('post')) {
          target = target.parent();
        }
        return this.publishEvent('redirect', '#post/' + target.attr('id'));
      }
    };

    AuthorPostsQueueView.prototype.getTemplateData = function() {
      return {
        posts: this.model.data
      };
    };

    return AuthorPostsQueueView;

  })(View);
});