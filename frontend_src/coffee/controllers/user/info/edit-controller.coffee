define [
        'controllers/base/controller'
        'views/info/page'
], (
  Controller,
  InfoPageView
) ->
  'use strict'

  class EditController extends Controller

    #Work with questions in blank
    indexAction: ->
      @view = new InfoPageView()


