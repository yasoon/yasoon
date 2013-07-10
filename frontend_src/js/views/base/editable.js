// Generated by CoffeeScript 1.6.1
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['views/base/view', 'JST'], function(View, JST) {
  'use strict';
  var EditableView;
  return EditableView = (function(_super) {

    __extends(EditableView, _super);

    function EditableView() {
      return EditableView.__super__.constructor.apply(this, arguments);
    }

    EditableView.prototype.autoRender = false;

    EditableView.prototype.events = {
      'click': function(e) {
        var target;
        target = $(e.target);
        if (target.attr('data-to-mode') != null) {
          this.setMode(target.attr('data-to-mode'));
        }
        if (target.attr('data-send-button') != null) {
          this.send();
        }
        if (target.attr('data-delete-button') != null) {
          return this.del();
        }
      }
    };

    EditableView.prototype.send = function() {
      if (this.model.id != null) {
        return this.update();
      } else {
        return this.add();
      }
    };

    EditableView.prototype.add = function() {
      return this.setMode('button');
    };

    EditableView.prototype.update = function() {
      this.model.update();
      return this.setMode('passive');
    };

    EditableView.prototype.del = function() {
      return console.log('delete');
    };

    EditableView.prototype.checkTemplate = function() {
      var mode, tempName, _i, _len, _ref, _results;
      _ref = this.modes;
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        mode = _ref[_i];
        tempName = this.formatTemplateName(mode);
        if (JST[tempName] == null) {
          throw "no template with name " + tempName + " found";
        } else {
          _results.push(void 0);
        }
      }
      return _results;
    };

    EditableView.prototype.initialize = function() {
      EditableView.__super__.initialize.apply(this, arguments);
      this.regionSet = false;
      this.rendered = false;
      return this.modesHistory = [];
    };

    EditableView.prototype.getTemplateFunction = function() {
      var templateFunc;
      return templateFunc = JST[this.currentTemplateName];
    };

    EditableView.prototype.setRegion = function(region) {
      this.region = region;
      this.regionSet = true;
      return this;
    };

    EditableView.prototype.render = function() {
      var tnBuffer;
      if (this.rendered) {
        return this.$el.html(JST[this.currentTemplateName](this.getTemplateData()));
      } else {
        tnBuffer = this.templateName;
        this.templateName = this.currentTemplateName;
        EditableView.__super__.render.apply(this, arguments);
        this.templateName = tnBuffer;
        return this.rendered = true;
      }
    };

    EditableView.prototype.setMode = function(mode, callback) {
      var _ref;
      this.currentTemplateName = this.formatTemplateName(mode);
      this.render();
      if ((_ref = this.mode) != null ? _ref : this.mode = mode) {
        this.modesHistory.push(this.mode);
      }
      if (typeof callback === "function") {
        callback();
      }
      return this;
    };

    EditableView.prototype.formatTemplateName = function(mode) {
      return "" + (this.templateName + '_' + mode);
    };

    EditableView.prototype.setPreviousMode = function() {
      return this.setMode(this.modesHistory[this.modesHistory.length - 1]);
    };

    return EditableView;

  })(View);
});
