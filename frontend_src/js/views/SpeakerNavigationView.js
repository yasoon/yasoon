(function() {
  define(['text!templates/speakerPageTpl.htm', 'backbone'], function(speakerPageTpl) {
    return Backbone.View.extend({
      tagName: 'section',
      className: 'lim',
      template: _.template(speakerPageTpl),
      initialize: function(options) {
        return this.options = options || {};
      },
      render: function() {
        this.$el.append(this.template(this.options));
        return this;
      }
    });
  });

}).call(this);
