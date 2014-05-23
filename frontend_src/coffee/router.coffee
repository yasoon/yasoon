define([
    'controller'
    'admin/controller'
    'backbone'
    'mediator'
  ]
  (
    Controller
    AdminController
  ) ->
    AppRouter = Backbone.Router.extend({
      routes: {
        '': 'index'
        'posts/:category/:sort(/)': 'posts'
        'post/new(/)': 'newPost'
        'post/:id(/)': 'showPost'
        'post/:id/edit(/)': 'editPost'
        'register(/)': 'registerSpeaker'
        'speakers(/:category)(/)': 'speakers'
        'speaker/:id/:page(/)': 'showSpeaker'
        'author/edit(/)': 'editAuthor'
        'author/:page(/)': 'author'
        'admin(/)': 'adminMainPage'
        '*other': 'undefinedRoute'
      }

      initialize: ->
        Backbone.history.start({
        # pushState: true
        })

        Backbone.Mediator.subscribe('post:submitted', this.loadPost, this)

        $(document).on('click', 'a[href^="/"]', (event) =>
          if not event.altKey and
          not event.ctrlKey and
          not event.metaKey and
          not event.shiftKey
            event.preventDefault()
            url = $(event.currentTarget).attr('href').replace(/^\//, '')
            @navigate(url, {trigger: yes})
        )

      index: ->
        Controller.index()

      posts: (category, sort) ->
        Controller.posts(category, sort)

      newPost: ->
        @isLogged()
        Controller.newPost()

      showPost: (id) ->
        Controller.post(id)

      editPost: (id) ->
        @isLogged()
        Controller.editPost(id)

      speakers: (category) ->
        Controller.speakers(category)

      registerSpeaker: ->
        Controller.register()

      editAuthor: ->
        @isLogged()
        Controller.editAuthor()

      showSpeaker: (id, page) ->
        Controller.speaker(id, page)

      author: (page) ->
        Controller.author(page)

      loadPost: (id) ->
        @navigate("#/post/#{id}", {trigger: yes})

      adminMainPage: ->
        AdminController.index()

      undefinedRoute: ->
        Controller.undefinedRoute()

      isLogged: ->
        if typeof window.userId is "undefined"
          @navigate('#/404/')
          Controller.undefinedRoute()
    })

    return new AppRouter()
)