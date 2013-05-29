define [
  'chaplin'
  'routes'
], (Chaplin, routes) ->
  'use strict'

  class Application extends Chaplin.Application
    title: 'Yasoon site'

    initialize: ->
      super

      @initRouter routes, pushState: false

      @initDispatcher controllerSuffix: '-controller'

      @initLayout()

      @initComposer()

      @initMediator()

      @startRouting()

      Object.freeze? this

    initMediator: ->
      Chaplin.mediator.seal()