(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['text!templates/speakerPageTpl.htm', 'backbone'], function(speakerPageTpl) {
    var SpeakerNavigationView;
    return SpeakerNavigationView = (function(_super) {
      __extends(SpeakerNavigationView, _super);

      function SpeakerNavigationView() {
        return SpeakerNavigationView.__super__.constructor.apply(this, arguments);
      }

      SpeakerNavigationView.prototype.tagName = 'section';

      SpeakerNavigationView.prototype.className = 'lim';

      SpeakerNavigationView.prototype.template = _.template(speakerPageTpl);

      SpeakerNavigationView.prototype.initialize = function(options) {
        return this.options = options || {};
      };

      SpeakerNavigationView.prototype.render = function() {
        this.$el.append(this.template(this.options));
        return this;
      };

      return SpeakerNavigationView;

    })(Backbone.View);
  });

}).call(this);
