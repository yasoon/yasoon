define [
  'chaplin',
  'models/base/model'
], (Chaplin, Model) ->
  'use strict'

  class BlankQuestion extends Model
    initialize: (data) ->
      super
      @data.id = data.id if data?
      @data.text = data.text if data?

    update: (callback) ->
      @fetchParams.method = "POST"
      @fetchParams.data =
        model:
          id:       @data.id
          text:     @data.text

      @url = -> "api/blank_question/update"

      editCallback = =>
        @trigger 'updated'
        callback()

      @request(editCallback)

    add: (callback) ->
      @fetchParams.method = "POST"
      @fetchParams.data =
        model:
          text:     @data.text

      @url = -> "api/blank_question/add"

      addCallback = =>
        @trigger 'inserted'
        @publishEvent 'postAdded', @
        callback()

      @request(addCallback)

    delete: (callback) ->
      @fetchParams.method = "POST"
      @fetchParams.data =
        model:
          id: @data.id

      @url = -> "api/blank_question/delete"

      deleteCallback = =>
        @trigger 'deleted'
        callback()

      @request(deleteCallback())


    sync: (callback) ->
      if @data.id
        @update(callback)
      else
        @add(callback)