define [
  'chaplin',
  'models/base/model'
], (Chaplin, Model) ->
  'use strict'

  class Post extends Model
   fetch: (callback) ->
      @url= -> "api/post/get/#{@id}"
      @request(callback)

   update: ->
     console.log 'update'

   add: (callback) ->
     @fetchParams.method = "POST"
     @fetchParams.data =
        model:
          authorId: @data.authorId
          caption:  @data.caption
          preview:  @data.preview
          text:     @data.text

     @url = -> "api/post/add"

     addCallback = =>

       @publishEvent 'postAdded', @data
       callback()

     @request(addCallback)

   sync: (callback) ->
     if @data.id
       @update(callback)
     else
       @add(callback)