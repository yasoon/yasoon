// Generated by CoffeeScript 1.6.1
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['views/base/page', 'JST', 'views/common/footer', 'views/author/posts/header', 'models/register/register', 'views/info/info'], function(PageView, JST, FooterView, HeaderView, InfoModel, InfoView) {
  'use strict';
  var InfoPageView;
  return InfoPageView = (function(_super) {

    __extends(InfoPageView, _super);

    function InfoPageView() {
      return InfoPageView.__super__.constructor.apply(this, arguments);
    }

    InfoPageView.prototype.className = 'infoPage';

    InfoPageView.prototype.regions = {
      'footer': 'footer',
      'header': 'header',
      '#page-layout': 'info'
    };

    InfoPageView.prototype.templateName = 'info_page';

    InfoPageView.prototype.render = function() {
      var infoModel,
        _this = this;
      InfoPageView.__super__.render.apply(this, arguments);
      new HeaderView();
      new FooterView();
      infoModel = new InfoModel();
      return infoModel.load(function() {
        var infoView;
        infoView = new InfoView({
          model: infoModel
        });
        return infoView.setRegion('info').setMode('edit');
      });
    };

    return InfoPageView;

  })(PageView);
});
