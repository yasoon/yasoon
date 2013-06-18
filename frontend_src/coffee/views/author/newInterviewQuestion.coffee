define [
         'views/base/editable'
         'JST'
         'views/author/newQuestion'
], (EditableView, JST, NewQuestionView) ->
  'use strict'

  class NewInterviewQuestionView extends NewQuestionView
    templateName: 'author_newInterviewQuestion_view'
    region: 'newQuestion'
#
#    initialize:  ->
#      super
#      @setButtonMode()
#
    events:
#      #button events
#      'click #askQuestionButton': ->
#        @setActiveMode()
#
#    #active events
#      'keydown #body': (e) ->
#        if e.keyCode is 27 #esc
#          @setPreviousMode()
#
#      'keydown #caption': (e) ->
#        if e.keyCode is 27 #esc
#          @setPreviousMode()
#
#      'keyup #caption': (e) ->
#          @model.data.caption = $(e.target).val()
#
      'keyup #body': (e) ->
        @model.data.answer = $(e.target).val()

      'click #sendButton': (e) ->
        @$el.find('#buttons').hide()
        @model.addInterview =>
           @setButtonMode()
#
#    setActiveMode: ->
#      super
#      @$el.find('#caption').focus()
#
#    getTemplateData: =>
#      {question: @model.data}




