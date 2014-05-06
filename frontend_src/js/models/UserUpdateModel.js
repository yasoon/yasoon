(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['models/UserRegisterModel', 'backbone'], function(UserRegisterModel) {
    var UserUpdateModel;
    return UserUpdateModel = (function(_super) {
      __extends(UserUpdateModel, _super);

      function UserUpdateModel() {
        return UserUpdateModel.__super__.constructor.apply(this, arguments);
      }

      UserUpdateModel.prototype.validate = function(attrs) {
        var errors, textTest;
        UserUpdateModel.__super__.validate.apply(this, arguments);
        errors = [];
        textTest = /^\S+$/ig;
        if (!attrs.job) {
          errors.push({
            name: 'job',
            message: 'Поле не может быть пустым'
          });
        } else if (!textTest.test(attrs.job)) {
          errors.push({
            name: 'job',
            message: 'Неверный формат текста'
          });
        }
        if (errors.length > 0) {
          return errors;
        } else {
          return false;
        }
      };

      return UserUpdateModel;

    })(UserRegisterModel);
  });

}).call(this);
