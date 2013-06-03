define [
         'views/base/editable'
         'JST'
], (EditableView, JST) ->
  'use strict'

  class BlankQuestionView extends EditableView
  # Automatically render after initialize.
    autoRender: true
    className: 'blankQuestion'
    region: 'questions'

    templateName: 'blankQuestion'

    @setPassiveMode()

    events:
      'click .question':->
        @setActiveMode()




    getTemplateData: =>
      {question: @model.data}

