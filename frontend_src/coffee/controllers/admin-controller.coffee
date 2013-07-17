define [
        'controllers/base/controller'

        'views/admin/blank/page'
        'views/admin/stories/page'

], (
  Controller,
  AdminBlankPageView,
  AdminStoriesPageView,
) ->
  'use strict'

  class AdminController extends Controller

    #Work with questions in blank
    blankAction: ->
      @blankQuestionsView = new AdminBlankPageView()

    storiesAction: ->
      @storiesView = new AdminStoriesPageView()


