(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['text!templates/postPreviewsTpl.htm', 'views/PaginationView', 'views/PostPreview', 'backbone'], function(postPreviewsTpl, PaginationView, PostPreview) {
    var PostsPreviewsCollection;
    return PostsPreviewsCollection = (function(_super) {
      __extends(PostsPreviewsCollection, _super);

      function PostsPreviewsCollection() {
        return PostsPreviewsCollection.__super__.constructor.apply(this, arguments);
      }

      PostsPreviewsCollection.prototype.tagName = 'section';

      PostsPreviewsCollection.prototype.className = 'main-layout m-page';

      PostsPreviewsCollection.prototype.template = _.template(postPreviewsTpl);

      PostsPreviewsCollection.prototype.addOne = function(item) {
        item = new PostPreview({
          model: item
        });
        return this.itemsList.append(item.render().$el);
      };

      return PostsPreviewsCollection;

    })(PaginationView);
  });

}).call(this);
