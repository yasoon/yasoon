(function() {
  define(['text!templates/speakersCategoriesTpl.htm', 'views/SpeakersPageCategoryView', 'backbone'], function(historyCategoriesTpl, SpeakersPageCategoryView) {
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
          category: this.options.category
        };
        this.$el.empty().append(this.template(data));
        storyList = this.$el.find('ul');
        this.collection.each(function(model) {
          return storyList.append(new SpeakersPageCategoryView({
            category: data.category,
            model: model
          }).render().$el);
        });
        return this;
      }
    });
  });

}).call(this);
