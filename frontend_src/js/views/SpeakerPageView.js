(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['views/SpeakerInfoView', 'views/SpeakerNavigationView', 'views/SpeakerContentView', 'models/SpeakerInfoModel', 'backbone'], function(SpeakerInfoView, SpeakerNavigationView, SpeakerContentView, SpeakerInfoModel) {
    var SpeakerPage;
    return SpeakerPage = (function(_super) {
      __extends(SpeakerPage, _super);

      function SpeakerPage() {
        return SpeakerPage.__super__.constructor.apply(this, arguments);
      }

      SpeakerPage.prototype.tagName = 'section';

      SpeakerPage.prototype.className = 'page-layout';

      SpeakerPage.prototype.initialize = function(options) {
        this.options = {
          id: options.id,
          page: options.page
        };
        return this.createSpeakerInfo();
      };

      SpeakerPage.prototype.createSpeakerInfo = function() {
        return $.post("/api/author/getAuthorInfo", {
          author_id: this.options.id
        }, (function(_this) {
          return function(data) {
            data = data[0];
            if (_this.speakerInfoView == null) {
              _this.speakerInfoView = new SpeakerInfoView({
                model: new SpeakerInfoModel(data)
              });
            } else {
              _this.speakerInfoView.delegateEvents();
            }
            _this.$el.append(_this.speakerInfoView.render().$el);
            _this.createNavigation();
            return _this.createSpeakerContent(data.answers, data.posts);
          };
        })(this), 'json');
      };

      SpeakerPage.prototype.createNavigation = function() {
        if (this.speakerNavigationView == null) {
          this.speakerNavigationView = new SpeakerNavigationView({
            id: this.options.id,
            page: this.options.page
          });
        } else {
          this.speakerNavigationView.delegateEvents();
        }
        return this.$el.append(this.speakerNavigationView.render().$el);
      };

      SpeakerPage.prototype.createSpeakerContent = function(answers, posts) {
        if (this.speakerContentView == null) {
          this.speakerContentView = new SpeakerContentView({
            answers: answers,
            posts: posts,
            page: this.options.page
          });
        } else {
          this.speakerContentView.delegateEvents();
        }
        return this.$el.append(this.speakerContentView.render().$el);
      };

      return SpeakerPage;

    })(Backbone.View);
  });

}).call(this);
