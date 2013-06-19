// Generated by CoffeeScript 1.6.1
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['chaplin'], function(Chaplin) {
  'use strict';
  var View;
  return View = (function(_super) {

    __extends(View, _super);

    function View() {
      return View.__super__.constructor.apply(this, arguments);
    }

    View.prototype.getTemplateFunction = function() {
      var templateFunc;
      return templateFunc = JST[this.templateName];
    };

    View.prototype.softRender = function() {
      return this.$el.html(JST[this.templateName](this.getTemplateData()));
    };

    View.prototype.manageAuthAreas = function() {
      var el, _i, _len, _ref, _results;
      _ref = this.$el.find('.auth-area');
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        el = _ref[_i];
        if (this.authorized) {
          _results.push($(el).show());
        } else {
          _results.push($(el).hide());
        }
      }
      return _results;
    };

    View.prototype.initialize = function() {
      this.authorized = true;
      this.subscribeEvent('logout', function() {
        this.authorized = false;
        return this.softRender();
      });
      return this.subscribeEvent('login', function() {
        this.authorized = true;
        return this.softRender();
      });
    };

    return View;

  })(Chaplin.View);
});
