(function() {
  define(['text!templates/speakerPostTpl.htm', 'backbone'], function(speakerPostTpl) {
    return Backbone.View.extend({
      tagName: 'article',
      className: 'lim',
      template: _.template(speakerPostTpl),
      render: function() {
        this.$el.html(this.template(this.model.toJSON()));
        return this;
      }
    });
  });

}).call(this);
