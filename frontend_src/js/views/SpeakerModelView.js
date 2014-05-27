(function() {
  define(['text!templates/speakerInfoTpl.htm', 'backbone'], function(SpeakerInfoTpl) {
    return Backbone.View.extend({
      tagName: 'aside',
      className: 'postinfo',
      template: _.template(SpeakerInfoTpl),
      render: function() {
        this.$el.html(this.template(this.model.toJSON()));
        return this;
      }
    });
  });

}).call(this);
