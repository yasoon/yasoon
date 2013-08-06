// Generated by CoffeeScript 1.6.3
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['models/base/queue', 'models/index/stories/post'], function(Queue, PostModel) {
  'use strict';
  var IndexStoriesPostQueueModel, _ref;
  return IndexStoriesPostQueueModel = (function(_super) {
    __extends(IndexStoriesPostQueueModel, _super);

    function IndexStoriesPostQueueModel() {
      _ref = IndexStoriesPostQueueModel.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    IndexStoriesPostQueueModel.prototype.name = 'IndexStoriesPostQueue';

    IndexStoriesPostQueueModel.prototype.elementName = 'IndexStoriesPost';

    IndexStoriesPostQueueModel.prototype.load = function(callback) {
      this.method = 'GET';
      this.url = function() {
        return 'api/post/get_best_posts';
      };
      this.requestData = {};
      return IndexStoriesPostQueueModel.__super__.load.call(this, callback);
    };

    IndexStoriesPostQueueModel.prototype.createElementModel = function(data) {
      var model;
      model = new PostModel();
      model.data = data;
      return model;
    };

    return IndexStoriesPostQueueModel;

  })(Queue);
});
