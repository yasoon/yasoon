define [
  'chaplin',
  'models/base/model'
], (Chaplin, Model) ->
  'use strict'

  class AuthorInfo extends Model
   fetch: (callback) ->
     @url =  -> "api/author/get_short_info/#{@id}"
     @request(callback)

   initialize: ->
       super
       @subscribeEvent 'postAdded', @postAddedHandler

   postAddedHandler: (post) ->
     if @data.id is parseInt(post.authorId)
       @data.posts++
       @trigger 'updated'
