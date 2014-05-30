define(
  [
    'views/LayoutView'
    'views/MainPageView'
    'views/PostsPageView'
    'views/PostPageView'
    'views/NewPostPageView'
    'views/EditPostPageView'
    'views/SpeakersPageView'
    'views/SpeakerPageView'
    'views/RegisterPageView'
    'views/AuthorPageView'
    'views/ErrorPageView'
    'views/EditAuthorView'
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
    NewPostPageView
    EditPostPageView
    SpeakersPageView
    SpeakerPageView
    RegisterPageView
    AuthorPageView
    ErrorPageView
    EditAuthorPageView
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
        LayoutView.contentRegion.$el.empty().append(@postPageView.render().$el)
        @postPageView.delegateEvents()
        @

      newPost: (id) ->
        $('body').removeClass().addClass('new-post')
        @newPostPageView = new NewPostPageView({
          id: id
          model: new PostPageModel()
        })
        LayoutView.contentRegion.$el.empty().append(@newPostPageView.render().$el)
        @newPostPageView.delegateEvents()
        @

      editPost: (id) ->
        $('body').removeClass().addClass('edit-post')
        @editPostPageView = new EditPostPageView({
          id: id
          model: new PostPageModel()
        })
        LayoutView.contentRegion.$el.empty().append(@editPostPageView.render().$el)
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

      speaker: (id, page) ->
        $('body').removeClass().addClass('speaker')
        @speakerPageView = new SpeakerPageView({
          id: id
          page: page
        })
        LayoutView.contentRegion.$el.empty().append(@speakerPageView.render().$el)
        @speakerPageView.delegateEvents()
        @

      register: ->
        $('body').removeClass().addClass('register')
        @registerPageView = new RegisterPageView({
          model: new UserRegisterModel()
        })
        LayoutView.contentRegion.$el.empty().append(@registerPageView.render().$el)
        @registerPageView.delegateEvents()
        @

      editAuthor: ->
        $('body').removeClass().addClass('editAuthor')
        @editAuthorPageView = new EditAuthorPageView({
          model: new UserUpdateModel()
        })
        LayoutView.contentRegion.$el.empty().append(@editAuthorPageView.render().$el)
        @editAuthorPageView.delegateEvents()
        @

      author: (page) ->
        $('body').removeClass().addClass('author')
        @authorPageView = new AuthorPageView({
          page: page
          model: userModel
        })
        LayoutView.contentRegion.$el.empty().append(@authorPageView.render().$el)
        @authorPageView.delegateEvents()
        @

      undefinedRoute: ->
        $('body').removeClass().addClass('error')
        @errorPageView = new ErrorPageView()
        LayoutView.contentRegion.$el.empty().append(@errorPageView.render().$el)
        @errorPageView.delegateEvents()
        @

    return new Controller()
)