// Generated by CoffeeScript 1.6.3
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['views/base/page', 'JST', 'views/common/footer', 'views/author/posts/header', 'views/author/posts/postQueue', 'models/author/posts/postQueue', 'models/blog/blog'], function(PageView, JST, FooterView, HeaderView, PostQueueView, PostQueueModel, BlogModel) {
  'use strict';
  var BlogBlogPageView, _ref;
  return BlogBlogPageView = (function(_super) {
    __extends(BlogBlogPageView, _super);

    function BlogBlogPageView() {
      _ref = BlogBlogPageView.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    BlogBlogPageView.prototype.className = 'blogPage';

    BlogBlogPageView.prototype.regions = {
      'queue': '#queue',
      'footer': 'footer',
      'header': 'header'
    };

    BlogBlogPageView.prototype.templateName = 'blog_blog_page';

    BlogBlogPageView.prototype.initialize = function() {
      return this.model = new BlogModel();
    };

    BlogBlogPageView.prototype.events = {
      'click #follow': function() {
        this.model.follow();
        $('#follow').hide();
        return $('#unfollow').show();
      },
      'click #unfollow': function() {
        this.model.unfollow();
        $('#follow').show();
        return $('#unfollow').hide();
      }
    };

    BlogBlogPageView.prototype.render = function() {
      var fv, hv, qqModel,
        _this = this;
      BlogBlogPageView.__super__.render.apply(this, arguments);
      hv = new HeaderView();
      fv = new FooterView();
      return qqModel = (new PostQueueModel({
        authorId: 0
      })).load(function() {
        var qqView;
        qqView = new PostQueueView({
          model: qqModel
        });
        return qqView.setRegion('queue').render();
      });
    };

    return BlogBlogPageView;

  })(PageView);
});
