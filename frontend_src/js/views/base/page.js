// Generated by CoffeeScript 1.6.3
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['views/base/view'], function(View) {
  'use strict';
  var PageView, _ref;
  return PageView = (function(_super) {
    __extends(PageView, _super);

    function PageView() {
      _ref = PageView.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    PageView.prototype.autoRender = true;

    PageView.prototype.className = 'pageView';

    PageView.prototype.container = 'body';

    return PageView;

  })(View);
});
