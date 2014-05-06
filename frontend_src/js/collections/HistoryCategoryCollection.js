(function() {
  define(['models/HistoryPageCategoryModel', 'backbone'], function(HistoryPageCategoryModel) {
    return Backbone.Collection.extend({
      model: HistoryPageCategoryModel
    });
  });

}).call(this);
