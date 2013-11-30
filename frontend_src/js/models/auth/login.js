// Generated by CoffeeScript 1.6.3
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['chaplin', 'models/base/model'], function(Chaplin, Model) {
  'use strict';
  var AuthLoginModel, _ref;
  return AuthLoginModel = (function(_super) {
    __extends(AuthLoginModel, _super);

    function AuthLoginModel() {
      _ref = AuthLoginModel.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    AuthLoginModel.prototype.name = 'AuthLogin';

    AuthLoginModel.prototype.notify = function(callback) {};

    AuthLoginModel.prototype.add = function(callback) {
      if (!this.validateEmail(this.data.email)) {
        $("input[data-field='email']").addClass('error');
        return;
      } else {
        $("input[data-field='email']").removeClass('error');
      }
      if (!this.validateNotNull('password')) {
        $("input[data-field='password']").addClass('error');
        return;
      } else {
        $("input[data-field='password']").removeClass('error');
      }
      this.method = 'POST';
      this.url = function() {
        return 'login_check';
      };
      this.requestData = {
        email: this.data.email,
        password: this.data.password
      };
      return this.request(callback);
    };

    return AuthLoginModel;

  })(Model);
});
