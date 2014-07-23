(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['text!templates/historyCategoriesTpl.htm', 'views/HistoryPageCategoryView', 'backbone'], function(historyCategoriesTpl, HistoryPageCategoryView) {
    var HistoryCategoryCollectionView;
    return HistoryCategoryCollectionView = (function(_super) {
      __extends(HistoryCategoryCollectionView, _super);

      function HistoryCategoryCollectionView() {
        return HistoryCategoryCollectionView.__super__.constructor.apply(this, arguments);
      }

      HistoryCategoryCollectionView.prototype.tagName = 'aside';

      HistoryCategoryCollectionView.prototype.className = 'left-side';

      HistoryCategoryCollectionView.prototype.template = _.template(historyCategoriesTpl);

      HistoryCategoryCollectionView.prototype.initialize = function(options) {
        return this.options = options || {};
      };

      HistoryCategoryCollectionView.prototype.render = function() {
        var data, storyList;
        data = {
          'sort': this.options.sort,
          'category': this.options.category
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
      };

      HistoryCategoryCollectionView.prototype.historyCategory = function() {};

      return HistoryCategoryCollectionView;

    })(Backbone.View);
  });

}).call(this);
