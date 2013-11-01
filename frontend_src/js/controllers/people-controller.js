// Generated by CoffeeScript 1.6.3
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['controllers/base/controller', 'views/people/page', 'views/people/explore/page'], function(Controller, PeoplePageView, PeopleExplorePageView) {
  'use strict';
  var PeopleController, _ref;
  return PeopleController = (function(_super) {
    __extends(PeopleController, _super);

    function PeopleController() {
      _ref = PeopleController.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    PeopleController.prototype.peopleAction = function(params) {
      var catId;
      if (params.catId != null) {
        catId = params.catId;
      } else {
        catId = 0;
      }
      return this.view = new PeoplePageView({
        catId: catId
      });
    };

    PeopleController.prototype.exploreAction = function(params) {
      if (params.catId == null) {
        params.catId = 0;
      }
      return this.view = new PeopleExplorePageView({
        mode: params.mode,
        catId: params.catId
      });
    };

    PeopleController.prototype.searchAction = function(params) {
      if (params.text == null) {
        params.text = false;
      }
      if (params.mode === 'author') {
        return this.view = this.view = new PeoplePageView({
          catId: 0,
          text: params.text
        });
      } else {
        return this.view = new PeopleExplorePageView({
          mode: params.mode,
          catId: 0,
          text: params.text
        });
      }
    };

    return PeopleController;

  })(Controller);
});
