(function() {
  define(['views/LayoutView', 'views/MainPageView', 'views/PostsPageView', 'views/PostPageView', 'views/AboutPageView', 'views/NewPostPageView', 'views/EditPostPageView', 'views/SpeakersPageView', 'views/SpeakerPageView', 'views/RegisterPageView', 'views/ErrorPageView', 'views/EditSpeakerView', 'views/TimelinePageView', 'models/UserRegisterModel', 'models/UserUpdateModel', 'models/userModel', 'models/PostPageModel', 'models/PostsPageModel', 'models/SpeakersPageModel', 'models/TimelinePageModel', 'backbone'], function(LayoutView, MainPageView, PostsPageView, PostPageView, AboutPageView, NewPostPageView, EditPostPageView, SpeakersPageView, SpeakerPageView, RegisterPageView, ErrorPageView, EditSpeakerView, TimelinePageView, UserRegisterModel, UserUpdateModel, userModel, PostPageModel, PostsPageModel, SpeakersPageModel, TimelinePageModel) {
    var Controller;
    Controller = (function() {
      function Controller() {}

      Controller.prototype.index = function() {
        $('body').removeClass().addClass('index');
        $('#js-login').removeClass();
        this.mainPageView = new MainPageView;
        LayoutView.contentRegion.$el.empty().append(this.mainPageView.render().$el);
        this.mainPageView.delegateEvents();
        return this;
      };

      Controller.prototype.posts = function(category, sort) {
        $('body').removeClass().addClass('posts');
        $('#js-login').removeClass();
        this.postsPageView = new PostsPageView({
          category: category,
          sort: sort,
          model: new PostsPageModel()
        });
        LayoutView.contentRegion.$el.empty().append(this.postsPageView.render().$el);
        this.postsPageView.delegateEvents();
        return this;
      };

      Controller.prototype.post = function(id) {
        $('body').removeClass().addClass('post');
        $('#js-login').removeClass();
        this.postPageView = new PostPageView({
          id: id
        });
        LayoutView.contentRegion.$el.empty().append(this.postPageView.$el);
        this.postPageView.delegateEvents();
        return this;
      };

      Controller.prototype.about = function() {
        $('body').removeClass().addClass('about');
        $('#js-login').removeClass();
        this.aboutPageView = new AboutPageView();
        LayoutView.contentRegion.$el.empty().append(this.aboutPageView.render().$el);
        this.aboutPageView.delegateEvents();
        return this;
      };

      Controller.prototype.newPost = function(id, isUser) {
        if (window.newPost != null) {
          delete window.newPost;
        }
        $('body').removeClass().addClass('new-post');
        $('#js-login').removeClass();
        this.newPostPageView = new NewPostPageView({
          id: id,
          model: new PostPageModel(),
          isUser: isUser
        });
        LayoutView.contentRegion.$el.empty().append(this.newPostPageView.$el);
        this.newPostPageView.delegateEvents();
        return this;
      };

      Controller.prototype.editPost = function(id) {
        $('body').removeClass().addClass('edit-post');
        $('#js-login').removeClass();
        this.editPostPageView = new EditPostPageView({
          id: id,
          model: new PostPageModel()
        });
        LayoutView.contentRegion.$el.empty().append(this.editPostPageView.$el);
        this.editPostPageView.delegateEvents();
        return this;
      };

      Controller.prototype.speakers = function(category) {
        $('body').removeClass().addClass('speakers');
        $('#js-login').removeClass();
        this.speakersPageView = new SpeakersPageView({
          category: category,
          model: new SpeakersPageModel()
        });
        LayoutView.contentRegion.$el.empty().append(this.speakersPageView.render().$el);
        this.speakersPageView.delegateEvents();
        return this;
      };

      Controller.prototype.register = function() {
        $('body').removeClass().addClass('register');
        $('#js-login').removeClass().addClass('hidden');
        this.registerPageView = new RegisterPageView({
          model: new UserRegisterModel()
        });
        LayoutView.contentRegion.$el.empty().append(this.registerPageView.render().$el);
        this.registerPageView.delegateEvents();
        return this;
      };

      Controller.prototype.speaker = function(id, page) {
        var model;
        $('body').removeClass().addClass('speaker');
        $('#js-login').removeClass();
        model = Backbone.Model.extend();
        this.speakerPageView = new SpeakerPageView({
          id: id,
          page: page,
          model: new model()
        });
        LayoutView.contentRegion.$el.empty().append(this.speakerPageView.render().$el);
        this.speakerPageView.delegateEvents();
        return this;
      };

      Controller.prototype.editSpeaker = function(id) {
        $('body').removeClass().addClass('editAuthor');
        $('#js-login').removeClass();
        this.editAuthorPageView = new EditSpeakerView({
          model: new UserUpdateModel(),
          el: LayoutView.contentRegion.$el
        });
        this.editAuthorPageView.delegateEvents();
        return this;
      };

      Controller.prototype.timeline = function() {
        $('body').removeClass().addClass('timeline');
        $('#js-login').removeClass();
        this.timelinePageView = new TimelinePageView({
          model: new TimelinePageModel()
        });
        LayoutView.contentRegion.$el.empty().append(this.timelinePageView.render().$el);
        this.timelinePageView.delegateEvents();
        return this;
      };

      Controller.prototype.undefinedRoute = function() {
        $('body').removeClass().addClass('error');
        $('#js-login').removeClass();
        this.errorPageView = new ErrorPageView();
        LayoutView.contentRegion.$el.empty().append(this.errorPageView.render().$el);
        this.errorPageView.delegateEvents();
        return this;
      };

      return Controller;

    })();
    return new Controller();
  });

}).call(this);
