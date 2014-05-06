(function() {
  define(['text!templates/speakerAnswerTpl.htm', 'backbone'], function(speakerAnswerTpl) {
    return Backbone.View.extend({
      tagName: 'article',
      className: 'lim',
      template: _.template(speakerAnswerTpl),
      render: function() {
        this.$el.html(this.template(this.model.toJSON()));
        return this;
      }
    });
  });

}).call(this);
