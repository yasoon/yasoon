(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['text!templates/postPreviewTpl.htm', 'text!templates/reviewPreviewTpl.htm', 'backbone'], function(postPreviewTpl, reviewPreviewTpl) {
    var PostPreview;
    return PostPreview = (function(_super) {
      __extends(PostPreview, _super);

      function PostPreview() {
        return PostPreview.__super__.constructor.apply(this, arguments);
      }

      PostPreview.prototype.tagName = 'article';

      PostPreview.prototype.template = _.template(postPreviewTpl);

      PostPreview.prototype.reviewTemplate = _.template(reviewPreviewTpl);

      PostPreview.prototype.render = function() {
        if (this.model.get('type') === 'post') {
          this.$el.html(this.template(this.model.toJSON()));
        } else {
          this.$el.html(this.reviewTemplate(this.model.toJSON()));
        }
        return this;
      };

      return PostPreview;

    })(Backbone.View);
  });

}).call(this);
