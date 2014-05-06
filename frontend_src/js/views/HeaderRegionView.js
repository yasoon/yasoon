(function() {
  define(['text!templates/headerTpl.htm', 'views/LoginPopUpView', 'views/HeaderLoginView', 'views/HeaderLogedView', 'models/UserLoginModel', 'models/userModel', 'backbone'], function(headerTpl, LoginPopUpView, HeaderLoginView, HeaderLogedView, UserLoginModel, userModel) {
    var HeaderRegionView;
    return HeaderRegionView = Backbone.View.extend({
      template: _.template(headerTpl),
      className: 'inside',
      events: function() {
        return {
          'click #login-trigger': 'loginPopUp'
        };
      },
      loginPopUp: function(event) {
        event.preventDefault();
        if (this.loginpopUpView == null) {
          this.loginpopUpView = new LoginPopUpView({
            model: new UserLoginModel()
          });
        } else {
          this.loginpopUpView.delegateEvents();
        }
        return $('body').append(this.loginpopUpView.render().$el);
      },
      render: function() {
        this.$el.html(this.template());
        this.userNav = this.$('.my-nav');
        userModel.deferred.done((function(_this) {
          return function() {
            if (typeof (userModel != null ? userModel.get('id') : void 0) === 'number') {
              if (_this.headerLogedView == null) {
                _this.headerLogedView = new HeaderLogedView({
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
      }
    });
  });

}).call(this);
