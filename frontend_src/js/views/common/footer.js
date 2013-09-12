// Generated by CoffeeScript 1.6.3
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['views/base/view', 'JST'], function(View, JST) {
  'use strict';
  var CommonFooterView, _ref;
  return CommonFooterView = (function(_super) {
    __extends(CommonFooterView, _super);

    function CommonFooterView() {
      _ref = CommonFooterView.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    CommonFooterView.prototype.autoRender = true;

    CommonFooterView.prototype.className = 'inside';

    CommonFooterView.prototype.region = 'footer';

    CommonFooterView.prototype.templateName = 'common_footer';

    return CommonFooterView;

  })(View);
});
