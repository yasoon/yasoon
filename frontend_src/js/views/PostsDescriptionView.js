(function() {
  define(['text!templates/historyStoriesTpl.htm', 'backbone'], function(historyStoriesTpl) {
    return Backbone.View.extend({
      tagName: 'section',
      template: _.template(historyStoriesTpl),
      initialize: function(options) {
        return this.options = options || {};
      },
      render: function() {
        var data;
        data = _.extend(this.options, this.options.description);
        this.$el.empty().append(this.template(data));
        return this;
      }
    });
  });

}).call(this);
