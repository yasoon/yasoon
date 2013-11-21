// Generated by CoffeeScript 1.6.3
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['views/base/page', 'JST', 'views/common/footer', 'views/admin/header', 'views/admin/blank/questionTemplate', 'models/admin/blank/questionTemplate', 'views/admin/blank/questionTemplateQueue', 'models/admin/blank/questionTemplateQueue'], function(PageView, JST, FooterView, HeaderView, QuestionTemplateView, QuestionTemplateModel, QuestionTemplateQueueView, QuestionTemplateQueueModel) {
  'use strict';
  var AdminBlankPageView, _ref;
  return AdminBlankPageView = (function(_super) {
    __extends(AdminBlankPageView, _super);

    function AdminBlankPageView() {
      _ref = AdminBlankPageView.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    AdminBlankPageView.prototype.className = 'postPage';

    AdminBlankPageView.prototype.regions = {
      'queue': '#queue',
      'new': '#new',
      'footer': 'footer',
      'header': 'header'
    };

    AdminBlankPageView.prototype.templateName = 'admin_blank_page';

    AdminBlankPageView.prototype.render = function() {
      var fv, hv, qtqModel, qtv,
        _this = this;
      AdminBlankPageView.__super__.render.apply(this, arguments);
      hv = new HeaderView();
      fv = new FooterView();
      qtv = new QuestionTemplateView({
        model: new QuestionTemplateModel()
      });
      qtv.setRegion('new').setMode('button');
      return qtqModel = (new QuestionTemplateQueueModel()).load(function() {
        var qtqView;
        qtqView = new QuestionTemplateQueueView({
          model: qtqModel
        });
        return qtqView.setRegion('queue').render();
      });
    };

    return AdminBlankPageView;

  })(PageView);
});
