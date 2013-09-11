// Generated by CoffeeScript 1.6.1
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['views/base/view', 'JST', 'categories'], function(View, JST, categories) {
  'use strict';
  var AuthorPostsInfoView;
  return AuthorPostsInfoView = (function(_super) {

    __extends(AuthorPostsInfoView, _super);

    function AuthorPostsInfoView() {
      return AuthorPostsInfoView.__super__.constructor.apply(this, arguments);
    }

    AuthorPostsInfoView.prototype.className = 'info';

    AuthorPostsInfoView.prototype.templateName = 'author_posts_info';

    AuthorPostsInfoView.prototype.events = {
      'click #follow': function() {
        this.model.follow();
        $('#follow').hide();
        return $('#unfollow').show();
      },
      'click #unfollow': function() {
        this.model.unfollow();
        $('#follow').show();
        return $('#unfollow').hide();
      }
    };

    AuthorPostsInfoView.prototype.getTemplateData = function() {
      return AuthorPostsInfoView.__super__.getTemplateData.apply(this, arguments);
    };

    return AuthorPostsInfoView;

  })(View);
});
