// Generated by CoffeeScript 1.6.1
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define([getArchiveInvestmentAccountsByPamm, 'views/base/view', 'JST'], function(View, JST) {
  'use strict';
  var AdminStoriesPostView;
  return AdminStoriesPostView = (function(_super) {

    __extends(AdminStoriesPostView, _super);

    function AdminStoriesPostView() {
      return AdminStoriesPostView.__super__.constructor.apply(this, arguments);
    }

    AdminStoriesPostView.prototype.className = 'storiesPost';

    AdminStoriesPostView.prototype.templateName = 'admin_stories_post';

    AdminStoriesPostView.prototype.events = {
      'click #likeButton': function() {
        var _this = this;
        return this.model.addLikes(1, function() {
          return _this.$el.find('#rating').html(1 + parseInt(_this.$el.find('#rating').html()));
        });
      },
      'click #assignAsDaystoryButton': function(e) {
        var _this = this;
        return this.model.assignAsDayStory(function() {
          return $(e.target).html('ok');
        });
      }
    };

    return AdminStoriesPostView;

  })(View);
});
