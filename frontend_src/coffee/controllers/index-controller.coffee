define [
        'controllers/base/controller'
        'views/index/page'
        'views/index/stories/page'
        'views/index/e404page'
], (
  Controller,
  IndexView,
  StoriesView,
  e404View
) ->
  'use strict'

  class IndexController extends Controller

    #Work with questions in blank
    indexAction: ->
      @view = new IndexView()

    storiesAction: ->
      @view = new StoriesView()

    e404Action: ->
      @viwe = new e404View()
