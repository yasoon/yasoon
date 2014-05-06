(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['backbone'], function() {
    var PaginationView;
    return PaginationView = (function(_super) {
      __extends(PaginationView, _super);

      function PaginationView() {
        return PaginationView.__super__.constructor.apply(this, arguments);
      }

      PaginationView.prototype.events = function() {
        return {
          'click .downloadMore': 'updateCounter'
        };
      };

      PaginationView.prototype.initialize = function(options) {
        this.options = options || {};
        this.counter = 1;
        return this.listenTo(this.collection, 'add', this.addOne);
      };

      PaginationView.prototype.updateCounter = function(event) {
        event.preventDefault();
        ++this.counter;
        if (this.collection.length % this.counter + 1 > 0) {
          this.removeButton($(event.currentTarget));
        }
        return this.onRender();
      };

      PaginationView.prototype.removeButton = function(elem) {
        return elem.parent().remove();
      };

      PaginationView.prototype.render = function() {
        var data;
        data = this.data || {};
        this.$el.empty().append(this.template(data));
        this.itemsList = this.$('.items-list');
        this.onRender();
        return this;
      };

      PaginationView.prototype.onRender = function() {
        return _.each(this.collection.pagination(10, this.counter), (function(_this) {
          return function(item) {
            return _this.addOne(item);
          };
        })(this));
      };

      return PaginationView;

    })(Backbone.View);
  });

}).call(this);
