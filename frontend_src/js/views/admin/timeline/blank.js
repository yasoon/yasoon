// Generated by CoffeeScript 1.6.3
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['views/admin/timeline/post', 'JST'], function(PostView, JST) {
  'use strict';
  var AdminTimelineBlankView, _ref;
  return AdminTimelineBlankView = (function(_super) {
    __extends(AdminTimelineBlankView, _super);

    function AdminTimelineBlankView() {
      _ref = AdminTimelineBlankView.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    AdminTimelineBlankView.prototype.templateName = 'admin_timeline_blank';

    return AdminTimelineBlankView;

  })(PostView);
});
