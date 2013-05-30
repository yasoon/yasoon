define [
  'chaplin',
  'models/base/model'
], (Chaplin, Model) ->
  'use strict'

  class Question extends Model
   add: (callback) ->
     @fetchParams.method = "POST"
     @fetchParams.data =
        model:
          postId:   @data.postId
          text:     @data.text
          authorId: @data.authorId

     console.log      @fetchParams.data

     @url = -> "api/question/add"

     addCallback = =>
       @publishEvent 'postAdded', @data
       callback()

     @request(addCallback)

   delete: (callback) ->
     @fetchParams.method = "POST"
     @fetchParams.data =
       model:
         id: @data.id

     @url = -> "api/question/delete"

     deleteCallback = =>
       @publishEvent 'postDeleted', @data
       callback()

     @request(deleteCallback())



   sync: (callback) ->
     if @data.id
       @update(callback)
     else
       @add(callback)