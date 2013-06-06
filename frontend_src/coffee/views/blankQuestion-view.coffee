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

    initialize: ->
      super
      @setPassiveMode()

    events:
      'keyup .body': (e) ->
        @model.data.text = @$el.find('.body').val()

      'click #newButton': ->
        @setActiveMode()

      'click #sendButton': ->
        @model.sync =>
          @setPreviousMode()

    getTemplateData: =>
      {question: @model.data}

