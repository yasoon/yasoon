// Generated by CoffeeScript 1.6.1
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['views/base/view', 'JST'], function(View, JST) {
  'use strict';
  var AuthorPostsView;
  return AuthorPostsView = (function(_super) {

    __extends(AuthorPostsView, _super);

    function AuthorPostsView() {
      return AuthorPostsView.__super__.constructor.apply(this, arguments);
    }

    AuthorPostsView.prototype.autoRender = true;

    AuthorPostsView.prototype.className = 'authorPosts';

    AuthorPostsView.prototype.container = '#center';

    AuthorPostsView.prototype.regions = {
      '#newPost': 'newPost',
      '#postsQueue': 'queue'
    };

    AuthorPostsView.prototype.templateName = 'authorPosts';

    return AuthorPostsView;

  })(View);
});