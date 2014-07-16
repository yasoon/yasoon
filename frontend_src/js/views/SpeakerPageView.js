(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['views/PostAuthorModelView', 'views/SpeakerNavigationView', 'views/SpeakerContentView', 'models/PostAuthorModel', 'models/SpeakerContentModel', 'backbone'], function(PostAuthorModelView, SpeakerNavigationView, SpeakerContentView, PostAuthorModel, SpeakerContentModel) {
    var SpeakerPage;
    return SpeakerPage = (function(_super) {
      __extends(SpeakerPage, _super);

      function SpeakerPage() {
        return SpeakerPage.__super__.constructor.apply(this, arguments);
      }

      SpeakerPage.prototype.tagName = 'section';

      SpeakerPage.prototype.className = 'page-layout';

      SpeakerPage.prototype.initialize = function(options) {
        this.model.set({
          id: options.id,
          page: options.page
        });
        this.setListeners();
        return this.getSpeakerInfo();
      };

      SpeakerPage.prototype.setListeners = function() {
        return this.listenTo(this.model, 'change:authorData', this.createSpeakerInfo);
      };

      SpeakerPage.prototype.getSpeakerInfo = function() {
        return $.post("/api/author/getAuthorInfo", {
          author_id: this.model.get('id')
        }, (function(_this) {
          return function(data) {
            return _this.model.set('authorData', data[0]);
          };
        })(this));
      };

      SpeakerPage.prototype.createSpeakerInfo = function() {
        var postAuthor;
        postAuthor = new PostAuthorModel(this.model.get('authorData'));
        if (this.authorModel == null) {
          this.authorModel = new PostAuthorModelView({
            model: postAuthor
          });
        } else {
          this.authorModel.delegateEvents();
        }
        this.$el.append(this.authorModel.render().$el);
        return this.createNavigation();
      };

      SpeakerPage.prototype.createNavigation = function() {
        if (this.speakerNavigationView == null) {
          this.speakerNavigation();
        } else {
          this.speakerNavigationView.delegateEvents();
        }
        this.$el.append(this.speakerNavigationView.render().$el);
        return this.createSpeakerContent();
      };

      SpeakerPage.prototype.speakerNavigation = function() {
        return this.speakerNavigationView = new SpeakerNavigationView({
          id: this.model.get('id'),
          page: this.model.get('page')
        });
      };

      SpeakerPage.prototype.createSpeakerContent = function() {
        if (this.speakerContentView == null) {
          this.speakerContent();
        } else {
          this.speakerContentView.delegateEvents();
        }
        return this.$el.append(this.speakerContentView.render().$el);
      };

      SpeakerPage.prototype.speakerContent = function() {
        var speakerContent;
        speakerContent = new SpeakerContentModel();
        return this.speakerContentView = new SpeakerContentView({
          model: speakerContent,
          author: this.model.get('authorData'),
          page: this.model.get('page'),
          id: this.model.get('id')
        });
      };

      return SpeakerPage;

    })(Backbone.View);
  });

}).call(this);
