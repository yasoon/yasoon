(function() {
  define(['text!templates/historyStoryTpl.htm', 'backbone'], function(historyStoryTpl) {
    return Backbone.View.extend({
      tagName: 'article',
      className: 'lim',
      template: _.template(historyStoryTpl),
      render: function() {
        this.$el.html(this.template(this.model.toJSON()));
        return this;
      }
    });
  });

}).call(this);
