(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['text!templates/headerLoginTpl.htm', 'views/LoginPopUpView', 'models/UserLoginModel', 'backbone'], function(headerLoginTpl, LoginPopUpView, UserLoginModel) {
    var HeaderLoginView;
    return HeaderLoginView = (function(_super) {
      __extends(HeaderLoginView, _super);

      function HeaderLoginView() {
        return HeaderLoginView.__super__.constructor.apply(this, arguments);
      }

      HeaderLoginView.prototype.template = _.template(headerLoginTpl);

      HeaderLoginView.prototype.render = function() {
        this.$el.append(this.template());
        return this;
      };

      HeaderLoginView.prototype.events = function() {
        return {
          'click #js-login': 'loginPopUp'
        };
      };

      HeaderLoginView.prototype.loginPopUp = function(event) {
        event.preventDefault();
        if (this.loginpopUpView == null) {
          this.loginpopUpView = new LoginPopUpView({
            model: new UserLoginModel()
          });
        } else {
          this.loginpopUpView.delegateEvents();
        }
        return $('body').append(this.loginpopUpView.render().$el);
      };

      return HeaderLoginView;

    })(Backbone.View);
  });

}).call(this);
