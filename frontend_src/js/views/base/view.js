// Generated by CoffeeScript 1.6.3
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['chaplin', 'handlebars', 'helper'], function(Chaplin, Handlebars, Helper) {
  'use strict';
  var View, _ref;
  return View = (function(_super) {
    __extends(View, _super);

    function View() {
      _ref = View.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    View.prototype.autoRender = false;

    View.prototype.events = {
      'click': function(e) {
        var $target;
        $target = $(e.target);
        if ($target.attr('data-link') != null) {
          this.publishEvent('redirect', $target.attr('data-link'));
        }
        if ($target.attr('data-to-login') != null) {
          return this.publishEvent('goLogin');
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
      return Handlebars.registerHelper('equals', function(a, b, block) {
        if (parseInt(a) === parseInt(b)) {
          return block.fn(this);
        } else {
          return block.inverse(this);
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

    View.prototype.render = function() {
      View.__super__.render.apply(this, arguments);
      this.manageAuthAreas();
      this.manageEditableContent();
      return pressFooter();
    };

    View.prototype.softRender = function() {
      if (this.rendered) {
        this.$el.html(JST[this.templateName](this.getTemplateData()));
      } else {
        this.render();
        this.rendered = true;
      }
      pressFooter();
      this.managerAuthAreas();
      return this.manageEditableContent();
    };

    View.prototype.setRegion = function(region) {
      this.region = region;
      return this;
    };

    View.prototype.manageEditableContent = function() {
      var el, id, _i, _len, _ref1, _results;
      _ref1 = this.$el.find("[data-managed-content]");
      _results = [];
      for (_i = 0, _len = _ref1.length; _i < _len; _i++) {
        el = _ref1[_i];
        id = $(el).attr('data-managed-content');
        _results.push($(el).html(managedContent[id].text));
      }
      return _results;
    };

    View.prototype.manageAuthAreas = function() {
      var el, _i, _j, _k, _len, _len1, _len2, _ref1, _ref2, _ref3, _ref4, _results;
      if (((_ref1 = this.model) != null ? _ref1.access : void 0) != null) {
        _ref2 = this.$el.find("[data-permission='ANON']");
        for (_i = 0, _len = _ref2.length; _i < _len; _i++) {
          el = _ref2[_i];
          if (this.model.access === 'ANON') {
            $(el).show();
          } else {
            $(el).hide();
          }
        }
        _ref3 = this.$el.find("[data-permission='USER']");
        for (_j = 0, _len1 = _ref3.length; _j < _len1; _j++) {
          el = _ref3[_j];
          if (this.model.access === 'USER') {
            $(el).show();
          } else {
            $(el).hide();
          }
        }
        _ref4 = this.$el.find("[data-permission='ADMIN']");
        _results = [];
        for (_k = 0, _len2 = _ref4.length; _k < _len2; _k++) {
          el = _ref4[_k];
          if (this.model.access === 'ADMIN') {
            _results.push($(el).show());
          } else {
            _results.push($(el).hide());
          }
        }
        return _results;
      }
    };

    View.prototype.permissions = {
      'admin': ['create', 'update', 'read'],
      'guest': ['read'],
      'author': ['create', 'update', 'read'],
      'user': ['read']
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
