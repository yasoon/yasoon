(function() {
  define(['text!templates/speakersCategoryTpl.htm', 'backbone'], function(speakersCategoryTpl) {
    return Backbone.View.extend({
      tagName: 'li',
      template: _.template(speakersCategoryTpl),
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
