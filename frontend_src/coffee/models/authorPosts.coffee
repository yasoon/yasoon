define [
  'chaplin',
  'models/base/model'
], (Chaplin, Model) ->
  'use strict'

  class AuthorPosts extends Model
    fetch: (callback) ->
      @url = -> "api/author/get_posts/#{@id}"
      @request(callback)

    initialize: ->
      super
      @subscribeEvent 'postAdded', @postAddedHandler

    postAddedHandler: (post) ->
      if @id is post.authorId
        @data.unshift post
        @trigger 'updated'
