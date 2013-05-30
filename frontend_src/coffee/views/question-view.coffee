define [
         'views/base/view'
         'JST'
], (View, JST) ->
  'use strict'

  class QuestionView extends View
  # Automatically render after initialize.
    autoRender: false
    className: 'post'

    # can be: question, question-dev,
    templateName: 'question'

    modesHistory: []

    initialize: ->
      super
      if @model.data.preview
        @previewTouched = true
      else
        @previewTouched = false

    setButtonMode: ->
      #@model.data = {id: @model.data.id, authorId: @model.data.authorId}
      @$el.empty()
      @templateName = 'newQuestionButton'
      @modesHistory.push(@mode) if @mode?
      @mode = 'button'
      @render()

    setActiveMode: ->
      @$el.empty()
      @templateName = 'questionActive'
      @modesHistory.push(@mode) if @mode?
      @mode = 'active'
      @render()
      @$el.find('.activeQuestionBody').focus()


    setPassiveMode: ->
      @$el.empty()
      @templateName = 'questionPassive'
      @modesHistory.push(@mode) if @mode?
      @mode = 'passive'
      @render()

    setPreviousMode: ->
      console.log @modesHistory
      if @modesHistory[@modesHistory.length-1] is 'button'
        @setButtonMode()
      else if @modesHistory[@modesHistory.length-1] is 'active'
        @setActiveMode()
      else if @modesHistory[@modesHistory.length-1] is 'passive'
        @setPassiveMode()

    events:
      'click #newQuestionButton': ->
         @setActiveMode()

      'keydown .activeQuestion': (e) ->
        if e.keyCode is 27 #esc
          @setPreviousMode()

      'keyup .activeQuestionBody': (e) ->
        @model.data.text = @$el.find('.activeQuestionBody').val()

      'click #sendQuestionButton': ->
        @$el.find('#sendQuestionButton').hide()
        @model.sync =>
          @setPreviousMode()

    getTemplateData: ->
      {question: @model.data}
