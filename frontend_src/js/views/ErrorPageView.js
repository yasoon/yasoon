(function() {
  define(['text!templates/errorPageTpl.htm', 'backbone'], function(errorPageTpl) {
    return Backbone.View.extend({
      tagName: 'section',
      template: _.template(errorPageTpl),
      render: function() {
        this.$el.append(this.template());
        return this;
      }
    });
  });

}).call(this);
