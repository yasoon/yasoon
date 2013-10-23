// Generated by CoffeeScript 1.6.3
var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['views/base/view', 'JST'], function(View, JST) {
  'use strict';
  var EditableView, _ref;
  return EditableView = (function(_super) {
    __extends(EditableView, _super);

    function EditableView() {
      this.callBackFn = __bind(this.callBackFn, this);
      _ref = EditableView.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    EditableView.prototype.autoRender = false;

    EditableView.prototype.events = {
      'click': function(e) {
        var $target;
        $target = $(e.target);
        if ($target.attr('data-to-mode') != null) {
          this.setMode($target.attr('data-to-mode'));
        }
        if ($target.attr('data-send-button') != null) {
          if ($target.attr('disable') == null) {
            this.send();
          }
        }
        if ($target.attr('data-delete-button') != null) {
          return this.del();
        }
      },
      'keyup': function(e) {
        var $target;
        $target = $(e.target);
        if ($target.attr('data-field')) {
          if ($(e.target).is('input')) {
            return this.model.data[$target.attr('data-field')] = $target.val();
          } else {
            return this.model.data[$target.attr('data-field')] = $target.html();
          }
        }
      },
      'change': function(e) {
        var $target;
        $target = $(e.target);
        if ($target.is("select") && ($target.attr('data-field') != null)) {
          return this.model.data[$target.attr('data-field')] = $target.find('option:selected').attr('id');
        }
      }
    };

    EditableView.prototype.send = function() {
      var count, ell, self;
      ell = this.model;
      self = this;
      count = $(this.el).find('[data-get-pre-send]').length;
      if (count === 0) {
        this.callBackFn();
      }
      return $(this.el).find('[data-get-pre-send]').each(function() {
        if ($(this).is('input')) {
          ell.data[$(this).attr('data-field')] = $(this).val();
        } else {
          ell.data[$(this).attr('data-field')] = $(this).html();
        }
        if (!--count) {
          return self.callBackFn();
        }
      });
    };

    EditableView.prototype.callBackFn = function() {
      console.log(this.model, this.model.data.id);
      if (this.model.data.id != null) {
        return this.update();
      } else {
        return this.add();
      }
    };

    EditableView.prototype.add = function() {
      var _this = this;
      return this.model.add(function() {
        return _this.addCallback();
      });
    };

    EditableView.prototype.update = function() {
      var _this = this;
      return this.model.update(function() {
        return _this.updateCallback();
      });
    };

    EditableView.prototype.del = function() {
      this.model["delete"]();
      return this.dispose();
    };

    EditableView.prototype.checkTemplate = function() {
      var mode, tempName, _i, _len, _ref1, _results;
      _ref1 = this.modes;
      _results = [];
      for (_i = 0, _len = _ref1.length; _i < _len; _i++) {
        mode = _ref1[_i];
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
      return JST[this.currentTemplateName];
    };

    EditableView.prototype.softRender = function() {
      var tnBuffer;
      if (this.rendered) {
        this.$el.html(JST[this.currentTemplateName](this.getTemplateData()));
        return this.manageEditableContent();
      } else {
        tnBuffer = this.templateName;
        this.templateName = this.currentTemplateName;
        this.render();
        this.templateName = tnBuffer;
        return this.rendered = true;
      }
    };

    EditableView.prototype.setMode = function(mode, callback) {
      var _ref1;
      if (this.modes.indexOf(mode) === -1) {
        throw "no mode '" + mode + "' available";
      }
      this.currentTemplateName = this.formatTemplateName(mode);
      this.softRender();
      if ((_ref1 = this.mode) != null ? _ref1 : this.mode = mode) {
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
