define [
  'chaplin',
  'models/base/model'
], (Chaplin, Model) ->
  'use strict'

  class Post extends Model
   url: -> "api/post/get/#{@id}"

   update: ->
     console.log 'update'

   add: ->
     @fetchParams.method = "POST"
     @fetchParams.data = {authorId: @data.authorId, caption: @data.caption, preview: @data.preview, text: @data.text }

   sync: ->
     if @data.id
       @update()
     else
       @add()