(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['text!templates/categoriesListTpl.htm', 'views/CategoryView', 'backbone'], function(categoriesListTpl, CategoryView) {
    var CategoriesListView;
    return CategoriesListView = (function(_super) {
      __extends(CategoriesListView, _super);

      function CategoriesListView() {
        return CategoriesListView.__super__.constructor.apply(this, arguments);
      }

      CategoriesListView.prototype.tagName = 'aside';

      CategoriesListView.prototype.className = 'left-side';

      CategoriesListView.prototype.template = _.template(categoriesListTpl);

      CategoriesListView.prototype.initialize = function(options) {
        return this.data = {
          page: options.page,
          sort: options.sort,
          category: options.category
        };
      };

      CategoriesListView.prototype.render = function() {
        this.$el.empty().append(this.template(this.data));
        this.categoriesList = this.$('ul');
        this.collection.each((function(_this) {
          return function(category) {
            category.set(_this.data);
            return _this.addOne(category);
          };
        })(this));
        this.$("a#" + this.data.category).addClass('active');
        return this;
      };

      CategoriesListView.prototype.addOne = function(category) {
        category = new CategoryView({
          model: category
        });
        return this.categoriesList.append(category.render().$el);
      };

      return CategoriesListView;

    })(Backbone.View);
  });

}).call(this);
