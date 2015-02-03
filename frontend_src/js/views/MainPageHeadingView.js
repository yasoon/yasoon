(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['text!templates/mainPageHeadingTpl.htm', 'backbone', 'videoBG', 'moderniz'], function(mainPageHeadingTpl) {
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
          'background-image': "url(web/upload" + (_.getContent(13)) + ")",
          'background-size': "cover"
        });
        this.onRender();
        return this;
      };

      MainPageHeadingView.prototype.onRender = function() {
        if (_.getContent(69) !== '') {
          return setTimeout((function() {
            var BV;
            if (Modernizr.video) {
              BV = new $.BigVideo({
                container: $('.mainPage-intro')
              });
              BV.init();
              BV.show([
                {
                  type: "video/mp4",
                  src: "" + (_.getContent(69)) + ".mp4"
                }, {
                  type: "video/webm",
                  src: "" + (_.getContent(69)) + ".webm"
                }, {
                  type: "video/ogg",
                  src: "" + (_.getContent(69)) + ".ogg"
                }, {
                  ambient: true
                }
              ]);
              return BV.getPlayer().on('durationchange', (function() {
                return $('#big-video-wrap').fadeIn();
              }));
            }
          }), 200);
        }
      };

      return MainPageHeadingView;

    })(Backbone.View);
  });

}).call(this);
