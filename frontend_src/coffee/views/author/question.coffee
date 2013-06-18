define [
         'views/base/editable'
         'JST'
         'tinyEditor'
], (EditableView, JST, TinyEditor) ->
  'use strict'

  class QuestionView extends EditableView
    templateName: 'author_question_view'
  # Automatically render after initialize.
    autoRender: false
    className: ''
    tagName: 'article'

    initialize: ->
      super

    events:
      'click h3': ->
        @setActiveMode() if @mode isnt 'active'


      #active events
      'keydown #body': (e) ->
        if e.keyCode is 27 #esc
          @setPreviousMode()

      'keydown #caption': (e) ->
        if e.keyCode is 27 #esc
          @setPreviousMode()

      'click #previewButton': (e) ->
        @setPassiveMode()

      'click iframe': ->
        console.log 'asd'

      'keyup #body': (e) ->
          @model.data.answer = $(e.target).val()
      'keyup #caption': (e) ->
          @model.data.caption = $(e.target).val()

      'click #sendButton': (e) ->
        @$el.find('#buttons').hide()
        @model.update =>
          @setPreviousMode()


      'click #declineButton': (e) ->
        @$el.find('#buttons').hide()
        @model.delete =>
          @dispose()


    setActiveMode: ->
      super
      @$el.find('#body').focus()
#      TinyEditor.editor.edit 'editor',
#        id: 'body'
#        controls: []
#        cssfile: "css/forms.css"

    getTemplateData: =>
      {question: @model.data}

    render: ->
      super
      @$el.attr('id', @model.data.id)




