// Generated by CoffeeScript 1.6.1
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['views/base/editable', 'JST'], function(EditableView, JST) {
  'use strict';
  var BlankQuestionView,
    _this = this;
  return BlankQuestionView = (function(_super) {

    __extends(BlankQuestionView, _super);

    function BlankQuestionView() {
      var _this = this;
      this.getTemplateData = function() {
        return BlankQuestionView.prototype.getTemplateData.apply(_this, arguments);
      };
      return BlankQuestionView.__super__.constructor.apply(this, arguments);
    }

    BlankQuestionView.prototype.autoRender = true;

    BlankQuestionView.prototype.className = 'blankQuestion';

    BlankQuestionView.prototype.region = 'questions';

    BlankQuestionView.prototype.templateName = 'blankQuestion';

    BlankQuestionView.setPassiveMode();

    BlankQuestionView.prototype.events = {
      'click .question': function() {
        return this.setActiveMode();
      }
    };

    BlankQuestionView.prototype.getTemplateData = function() {
      return {
        question: this.model.data
      };
    };

    return BlankQuestionView;

  })(EditableView);
});