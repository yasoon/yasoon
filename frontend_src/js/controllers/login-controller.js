// Generated by CoffeeScript 1.6.1
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['controllers/base/controller', 'chaplin', 'views/auth/login', 'models/auth/login'], function(Controller, Chaplin, LoginView, LoginModel) {
  'use strict';
  var LoginController,
    _this = this;
  return LoginController = (function(_super) {

    __extends(LoginController, _super);

    function LoginController() {
      var _this = this;
      this.goLogin = function() {
        return LoginController.prototype.goLogin.apply(_this, arguments);
      };
      return LoginController.__super__.constructor.apply(this, arguments);
    }

    LoginController.prototype.initialize = function() {
      LoginController.__super__.initialize.apply(this, arguments);
      return Chaplin.mediator.subscribe('goLogin', this.goLogin);
    };

    LoginController.prototype.goLogin = function() {
      var loginModel, loginView;
      loginModel = new LoginModel();
      loginView = new LoginView({
        model: loginModel
      });
      return loginView.setMode('active');
    };

    return LoginController;

  })(Controller);
});
