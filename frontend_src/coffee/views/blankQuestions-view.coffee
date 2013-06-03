define [
         'views/base/view'
         'JST'
         'views/blankQuestion-view'
], (View, JST, BlankQuestionView) ->
  'use strict'

  class BlankQuestionsView extends View
  # Automatically render after initialize.
    autoRender: true
    className: 'blankQuestions'
    container: '#center'
    regions:
      '#questions': 'questions'

    templateName: 'blankQuestions'

    render: ->
      super
      for question in @model.questions
        view = new BlankQuestionView(model: question)

