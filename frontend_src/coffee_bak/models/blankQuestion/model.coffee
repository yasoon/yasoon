define [
  'chaplin',
  'models/base/model'
], (Chaplin, Model) ->
  'use strict'

  class BlankQuestion extends Model

    update: (callback) ->
      @fetchParams = {}
      @fetchParams.method = "POST"
      @fetchParams.data =
        model:
          id:       @data.id
          text:     @data.text

      @url = -> "api/blank_question/update"

      editCallback = =>
        callback()

      @request(editCallback)

    add: (callback) ->
      @fetchParams = {}
      @fetchParams.method = "POST"
      @fetchParams.data =
        model:
          text:     @data.text
          place:    @data.place

      @url = -> "api/blank_question/add"

      addCallback = =>
        addedQuestion = new BlankQuestion
        addedQuestion.data = id: @data.id, place: @data.place, text: @data.text
        @publishEvent 'blankQuestionAdded', addedQuestion
        @data.id = undefined
        @data.text = ''
        callback()

      @request(addCallback)

    delete: (callback) ->
      @fetchParams = {}
      @fetchParams.method = "POST"
      @fetchParams.data = {model: id: @data.id}

      @url = -> "api/blank_question/delete"


      deleteCallback = =>
        @publishEvent 'blankQuestionDeleted', @
        callback?()

      @request(deleteCallback())
