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
        'interview/:id(/)': 'showInterview'
        'interviews(/)': 'interviews'
        'post/:id(/)': 'showPost'
        'post/:id/edit(/)': 'editPost'
        'register(/)': 'registerSpeaker'
        'speakers(/:category)(/)': 'speakers'
        'speaker/:id/edit(/)': 'editSpeaker'
        'speaker/:id/:page(/)': 'showSpeaker'
        'timeline(/)': 'timeline'
        'about(/)': 'about'
        'rules(/)': 'rules'
        'admin(/)': 'adminMainPage'
        '*other': 'undefinedRoute'
      }

      initialize: ->
        Backbone.history.start()
        @bind 'route', @sendPageview
        Backbone.history.on("route", @sendPageview())
        @setHandlers()
        

      setHandlers: ->
        $(document).on('click', 'a[href^="/"]', (event) => @isClicked(event))

      isClicked: (event) ->
        if not event.altKey and not event.ctrlKey and not event.metaKey and not event.shiftKey then @linkClicked(event)

      linkClicked: (event) ->
        event.preventDefault()
        @navigate($(event.currentTarget).attr('href').replace(/^\//, ''), {trigger: yes})

      index: ->
        if window.reloadMainPage? then window.location.reload(yes) else Controller.index()

      posts: (category, sort) ->
        Controller.posts(category, sort)

      newPost: (id) ->
        userModel.deferred.done( => if @isUser() then Controller.newPost(id, true) else if window.newPost? then Controller.newPost(id, true) else Controller.newPost(id, false))

      showPost: (id) ->
        Controller.post(id)

      editPost: (id) ->
        userModel.deferred.done( => if window.config.admin or @isUser() then Controller.editPost(id) else @navigate('#/404'))

      speakers: (category) ->
        userModel.deferred.done( => Controller.speakers(category))

      registerSpeaker: ->
        userModel.deferred.done( => if not @isUser() then Controller.register() else @navigate('#/404'))

      showSpeaker: (id, page) ->
        userModel.deferred.done( => Controller.speaker(id, page))

      editSpeaker: (id) ->
        userModel.deferred.done( => if @isUser() then Controller.editSpeaker(id) else @navigate('#/404'))

      timeline: ->
        userModel.deferred.done( => if @isUser() then Controller.timeline() else @navigate('#/404'))

      about: ->
        Controller.about()

      rules: ->
        Controller.rules()

      adminMainPage: ->
        userModel.deferred.done( => if window.config.admin then AdminController.index() else @navigate('#/404'))

      isUser: ->
        typeof window.config.userId is "number"

      showInterview: (id)->
        Controller.interview(id)

      interviews: ->
        Controller.interviews()

      undefinedRoute: ->
        Controller.undefinedRoute()
        
      sendPageview: ->
        url = Backbone.history.getFragment()
        ga('send', 'pageview', {'page' : '/#/'+url});
    })
    return new AppRouter()
)