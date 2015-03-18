(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['text!templates/mainPageNavTpl.htm', 'views/MainPageHistoryView', 'views/EmptyView', 'views/PostsPreviews', 'models/MainPageHistoryModel', 'collections/PostsPreviewsList', 'backbone'], function(mainPageNavTpl, MainPageHistoryView, EmptyView, PostsPreviews, MainPageHistoryModel, PostsPreviewsList) {
    var MainPageContentView;
    return MainPageContentView = (function(_super) {
      __extends(MainPageContentView, _super);

      function MainPageContentView() {
        return MainPageContentView.__super__.constructor.apply(this, arguments);
      }

      MainPageContentView.prototype.className = 'main-layout';

      MainPageContentView.prototype.tagName = 'section';

      MainPageContentView.prototype.events = function() {
        return {
          'click nav.navigate a': 'changeMainPageView'
        };
      };

      MainPageContentView.prototype.template = _.template(mainPageNavTpl);

      MainPageContentView.prototype.initialize = function() {
        this.createMainPageStories();
        $(window).off('scroll.app:main').on('scroll.app:main', this.fixedPositionOnScroll);
        return this;
      };

      MainPageContentView.prototype.fixedPositionOnScroll = function(event) {
        var layoutOffsetTop, pageOffsetTop;
        pageOffsetTop = $(event.currentTarget).scrollTop();
        layoutOffsetTop = $('.main-layout, .page-layout').offset().top;
        if (layoutOffsetTop && pageOffsetTop > layoutOffsetTop) {
          return $('.navigate, .postinfo').addClass('fixed');
        } else {
          return $('.navigate, .postinfo').removeClass('fixed');
        }
      };

      MainPageContentView.prototype.createMainPageHistory = function() {
        return $.get('/api/post/get_daystory', (function(_this) {
          return function(data) {
            if (data.error === 'true') {
              return _this.emptyDayStory(data);
            } else {
              return _this.dayStory(data);
            }
          };
        })(this));
      };

      MainPageContentView.prototype.emptyDayStory = function(data) {
        var emptyView;
        emptyView = new EmptyView({
          message: data.errorText
        });
        if (this.mainPageHistoryView == null) {
          this.emptyView = emptyView;
        } else {
          this.emptyView.delegateEvents();
        }
        return this.$el.find('.mainPage-content').append(this.emptyView.render().$el);
      };

      MainPageContentView.prototype.dayStory = function(data) {
        var dayStory;
        dayStory = new MainPageHistoryView({
          model: new MainPageHistoryModel(data)
        });
        if (this.mainPageHistoryView == null) {
          this.mainPageHistoryView = dayStory;
        } else {
          this.mainPageHistoryView.delegateEvents();
        }
        return this.$el.find('.mainPage-content').append(this.mainPageHistoryView.render().$el);
      };

      MainPageContentView.prototype.createMainPageStories = function() {
        return $.get('/api/post/get_categoryPosts/0/1/10/dateSort', (function(_this) {
          return function(data) {
            return _this.postPreviews(data);
          };
        })(this));
      };

      MainPageContentView.prototype.postPreviews = function(data) {
        var postPreviews;
        postPreviews = new PostsPreviews({
          collection: new PostsPreviewsList(data.dateSort)
        });
        if (this.postsPreviews == null) {
          this.postsPreviews = postPreviews;
        } else {
          this.postsPreviews.delegateEvents();
        }
        this.$el.find('.mainPage-content').append(this.postsPreviews.render().$el);
        $('.bottom-toolbar').remove();
        return $('.ratingSpeaker').rating();
      };

      MainPageContentView.prototype.changeMainPageView = function(event) {
        var $mainLayout, $this;
        event.preventDefault();
        $this = $(event.currentTarget);
        $mainLayout = $('.main-layout');
        $("html, body").animate({
          scrollTop: $mainLayout.offset().top
        }, 'fast');
        if (!$this.hasClass('active')) {
          $this.addClass('active').siblings().removeClass('active');
          this.$el.find('.mainPage-content').empty();
          return this[$this.attr('href').replace('#', '')].call(this);
        }
      };

      MainPageContentView.prototype.render = function() {
        this.$el.empty().append(this.template());
        return this;
      };

      return MainPageContentView;

    })(Backbone.View);
  });

}).call(this);
