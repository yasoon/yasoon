(function() {
  define(['backbone'], function() {
    return Backbone.Model.extend({
      defaults: {
        text: ''
      },
      validate: function(attrs) {
        var errors;
        errors = [];
        if (attrs.category.length === 0) {
          errors.push({
            name: 'categories',
            message: 'Не выбрано ни одной категории'
          });
        }
        if (!attrs.title) {
          errors.push({
            name: 'title',
            message: 'Поле не может быть пустым'
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
