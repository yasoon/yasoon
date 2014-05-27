(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['models/ValidateModel', 'backbone'], function(ValidateModel) {
    var UserLoginModel;
    return UserLoginModel = (function(_super) {
      __extends(UserLoginModel, _super);

      function UserLoginModel() {
        return UserLoginModel.__super__.constructor.apply(this, arguments);
      }

      UserLoginModel.prototype.validate = function(attrs) {
        var emailTest, errors, passwordMaxLength, passwordTest;
        UserLoginModel.__super__.validate.apply(this, arguments);
        errors = [];
        emailTest = /^[\.\w_\-\+]{2,}[@][\w_\-]{2,}[.][\w_\-]{0,4}$/;
        passwordTest = /^[\.\w_\-\+]{2,}$/;
        passwordMaxLength = 10;
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
        if (!attrs.password) {
          errors.push({
            name: 'password',
            message: 'Поле не может быть пустым'
          });
        } else if (!passwordTest.test(attrs.password)) {
          errors.push({
            name: 'password',
            message: 'Неверный формат пароля'
          });
        } else if (!attrs.password.length > passwordMaxLength) {
          errors.push({
            name: 'password',
            message: 'Слишком длинный пароль'
          });
        }
        if (errors.length > 0) {
          return errors;
        } else {
          return false;
        }
      };

      return UserLoginModel;

    })(ValidateModel);
  });

}).call(this);
