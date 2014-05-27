(function() {
  define(['models/HistoryPagePostsModel', 'backbone'], function(HistoryPagePostsModel) {
    return Backbone.Collection.extend({
      model: HistoryPagePostsModel
    });
  });

}).call(this);
