define [
  'controllers/base/controller'
  'chaplin'
], (Controller, Chaplin) ->
  'use strict'

  #component with no view, listens 'redirect' events and makes some tiny stuff
  class RedirectController extends Controller
    initialize: ->
      super
      Chaplin.mediator.subscribe 'redirect', @redirect

    redirect: (url) =>
      document.location = '#'+url