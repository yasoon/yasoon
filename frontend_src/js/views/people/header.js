// Generated by CoffeeScript 1.6.3
var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['views/index/header', 'JST'], function(IndexHeaderView, JST) {
  'use strict';
  var PeopleHeaderView, _ref;
  return PeopleHeaderView = (function(_super) {
    __extends(PeopleHeaderView, _super);

    function PeopleHeaderView() {
      this.getTemplateData = __bind(this.getTemplateData, this);
      _ref = PeopleHeaderView.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    PeopleHeaderView.prototype.autoRender = true;

    PeopleHeaderView.prototype.className = 'inside';

    PeopleHeaderView.prototype.region = 'header';

    PeopleHeaderView.prototype.templateName = 'people_header';

    PeopleHeaderView.prototype.initialize = function(params) {
      PeopleHeaderView.__super__.initialize.call(this, params);
      this.categoryId = params.catId;
      if (params.mode) {
        return this.mode = params.mode;
      } else {
        return this.mode = 'date';
      }
    };

    PeopleHeaderView.prototype.getTemplateData = function() {
      return {
        catId: this.categoryId,
        mode: this.mode,
        model: this.model.data
      };
    };

    PeopleHeaderView.prototype.events = {
      'click #logout': function() {
        var _this = this;
        this.model.logout(function() {
          return _this.render;
        });
        return this.publishEvent('onLogout');
      }
    };

    return PeopleHeaderView;

  })(IndexHeaderView);
});
