define [
  'controllers/base/controller'
  'chaplin',
  'views/common/message'
], (Controller, Chaplin, CommonMessageView) ->
  'use strict'

  #listens errors events and shows related messages
  class MessageController extends Controller
    initialize: ->
      super
      Chaplin.mediator.subscribe 'publicError', @publicError

    publicError: (error) =>
      mv = new CommonMessageView(caption: 'Ошибка', text: error)

