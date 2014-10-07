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

      PostsPreviewsCollection.prototype.template = _.template(postPreviewsTpl);

      PostsPreviewsCollection.prototype.initialize = function(options) {
        this.sort = options.sort;
        this.category = options.category;
        return PostsPreviewsCollection.__super__.initialize.apply(this, arguments);
      };

      PostsPreviewsCollection.prototype.updateCounter = function(event) {
        event.preventDefault();
        this.updateCollection();
        ++this.counter;
        return this.onRender();
      };

      PostsPreviewsCollection.prototype.updateCollection = function() {
        var counter;
        counter = this.counter + 1;
        return $.get("/api/post/get_categoryPosts/" + this.category + "/" + counter + "/10", (function(_this) {
          return function(data) {
            var max;
            max = data['postsCount'];
            data = data[_this.sort];
            _this.collection.add(data);
            if (_this.collection.length === max) {
              return _this.removeButton(_this.$('.downloadMore'));
            }
          };
        })(this), 'json');
      };

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
