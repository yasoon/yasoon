// Generated by CoffeeScript 1.6.1
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['views/base/editable', 'JST'], function(EditableView, JST) {
  'use strict';
  var NewQuestionView,
    _this = this;
  return NewQuestionView = (function(_super) {

    __extends(NewQuestionView, _super);

    function NewQuestionView() {
      var _this = this;
      this.getTemplateData = function() {
        return NewQuestionView.prototype.getTemplateData.apply(_this, arguments);
      };
      return NewQuestionView.__super__.constructor.apply(this, arguments);
    }

    NewQuestionView.prototype.templateName = 'author_newQuestion_view';

    NewQuestionView.prototype.autoRender = true;

    NewQuestionView.prototype.className = 'cat-title';

    NewQuestionView.prototype.tagName = 'article';

    NewQuestionView.prototype.region = 'newQuestion';

    NewQuestionView.prototype.setDoneMode = function(callback) {
      this.currentTemplateName = "" + this.templateName + "Done";
      this.softRender();
      if (this.mode != null) {
        this.modesHistory.push(this.mode);
      }
      this.mode = 'done';
      if (typeof callback === "function") {
        callback();
      }
      return this;
    };

    NewQuestionView.prototype.initialize = function() {
      NewQuestionView.__super__.initialize.apply(this, arguments);
      return this.setButtonMode();
    };

    NewQuestionView.prototype.events = {
      'click #askQuestionButton': function() {
        return this.setActiveMode();
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
      'keyup #caption': function(e) {
        return this.model.data.caption = $(e.target).val();
      },
      'click #sendButton': function(e) {
        var _this = this;
        this.$el.find('#buttons').hide();
        return this.model.add(function() {
          return _this.setDoneMode();
        });
      }
    };

    NewQuestionView.prototype.setActiveMode = function() {
      NewQuestionView.__super__.setActiveMode.apply(this, arguments);
      return this.$el.find('#caption').focus();
    };

    NewQuestionView.prototype.getTemplateData = function() {
      return {
        question: this.model.data
      };
    };

    return NewQuestionView;

  })(EditableView);
});
