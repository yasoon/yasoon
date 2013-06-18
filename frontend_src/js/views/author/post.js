// Generated by CoffeeScript 1.6.1
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  __indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

define(['views/base/editable', 'JST', 'tinyEditor'], function(EditableView, JST, TinyEditor) {
  'use strict';
  var PostView,
    _this = this;
  return PostView = (function(_super) {

    __extends(PostView, _super);

    function PostView() {
      var _this = this;
      this.getTemplateData = function() {
        return PostView.prototype.getTemplateData.apply(_this, arguments);
      };
      return PostView.__super__.constructor.apply(this, arguments);
    }

    PostView.prototype.templateName = 'author_post_view';

    PostView.prototype.autoRender = false;

    PostView.prototype.className = '';

    PostView.prototype.tagName = 'article';

    PostView.prototype.initialize = function() {
      PostView.__super__.initialize.apply(this, arguments);
      if (this.model.data.preview) {
        return this.previewTouched = true;
      } else {
        return this.previewTouched = false;
      }
    };

    PostView.prototype.events = {
      'click h3': function() {
        if (this.mode !== 'active') {
          return this.setActiveMode();
        }
      },
      'keydown #body': function(e) {
        if (e.keyCode === 27) {
          return this.setPreviousMode();
        }
      },
      'keydown #caption': function(e) {
        if (e.keyCode === 27) {
          return this.setPreviousMode();
        }
      },
      'keyup #body': function(e) {
        this.model.data.text = $(e.target).val();
        if (!this.previewTouched) {
          this.model.data.preview = this.model.data.text.substring(0, 255);
          return this.$el.find('#preview').val(this.model.data.preview);
        }
      },
      'keyup #preview': function(e) {
        var text, _i, _ref, _results;
        text = this.$el.find('#preview').val();
        if (text) {
          if ((_ref = e.keyCode, __indexOf.call((function() {
            _results = [];
            for (_i = 48; _i <= 90; _i++){ _results.push(_i); }
            return _results;
          }).apply(this), _ref) >= 0) || e.keyCode === 32) {
            this.previewTouched = true;
          }
        } else {
          this.previewTouched = false;
        }
        return this.model.data.preview = text.substring(0, 300);
      },
      'keyup #caption': function(e) {
        return this.model.data.caption = $(e.target).val();
      },
      'click #sendButton': function(e) {
        var _this = this;
        this.$el.find('#buttons').hide();
        if (this.model.id) {
          return this.model.update(function() {
            return _this.publishEvent('redirect', '#author/1/posts');
          });
        } else {
          return this.model.add(function() {
            return _this.publishEvent('redirect', '#author/1/posts');
          });
        }
      },
      'click #previewButton': function(e) {
        return this.setPassiveMode();
      },
      'click #editButton': function(e) {
        return this.setActiveMode();
      }
    };

    PostView.prototype.setActiveMode = function() {
      PostView.__super__.setActiveMode.apply(this, arguments);
      return this.$el.find('#body').focus();
    };

    PostView.prototype.getTemplateData = function() {
      return {
        post: this.model.data,
        authorized: this.authorized
      };
    };

    PostView.prototype.render = function() {
      PostView.__super__.render.apply(this, arguments);
      return this.$el.attr('id', this.model.data.id);
    };

    return PostView;

  })(EditableView);
});
