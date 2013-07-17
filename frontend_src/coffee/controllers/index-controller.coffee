define [
        'controllers/base/controller'
        'views/index/page'
], (
  Controller,
  IndexView,
) ->
  'use strict'

  class IndexController extends Controller

    #Work with questions in blank
    indexAction: ->
      @view = new IndexView()


