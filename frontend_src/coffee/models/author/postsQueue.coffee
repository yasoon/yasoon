define [
  'chaplin',
  'models/base/model'
], (Chaplin, Model) ->
  'use strict'

  class AuthorPostsQueue extends Model
    initialize: ->
      @posts = []
      super

    fetch: (callback) ->
      @fetchParams = {}
      @fetchParams =
          method: 'GET'
      data: {}
      @url = -> "api/author/get_posts/#{@id}"

      fetchCallback = =>
        @posts = @data
        callback()

      @request(fetchCallback)