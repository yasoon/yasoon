(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['text!templates/headerTpl.htm', 'views/HeaderLoginView', 'views/HeaderLoggedView', 'views/ReviewCategoriesView', 'views/SearchCategoriesView', 'models/userModel', 'backbone'], function(headerTpl, HeaderLoginView, HeaderLoggedView, ReviewCategoriesView, SearchCategoriesView, userModel) {
    var HeaderRegionView;
    return HeaderRegionView = (function(_super) {
      __extends(HeaderRegionView, _super);

      function HeaderRegionView() {
        return HeaderRegionView.__super__.constructor.apply(this, arguments);
      }

      HeaderRegionView.prototype.events = function() {
        return {
          'click nav a.categoriesBtn': 'showCategories',
          'click a.search-categories': 'showCategories'
        };
      };

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
              return _this.createLoggedHeader();
            }
          };
        })(this));
        return this;
      };

      HeaderRegionView.prototype.createLoginHeader = function() {
        var headerLogged;
        headerLogged = new HeaderLoggedView({
          model: userModel,
          el: this.userNav
        });
        if (this.headerLogedView == null) {
          this.headerLogedView = headerLogged;
        } else {
          this.headerLogedView.delegateEvents();
        }
        return this.userNav.addClass('log').empty().append(this.headerLogedView.render().$el);
      };

      HeaderRegionView.prototype.createLoggedHeader = function() {
        var headerLogin;
        headerLogin = new HeaderLoginView();
        if (this.headerLoginView == null) {
          this.headerLoginView = headerLogin;
        } else {
          this.headerLoginView.delegateEvents();
        }
        return this.userNav.removeClass().empty().append(this.headerLoginView.render().$el);
      };

      HeaderRegionView.prototype.showCategories = function(event) {
        var type;
        event.preventDefault();
        type = $(event.currentTarget).attr('data-type');
        this.reviewCategoriesView = new ReviewCategoriesView({
          type: type
        });
        return $('body').append(this.reviewCategoriesView.render().$el);
      };

      return HeaderRegionView;

    })(Backbone.View);
  });

}).call(this);
