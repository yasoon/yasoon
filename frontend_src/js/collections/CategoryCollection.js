(function() {
  define(['models/CategoryModel', 'backbone'], function(CategoryModel) {
    return Backbone.Collection.extend({
      model: CategoryModel
    });
  });

}).call(this);
