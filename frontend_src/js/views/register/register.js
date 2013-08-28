// Generated by CoffeeScript 1.6.1
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['views/base/editable'], function(EditableView) {
  'use strict';
  var RegisterRegisterView,
    _this = this;
  return RegisterRegisterView = (function(_super) {

    __extends(RegisterRegisterView, _super);

    function RegisterRegisterView() {
      var _this = this;
      this.updateCallback = function() {
        return RegisterRegisterView.prototype.updateCallback.apply(_this, arguments);
      };
      this.addCallback = function() {
        return RegisterRegisterView.prototype.addCallback.apply(_this, arguments);
      };
      return RegisterRegisterView.__super__.constructor.apply(this, arguments);
    }

    RegisterRegisterView.prototype.className = 'register';

    RegisterRegisterView.prototype.templateName = 'register';

    RegisterRegisterView.prototype.modes = ['active', 'active_step2'];

    RegisterRegisterView.prototype.addCallback = function() {
      return this.setMode('active_step2');
    };

    RegisterRegisterView.prototype.updateCallback = function() {};

    return RegisterRegisterView;

  })(EditableView);
});
