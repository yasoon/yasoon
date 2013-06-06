define [
         'views/base/view'
         'JST'
         'views/blankQuestion-view'
          'models/blankQuestion'
], (View, JST, BlankQuestionView, BlankQuestion) ->
  'use strict'

  class BlankQuestionsView extends View
  # Automatically render after initialize.
    autoRender: true
    className: 'blankQuestions'
    container: '#center'
    regions:
      '#questions': 'questions'

    templateName: 'blankQuestions'

    listen:
      'updated model': 'render'

    render: ->
      super
      for question in @model.questions
        view = new BlankQuestionView(model: question)

      newView = (new BlankQuestionView(model: new BlankQuestion)).setButtonMode()
