(function() {
  define(['views/CategoriesListView', 'views/PostsPagePreviews', 'views/PostsDescriptionView', 'views/EmptyView', 'collections/CategoryCollection', 'collections/PostsPreviewsList', 'backbone'], function(CategoriesListView, PostsPreviews, PostsDescriptionView, EmptyView, CategoryCollection, PostsPreviewsList) {
    return Backbone.View.extend({
      tagName: 'section',
      className: 'page-layout',
      initialize: function(options) {
        this.category = options.category || 0;
        this.sort = options.sort || 'dateSort';
        this.description = {
          name: 'THE GLASS BICYCLE',
          description: 'Your digestive tract is probably'
        };
        return this.createsCategoryFilter();
      },
      createsCategoryFilter: function() {
        var category, sort;
        category = this.category;
        sort = this.sort;
        return $.get("/api/category/get_CategoryList", (function(_this) {
          return function(data) {
            if (_this.categoriesListView == null) {
              _this.categoriesListView = new CategoriesListView({
                category: category,
                sort: sort,
                page: 'posts',
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
            return _this.createPostsList();
          };
        })(this), 'json');
      },
      createPostsList: function() {
        var options;
        options = {
          description: this.description,
          category: this.category,
          sort: this.sort
        };
        return $.get("/api/post/get_categoryPosts/" + this.category + "/1/10", (function(_this) {
          return function(data) {
            data = data[_this.sort];
            if (data.length > 0) {
              _this.createPostsDescription(options);
              return _this.createPosts(data, _this.sort, _this.category);
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
      },
      createPostsDescription: function(options) {
        if (this.postsDescriptionView == null) {
          this.postsDescriptionView = new PostsDescriptionView(options);
        } else {
          this.postsDescriptionView.delegateEvents();
        }
        return this.$el.append(this.postsDescriptionView.render().$el);
      },
      createPosts: function(data, sort, category) {
        if (this.postsPreviews == null) {
          this.postsPreviews = new PostsPreviews({
            category: category,
            sort: sort,
            collection: new PostsPreviewsList(data)
          });
        } else {
          this.postsPreviews.delegateEvents();
        }
        return this.$el.append(this.postsPreviews.render().$el);
      }
    });
  });

}).call(this);
