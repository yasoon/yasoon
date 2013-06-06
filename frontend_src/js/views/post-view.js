// Generated by CoffeeScript 1.6.1
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  __indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

define(['views/base/view', 'JST'], function(View, JST) {
  'use strict';
  var PostView;
  return PostView = (function(_super) {

    __extends(PostView, _super);

    function PostView() {
      return PostView.__super__.constructor.apply(this, arguments);
    }

    PostView.prototype.autoRender = false;

    PostView.prototype.className = 'post';

    PostView.prototype.templateName = 'post';

    PostView.prototype.modesHistory = [];

    PostView.prototype.initialize = function() {
      PostView.__super__.initialize.apply(this, arguments);
      if (this.model.data.preview) {
        return this.previewTouched = true;
      } else {
        return this.previewTouched = false;
      }
    };

    PostView.prototype.setButtonMode = function() {
      this.$el.empty();
      this.templateName = 'newPostButton';
      if (this.mode != null) {
        this.modesHistory.push(this.mode);
      }
      this.mode = 'button';
      return this.render();
    };

    PostView.prototype.setActiveMode = function() {
      this.$el.empty();
      this.templateName = 'postActive';
      if (this.mode != null) {
        this.modesHistory.push(this.mode);
      }
      this.mode = 'active';
      this.render();
      return this.$el.find('.activePostCaption').focus();
    };

    PostView.prototype.setPassiveMode = function() {
      this.$el.empty();
      this.templateName = 'postPassive';
      if (this.mode != null) {
        this.modesHistory.push(this.mode);
      }
      this.mode = 'passive';
      return this.render();
    };

    PostView.prototype.events = {
      'click #newPostButton': function() {
        return this.setActiveMode();
      },
      'keydown .activePost': function(e) {
        if (e.keyCode === 27) {
          return this.setPreviousMode();
        }
      },
      'keyup .activePostBody': function(e) {
        this.model.data.text = this.$el.find('.activePostBody').val();
        if (!this.previewTouched) {
          this.model.data.preview = this.model.data.text.substring(0, 255);
          return this.$el.find('.activePostPreview').val(this.model.data.preview);
        }
      },
      'keyup .activePostPreview': function(e) {
        var text, _i, _ref, _results;
        text = this.$el.find('.activePostPreview').val();
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
      'keyup .activePostCaption': function(e) {
        return this.model.data.caption = this.$el.find('.activePostCaption').val();
      },
      'click #sendPostButton': function() {
        var _this = this;
        this.$el.find('#sendPostButton').hide();
        return this.model.sync(function() {
          return _this.setPreviousMode();
        });
      },
      'click #editPostButton': function() {
        return this.setActiveMode();
      },
      'click #deletePostButton': function() {
        var _this = this;
        return this.model["delete"](function() {
          return _this.publishEvent('redirect', "#author/" + _this.model.data.authorId + "/posts");
        });
      }
    };

    PostView.prototype.getTemplateData = function() {
      return {
        post: this.model.data
      };
    };

    return PostView;

  })(View);
});
