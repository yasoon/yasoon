define([
    'controller'
    'admin/controller'
    'models/userModel'
    'backbone'
    'mediator'
  ]
  (
    Controller
    AdminController
    userModel
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
        if typeof Window.config.userId isnt "undefined"
          Controller.newPost()
        else
          @navigate('#/404')

      showPost: (id) ->
        Controller.post(id)

      editPost: (id) ->
        userModel.deferred.done( =>
          if Window.config.admin or typeof Window.config.userId isnt
          "undefined"
            Controller.editPost(id)
          else
            @navigate('#/404')
        )

      speakers: (category) ->
        Controller.speakers(category)

      registerSpeaker: ->
        Controller.register()

      editAuthor: ->
        if typeof Window.config.userId isnt "undefined"
          Controller.editAuthor()
        else
          @navigate('#/404')

      showSpeaker: (id, page) ->
        Controller.speaker(id, page)

      author: (page) ->
        userModel.deferred.done( =>
          if Window.config.userId isnt "undefined"
            Controller.author(page)
          else
            @navigate('#/404')
        )

      loadPost: (id) ->
        @navigate("#/post/#{id}", {trigger: yes})

      adminMainPage: ->
        userModel.deferred.done( =>
          if Window.config.admin
            AdminController.index()
          else
            @navigate('#/404')
        )

      undefinedRoute: ->
        Controller.undefinedRoute()

    })
    return new AppRouter()
)