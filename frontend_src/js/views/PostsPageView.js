(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['views/CategoriesListView', 'views/PostsPagePreviews', 'views/PostsDescriptionView', 'views/EmptyView', 'views/StatisticPreview', 'collections/CategoryCollection', 'collections/PostsPreviewsList', 'backbone', 'bootstrap-rating'], function(CategoriesListView, PostsPreviews, PostsDescriptionView, EmptyView, StatisticPreview, CategoryCollection, PostsPreviewsList) {
    var PostsPageView;
    return PostsPageView = (function(_super) {
      __extends(PostsPageView, _super);

      function PostsPageView() {
        return PostsPageView.__super__.constructor.apply(this, arguments);
      }

      PostsPageView.prototype.tagName = 'section';

      PostsPageView.prototype.className = 'page-layout';

      PostsPageView.prototype.events = function() {
        return {
          'click .nav-cat li a': 'checkCategoryChildren'
        };
      };

      PostsPageView.prototype.initialize = function(options) {
        this.model.set({
          'category': options.category,
          'sort': options.sort || 'dateSort'
        });
        this.setListeners();
        return this.getCategoryList();
      };

      PostsPageView.prototype.setListeners = function() {
        this.listenTo(this.model, 'change:postsList', this.createPostsList);
        this.listenTo(this.model, 'change:description', this.createPostsDescription);
        return this.listenTo(this.model, 'change:categoryList', this.createsCategoryFilter);
      };

      PostsPageView.prototype.getCategoryList = function() {
        if (parseInt(this.model.get('category')) === 0) {
          return this.model.set('categoryList', window.config.category);
        } else {
          return this.getCategories();
        }
      };

      PostsPageView.prototype.getCategories = function() {
        return $.get("/api/post/get_categories/" + parseInt(this.model.get('category')), (function(_this) {
          return function(data) {
            return _this.checkCategoryErrors(data);
          };
        })(this));
      };

      PostsPageView.prototype.checkCategoryErrors = function(data) {
        if (data.error === true) {
          return this.model.set('categoryList', window.config.category);
        } else {
          return this.setDataCategories(data);
        }
      };

      PostsPageView.prototype.setDataCategories = function(data) {
        this.model.set('parent', data.result.parent);
        this.model.set('pathData', data.path);
        if (data.result.categories != null) {
          return this.model.set('categoryList', data.result.categories);
        } else {
          return this.createsCategoryFilter();
        }
      };

      PostsPageView.prototype.createsCategoryFilter = function() {
        this.categoryList();
        this.$el.append(this.categoryListView.render().$el);
        return this.setDescription();
      };

      PostsPageView.prototype.getPostsList = function() {
        return $.get("/api/post/get_categoryPosts/" + (this.model.get('category')) + "/1/10/" + (this.model.get('sort')), (function(_this) {
          return function(data) {
            return _this.checkErrors(data);
          };
        })(this));
      };

      PostsPageView.prototype.createPostsList = function() {
        if (this.model.get('postsList').length > 0) {
          return this.createPosts();
        } else {
          return this.emptyPosts();
        }
      };

      PostsPageView.prototype.emptyPosts = function(errorText) {
        var text;
        if (errorText == null) {
          errorText = null;
        }
        text = _.getContent(34);
        if ($('.items-list').length) {
          $('.items-list').parent().remove();
        }
        if (this.emptyView == null) {
          this.emptyView = new EmptyView({
            message: text
          });
        } else {
          this.emptyView.delegateEvents();
        }
        return this.$el.append(this.emptyView.render().$el);
      };

      PostsPageView.prototype.setDescription = function() {
        var description;
        description = parseInt(this.model.get('category')) === 0 ? [
          {
            'id': 0,
            'name': 'Все'
          }
        ] : this.model.get('pathData');
        return this.model.set('description', description);
      };

      PostsPageView.prototype.createPostsDescription = function() {
        this.postsDescription();
        this.$el.append(this.postsDescriptionView.render().$el);
        return this.getReviewsStatistic();
      };

      PostsPageView.prototype.createPosts = function() {
        if ($('.items-list').length) {
          $('.items-list').parent().remove();
        }
        if ($('.empty-text').length) {
          $('.empty-text').parent().remove();
        }
        this.posts();
        return this.$el.append(this.postsPreviews.render().$el);
      };

      PostsPageView.prototype.categoryList = function() {
        var categoryCollection;
        categoryCollection = new CategoryCollection(this.model.get('categoryList'));
        return this.categoryListView = new CategoriesListView({
          category: this.model.get('category'),
          sort: this.model.get('sort'),
          page: 'posts',
          collection: categoryCollection,
          parent: this.model.get('parent')
        });
      };

      PostsPageView.prototype.postsDescription = function() {
        return this.postsDescriptionView = new PostsDescriptionView({
          description: this.model.get('description'),
          category: this.model.get('category'),
          sort: this.model.get('sort')
        });
      };

      PostsPageView.prototype.posts = function() {
        return this.postsPreviews = new PostsPreviews({
          category: this.model.get('category'),
          sort: this.model.get('sort'),
          collection: new PostsPreviewsList(this.model.get('postsList'))
        });
      };

      PostsPageView.prototype.checkErrors = function(data) {
        if (data.error === true) {
          return this.emptyPosts(data.errorText);
        } else {
          this.model.set('postsList', data[this.model.get('sort')]);
          return this.model.trigger('change:postsList');
        }
      };

      PostsPageView.prototype.checkCategoryChildren = function(event) {
        var element, obj;
        if ($(event.currentTarget).attr('data-last') === '0') {
          _.each($('.nav-cat li a'), (function(_this) {
            return function(category) {
              return $(category).removeClass('active');
            };
          })(this));
          element = $(event.currentTarget);
          $(".nav-cat a:first").addClass('active');
          element.addClass('active');
          event.preventDefault();
          this.model.set('category', event.target.id);
          obj = {
            Url: '#/posts/' + event.target.id + '/' + this.model.get('sort')
          };
          window.history.pushState(obj, 'yasoon', obj.Url);
          $(".cat-title a.active").remove();
          if (event.target.id !== '0') {
            element.clone().insertAfter(".cat-title a:last");
          }
          return this.getReviewsStatistic();
        }
      };

      PostsPageView.prototype.getReviewsStatistic = function() {
        if ($('.cat-statistic').length) {
          $('.cat-statistic').parent().remove();
        }
        if ($('.items-list').length) {
          $('.items-list').parent().remove();
        }
        if ($('.empty-text').length) {
          $('.empty-text').parent().remove();
        }
        return $.get("/api/post/get_reviewsStatistic/" + (this.model.get('category')), (function(_this) {
          return function(data) {
            return _this.checkStatisticsErrors(data);
          };
        })(this));
      };

      PostsPageView.prototype.checkStatisticsErrors = function(data) {
        this.getPostsList();
        if (data.error === true) {
          if ($('.cat-statistic').length) {
            return $('.cat-statistic').parent().remove();
          }
        } else {
          this.statisticPreview = new StatisticPreview(data.result);
          this.$el.append(this.statisticPreview.render().$el);
          return $('.ratingCategory').rating();
        }
      };

      return PostsPageView;

    })(Backbone.View);
  });

}).call(this);
