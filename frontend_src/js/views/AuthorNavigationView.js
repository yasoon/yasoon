(function() {
  define(['text!templates/authorPageTpl.htm', 'backbone'], function(authorPageTpl) {
    return Backbone.View.extend({
      tagName: 'section',
      className: 'lim',
      template: _.template(authorPageTpl),
      initialize: function(options) {
        return this.options = options || {};
      },
      render: function() {
        this.$el.append(this.template(this.options));
        this.$("#" + this.options.page).addClass('active');
        return this;
      }
    });
  });

}).call(this);
