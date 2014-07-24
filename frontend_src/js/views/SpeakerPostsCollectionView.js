(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['views/SpeakerPostView', 'backbone'], function(SpeakerPostView) {
    var SpeakerPostsCollectionView;
    return SpeakerPostsCollectionView = (function(_super) {
      __extends(SpeakerPostsCollectionView, _super);

      function SpeakerPostsCollectionView() {
        return SpeakerPostsCollectionView.__super__.constructor.apply(this, arguments);
      }

      SpeakerPostsCollectionView.prototype.tagName = 'section';

      SpeakerPostsCollectionView.prototype.render = function() {
        this.collection.each((function(_this) {
          return function(post) {
            return _this.addOne(post);
          };
        })(this));
        return this;
      };

      SpeakerPostsCollectionView.prototype.addOne = function(post) {
        var speakerPostView;
        speakerPostView = new SpeakerPostView({
          model: post
        });
        return this.$el.prepend(speakerPostView.render().$el);
      };

      return SpeakerPostsCollectionView;

    })(Backbone.View);
  });

}).call(this);
