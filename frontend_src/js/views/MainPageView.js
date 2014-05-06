(function() {
  define(['views/MainPageHeadingView', 'views/MainPageContentView', 'backbone'], function(MainPageHeadingView, MainPageContentView) {
    return Backbone.View.extend({
      tagName: 'section',
      initialize: function() {
        this.createMainPageHeading();
        this.createMainPageContent();
        return this;
      },
      createMainPageHeading: function() {
        if (this.mainPageHeadingView == null) {
          this.mainPageHeadingView = new MainPageHeadingView();
        }
        return this.$el.append(this.mainPageHeadingView.render().$el);
      },
      createMainPageContent: function() {
        if (this.mainPageContentView == null) {
          this.mainPageContentView = new MainPageContentView();
        }
        return this.$el.append(this.mainPageContentView.render().$el);
      }
    });
  });

}).call(this);
