(function() {
  define(['text!templates/categoriesListTpl.htm', 'views/CategoryView', 'backbone'], function(categoriesListTpl, CategoryView) {
    return Backbone.View.extend({
      tagName: 'aside',
      className: 'left-side',
      template: _.template(categoriesListTpl),
      initialize: function(options) {
        this.options = options || {};
        return this.data = {
          page: this.options.page,
          sort: this.options.sort,
          category: this.options.category
        };
      },
      render: function() {
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
      },
      addOne: function(category) {
        category = new CategoryView({
          model: category
        });
        return this.categoriesList.append(category.render().$el);
      }
    });
  });

}).call(this);
