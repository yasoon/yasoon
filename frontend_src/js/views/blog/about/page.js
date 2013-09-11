// Generated by CoffeeScript 1.6.1
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['views/base/page', 'JST', 'views/common/footer', 'views/author/posts/header', 'models/blog/about/page'], function(PageView, JST, FooterView, HeaderView, AboutPageModel) {
  'use strict';
  var BlogAboutPageView;
  return BlogAboutPageView = (function(_super) {

    __extends(BlogAboutPageView, _super);

    function BlogAboutPageView() {
      return BlogAboutPageView.__super__.constructor.apply(this, arguments);
    }

    BlogAboutPageView.prototype.className = 'aboutPage';

    BlogAboutPageView.prototype.regions = {
      'post': '#post',
      'footer': 'footer',
      'header': 'header'
    };

    BlogAboutPageView.prototype.templateName = 'blog_about_page';

    BlogAboutPageView.prototype.initialize = function() {
      return this.model = new AboutPageModel();
    };

    BlogAboutPageView.prototype.render = function() {
      var _this = this;
      return this.model.load(function() {
        var fv, hv;
        BlogAboutPageView.__super__.render.apply(_this, arguments);
        hv = new HeaderView();
        fv = new FooterView();
        return pressFooter();
      });
    };

    return BlogAboutPageView;

  })(PageView);
});
