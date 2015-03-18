(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['text!templates/mainPageHeadingTpl.htm', 'text!templates/categoriesSearchResultTpl.htm', 'views/ReviewCategoriesView', 'backbone', 'videoBG', 'moderniz'], function(mainPageHeadingTpl, categoriesSearchResultTpl, ReviewCategoriesView) {
    var MainPageHeadingView;
    return MainPageHeadingView = (function(_super) {
      __extends(MainPageHeadingView, _super);

      function MainPageHeadingView() {
        return MainPageHeadingView.__super__.constructor.apply(this, arguments);
      }

      MainPageHeadingView.prototype.className = 'mainPage-intro';

      MainPageHeadingView.prototype.template = _.template(mainPageHeadingTpl);

      MainPageHeadingView.prototype.categoriesTemplate = _.template(categoriesSearchResultTpl);

      MainPageHeadingView.prototype.events = function() {
        return {
          'keyup input.category-for-review-main': 'getCategoriesMain',
          'click a.categoriesBtn': 'showCategories'
        };
      };

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

      MainPageHeadingView.prototype.getCategoriesMain = function() {
        var categoryText;
        categoryText = $('input.category-for-review-main').val();
        if (categoryText.length >= 2) {
          return $.get("/api/post/search-categories/" + categoryText, (function(_this) {
            return function(data) {
              return _this.checkErrorsMain(data);
            };
          })(this));
        } else {
          return $('.found-categories-main').hide();
        }
      };

      MainPageHeadingView.prototype.checkErrorsMain = function(data) {
        if (data.error === true) {
          return this.showErrorMain(data.errorText);
        } else {
          return this.setCategoriesDataMain(data.result);
        }
      };

      MainPageHeadingView.prototype.setCategoriesDataMain = function(data) {
        $('.found-categories-main').empty().append(this.categoriesTemplate(_.extend({}, {
          'categories': data
        })));
        return $('.found-categories-main').show();
      };

      MainPageHeadingView.prototype.showErrorMain = function(data) {
        return $('.found-categories-main').hide();
      };

      MainPageHeadingView.prototype.showCategories = function(event) {
        var type;
        event.preventDefault();
        type = $(event.currentTarget).attr('data-type');
        this.reviewCategoriesView = new ReviewCategoriesView({
          type: type
        });
        $('body').append(this.reviewCategoriesView.render().$el);
        return setTimeout((function() {
          return $('.category-for-review').focus();
        }), 1000);
      };

      return MainPageHeadingView;

    })(Backbone.View);
  });

}).call(this);
