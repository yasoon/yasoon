(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['models/ValidateModel', 'backbone'], function(ValidateModel) {
    var UserRegisterModel;
    return UserRegisterModel = (function(_super) {
      __extends(UserRegisterModel, _super);

      function UserRegisterModel() {
        return UserRegisterModel.__super__.constructor.apply(this, arguments);
      }

      UserRegisterModel.prototype.validate = function(attrs) {
        var emailTest, errors, passwordMaxLength, passwordTest, textTest;
        UserRegisterModel.__super__.validate.apply(this, arguments);
        errors = [];
        emailTest = /^[\.\w_]{2,}[@][\w_\-]{2,}[.][\w_\-]{0,4}$/;
        passwordTest = /^[\.\w_]{2,}$/;
        textTest = /^\S+$/ig;
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
        if (!attrs.name) {
          errors.push({
            name: 'name',
            message: 'Поле не может быть пустым'
          });
        } else if (!textTest.test(attrs.name)) {
          errors.push({
            name: 'name',
            message: 'Неверный формат имени'
          });
        }
        if (errors.length > 0) {
          return errors;
        } else {
          return false;
        }
      };

      return UserRegisterModel;

    })(ValidateModel);
  });

}).call(this);
