define(
  [
    'views/LayoutView'
    'views/MainPageView'
    'views/PostsPageView'
    'views/PostPageView'
    'views/AboutPageView'
    'views/NewPostPageView'
    'views/EditPostPageView'
    'views/SpeakersPageView'
    'views/SpeakerPageView'
    'views/RegisterPageView'
    'views/ErrorPageView'
    'views/EditSpeakerView'
    'views/TimelinePageView'
    'models/UserRegisterModel'
    'models/UserUpdateModel'
    'models/userModel'
    'models/PostPageModel'
    'backbone'
  ]
  (
    LayoutView
    MainPageView
    PostsPageView
    PostPageView
    AboutPageView
    NewPostPageView
    EditPostPageView
    SpeakersPageView
    SpeakerPageView
    RegisterPageView
    ErrorPageView
    EditSpeakerView
    TimelinePageView
    UserRegisterModel
    UserUpdateModel
    userModel
    PostPageModel
  ) ->
    class Controller
      constructor: () ->

      index: ->
        $('body').removeClass().addClass('index')
        @mainPageView = new MainPageView
        LayoutView.contentRegion.$el.empty().append(@mainPageView.render().$el)
        @mainPageView.delegateEvents()
        @

      posts: (category, sort) ->
        $('body').removeClass().addClass('posts')
        @postsPageView = new PostsPageView({
          category: category,
          sort: sort
        })
        LayoutView.contentRegion.$el.empty().append(@postsPageView.render().$el)
        @postsPageView.delegateEvents()
        @

      post: (id) ->
        $('body').removeClass().addClass('post')
        @postPageView = new PostPageView({
          id: id
        })
        LayoutView.contentRegion.$el.empty().append(@postPageView.$el)
        @postPageView.delegateEvents()
        @

      about: ->
        $('body').removeClass().addClass('about')
        @aboutPageView = new AboutPageView()
        LayoutView.contentRegion.$el.empty().append(@aboutPageView.render().$el)
        @aboutPageView.delegateEvents()
        @

      newPost: (id) ->
        $('body').removeClass().addClass('new-post')
        @newPostPageView = new NewPostPageView({
          id: id
          model: new PostPageModel()
          el: LayoutView.contentRegion.$el
        })
        @newPostPageView.delegateEvents()
        @

      editPost: (id) ->
        $('body').removeClass().addClass('edit-post')
        @editPostPageView = new EditPostPageView({
          id: id
          el: LayoutView.contentRegion.$el
          model: new PostPageModel()
        })
        @editPostPageView.delegateEvents()
        @

      speakers: (category) ->
        $('body').removeClass().addClass('speakers')
        @speakersPageView = new SpeakersPageView({
          category: category
        })
        LayoutView.contentRegion.$el.empty().append(@speakersPageView.render().$el)
        @speakersPageView.delegateEvents()
        @

      register: ->
        $('body').removeClass().addClass('register')
        @registerPageView = new RegisterPageView({
          model: new UserRegisterModel()
        })
        LayoutView.contentRegion.$el.empty().append(@registerPageView.render().$el)
        @registerPageView.delegateEvents()
        @

      speaker: (id, page) ->
        $('body').removeClass().addClass('speaker')
        @speakerPageView = new SpeakerPageView({
          id: id
          page: page
        })
        LayoutView.contentRegion.$el.empty().append(@speakerPageView.render().$el)
        @speakerPageView.delegateEvents()
        @

      editSpeaker: (id) ->
        $('body').removeClass().addClass('editAuthor')
        @editAuthorPageView = new EditSpeakerView({
          model: new UserUpdateModel()
          el: LayoutView.contentRegion.$el
        })
        #        LayoutView.contentRegion.$el.empty().append(@editAuthorPageView.render().$el)
        @editAuthorPageView.delegateEvents()
        @

      timeline: ->
        $('body').removeClass().addClass('timeline')
        @timelinePageView = new TimelinePageView()
        LayoutView.contentRegion.$el.empty().append(@timelinePageView.render().$el)
        @timelinePageView.delegateEvents()
        @

      undefinedRoute: ->
        $('body').removeClass().addClass('error')
        @errorPageView = new ErrorPageView()
        LayoutView.contentRegion.$el.empty().append(@errorPageView.render().$el)
        @errorPageView.delegateEvents()
        @

    return new Controller()
)