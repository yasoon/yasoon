(function() {
  define(['text!templates/postPageTpl.htm', 'backbone'], function(postPageTpl) {
    return Backbone.View.extend({
      tagName: 'article',
      className: 'col-md-9',
      template: _.template(postPageTpl),
      render: function() {
        console.log(this.model.toJSON());
        this.$el.html(this.template(this.model.toJSON()));
        return this;
      }
    });
  });

}).call(this);
