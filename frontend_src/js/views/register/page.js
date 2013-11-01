// Generated by CoffeeScript 1.6.3
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['views/base/page', 'JST', 'views/common/footer', 'views/author/posts/header', 'models/register/register', 'views/register/register'], function(PageView, JST, FooterView, HeaderView, RegisterModel, RegisterView) {
  'use strict';
  var RegisterPageView, _ref;
  return RegisterPageView = (function(_super) {
    __extends(RegisterPageView, _super);

    function RegisterPageView() {
      _ref = RegisterPageView.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    RegisterPageView.prototype.className = 'registerPage';

    RegisterPageView.prototype.regions = {
      'footer': 'footer',
      'header': 'header',
      'page-layout': '#page-layout'
    };

    RegisterPageView.prototype.templateName = 'register_page';

    RegisterPageView.prototype.render = function() {
      var registerModel, registerView;
      RegisterPageView.__super__.render.apply(this, arguments);
      new HeaderView();
      new FooterView();
      registerModel = new RegisterModel();
      registerView = new RegisterView({
        model: registerModel
      });
      return registerView.setRegion('page-layout').setMode('active');
    };

    return RegisterPageView;

  })(PageView);
});
