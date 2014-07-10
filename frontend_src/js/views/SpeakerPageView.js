(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['views/PostAuthorModelView', 'views/SpeakerNavigationView', 'views/SpeakerContentView', 'views/SpeakerWritePostButtonView', 'models/PostAuthorModel', 'backbone'], function(PostAuthorModelView, SpeakerNavigationView, SpeakerContentView, SpeakerWritePostButtonView, PostAuthorModel) {
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
        this.listenTo(this.model, 'change:authorData', this.createSpeakerInfo);
        return this.getSpeakerInfo();
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
        if (this.postAuthorModelView == null) {
          this.postAuthorModelView = new PostAuthorModelView({
            model: new PostAuthorModel(this.model.get('authorData'))
          });
        } else {
          this.postAuthorModelView.delegateEvents();
        }
        this.$el.append(this.postAuthorModelView.render().$el);
        return this.createNavigation();
      };

      SpeakerPage.prototype.createNavigation = function() {
        if (this.speakerNavigationView == null) {
          this.speakerNavigationView = new SpeakerNavigationView({
            id: this.model.get('id'),
            page: this.model.get('page')
          });
        } else {
          this.speakerNavigationView.delegateEvents();
        }
        this.$el.append(this.speakerNavigationView.render().$el);
        return this.createWritePostButton();
      };

      SpeakerPage.prototype.createWritePostButton = function() {
        if (Window.config.userId === parseInt(this.model.get('id')) && this.model.get('page') === 'posts') {
          this.renderButton();
        }
        return this.createSpeakerContent();
      };

      SpeakerPage.prototype.renderButton = function() {
        if (this.speakerWritePostButtonView == null) {
          this.speakerWritePostButtonView = new SpeakerWritePostButtonView();
        } else {
          this.speakerWritePostButtonView.delegateEvents();
        }
        return this.$el.append(this.speakerWritePostButtonView.render().$el);
      };

      SpeakerPage.prototype.createSpeakerContent = function() {
        var author;
        author = this.model.get('authorData');
        if (this.speakerContentView == null) {
          this.speakerContentView = new SpeakerContentView({
            answers: author.answers,
            posts: author.posts,
            page: this.model.get('page'),
            id: this.model.get('id')
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
