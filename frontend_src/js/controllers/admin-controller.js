// Generated by CoffeeScript 1.6.3
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['controllers/base/controller', 'views/admin/blank/page', 'views/admin/stories/page'], function(Controller, AdminBlankPageView, AdminStoriesPageView) {
  'use strict';
  var AdminController, _ref;
  return AdminController = (function(_super) {
    __extends(AdminController, _super);

    function AdminController() {
      _ref = AdminController.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    AdminController.prototype.blankAction = function() {
      return this.blankQuestionsView = new AdminBlankPageView();
    };

    AdminController.prototype.storiesAction = function() {
      return this.storiesView = new AdminStoriesPageView();
    };

    return AdminController;

  })(Controller);
});
