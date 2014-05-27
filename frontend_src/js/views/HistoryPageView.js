(function() {
  define(['views/HistoryCategoryCollectionView', 'views/HistoryPostsCollectionView', 'views/EmptyView', 'collections/HistoryCategoryCollection', 'collections/HistoryPostsCollection', 'backbone'], function(HistoryCategoryCollectionView, HistoryPostsCollectionView, EmptyView, HistoryCategoryCollection, HistoryPostsCollection) {
    return Backbone.View.extend({
      tagName: 'section',
      className: 'page-layout',
      initialize: function(options) {
        this.options = {
          category: options.category || 0,
          sort: options.sort || 'dateSort'
        };
        this.description = {
          name: 'THE GLASS BICYCLE',
          description: 'Your digestive tract is probably'
        };
        return this.createHistoryPageAside();
      },
      createHistoryPageAside: function() {
        var category, sort;
        category = this.options.category;
        sort = this.options.sort;
        return $.get("/api/category/get_CategoryList", (function(_this) {
          return function(data) {
            if (_this.historyCategoryCollectionView == null) {
              _this.historyCategoryCollectionView = new HistoryCategoryCollectionView({
                category: category,
                sort: sort,
                collection: new HistoryCategoryCollection(data)
              });
            } else {
              _this.historyCategoryCollectionView.delegateEvents();
            }
            _this.$el.append(_this.historyCategoryCollectionView.render().$el);
            if (parseInt(category) > 0) {
              _this.description = _.where(data, {
                id: parseInt(category)
              })[0];
            }
            return _this.createHistoryPageStories();
          };
        })(this), 'json');
      },
      createHistoryPageStories: function() {
        var category, description, sort;
        category = this.options.category;
        sort = this.options.sort;
        description = this.description;
        return $.get("/api/post/get_categoryPosts/" + category + "/1/10", (function(_this) {
          return function(data) {
            if (data[sort].length > 0) {
              if (_this.historyPostsCollectionView == null) {
                _this.historyPostsCollectionView = new HistoryPostsCollectionView({
                  category: category,
                  sort: sort,
                  description: description,
                  collection: new HistoryPostsCollection(data[sort])
                });
              } else {
                _this.historyPostsCollectionView.delegateEvents();
              }
              return _this.$el.append(_this.historyPostsCollectionView.render().$el);
            } else {
              if (_this.emptyView == null) {
                _this.emptyView = new EmptyView({
                  message: 'В этой категории нет постов!'
                });
              } else {
                _this.emptyView.delegateEvents();
              }
              return _this.$el.append(_this.emptyView.render().$el);
            }
          };
        })(this), 'json');
      }
    });
  });

}).call(this);
