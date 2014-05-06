(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['backbone'], function() {
    var Pagination;
    return Pagination = (function(_super) {
      __extends(Pagination, _super);

      function Pagination() {
        return Pagination.__super__.constructor.apply(this, arguments);
      }

      Pagination.prototype.initialize = function(options) {
        return this.options = options || {};
      };

      Pagination.prototype.pagination = function(perPage, page) {
        var collection;
        page = page - 1;
        collection = this;
        collection = _(collection.rest(perPage * page));
        collection = _(collection.first(perPage));
        return collection.map(function(model) {
          return model;
        });
      };

      return Pagination;

    })(Backbone.Collection);
  });

}).call(this);
