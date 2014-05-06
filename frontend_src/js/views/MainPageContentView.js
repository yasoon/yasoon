(function() {
  define(['text!templates/mainPageNavTpl.htm', 'views/MainPageHistoryView', 'views/EmptyView', 'views/PostsPreviews', 'models/MainPageHistoryModel', 'collections/PostsPreviewsList', 'backbone'], function(mainPageNavTpl, MainPageHistoryView, EmptyView, PostsPreviews, MainPageHistoryModel, PostsPreviewsList) {
    return Backbone.View.extend({
      className: 'main-layout',
      tagName: 'section',
      events: function() {
        return {
          'click nav.navigate a': 'changeMainPageView'
        };
      },
      template: _.template(mainPageNavTpl),
      initialize: function() {
        this.createMainPageHistory();
        $(window).off('scroll.app:main').on('scroll.app:main', this.fixedPostionOnScroll);
        return this;
      },
      fixedPostionOnScroll: function(event) {
        var layoutOffsetTop, pageOffsetTop;
        pageOffsetTop = $(event.currentTarget).scrollTop();
        layoutOffsetTop = $('.main-layout, .page-layout').offset().top;
        if (layoutOffsetTop && pageOffsetTop > layoutOffsetTop) {
          return $('.navigate, .postinfo').addClass('fixed');
        } else {
          return $('.navigate, .postinfo').removeClass('fixed');
        }
      },
      createMainPageHistory: function() {
        return $.get('/api/post/get_daystory', (function(_this) {
          return function(data) {
            if (data.error === 'true') {
              if (_this.mainPageHistoryView == null) {
                _this.emptyView = new EmptyView({
                  message: data.errorText
                });
              } else {
                _this.emptyView.delegateEvents();
              }
              return _this.$el.find('.mainPage-content').append(_this.emptyView.render().$el);
            } else {
              if (_this.emptyView == null) {
                _this.mainPageHistoryView = new MainPageHistoryView({
                  model: new MainPageHistoryModel(data)
                });
              } else {
                _this.mainPageHistoryView.delegateEvents();
              }
              return _this.$el.find('.mainPage-content').append(_this.mainPageHistoryView.render().$el);
            }
          };
        })(this), 'json');
      },
      createMainPageStories: function() {
        return $.get('/api/post/get_best_posts', (function(_this) {
          return function(data) {
            if (_this.postsPreviews == null) {
              _this.postsPreviews = new PostsPreviews({
                collection: new PostsPreviewsList(data)
              });
            } else {
              _this.postsPreviews.delegateEvents();
            }
            return _this.$el.find('.mainPage-content').append(_this.postsPreviews.render().$el);
          };
        })(this), 'json');
      },
      changeMainPageView: function(event) {
        var $mainLayout, $this, tab;
        event.preventDefault();
        $this = $(event.currentTarget);
        $mainLayout = $('.main-layout');
        $("html, body").animate({
          scrollTop: $mainLayout.offset().top
        }, 'fast');
        if (!$this.hasClass('active')) {
          $this.addClass('active').siblings().removeClass('active');
          this.$el.find('.mainPage-content').empty();
          tab = $this.attr('href').replace('#', '');
          return this[tab].call(this);
        }
      },
      render: function() {
        this.$el.empty().append(this.template());
        return this;
      }
    });
  });

}).call(this);
