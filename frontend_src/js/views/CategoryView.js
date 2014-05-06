(function() {
  define(['text!templates/categoryTpl.htm', 'backbone'], function(categoryTpl) {
    return Backbone.View.extend({
      tagName: 'li',
      template: _.template(categoryTpl),
      render: function() {
        this.$el.html(this.template(this.model.toJSON()));
        return this;
      }
    });
  });

}).call(this);
