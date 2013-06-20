define [
         'views/base/editable'
         'JST'
         'tinyEditor'
          'handlebars'
], (EditableView, JST, TinyEditor, Handlebars) ->
  'use strict'

  class QuestionView extends EditableView
    templateName: 'author_question_view'
  # Automatically render after initialize.
    autoRender: false
    className: ''
    tagName: 'article'

    Handlebars.registerHelper('ifnot', (condition, options) ->
      console.log 'no'
      if not condition
        return options.fn(@)
    )

    initialize: ->
      super

    events:
#      'click h3': ->
#        @setActiveMode() if @mode isnt 'active'

      'click #editButton': (e) ->
        console.log 'as'
        @setActiveMode()

      #active events
      'keydown #body': (e) ->
        if e.keyCode is 27 #esc
          @setPreviousMode()

      'keydown #caption': (e) ->
        if e.keyCode is 27 #esc
          @setPreviousMode()

      'click #previewButton': (e) ->
        @setPassiveMode()

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

    getTemplateData: =>
      {question: @model.data}

    render: ->
      super
      @$el.attr('id', @model.data.id)
      if not @model.data.answer
        @$el.attr('data-permission', 'author')




