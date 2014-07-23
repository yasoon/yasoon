(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['text!templates/errorPageTpl.htm', 'backbone'], function(errorPageTpl) {
    var ErrorPageView;
    return ErrorPageView = (function(_super) {
      __extends(ErrorPageView, _super);

      function ErrorPageView() {
        return ErrorPageView.__super__.constructor.apply(this, arguments);
      }

      ErrorPageView.prototype.tagName = 'section';

      ErrorPageView.prototype.template = _.template(errorPageTpl);

      ErrorPageView.prototype.render = function() {
        this.$el.append(this.template());
        return this;
      };

      return ErrorPageView;

    })(Backbone.View);
  });

}).call(this);
