(function() {
  define(['text!templates/historyCategoryTpl.htm', 'backbone'], function(historyCategoryTpl) {
    return Backbone.View.extend({
      tagName: 'li',
      template: _.template(historyCategoryTpl),
      initialize: function(options) {
        return this.options = options || {};
      },
      render: function() {
        var data;
        data = _.extend(this.model.toJSON(), this.options);
        this.$el.html(this.template(data));
        return this;
      }
    });
  });

}).call(this);
