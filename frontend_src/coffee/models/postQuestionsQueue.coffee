define [
  'chaplin',
  'models/base/model'
], (Chaplin, Model) ->
  'use strict'

  class PostQuestionsQueue extends Model
    fetch: (callback) ->
      @url = -> "api/post/get_questions/#{@id}"
      @fetchParams =
        method: 'GET'
        data: {}
      @request(callback)

    initialize: ->
      super
      @subscribeEvent 'questionAdded', @questionAddedHandler

    questionAddedHandler: (post) ->
      if @id is post.authorId
        @data.unshift post
        @trigger 'updated'
