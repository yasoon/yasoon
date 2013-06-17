define [
  'chaplin',
  'models/base/model'
], (Chaplin, Model) ->
  'use strict'

  class Post extends Model

    initialize: (obj) ->
      super

    update: (callback) ->
      @fetchParams = {}
      @fetchParams.method = "POST"
      @fetchParams.data =
        model:
          id:      @data.id
          caption: @data.caption
          answer:  @data.description
          text:    @data.text

      @url = -> "api/post/update"

      editCallback = =>
        callback()

      @request(editCallback)

    add: (callback) ->
      @fetchParams.data = {}
      @fetchParams.method = "POST"
      @fetchParams.data = {model: {caption: @data.caption, preview: @data.preview, text: @data.text}}

      console.log @fetchParams.data

      @url = -> "api/post/add"

      addCallback = =>
        callback()

      @request(addCallback)

    delete: (callback) ->
      @fetchParams = {}
      @fetchParams.method = "POST"
      @fetchParams.data = {model: id: @data.id}

      @url = -> "api/post/delete"


      deleteCallback = =>
        callback?()

      @request(deleteCallback())
