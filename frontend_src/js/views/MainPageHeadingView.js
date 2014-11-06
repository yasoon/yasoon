(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['text!templates/mainPageHeadingTpl.htm', 'backbone'], function(mainPageHeadingTpl) {
    var MainPageHeadingView;
    return MainPageHeadingView = (function(_super) {
      __extends(MainPageHeadingView, _super);

      function MainPageHeadingView() {
        return MainPageHeadingView.__super__.constructor.apply(this, arguments);
      }

      MainPageHeadingView.prototype.className = 'mainPage-intro';

      MainPageHeadingView.prototype.template = _.template(mainPageHeadingTpl);

      MainPageHeadingView.prototype.render = function() {
        this.$el.html(this.template()).css({
          'background-image': "url(frontend" + (_.getContent(13)) + ")",
          'background-size': "cover"
        });
        return this;
      };

      return MainPageHeadingView;

    })(Backbone.View);
  });

}).call(this);
