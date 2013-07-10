define [
  'chaplin',
  'models/base/model'
], (Chaplin, Model) ->
  'use strict'

  class AdminBlankQuestionTemplateModel extends Model

    update: (callback) ->
      @method = 'POST'
      @url    = -> 'api/blank_question/update'
      @requestData =
        model:
          id: @data.id
          text: @data.text

      updateCallback = =>
        @publishEvent 'modelUpdated', @
        callback?()

      @request(updateCallback)

    add: (callback) ->
      @method = 'POST'
      @url    = -> 'api/blank_question_add'
      @requestData =
        model:
          text:  @data.text
          place: @data.place

      addCallback = =>
        addedModel = new AdminBlankQuestionTemplateModel
        addedModel.data = id: @data.id, place: @data.place, text: @data.text
        @data = {}

        @publishEvent 'modelAdded', addedModel
        callback?()

      @request(addCallback)

    delete: (callback) ->
      @method = 'POST'
      @url    = -> 'api/blank_question/delete'
      @requestData = model: id: @data.id

      deleteCallback = =>
        @publishEvent 'modelDeleted', @data.id
        callback?()

      @request(deleteCallback)
