define [
  'chaplin',
  'models/base/model'
], (Chaplin, Model) ->
  'use strict'

  class Question extends Model

    initialize: (obj) ->
      super
      @data = {}
      @data.authorId = obj.authorId if obj? and obj.authorId?


    update: (callback) ->
      @fetchParams = {}
      @fetchParams.method = "POST"
      @fetchParams.data =
        model:
          id:      @data.id
          caption: @data.caption
          answer:  @data.answer


      @url = -> "api/question/update"

      editCallback = =>
        callback()

      @request(editCallback)

    addInterview: (callback) =>
      @fetchParams = {}
      @fetchParams.method = "POST"
      @fetchParams.data =
        model:
          caption:  @data.caption
          authorId: @data.authorId
          answer:   @data.answer

      @url = -> "api/question/add_interview"
      addCallback = =>
        addedQuestion = new Question
        addedQuestion.data = id: @data.id, caption: @data.caption, date: @data.date, answer: @data.answer
        @publishEvent 'questionAdded', addedQuestion
        @data.id = undefined
        @data.caption = ''
        @data.text = ''
        callback?()

      @request(addCallback)


    add: (callback) ->
      @fetchParams = {}
      @fetchParams.method = "POST"
      @fetchParams.data =
        model:
          caption: @data.caption
          authorId: @data.authorId

      @url = -> "api/question/add"

      addCallback = =>
        addedQuestion = new Question
        addedQuestion.data = id: @data.id, caption: @data.caption, date: @data.date
        @publishEvent 'questionAdded', addedQuestion
        @data.id = undefined
        @data.caption = ''
        @data.text = ''
        callback()

      @request(addCallback)

    delete: (callback) ->
      @fetchParams = {}
      @fetchParams.method = "POST"
      @fetchParams.data = {model: id: @data.id}

      @url = -> "api/question/delete"


      deleteCallback = =>
        @publishEvent 'questionDeleted', @
        callback?()

      @request(deleteCallback())
