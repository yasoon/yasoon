define [
  'controllers/base/controller'
  'chaplin/mediator'
], (Controller, Mediator) ->
  'use strict'

  #component with no view, listens 'redirect' events and makes some tiny stuff
  class RedirectController extends Controller
    initialize: ->
      super
      Mediator.subscribe 'redirect', @redirect

    redirect: (url) =>
      @publishEvent 'dispose'
      document.location = url

    redirectAction: (params) =>
      @redirect params.url

