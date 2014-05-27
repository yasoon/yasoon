(function() {
  define(['text!templates/mainPageHeadingTpl.htm', 'backbone'], function(mainPageHeadingTpl) {
    return Backbone.View.extend({
      className: 'mainPage-intro',
      template: _.template(mainPageHeadingTpl),
      render: function() {
        this.$el.html(this.template()).css({
          'background-image': 'url(frontend/img/i6.jpg)'
        });
        return this;
      }
    });
  });

}).call(this);
