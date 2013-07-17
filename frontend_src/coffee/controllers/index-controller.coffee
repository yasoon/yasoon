define [
        'controllers/base/controller'
        'views/index/page'
        'views/index/stories/page'
], (
  Controller,
  IndexView,
  StoriesView
) ->
  'use strict'

  class IndexController extends Controller

    #Work with questions in blank
    indexAction: ->
      @view = new IndexView()

    storiesAction: ->
      @view = new StoriesView()
