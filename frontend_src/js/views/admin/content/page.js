// Generated by CoffeeScript 1.6.3
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['views/base/page', 'JST', 'views/common/footer', 'views/admin/header', 'views/admin/content/rowQueue', 'models/admin/content/rowQueue'], function(PageView, JST, FooterView, HeaderView, RowQueueView, RowQueueModel) {
  'use strict';
  var AdminContentPageView, _ref;
  return AdminContentPageView = (function(_super) {
    __extends(AdminContentPageView, _super);

    function AdminContentPageView() {
      _ref = AdminContentPageView.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    AdminContentPageView.prototype.className = 'postPage';

    AdminContentPageView.prototype.regions = {
      'queue': '#queue',
      'footer': 'footer',
      'header': 'header'
    };

    AdminContentPageView.prototype.templateName = 'admin_content_page';

    AdminContentPageView.prototype.render = function() {
      var fv, hv, rModel,
        _this = this;
      AdminContentPageView.__super__.render.apply(this, arguments);
      hv = new HeaderView();
      fv = new FooterView();
      rModel = new RowQueueModel();
      return rModel.load(function() {
        var rView;
        console.log(rModel);
        rView = new RowQueueView({
          model: rModel
        });
        return rView.setRegion('queue').render();
      });
    };

    return AdminContentPageView;

  })(PageView);
});