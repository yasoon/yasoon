(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['text!templates/historyStoriesTpl.htm', 'views/HistoryPageStoryView', 'backbone'], function(historyStoriesTpl, HistoryPageStoryView) {
    var AnswersPostsCollectionView;
    return AnswersPostsCollectionView = (function(_super) {
      __extends(AnswersPostsCollectionView, _super);

      function AnswersPostsCollectionView() {
        return AnswersPostsCollectionView.__super__.constructor.apply(this, arguments);
      }

      AnswersPostsCollectionView.prototype.tagName = 'section';

      AnswersPostsCollectionView.prototype.template = _.template(historyStoriesTpl);

      AnswersPostsCollectionView.prototype.initialize = function(options) {
        return this.options = options || {};
      };

      AnswersPostsCollectionView.prototype.render = function() {
        this.$el.empty().append(this.template(_.extend(this.options, this.options.description)));
        this.collection.each((function(_this) {
          return function(story) {
            return _this.addOne(story);
          };
        })(this));
        return this;
      };

      AnswersPostsCollectionView.prototype.addOne = function(story) {
        var history;
        history = new HistoryPageStoryView({
          model: story
        });
        return this.$el.append(history.render().$el);
      };

      return AnswersPostsCollectionView;

    })(Backbone.View);
  });

}).call(this);
