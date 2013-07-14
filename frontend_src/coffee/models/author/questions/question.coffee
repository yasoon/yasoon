define [
  'chaplin',
  'models/base/model'
], (Chaplin, Model) ->
  'use strict'

  class AuthorQuestionsQuestionModel extends Model
    name: 'AuthorQuestionsQuestion'

    #
    initialize: (params)->
      super(params)
      @authorId = params.authorId

    #
    update: (callback) ->
      if not @validateNotNull('caption', 'answer')
        @publishEvent 'publicError', 'Поля вопроса и ответа должны быть заполнены'
        return

      @method = 'POST'
      @url    = -> 'api/question/update'
      @requestData =
        model:
          id: @data.id
          caption: @data.caption
          answer:  @data.answer


      updateCallback = =>
        @publishEvent 'modelUpdated', @
        callback?()

      @request(updateCallback)


    #
    add: (callback) ->
      if not @validateNotNull('caption')
        @publishEvent 'publicError', 'Тест вопроса не может быть пустым'
        return

      @method = 'POST'
      @url    = -> 'api/question/add'
      @requestData =
        model:
          caption:  @data.caption
          authorId: @authorId

      addCallback = =>
        addedModel = new AuthorQuestionsQuestionModel(@authorId)
        addedModel.data = id: @data.id, place: @data.place, caption: @data.caption,  date: @data.date
        @data = {}

        @publishEvent 'modelAdded', addedModel
        callback?()

      @request(addCallback)


    #
    delete: (callback) ->
      @method = 'POST'
      @url    = -> 'api/question/delete'
      @requestData = model: id: @data.id

      deleteCallback = =>
        @publishEvent 'modelDeleted', @data.id
        callback?()

      @request(deleteCallback)
