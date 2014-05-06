(function() {
  define(['views/HeaderRegionView', 'views/ContentRegionView', 'backbone'], function(HeaderRegionView, ContentRegionView) {
    var LayoutView;
    LayoutView = Backbone.View.extend({
      initialize: function() {
        this.headerRegion = new HeaderRegionView();
        this.contentRegion = new ContentRegionView({
          el: this.$('.main_block')
        });
        this.$('#header').empty().append(this.headerRegion.render().$el);
        return this;
      }
    });
    return new LayoutView({
      el: 'body'
    });
  });

}).call(this);
