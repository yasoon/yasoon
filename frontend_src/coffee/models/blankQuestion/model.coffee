define [
  'chaplin',
  'models/base/model'
], (Chaplin, Model) ->
  'use strict'

  class BlankQuestion extends Model

    update: (callback) ->
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

      @fetchParams.method = "POST"
      @fetchParams.data =
        model:
          text:     @data.text
          place:    @data.place

      console.log @fetchParams.data
      @url = -> "api/blank_question/add"

      addCallback = =>
#        @publishEvent 'postAdded', @
        callback()

      @request(addCallback)

    delete: (callback) ->
      @fetchParams.method = "POST"
      @fetchParams.data =
        model:
          id: @data.id

      @url = -> "api/blank_question/delete"

      deleteCallback = =>
        callback?()

      @request(deleteCallback())
