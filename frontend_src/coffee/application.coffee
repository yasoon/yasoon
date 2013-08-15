define [
  'chaplin'
  'routes'
  'controllers/redirect-controller'
  'controllers/message-controller'
  'controllers/login-controller'
], (Chaplin, routes, RedirectController, MessageController, LoginController) ->
  'use strict'

  class Application extends Chaplin.Application
    title: 'Yasoon site'

    initialize: ->

      super

      @initRouter routes, pushState: false

      @initDispatcher controllerSuffix: '-controller'

      @initControllers()

      @initLayout()

      @initComposer()

      @initMediator()

      @startRouting()

      Object.freeze? this

    initMediator: ->
      Chaplin.mediator.seal()

    initControllers: ->
      new RedirectController()
      new MessageController()
      new LoginController()
