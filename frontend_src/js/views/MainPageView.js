(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['views/MainPageHeadingView', 'views/MainPageContentView', 'backbone'], function(MainPageHeadingView, MainPageContentView) {
    var MainPageView;
    return MainPageView = (function(_super) {
      __extends(MainPageView, _super);

      function MainPageView() {
        return MainPageView.__super__.constructor.apply(this, arguments);
      }

      MainPageView.prototype.tagName = 'section';

      MainPageView.prototype.initialize = function() {
        this.createMainPageHeading();
        return this;
      };

      MainPageView.prototype.createMainPageHeading = function() {
        if (this.mainPageHeadingView == null) {
          this.mainPageHeadingView = new MainPageHeadingView();
        }
        return this.$el.append(this.mainPageHeadingView.render().$el);
      };

      MainPageView.prototype.createMainPageContent = function() {
        if (this.mainPageContentView == null) {
          this.mainPageContentView = new MainPageContentView();
        }
        return this.$el.append(this.mainPageContentView.render().$el);
      };

      return MainPageView;

    })(Backbone.View);
  });

}).call(this);
