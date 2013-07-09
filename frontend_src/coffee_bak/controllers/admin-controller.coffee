define [
        'controllers/base/controller'

        'views/page/admin/blank'

#        'models/blankQuestion/queue'
#        'views/blankQuestion/queue'
#
#        'models/blankQuestion/model'
#        'views/blankQuestion/view'
], (
  Controller,
  AdminBlankPageView,

  BlankQuestionsQueue,
  BlankQuestionsQueueView,
  BlankQuestion,
  BlankQuestionView
) ->
  'use strict'

  class AdminController extends Controller

    #Work with questions in blank
    blankAction: ->
      @blankQuestionsView = new AdminBlankPageView()
#      @queue              = new BlankQuestionsQueue()
#      @queue.fetch =>
#        queueView = new BlankQuestionsQueueView(model: @queue)
#        newQuestion = new BlankQuestion
#        newQuestion.data = {place: @queue.questions.length + 1}
#        newQuestionView = new BlankQuestionView(model: newQuestion)
#        newQuestionView.region = 'new'
#        newQuestionView.setButtonMode()
#
#        @subscribeEvent 'blankQuestionAdded', ->
#          newQuestion.data.place++
#        @subscribeEvent 'blankQuestionDeleted', ->
#          newQuestion.data.place--



