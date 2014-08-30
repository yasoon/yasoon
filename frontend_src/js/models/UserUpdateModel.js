(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['models/ValidateModel', "backbone"], function(ValidateModel) {
    var UserUpdateModel;
    return UserUpdateModel = (function(_super) {
      __extends(UserUpdateModel, _super);

      function UserUpdateModel() {
        return UserUpdateModel.__super__.constructor.apply(this, arguments);
      }

      UserUpdateModel.prototype.validate = function(attrs) {
        var emailTest, errors, passwordMaxLength, passwordTest, _ref;
        errors = [];
        emailTest = /^[\.\w_]{2,}[@][\w_\-]{2,}[.][\w_\-]{0,4}$/;
        passwordTest = /^[\.\w_]{2,}$/;
        passwordMaxLength = 10;
        if (!attrs.name) {
          errors.push({
            name: 'name',
            message: 'Поле не может быть пустым'
          });
        }
        if (typeof Window.config.regFrom === "undefined" || parseInt(Window.config.regFrom) === 0) {
          if (!attrs.email) {
            errors.push({
              name: 'email',
              message: 'Поле не может быть пустым'
            });
          } else if (!emailTest.test(attrs.email)) {
            errors.push({
              name: 'email',
              message: 'Неверный формат email'
            });
          }
        }
        if (!((_ref = attrs.password) != null ? _ref.length : void 0) > passwordMaxLength) {
          errors.push({
            name: 'password',
            message: 'Слишком длинный пароль'
          });
        }
        if (!attrs.job) {
          errors.push({
            name: 'job',
            message: 'Поле не может быть пустым'
          });
        }
        if (errors.length > 0) {
          return errors;
        } else {
          return false;
        }
      };

      return UserUpdateModel;

    })(ValidateModel);
  });

}).call(this);
