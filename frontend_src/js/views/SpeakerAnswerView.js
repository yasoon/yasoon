(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['text!templates/speakerAnswerTpl.htm', 'views/ValidationView', 'backbone'], function(speakerAnswerTpl, ValidationView) {
    var SpeakerAnswerView;
    return SpeakerAnswerView = (function(_super) {
      __extends(SpeakerAnswerView, _super);

      function SpeakerAnswerView() {
        return SpeakerAnswerView.__super__.constructor.apply(this, arguments);
      }

      SpeakerAnswerView.prototype.tagName = 'article';

      SpeakerAnswerView.prototype.className = 'lim';

      SpeakerAnswerView.prototype.template = _.template(speakerAnswerTpl);

      SpeakerAnswerView.prototype.render = function() {
        this.$el.html(this.template(this.model.toJSON()));
        return this;
      };

      return SpeakerAnswerView;

    })(ValidationView);
  });

}).call(this);
