// Generated by CoffeeScript 1.6.3
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['views/base/view', 'JST'], function(View, JST) {
  'use strict';
  var AdminHeaderView, _ref;
  return AdminHeaderView = (function(_super) {
    __extends(AdminHeaderView, _super);

    function AdminHeaderView() {
      _ref = AdminHeaderView.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    AdminHeaderView.prototype.autoRender = true;

    AdminHeaderView.prototype.className = 'inside';

    AdminHeaderView.prototype.region = 'header';

    AdminHeaderView.prototype.templateName = 'admin_header';

    return AdminHeaderView;

  })(View);
});
