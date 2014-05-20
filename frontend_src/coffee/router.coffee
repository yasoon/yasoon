define([
  'controller'
  'backbone'
  'mediator'
]
(
  Controller
) ->
  AppRouter = Backbone.Router.extend({
    routes: {
      '': 'index'
      'posts(/:category)(/:sort)(/)': 'posts'
      'post(/:id)(/:edit)(/)': 'post'
      'speakers(/:category)(/)': 'speakers'
      'speaker(/:id)(/:page)(/)': 'speaker'
      'register(/)': 'register'
      'author(/:page)(/)': 'author'
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
    post: (id, edit) ->
      if id is 'new'
        Controller.newPost()
      else
        if edit
          Controller.editPost(id)
        else
          Controller.post(id)
    speakers: (category) ->
      Controller.speakers(category)
    speaker: (id, page) ->
      Controller.speaker(id, page)
    register: ->
      Controller.register()
    author: (page) ->
      Controller.author(page)
    loadPost: (id) ->
      @navigate("#/post/#{id}", {trigger: yes})
    undefinedRoute: ->
      Controller.undefinedRoute()
  })

  return new AppRouter()
)