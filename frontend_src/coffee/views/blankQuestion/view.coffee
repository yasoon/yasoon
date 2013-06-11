define [
         'views/base/editable'
         'JST'
], (EditableView, JST) ->
  'use strict'

  class BlankQuestionView extends EditableView
    templateName: 'blankQuestion_view'
  # Automatically render after initialize.
    autoRender: false
    className: 'blankQuestion'
    tagName: 'li'

    setActiveMode: ->
      super
      @$el.find('.body').focus()

    events:
      #button events
      'click #newButton': ->
        @setActiveMode()

      #passive events
      'click .question': ->
        @setActiveMode() if @mode is 'passive'

      #active events
      'keydown .body': (e) ->
        if e.keyCode is 27 #esc
          @setPreviousMode()

      'keyup .body': (e) ->
          @model.data.text = $(e.target).val()

      'click #sendButton': (e) ->
        @$el.find('#buttons').hide()
        if @model.data.id?
          @model.update =>
            @setPreviousMode()
        else
          @model.add =>
            @setButtonMode()

      'click #deleteButton': (e) ->
        @$el.find('#buttons').hide()
        @model.delete =>
          @dispose()

    getTemplateData: =>
      {question: @model.data}

