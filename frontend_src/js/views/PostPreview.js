(function() {
  define(['text!templates/postPreviewTpl.htm', 'backbone'], function(postPreviewTpl) {
    return Backbone.View.extend({
      tagName: 'article',
      template: _.template(postPreviewTpl),
      render: function() {
        this.$el.html(this.template(this.model.toJSON()));
        return this;
      }
    });
  });

}).call(this);
