(function() {
  define(['text!templates/speakerPreviewTpl.htm', 'backbone'], function(speakerPreviewTpl) {
    return Backbone.View.extend({
      tagName: 'article',
      className: 'lim',
      template: _.template(speakerPreviewTpl),
      render: function() {
        this.$el.html(this.template(this.model.toJSON()));
        return this;
      }
    });
  });

}).call(this);
