(function() {
  define(['models/AnswerModel', 'backbone'], function(AnswerModel) {
    return Backbone.Collection.extend({
      model: AnswerModel
    });
  });

}).call(this);
