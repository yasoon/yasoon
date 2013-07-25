// Generated by CoffeeScript 1.6.1
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['views/base/queue', 'JST', 'views/timeline/post'], function(QueueView, JST, PostView) {
  'use strict';
  var TimelinePostQueueView;
  return TimelinePostQueueView = (function(_super) {

    __extends(TimelinePostQueueView, _super);

    function TimelinePostQueueView() {
      return TimelinePostQueueView.__super__.constructor.apply(this, arguments);
    }

    TimelinePostQueueView.prototype.className = 'TimelinePostQueue';

    TimelinePostQueueView.prototype.templateName = 'timeline_post_queue';

    TimelinePostQueueView.prototype.placeholder = 'timeline_queue_post_placeholder';

    TimelinePostQueueView.prototype.sortable = true;

    TimelinePostQueueView.prototype.createElementView = function(model) {
      return new PostView({
        model: model
      });
    };

    return TimelinePostQueueView;

  })(QueueView);
});
