(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['text!templates/loginPopUpTpl.htm', 'views/PopUpView', 'backbone', 'stickit'], function(loginPopUpTpl, PopUpView) {
    var LoginPopUpView;
    return LoginPopUpView = (function(_super) {
      __extends(LoginPopUpView, _super);

      function LoginPopUpView() {
        return LoginPopUpView.__super__.constructor.apply(this, arguments);
      }

      LoginPopUpView.prototype.events = function() {
        return _.extend({}, LoginPopUpView.__super__.events.apply(this, arguments), {
          'click #vk-login': 'vkLogin',
          'click #fb-login': 'facebookLogin',
          'click #register': 'registerAction',
          'submit form': 'loginAction'
        });
      };

      LoginPopUpView.prototype.bindings = {
        '#email': 'email',
        '#password': 'password'
      };

      LoginPopUpView.prototype.className = 'barrier';

      LoginPopUpView.prototype.template = _.template(loginPopUpTpl);

      LoginPopUpView.prototype.render = function() {
        this.$el.empty().append(this.template());
        LoginPopUpView.__super__.render.apply(this, arguments);
        this.onRender();
        return this;
      };

      LoginPopUpView.prototype.onRender = function() {
        this.$el.show();
        return this.stickit();
      };

      LoginPopUpView.prototype.vkLogin = function(event) {
        event.preventDefault();
        return window.open('/socauth/vkontakte', '', 'top=100, left=100, width=700, height=400, scrollbars=no, location=no, toolbar=no, directories=no, status=yes, menubar=no, resizable=yes');
      };

      LoginPopUpView.prototype.facebookLogin = function(event) {
        event.preventDefault();
        return window.open('/socauth/facebook', '', 'top=100, left=100, width=700, height=400, scrollbars=no, location=no, toolbar=no, directories=no, status=yes, menubar=no, resizable=yes');
      };

      LoginPopUpView.prototype.registerAction = function(event) {
        return this.closePopUp();
      };

      LoginPopUpView.prototype.loginAction = function(event) {
        event.preventDefault();
        this.hideErrors();
        if (this.model.isValid()) {
          return $.post('/login_check', {
            email: this.model.get('email'),
            password: this.model.get('password')
          }, (function(_this) {
            return function(data) {
              if (data.error === true) {
                if (data.errorType === 'nouser') {
                  return _this.showErrors([
                    {
                      name: 'email',
                      message: 'Пользователя с таким email нет'
                    }
                  ]);
                } else if (data.errorType === 'invalidPassword') {
                  return _this.showErrors([
                    {
                      name: 'password',
                      message: 'Неверный пароль'
                    }
                  ]);
                }
              } else {
                Window.config.userId = data.userData.id;
                return window.location.reload(true);
              }
            };
          })(this), 'json');
        } else {
          return this.showErrors(this.model.validationError);
        }
      };

      LoginPopUpView.prototype.showErrors = function(errors) {
        return _.each(errors, function(error) {
          return this.$el.find('#' + error.name).closest('.form-group').removeClass('has-success').addClass('has-error').find('.help-block').text(error.message);
        }, this);
      };

      LoginPopUpView.prototype.hideErrors = function() {
        return this.$('.form-group').removeClass('has-error').addClass('has-success').find('.help-block').text('');
      };

      return LoginPopUpView;

    })(PopUpView);
  });

}).call(this);
