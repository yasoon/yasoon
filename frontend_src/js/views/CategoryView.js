(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['text!templates/categoryTpl.htm', 'backbone'], function(categoryTpl) {
    var CategoryView;
    return CategoryView = (function(_super) {
      __extends(CategoryView, _super);

      function CategoryView() {
        return CategoryView.__super__.constructor.apply(this, arguments);
      }

      CategoryView.prototype.tagName = 'li';

      CategoryView.prototype.template = _.template(categoryTpl);

      CategoryView.prototype.render = function() {
        this.$el.html(this.template(this.model.toJSON()));
        return this;
      };

      return CategoryView;

    })(Backbone.View);
  });

}).call(this);
