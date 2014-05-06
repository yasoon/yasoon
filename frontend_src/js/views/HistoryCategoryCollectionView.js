(function() {
  define(['text!templates/historyCategoriesTpl.htm', 'views/HistoryPageCategoryView', 'backbone'], function(historyCategoriesTpl, HistoryPageCategoryView) {
    return Backbone.View.extend({
      tagName: 'aside',
      className: 'left-side',
      template: _.template(historyCategoriesTpl),
      initialize: function(options) {
        return this.options = options || {};
      },
      render: function() {
        var data, storyList;
        data = {
          sort: this.options.sort,
          category: this.options.category
        };
        this.$el.empty().append(this.template(data));
        storyList = this.$el.find('ul');
        this.collection.each(function(model) {
          return storyList.append(new HistoryPageCategoryView({
            sort: data.sort,
            category: data.category,
            model: model
          }).render().$el);
        });
        return this;
      }
    });
  });

}).call(this);
