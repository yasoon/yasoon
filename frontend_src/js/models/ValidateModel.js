(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['backbone'], function() {
    var ValidateModel;
    return ValidateModel = (function(_super) {
      __extends(ValidateModel, _super);

      function ValidateModel() {
        return ValidateModel.__super__.constructor.apply(this, arguments);
      }

      ValidateModel.prototype.validate = function(attrs) {
        return _.each(attrs, function(attr) {
          if (typeof attr === 'string') {
            return $.trim(attr);
          } else {
            return attr;
          }
        });
      };

      return ValidateModel;

    })(Backbone.Model);
  });

}).call(this);
