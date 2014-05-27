(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['views/SpeakerPageView', 'views/AuthorNavigationView', 'backbone'], function(SpeakerPageView, AuthorNavigationView) {
    var AuthorPage;
    return AuthorPage = (function(_super) {
      __extends(AuthorPage, _super);

      function AuthorPage() {
        return AuthorPage.__super__.constructor.apply(this, arguments);
      }

      AuthorPage.prototype.initialize = function(options) {
        return this.model.deferred.done((function(_this) {
          return function() {
            _this.options = {
              id: _this.model.get('id'),
              page: options.page
            };
            return _this.createSpeakerInfo();
          };
        })(this));
      };

      AuthorPage.prototype.createNavigation = function() {
        if (this.authorNavigationView == null) {
          this.authorNavigationView = new AuthorNavigationView({
            page: this.options.page
          });
        } else {
          this.authorNavigationView.delegateEvents();
        }
        return this.$el.append(this.authorNavigationView.render().$el);
      };

      return AuthorPage;

    })(SpeakerPageView);
  });

}).call(this);
