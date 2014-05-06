(function() {
  define(['text!templates/postPageAuthorTpl.htm', 'backbone'], function(postPageAuthorTpl) {
    return Backbone.View.extend({
      tagName: 'aside',
      className: 'postinfo',
      template: _.template(postPageAuthorTpl),
      render: function() {
        this.$el.html(this.template(this.model.toJSON()));
        return this;
      }
    });
  });

}).call(this);
