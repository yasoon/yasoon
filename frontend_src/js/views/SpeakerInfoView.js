(function() {
  define(['text!templates/speakerInfoTpl.htm', 'backbone', 'mediator'], function(speakerInfoTpl) {
    return Backbone.View.extend({
      tagName: 'aside',
      className: 'postinfo',
      template: _.template(speakerInfoTpl)
    });
  });

}).call(this);
