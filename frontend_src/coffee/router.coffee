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
        'post/new(/:id)(/)': 'newPost'
        'post/:id(/)': 'showPost'
        'post/:id/edit(/)': 'editPost'
        'register(/)': 'registerSpeaker'
        'speakers(/:category)(/)': 'speakers'
        'speaker/:id/edit(/)': 'editSpeaker'
        'speaker/:id/:page(/)': 'showSpeaker'
        'timeline(/)': 'timeline'
        'about(/)': 'about'
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

      newPost: (id) ->
        userModel.deferred.done( =>
          if typeof Window.config.userId is "number"
              Controller.newPost(id)
            else
              @navigate('#/404')
        )
      showPost: (id) ->
        Controller.post(id)

      editPost: (id) ->
        userModel.deferred.done( =>
          if Window.config.admin or typeof Window.config.userId is "number"
            Controller.editPost(id)
          else
            @navigate('#/404')
        )

      speakers: (category) ->
        Controller.speakers(category)

      registerSpeaker: ->
        userModel.deferred.done( =>
          if typeof Window.config.userId is "number"
            @navigate('#/404')
          else
            Controller.register()
        )

      showSpeaker: (id, page) ->
        Controller.speaker(id, page)

      editSpeaker: (id) ->
        userModel.deferred.done( =>
          if typeof Window.config.userId is "number"
            Controller.editAuthor(id)
          else
            @navigate('#/404')
        )

      timeline: ->
        userModel.deferred.done( =>
          if typeof Window.config.userId is "number"
            Controller.timeline()
          else
            @navigate('#/404')
        )

      about: ->
        Controller.about()

      adminMainPage: ->
        userModel.deferred.done( =>
          if Window.config.admin
            AdminController.index()
          else
            @navigate('#/404')
        )

      loadPost: (id) ->
        @navigate("#/post/#{id}", {trigger: yes})

      undefinedRoute: ->
        console.log("undefined route")
        Controller.undefinedRoute()

    })
    return new AppRouter()
)