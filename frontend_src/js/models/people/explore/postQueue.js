// Generated by CoffeeScript 1.6.1
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['models/base/queue', 'models/people/explore/post'], function(Queue, PostModel) {
  'use strict';
  var PeopleExplorePostQueueModel;
  return PeopleExplorePostQueueModel = (function(_super) {

    __extends(PeopleExplorePostQueueModel, _super);

    function PeopleExplorePostQueueModel() {
      return PeopleExplorePostQueueModel.__super__.constructor.apply(this, arguments);
    }

    PeopleExplorePostQueueModel.prototype.name = 'PeopleExplorePostQueue';

    PeopleExplorePostQueueModel.prototype.elementName = 'PeopleExplorePost';

    PeopleExplorePostQueueModel.prototype.initialize = function(params) {
      PeopleExplorePostQueueModel.__super__.initialize.call(this, params);
      this.categoryId = params.categoryId;
      return this.mode = params.mode;
    };

    PeopleExplorePostQueueModel.prototype.load = function(callback) {
      if (this.mode === 'date') {
        this.url = function() {
          return 'api/people/get_posts_date/' + this.categoryId;
        };
      } else {
        this.url = function() {
          return 'api/people/get_posts_rating/' + this.categoryId;
        };
      }
      this.method = 'GET';
      return PeopleExplorePostQueueModel.__super__.load.call(this, callback);
    };

    PeopleExplorePostQueueModel.prototype.createElementModel = function(elData) {
      var model;
      model = new PostModel();
      model.data = elData;
      return model;
    };

    return PeopleExplorePostQueueModel;

  })(Queue);
});
