// Generated by CoffeeScript 1.6.1
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['chaplin', 'models/base/model'], function(Chaplin, Model) {
  'use strict';
  var RegisterRegisterModel,
    _this = this;
  return RegisterRegisterModel = (function(_super) {

    __extends(RegisterRegisterModel, _super);

    function RegisterRegisterModel() {
      var _this = this;
      this.validateEmail = function(email) {
        return RegisterRegisterModel.prototype.validateEmail.apply(_this, arguments);
      };
      return RegisterRegisterModel.__super__.constructor.apply(this, arguments);
    }

    RegisterRegisterModel.prototype.name = 'RegisterRegister';

    RegisterRegisterModel.prototype.load = function(callback) {
      this.method = 'GET';
      this.url = function() {
        return 'api/author/get_private_info';
      };
      this.requestData = {};
      return this.request(callback);
    };

    RegisterRegisterModel.prototype.add = function(callback) {
      var addCallback,
        _this = this;
      if (!this.validateRegFields('name') || !this.validateRegFields('lastName') || !this.validateRegFields('password') || !this.validateEmail(this.data['email'])) {
        $('html,body').animate({
          scrollTop: 150
        }, 'slow');
        return;
      }
      this.method = 'POST';
      this.url = function() {
        return 'api/author/register';
      };
      this.requestData = {
        author: {
          name: this.data.name,
          lastName: this.data.lastName,
          email: this.data.email,
          password: this.data.password,
          shortHistory: this.data.shortHistory,
          job: this.data.job,
          interests: this.data.interests,
          dreams: this.data.dreams
        }
      };
      callback();
      addCallback = function(data) {
        var authorId;
        if (data.error != null) {
          return _this.publishEvent('publicError', 'Пользователь с этим email уже зарегистрирован');
        } else {
          authorId = data.id;
          return callback();
        }
      };
      return this.request(addCallback, true);
    };

    RegisterRegisterModel.prototype.addStep2 = function(callback) {
      var addCallback,
        _this = this;
      this.method = 'POST';
      this.url = function() {
        return 'api/author/register_step2';
      };
      this.requestData = {
        author: {
          shortHistory: this.data.shortHistory,
          job: this.data.job,
          interests: this.data.interests,
          dreams: this.data.dreams
        }
      };
      addCallback = function(data) {
        var authorId;
        if (data.error == null) {
          authorId = data.id;
          return _this.publishEvent('redirect', "author/" + authorId + "/posts/new/blank");
        }
      };
      return this.request(addCallback, true);
    };

    RegisterRegisterModel.prototype.update = function(callback) {
      var updateCallback,
        _this = this;
      if (!this.validateRegFields('name') || !this.validateRegFields('lastName') || !this.validateRegFields('password') || !this.validateEmail(this.data['email'])) {
        $('html,body').animate({
          scrollTop: 150
        }, 'slow');
        return;
      }
      this.method = 'POST';
      this.url = function() {
        return 'api/author/editinfo';
      };
      this.requestData = {
        author: {
          name: this.data.name,
          lastName: this.data.lastName,
          email: this.data.email,
          password: this.data.password,
          shortHistory: this.data.shortHistory,
          job: this.data.job,
          interests: this.data.interests,
          dreams: this.data.dreams
        }
      };
      updateCallback = function(data) {
        var authorId;
        authorId = data.id;
        return _this.publishEvent('redirect', "author/" + authorId + "/posts");
      };
      return this.request(updateCallback, true);
    };

    RegisterRegisterModel.prototype.validateRegFields = function(fieldName) {
      var registerForm, statusValidate;
      registerForm = $(".register-form, .info-form");
      statusValidate = false;
      if (!this.validateNotNull(fieldName)) {
        registerForm.find(".data_" + fieldName).show();
        registerForm.find("input[data-field='" + fieldName + "']").addClass('error');
        statusValidate = false;
      } else {
        registerForm.find(".data_" + fieldName).hide();
        registerForm.find("input[data-field='" + fieldName + "']").removeClass('error');
        statusValidate = true;
      }
      return statusValidate;
    };

    RegisterRegisterModel.prototype.validateEmail = function(email) {
      var registerForm, statusValidate;
      registerForm = $(".register-form, .info-form");
      statusValidate = false;
      if (!RegisterRegisterModel.__super__.validateEmail.call(this, email)) {
        registerForm.find(".data_email").show();
        registerForm.find("input[data-field='email']").addClass('error');
        statusValidate = false;
      } else {
        registerForm.find(".data_email").hide();
        registerForm.find("input[data-field='email']").removeClass('error');
        statusValidate = true;
      }
      return statusValidate;
    };

    return RegisterRegisterModel;

  })(Model);
});
