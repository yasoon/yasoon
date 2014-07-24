(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['text!templates/speakerPostTpl.htm', 'backbone'], function(speakerPostTpl) {
    var SpeakerPostView;
    return SpeakerPostView = (function(_super) {
      __extends(SpeakerPostView, _super);

      function SpeakerPostView() {
        return SpeakerPostView.__super__.constructor.apply(this, arguments);
      }

      SpeakerPostView.prototype.tagName = 'article';

      SpeakerPostView.prototype.className = 'lim';

      SpeakerPostView.prototype.template = _.template(speakerPostTpl);

      SpeakerPostView.prototype.events = function() {
        return {
          'click .like-this': 'addLike'
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

      SpeakerPostView.prototype.likesCount = function(data) {
        if (!data.error && data.count) {
          return this.$el.find('.like-this .counter').text(data.count);
        }
      };

      SpeakerPostView.prototype.render = function() {
        this.$el.html(this.template(this.model.toJSON()));
        return this;
      };

      return SpeakerPostView;

    })(Backbone.View);
  });

}).call(this);
