// Generated by CoffeeScript 1.6.3
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['views/base/view', 'JST'], function(View, JST) {
  'use strict';
  var IndexDaystoryView, _ref;
  return IndexDaystoryView = (function(_super) {
    __extends(IndexDaystoryView, _super);

    function IndexDaystoryView() {
      _ref = IndexDaystoryView.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    IndexDaystoryView.prototype.className = 'daystory';

    IndexDaystoryView.prototype.templateName = 'index_daystory';

    return IndexDaystoryView;

  })(View);
});
