(function() {
  define(['text!templates/mainPageHeadingTpl.htm', 'backbone'], function(mainPageHeadingTpl) {
    return Backbone.View.extend({
      className: 'mainPage-intro',
      template: _.template(mainPageHeadingTpl),
      render: function() {
        var image;
        image = _.getContent(12);
        this.$el.html(this.template()).css({
          'background-image': "url(frontend" + image + ")",
          'background-size': "cover"
        });
        return this;
      }
    });
  });

}).call(this);
