define [
         'controllers/base/controller'
         'models/blankQuestions'
         'views/blankQuestions-view'
], (Controller
    BlankQuestions, BlankQuestionsView

) ->
  'use strict'

  class AdminController extends Controller

    #Work with questions in blank
    blankAction: ->
      @blankQuestions = new BlankQuestions
      @blankQuestions.fetch =>
        new BlankQuestionsView(model: @blankQuestions)
