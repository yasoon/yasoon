(function() {
  define(['text!templates/historyStoriesTpl.htm', 'views/HistoryPageStoryView', 'backbone'], function(historyStoriesTpl, HistoryPageStoryView) {
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
        this.collection.each((function(_this) {
          return function(story) {
            return _this.addOne(story);
          };
        })(this));
        return this;
      },
      addOne: function(story) {
        var historyPageStoryView;
        historyPageStoryView = new HistoryPageStoryView({
          model: story
        });
        return this.$el.append(historyPageStoryView.render().$el);
      }
    });
  });

}).call(this);
