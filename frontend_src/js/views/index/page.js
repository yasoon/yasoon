// Generated by CoffeeScript 1.6.3
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['views/base/page', 'JST', 'views/common/footer', 'views/index/header', 'views/index/daystory', 'models/index/daystory'], function(PageView, JST, FooterView, HeaderView, DaystoryView, DaystoryModel) {
  'use strict';
  var IndexPageView, _ref;
  return IndexPageView = (function(_super) {
    __extends(IndexPageView, _super);

    function IndexPageView() {
      _ref = IndexPageView.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    IndexPageView.prototype.className = 'indexPage';

    IndexPageView.prototype.regions = {
      '#daystory': 'daystory',
      'footer': 'footer',
      'header': 'header'
    };

    IndexPageView.prototype.templateName = 'index_page';

    IndexPageView.prototype.render = function() {
      var dsModel,
        _this = this;
      IndexPageView.__super__.render.apply(this, arguments);
      new HeaderView();
      new FooterView();
      dsModel = new DaystoryModel;
      return dsModel.load(function() {
        return (new DaystoryView({
          model: dsModel
        })).setRegion('daystory').render();
      });
    };

    return IndexPageView;

  })(PageView);
});
