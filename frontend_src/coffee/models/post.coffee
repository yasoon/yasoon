define [
  'chaplin',
  'models/base/model'
], (Chaplin, Model) ->
  'use strict'

  class Post extends Model
   fetch: (callback) ->
      @url= -> "api/post/get/#{@id}"
      @fetchParams.method = "GET"
      @fetchParams.data = {}
      @request(callback)

   update: (callback) ->
     @fetchParams.method = "POST"
     @fetchParams.data =
        model:
          id:       @data.id
          authorId: @data.authorId
          caption:  @data.caption
          preview:  @data.preview
          text:     @data.text

     @url = -> "api/post/update"

     editCallback = =>
       @publishEvent 'postUpdated', @data
       callback()

     @request(editCallback)

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

   delete: (callback) ->
     @fetchParams.method = "POST"
     @fetchParams.data =
       model:
         id: @data.id

     @url = -> "api/post/delete"

     deleteCallback = =>
       @publishEvent 'postDeleted', @data
       callback()

     @request(deleteCallback())



   sync: (callback) ->
     if @data.id
       @update(callback)
     else
       @add(callback)