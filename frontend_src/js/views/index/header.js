// Generated by CoffeeScript 1.6.1
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['views/base/view', 'JST', 'models/index/header', 'sitefunctions'], function(View, JST, HeaderModel, Sitefunctions) {
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

    IndexHeaderView.prototype.initialize = function() {
      var _this = this;
      IndexHeaderView.__super__.initialize.apply(this, arguments);
      this.model = new HeaderModel;
      return this.model.load(function() {
        return _this.render();
      });
    };

    IndexHeaderView.prototype.events = {
      'click #logout': function() {
        var _this = this;
        return this.model.logout(function() {
          return _this.render;
        });
      }
    };

    return IndexHeaderView;

  })(View);
});
