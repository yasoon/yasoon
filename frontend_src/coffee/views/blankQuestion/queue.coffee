define [
         'views/base/view'
         'JST'
         'models/blankQuestion/model'
         'views/blankQuestion/view'
], (View, JST, BlankQuestion, BlankQuestionView) ->
  'use strict'

  class BlankQuestionsQueueView extends View
    className: 'list'
    autoRender: true
    region: 'queue'
    regions:
      '#list': 'list'

    templateName: 'blankQuestion_queue'

    render: ->
      super
      for question in @model.questions
        (new BlankQuestionView(model: question)).setRegion('list').setPassiveMode()