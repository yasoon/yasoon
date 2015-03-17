(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['text!templates/speakerPostTpl.htm', 'text!templates/oneReviewPreviewTpl.htm', 'backbone'], function(speakerPostTpl, oneReviewPreviewTpl) {
    var SpeakerPostView;
    return SpeakerPostView = (function(_super) {
      __extends(SpeakerPostView, _super);

      function SpeakerPostView() {
        return SpeakerPostView.__super__.constructor.apply(this, arguments);
      }

      SpeakerPostView.prototype.tagName = 'article';

      SpeakerPostView.prototype.className = 'lim';

      SpeakerPostView.prototype.template = _.template(speakerPostTpl);

      SpeakerPostView.prototype.reviewTemplate = _.template(oneReviewPreviewTpl);

      SpeakerPostView.prototype.events = function() {
        return {
          'click .like-this': 'addLike',
          'click .like-this-review': 'addLikeReview'
        };
      };

      SpeakerPostView.prototype.addLike = function(event) {
        event.preventDefault();
        return $.post('/api/post/add_likes', {
          'postlike': {
            'postId': this.model.id,
            'type': 'add'
          }
        }, (function(_this) {
          return function(data) {
            return _this.likesCount(data);
          };
        })(this));
      };

      SpeakerPostView.prototype.addLikeReview = function(event) {
        event.preventDefault();
        return $.post('/api/post/add_likes_review', {
          'reviewlike': {
            'reviewId': this.model.id,
            'type': 'add'
          }
        }, (function(_this) {
          return function(data) {
            return _this.likesCountReview(data);
          };
        })(this));
      };

      SpeakerPostView.prototype.likesCount = function(data) {
        if (!data.error && data.count) {
          return this.$el.find('.like-this .counter').text(data.count);
        }
      };

      SpeakerPostView.prototype.likesCountReview = function(data) {
        if (!data.error && data.count) {
          return this.$el.find('.like-this-review .counter').text(data.count);
        }
      };

      SpeakerPostView.prototype.render = function() {
        if (this.model.get('type') === 'post') {
          this.$el.html(this.template(this.model.toJSON()));
        } else if (this.model.get('type') === 'review') {
          this.$el.html(this.reviewTemplate(this.model.toJSON()));
        }
        return this;
      };

      return SpeakerPostView;

    })(Backbone.View);
  });

}).call(this);
