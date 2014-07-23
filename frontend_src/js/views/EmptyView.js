(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['text!templates/emptyPageTpl.htm', 'backbone'], function(emptyPageTpl) {
    var EmptyView;
    return EmptyView = (function(_super) {
      __extends(EmptyView, _super);

      function EmptyView() {
        return EmptyView.__super__.constructor.apply(this, arguments);
      }

      EmptyView.prototype.template = _.template(emptyPageTpl);

      EmptyView.prototype.initialize = function(options) {
        return this.options = options || {};
      };

      EmptyView.prototype.render = function() {
        this.$el.html(this.template(this.options));
        return this;
      };

      return EmptyView;

    })(Backbone.View);
  });

}).call(this);
