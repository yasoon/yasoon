// Generated by CoffeeScript 1.6.1
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['views/base/editable', 'JST', 'models/auth/login'], function(EditableView, JST, LoginModel) {
  'use strict';
  var LoginView;
  return LoginView = (function(_super) {

    __extends(LoginView, _super);

    function LoginView() {
      return LoginView.__super__.constructor.apply(this, arguments);
    }

    LoginView.prototype.autoRender = true;

    LoginView.prototype.className = 'login';

    LoginView.prototype.container = 'body';

    LoginView.prototype.modes = ['active', 'notify', 'sent'];

    LoginView.prototype.templateName = 'auth_login';

    LoginView.prototype.events = {
      'click .go_register': function() {
        return this.dispose();
      },
      'click': function(e) {
        var $target,
          _this = this;
        $target = $(e.target);
        if ($target.hasClass('barrier') || $target.attr('id') === 'closeButton') {
          this.publishEvent('hideLogin');
        }
        if ($target.attr('id') === 'notify') {
          return this.model.notify(function() {
            return _this.setMode('sent');
          });
        }
      }
    };

    LoginView.prototype.addCallback = function(data) {
      this.publishEvent('redirect', 'author/' + this.model.data.id + '/posts');
      return this.dispose();
    };

    return LoginView;

  })(EditableView);
});
