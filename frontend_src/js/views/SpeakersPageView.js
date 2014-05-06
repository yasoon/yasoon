(function() {
  define(['views/CategoriesListView', 'views/SpeakersCollectionView', 'views/EmptyView', 'collections/CategoryCollection', 'collections/SpeakersCollection', 'backbone'], function(CategoriesListView, SpeakersCollectionView, EmptyView, CategoryCollection, SpeakersCollection) {
    return Backbone.View.extend({
      tagName: 'section',
      className: 'page-layout',
      initialize: function(options) {
        this.options = {
          category: options.category || 0
        };
        this.description = {
          name: 'THE GLASS BICYCLE',
          description: 'Your digestive tract is probably'
        };
        return this.createCategoryFilter();
      },
      createCategoryFilter: function() {
        var category;
        category = this.options.category;
        return $.get("/api/category/get_CategoryList", (function(_this) {
          return function(data) {
            if (_this.categoriesListView == null) {
              _this.categoriesListView = new CategoriesListView({
                category: category,
                page: 'speakers',
                collection: new CategoryCollection(data)
              });
            } else {
              _this.categoriesListView.delegateEvents();
            }
            _this.$el.append(_this.categoriesListView.render().$el);
            if (parseInt(category) > 0) {
              _this.description = _.where(data, {
                id: parseInt(category)
              })[0];
            }
            return _this.createSpeakersPageStories();
          };
        })(this), 'json');
      },
      createSpeakersPageStories: function() {
        var category, description;
        category = this.options.category;
        description = this.description;
        return $.get("/api/post/get_categoryPeople/" + category + "/1/10", (function(_this) {
          return function(data) {
            data = data['peoples'];
            if (data.error === true) {
              if (_this.emptyView == null) {
                _this.emptyView = new EmptyView({
                  message: data.errorText
                });
              } else {
                _this.emptyView.delegateEvents();
              }
              return _this.$el.append(_this.emptyView.render().$el);
            } else {
              if (_this.SpeakersCollectionView == null) {
                _this.SpeakersCollectionView = new SpeakersCollectionView({
                  category: category,
                  description: description,
                  collection: new SpeakersCollection(data)
                });
              } else {
                _this.SpeakersCollectionView.delegateEvents();
              }
              return _this.$el.append(_this.SpeakersCollectionView.render().$el);
            }
          };
        })(this), 'json');
      }
    });
  });

}).call(this);
