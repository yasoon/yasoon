define [
        'controllers/base/controller'
        'views/timeline/page'
], (
  Controller,
  TimelinePage,
) ->
  'use strict'

  class TimelineController extends Controller

    #Work with questions in blank
    indexAction: ->
      @view = new TimelinePage()



