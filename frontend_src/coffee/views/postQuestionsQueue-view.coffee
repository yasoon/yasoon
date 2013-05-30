define [
         'views/base/view'
         'JST'
], (View, JST) ->
  'use strict'

  class PostQuestionsQueue extends View
  # Automatically render after initialize.
    autoRender: true
    className: 'questionsQueue'
    region: 'questionsQueue'

    templateName: 'postQuestionsQueue'

    listen:
      'updated model': 'render'

    getTemplateData: ->
      {questions: @model.data}
