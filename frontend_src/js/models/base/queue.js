// Generated by CoffeeScript 1.6.1
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['models/base/model'], function(Model) {
  var Queue;
  return Queue = (function(_super) {

    __extends(Queue, _super);

    function Queue() {
      return Queue.__super__.constructor.apply(this, arguments);
    }

    Queue.prototype.data = [];

    Queue.prototype.elements = [];

    Queue.prototype.initialize = function() {
      Queue.__super__.initialize.apply(this, arguments);
      if (this.elementName == null) {
        throw 'ElementName must be defined';
      }
      if (this.paging) {
        this.offset = 0;
        return this.loadNext = function(offsetStep) {
          if (offsetStep == null) {
            offsetStep = 10;
          }
          this.offset += offsetStep;
          return this.load;
        };
      }
    };

    Queue.prototype.pushElement = function(model) {
      this.elements.push(model);
      return this.elements.sort(this.compare);
    };

    Queue.prototype.load = function(callback) {
      var loadCallback,
        _this = this;
      this.elements = [];
      loadCallback = function() {
        var elData, _i, _len, _ref;
        _ref = _this.data;
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          elData = _ref[_i];
          _this.elements.push(_this.createElementModel(elData));
        }
        return typeof callback === "function" ? callback() : void 0;
      };
      this.request(loadCallback);
      return this;
    };

    Queue.prototype.compare = function(a, b) {
      if (a.data.place < b.data.place) {
        return -1;
      } else {
        return 1;
      }
    };

    Queue.prototype.updatePlaces = function(callback) {
      var updateCallback,
        _this = this;
      this.requestData = {
        'map': this.buildPlacesMap()
      };
      updateCallback = function() {
        _this.elements.sort(_this.compare);
        return typeof callback === "function" ? callback() : void 0;
      };
      return this.request(updateCallback);
    };

    Queue.prototype.getElementById = function(id) {
      var element, _i, _len, _ref;
      _ref = this.elements;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        element = _ref[_i];
        if (parseInt(element.data.id) === parseInt(id)) {
          return element;
        }
      }
      throw "no element with id " + id + " found";
    };

    Queue.prototype.createElementModel = function(elData) {
      throw 'abstract method createElemenModel must be redefined';
    };

    Queue.prototype.removeDeleted = function(id) {
      var element, key, _i, _len, _ref, _results;
      _ref = this.elements;
      _results = [];
      for (key = _i = 0, _len = _ref.length; _i < _len; key = ++_i) {
        element = _ref[key];
        console.log(element, key);
        if (element.data.id == null) {
          this.elements.splice(key, 1);
          _results.push(console.log('spliced'));
        } else {
          _results.push(void 0);
        }
      }
      return _results;
    };

    Queue.prototype.buildPlacesMap = function() {
      var element, placesMap, _i, _len, _ref;
      placesMap = {};
      _ref = this.elements;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        element = _ref[_i];
        placesMap[element.data.place] = element.data.id;
      }
      return placesMap;
    };

    return Queue;

  })(Model);
});
