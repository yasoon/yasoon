// Generated by CoffeeScript 1.6.3
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['chaplin', 'models/base/model'], function(Chaplin, Model) {
  'use strict';
  var TimelinePostModel, _ref;
  return TimelinePostModel = (function(_super) {
    __extends(TimelinePostModel, _super);

    function TimelinePostModel() {
      _ref = TimelinePostModel.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    TimelinePostModel.prototype.name = 'TimelinePost';

    return TimelinePostModel;

  })(Model);
});
