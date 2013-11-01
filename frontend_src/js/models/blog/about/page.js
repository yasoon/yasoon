// Generated by CoffeeScript 1.6.3
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['chaplin', 'models/base/model'], function(Chaplin, Model) {
  'use strict';
  var BlogAboutPageModel, _ref;
  return BlogAboutPageModel = (function(_super) {
    __extends(BlogAboutPageModel, _super);

    function BlogAboutPageModel() {
      _ref = BlogAboutPageModel.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    BlogAboutPageModel.prototype.name = 'BlogAboutPageModel';

    BlogAboutPageModel.prototype.load = function(callback) {
      this.url = function() {
        return 'api/people/get_about_info';
      };
      this.method = 'GET';
      this.requestData = {};
      return this.request(callback);
    };

    return BlogAboutPageModel;

  })(Model);
});
