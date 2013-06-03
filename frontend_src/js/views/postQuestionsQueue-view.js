// Generated by CoffeeScript 1.6.1
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['views/base/view', 'JST'], function(View, JST) {
  'use strict';
  var PostQuestionsQueue;
  return PostQuestionsQueue = (function(_super) {

    __extends(PostQuestionsQueue, _super);

    function PostQuestionsQueue() {
      return PostQuestionsQueue.__super__.constructor.apply(this, arguments);
    }

    PostQuestionsQueue.prototype.autoRender = true;

    PostQuestionsQueue.prototype.className = 'questionsQueue';

    PostQuestionsQueue.prototype.region = 'questionsQueue';

    PostQuestionsQueue.prototype.templateName = 'postQuestionsQueue';

    PostQuestionsQueue.prototype.listen = {
      'updated model': 'render'
    };

    PostQuestionsQueue.prototype.getTemplateData = function() {
      return {
        questions: this.model.data
      };
    };

    return PostQuestionsQueue;

  })(View);
});