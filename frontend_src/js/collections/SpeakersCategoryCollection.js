(function() {
  define(['models/SpeakersCategoryModel', 'backbone'], function(SpeakersCategoryModel) {
    return Backbone.Collection.extend({
      model: SpeakersCategoryModel
    });
  });

}).call(this);
