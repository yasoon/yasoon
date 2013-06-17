define [
         'views/base/editable'
         'JST'
], (EditableView, JST) ->
  'use strict'

  class NewQuestionView extends EditableView
    templateName: 'author_newQuestion_view'
  # Automatically render after initialize.
    autoRender: true
    className: 'cat-title'
    tagName: 'article'
    region: 'newQuestion'

    initialize:  ->
      super
      @setButtonMode()

    events:
      #button events
      'click #askQuestionButton': ->
        @setActiveMode()

    #active events
      'keydown #body': (e) ->
        if e.keyCode is 27 #esc
          @setPreviousMode()

      'keydown #caption': (e) ->
        if e.keyCode is 27 #esc
          @setPreviousMode()

      'keyup #caption': (e) ->
          @model.data.caption = $(e.target).val()

      'click #sendButton': (e) ->
        @$el.find('#buttons').hide()
        @model.add =>
           @setButtonMode()

    setActiveMode: ->
      super
      @$el.find('#caption').focus()

    getTemplateData: =>
      {question: @model.data}




