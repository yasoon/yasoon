// Generated by CoffeeScript 1.6.3
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['views/base/pagingQueue', 'JST', 'views/admin/timeline/post', 'views/admin/timeline/question', 'views/admin/timeline/blank'], function(PagingQueueView, JST, PostView, QuestionView, BlankView) {
  'use strict';
  var AdminTimelinePostQueueView, _ref;
  return AdminTimelinePostQueueView = (function(_super) {
    __extends(AdminTimelinePostQueueView, _super);

    function AdminTimelinePostQueueView() {
      _ref = AdminTimelinePostQueueView.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    AdminTimelinePostQueueView.prototype.className = 'AdminTimelinePostQueue';

    AdminTimelinePostQueueView.prototype.templateName = 'admin_timeline_post_queue';

    AdminTimelinePostQueueView.prototype.sortable = false;

    AdminTimelinePostQueueView.prototype.createElementView = function(model) {
      if (model.data.type === 'p') {
        return new PostView({
          model: model
        });
      } else if (model.data.type === 'q') {
        return new QuestionView({
          model: model
        });
      } else if (model.data.type === 'b') {
        return new BlankView({
          model: model
        });
      }
    };

    return AdminTimelinePostQueueView;

  })(PagingQueueView);
});