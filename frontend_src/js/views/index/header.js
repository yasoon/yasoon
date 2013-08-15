// Generated by CoffeeScript 1.6.1
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['views/base/view', 'JST', 'sitefunctions'], function(View, JST, SiteFunctions) {
  'use strict';
  var IndexHeaderView;
  return IndexHeaderView = (function(_super) {

    __extends(IndexHeaderView, _super);

    function IndexHeaderView() {
      return IndexHeaderView.__super__.constructor.apply(this, arguments);
    }

    IndexHeaderView.prototype.autoRender = true;

    IndexHeaderView.prototype.className = '';

    IndexHeaderView.prototype.region = 'header';

    IndexHeaderView.prototype.templateName = 'index_header';

    return IndexHeaderView;

  })(View);
});
