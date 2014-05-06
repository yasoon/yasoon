(function() {
  define(['text!templates/speakerInfoTpl.htm', 'backbone'], function(speakerInfoTpl) {
    return Backbone.View.extend({
      tagName: 'aside',
      className: 'postinfo',
      template: _.template(speakerInfoTpl),
      render: function() {
        this.$el.html(this.template(this.model.toJSON()));
        return this;
      }
    });
  });

}).call(this);
