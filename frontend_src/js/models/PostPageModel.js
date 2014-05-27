(function() {
  define(['backbone'], function() {
    return Backbone.Model.extend({
      validate: function(attrs) {
        var errors, textTest;
        errors = [];
        textTest = /^\S+$/ig;
        if (attrs.categories.length < 0) {
          errors.push({
            name: 'categories',
            message: 'Не выбрано ни одной категории'
          });
        }
        if (errors.length > 0) {
          return errors;
        } else {
          return false;
        }
      }
    });
  });

}).call(this);
