(function() {
  define(['text!templates/mainPageHistoryTpl.htm', 'backbone'], function(MainPageHistoryTpl) {
    return Backbone.View.extend({
      tagName: 'section',
      className: 'main-layout',
      template: _.template(MainPageHistoryTpl),
      render: function() {
        this.$el.html(this.template(this.model.toJSON()));
        return this;
      }
    });
  });

}).call(this);
