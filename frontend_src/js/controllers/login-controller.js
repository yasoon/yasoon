// Generated by CoffeeScript 1.6.3
var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['controllers/base/controller', 'chaplin', 'views/auth/login', 'models/auth/login'], function(Controller, Chaplin, LoginView, LoginModel) {
  'use strict';
  var LoginController, _ref;
  return LoginController = (function(_super) {
    __extends(LoginController, _super);

    function LoginController() {
      this.hideLogin = __bind(this.hideLogin, this);
      this.goLogin = __bind(this.goLogin, this);
      this.initialize = __bind(this.initialize, this);
      _ref = LoginController.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    LoginController.prototype.initialize = function() {
      LoginController.__super__.initialize.apply(this, arguments);
      Chaplin.mediator.subscribe('goLogin', this.goLogin);
      Chaplin.mediator.subscribe('hideLogin', this.hideLogin);
      return this.loginActive = false;
    };

    LoginController.prototype.goLogin = function() {
      var loginModel;
      if (!this.loginActive) {
        this.loginActive = 1;
        loginModel = new LoginModel();
        this.loginView = new LoginView({
          model: loginModel
        });
        return this.loginView.setMode('active');
      }
    };

    LoginController.prototype.hideLogin = function() {
      this.loginActive = false;
      return this.loginView.dispose();
    };

    return LoginController;

  })(Controller);
});
