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
        this.$el.empty().append(this.template());
        this.userNav = this.$('.my-nav');
        userModel.deferred.done((function(_this) {
          return function() {
            if (typeof (userModel != null ? userModel.get('id') : void 0) === 'number') {
              return _this.createLoginHeader();
            } else {
              return _this.createLogedHeader();
            }
          };
        })(this));
        return this;
      };

      HeaderRegionView.prototype.createLoginHeader = function() {
        if (this.headerLogedView == null) {
          this.headerLogedView = new HeaderLoggedView({
            model: userModel,
            el: this.userNav
          });
        } else {
          this.headerLogedView.delegateEvents();
        }
        return this.userNav.addClass('log').empty().append(this.headerLogedView.render().$el);
      };

      HeaderRegionView.prototype.createLogedHeader = function() {
        if (this.headerLoginView == null) {
          this.headerLoginView = new HeaderLoginView();
        } else {
          this.headerLoginView.delegateEvents();
        }
        return this.userNav.removeClass().empty().append(this.headerLoginView.render().$el);
      };

      return HeaderRegionView;

    })(Backbone.View);
  });

}).call(this);
