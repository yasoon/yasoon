(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['text!templates/headerLogedTpl.htm', 'backbone'], function(headerLogedTpl) {
    var HeaderLogedView;
    return HeaderLogedView = (function(_super) {
      __extends(HeaderLogedView, _super);

      function HeaderLogedView() {
        return HeaderLogedView.__super__.constructor.apply(this, arguments);
      }

      HeaderLogedView.prototype.template = _.template(headerLogedTpl);

      HeaderLogedView.prototype.render = function() {
        this.$el.append(this.template(this.model.toJSON()));
        return this;
      };

      HeaderLogedView.prototype.events = function() {
        return {
          'click #js-logout': 'logout'
        };
      };

      HeaderLogedView.prototype.logout = function(event) {
        event.preventDefault();
        event.stopPropagation();
        return $.post('/logout', {}, function(data) {
          Window.config.userId = false;
          return window.location.reload(true);
        });
      };

      return HeaderLogedView;

    })(Backbone.View);
  });

}).call(this);
