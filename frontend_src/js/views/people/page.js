// Generated by CoffeeScript 1.6.1
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['views/base/page', 'JST', 'views/common/footer', 'views/people/header', 'categories', 'views/people/authorQueue', 'models/people/authorQueue'], function(PageView, JST, FooterView, HeaderView, categories, AuthorQueueView, AuthorQueueModel) {
  'use strict';
  var PeoplePageView;
  return PeoplePageView = (function(_super) {

    __extends(PeoplePageView, _super);

    function PeoplePageView() {
      return PeoplePageView.__super__.constructor.apply(this, arguments);
    }

    PeoplePageView.prototype.className = 'peoplePage';

    PeoplePageView.prototype.regions = {
      'queue': '#queue',
      'footer': 'footer',
      'header': 'header'
    };

    PeoplePageView.prototype.templateName = 'people_page';

    PeoplePageView.prototype.initialize = function(params) {
      PeoplePageView.__super__.initialize.apply(this, arguments);
      this.activeCategoryId = parseInt(params.catId);
      return this.activeCategory = categories[this.activeCategoryId];
    };

    PeoplePageView.prototype.render = function() {
      var activeCategoryId, aq,
        _this = this;
      PeoplePageView.__super__.render.apply(this, arguments);
      new HeaderView({
        catId: this.activeCategoryId
      });
      new FooterView();
      aq = new AuthorQueueModel({
        categoryId: this.activeCategoryId
      });
      aq.load(function() {
        var aqView;
        aqView = new AuthorQueueView({
          model: aq
        });
        return aqView.setRegion('queue').render();
      });
      activeCategoryId = this.activeCategoryId;
      return this.$el.find('.category').each(function() {
        if (parseInt($(this).attr('id')) === activeCategoryId) {
          return $(this).addClass('active');
        } else {
          return $(this).removeClass('active');
        }
      });
    };

    PeoplePageView.prototype.getTemplateData = function() {
      return {
        categories: categories,
        activeCategory: this.activeCategory,
        activeCatId: this.activeCategoryId
      };
    };

    return PeoplePageView;

  })(PageView);
});
