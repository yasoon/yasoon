// Generated by CoffeeScript 1.6.1
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['chaplin', 'handlebars'], function(Chaplin, Handlebars) {
  'use strict';
  var View;
  return View = (function(_super) {

    __extends(View, _super);

    function View() {
      return View.__super__.constructor.apply(this, arguments);
    }

    View.prototype.autoRender = false;

    View.prototype.events = {
      'click': function(e) {
        var $target;
        $target = $(e.target);
        if ($target.attr('data-link') != null) {
          return this.publishEvent('redirect', $target.attr('data-link'));
        }
      }
    };

    View.prototype.initialize = function() {
      this.initHandlebarsHelpers();
      this.checkTemplate();
      if (!this.autoRender) {
        return this.rendered = false;
      }
    };

    View.prototype.initHandlebarsHelpers = function() {
      return Handlebars.registerHelper('ifEquals', function(a, b, block) {
        console.log(a === b);
        if (parseInt(a) === parseInt(b)) {
          return block.fn(this);
        }
      });
    };

    View.prototype.checkTemplate = function() {
      if (JST[this.templateName] == null) {
        throw "no template with name " + this.templateName + " found";
      }
    };

    View.prototype.getTemplateFunction = function() {
      var templateFunc;
      return templateFunc = JST[this.templateName];
    };

    View.prototype.softRender = function() {
      if (this.rendered) {
        this.$el.html(JST[this.templateName](this.getTemplateData()));
      } else {
        this.render();
        this.rendered = true;
      }
      return this.manageAuthAreas();
    };

    View.prototype.setRegion = function(region) {
      this.region = region;
      return this;
    };

    View.prototype.manageAuthAreas = function() {
      var el, _i, _j, _k, _l, _len, _len1, _len2, _len3, _ref, _ref1, _ref2, _ref3, _results;
      _ref = this.$el.find("[data-permission='authorized']");
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        el = _ref[_i];
        if (this.authorized) {
          $(el).show();
        } else {
          $(el).hide();
        }
      }
      _ref1 = this.$el.find("[data-permission='not-authorized']");
      for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
        el = _ref1[_j];
        if (this.authorized) {
          $(el).hide();
        } else {
          $(el).show();
        }
      }
      _ref2 = this.$el.find("[data-permission='author']");
      for (_k = 0, _len2 = _ref2.length; _k < _len2; _k++) {
        el = _ref2[_k];
        if (this.authorized) {
          $(el).show();
        } else {
          $(el).hide();
        }
      }
      _ref3 = this.$el.find("[data-permission='not-author']");
      _results = [];
      for (_l = 0, _len3 = _ref3.length; _l < _len3; _l++) {
        el = _ref3[_l];
        if (this.authorized) {
          _results.push($(el).hide());
        } else {
          _results.push($(el).show());
        }
      }
      return _results;
    };

    View.prototype.getTemplateData = function() {
      if (this.model != null) {
        return {
          model: this.model.data
        };
      }
    };

    return View;

  })(Chaplin.View);
});
