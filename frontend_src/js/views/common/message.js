// Generated by CoffeeScript 1.6.1
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['views/base/view', 'JST'], function(View, JST) {
  'use strict';
  var CommonMessageView;
  return CommonMessageView = (function(_super) {

    __extends(CommonMessageView, _super);

    function CommonMessageView() {
      return CommonMessageView.__super__.constructor.apply(this, arguments);
    }

    CommonMessageView.prototype.autoRender = true;

    CommonMessageView.prototype.className = 'barrier';

    CommonMessageView.prototype.container = 'body';

    CommonMessageView.prototype.templateName = 'common_message';

    CommonMessageView.prototype.initialize = function(data) {
      this.caption = data.caption;
      return this.text = data.text;
    };

    CommonMessageView.prototype.getTemplateData = function() {
      return {
        caption: this.caption,
        text: this.text
      };
    };

    CommonMessageView.prototype.events = {
      'click #disposeButton': function() {
        return this.dispose();
      }
    };

    return CommonMessageView;

  })(View);
});
