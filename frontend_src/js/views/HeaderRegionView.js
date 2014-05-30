(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['text!templates/headerTpl.htm', 'views/HeaderLoginView', 'views/HeaderLoggedView', 'models/userModel', 'backbone'], function(headerTpl, HeaderLoginView, HeaderLoggedView, userModel) {
    var HeaderRegionView;
    return HeaderRegionView = (function(_super) {
      __extends(HeaderRegionView, _super);

      function HeaderRegionView() {
        return HeaderRegionView.__super__.constructor.apply(this, arguments);
      }

      HeaderRegionView.prototype.template = _.template(headerTpl);

      HeaderRegionView.prototype.className = 'inside';

      HeaderRegionView.prototype.render = function() {
        this.$el.html(this.template());
        this.userNav = this.$('.my-nav');
        userModel.deferred.done((function(_this) {
          return function() {
            if (typeof (userModel != null ? userModel.get('id') : void 0) === 'number') {
              if (_this.headerLogedView == null) {
                _this.headerLogedView = new HeaderLoggedView({
                  model: userModel,
                  el: _this.userNav
                });
              } else {
                _this.headerLogedView.delegateEvents();
              }
              return _this.userNav.addClass('log').empty().append(_this.headerLogedView.render().$el);
            } else {
              if (_this.headerLoginView == null) {
                _this.headerLoginView = new HeaderLoginView();
              } else {
                _this.headerLoginView.delegateEvents();
              }
              return _this.userNav.removeClass().empty().append(_this.headerLoginView.render().$el);
            }
          };
        })(this));
        return this;
      };

      return HeaderRegionView;

    })(Backbone.View);
  });

}).call(this);
