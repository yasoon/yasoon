(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['text!templates/mainPageHistoryTpl.htm', 'backbone'], function(MainPageHistoryTpl) {
    var MainPageHistoryView;
    return MainPageHistoryView = (function(_super) {
      __extends(MainPageHistoryView, _super);

      function MainPageHistoryView() {
        return MainPageHistoryView.__super__.constructor.apply(this, arguments);
      }

      MainPageHistoryView.prototype.events = function() {
        return {
          'click .like-this': 'addLike'
        };
      };

      MainPageHistoryView.prototype.tagName = 'section';

      MainPageHistoryView.prototype.className = 'main-layout';

      MainPageHistoryView.prototype.template = _.template(MainPageHistoryTpl);

      MainPageHistoryView.prototype.render = function() {
        this.$el.html(this.template(this.model.toJSON()));
        return this;
      };

      MainPageHistoryView.prototype.addLike = function(event) {
        event.preventDefault();
        return $.post('/api/post/add_likes', {
          'postlike': this.likeData()
        }, (function(_this) {
          return function(data) {
            return _this.changeLikeCount(data);
          };
        })(this));
      };

      MainPageHistoryView.prototype.changeLikeCount = function(data) {
        if (!data.error && data.count) {
          return this.$el.find('.like-this .counter').text(data.count);
        }
      };

      MainPageHistoryView.prototype.likeData = function() {
        return _.extend({}, {
          postId: this.model.get('id'),
          type: 'add'
        });
      };

      return MainPageHistoryView;

    })(Backbone.View);
  });

}).call(this);
