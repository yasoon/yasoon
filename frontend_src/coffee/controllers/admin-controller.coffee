define [
        'controllers/base/controller'

        'views/admin/blank/page'
        'views/admin/stories/page'
        'views/admin/timeline/page'
        'views/admin/content/page'

], (
  Controller,
  AdminBlankPageView,
  AdminStoriesPageView,
  AdminTimelinePageView,
  AdminContentPageView
) ->
  'use strict'

  class AdminController extends Controller

    #Work with questions in blank
    blankAction: ->
      @blankQuestionsView = new AdminBlankPageView()

    storiesAction: ->
      @storiesView = new AdminStoriesPageView()

    timelineAction: ->
      @timelineView = new AdminTimelinePageView()

    contentAction: ->
      @contentView = new AdminContentPageView()
