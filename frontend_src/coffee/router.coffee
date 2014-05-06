define(['controller', 'backbone']
(Controller) ->
  AppRouter = Backbone.Router.extend({
    routes: {
      '': 'index'
      'posts(/:category)(/:sort)(/)': 'posts'
      'post(/:id)(/)': 'post'
      'post-new(/)': 'newPost'
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
      $(document).on('click', 'a:not([data-bypass])', (event) =>
        $this = $(event.currentTarget)
        href = $this.attr('href')
        protocol = event.currentTarget.protocol + '//'

        if href.slice(protocol.length) isnt protocol
          event.preventDefault()
          @navigate(href, on)
      )
    index: ->
      Controller.index()
    posts: (category, sort) ->
      Controller.posts(category, sort)
    post: (id) ->
      Controller.post(id)
    newPost: ->
      Controller.newPost()
    speakers: (category) ->
      Controller.speakers(category)
    speaker: (id, page) ->
      Controller.speaker(id, page)
    register: ->
      Controller.register()
    author: (page) ->
      Controller.author(page)
    undefinedRoute: ->
      Controller.undefinedRoute()
  })

  return new AppRouter()
)