define [
        'controllers/base/controller'

        'views/admin/blank/page'

], (
  Controller,
  AdminBlankPageView,
) ->
  'use strict'

  class AdminController extends Controller

    #Work with questions in blank
    blankAction: ->
      @blankQuestionsView = new AdminBlankPageView()


