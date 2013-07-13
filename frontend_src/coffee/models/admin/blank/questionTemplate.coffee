define [
  'chaplin',
  'models/base/model'
], (Chaplin, Model) ->
  'use strict'

  class AdminBlankQuestionTemplateModel extends Model
    name: 'AdminBlankQuestionTemplate'

    validate: ->
      if not @data.text? or @data.text is ''
        @publishEvent 'publicError', 'Текст вопроса не может быть пустым'
        return false
      return true

    update: (callback) ->
      if not @validate() then return

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
      if not @validate() then return

      @method = 'POST'
      @url    = -> 'api/blank_question/add'
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
