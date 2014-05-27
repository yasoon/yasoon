(function() {
  define(['text!templates/emptyPageTpl.htm', 'backbone'], function(emptyPageTpl) {
    return Backbone.View.extend({
      template: _.template(emptyPageTpl),
      initialize: function(options) {
        return this.options = options || {};
      },
      render: function() {
        this.$el.html(this.template(this.options));
        return this;
      }
    });
  });

}).call(this);
