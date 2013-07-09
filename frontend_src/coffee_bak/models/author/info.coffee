define [
  'chaplin',
  'models/base/model'
], (Chaplin, Model) ->
  'use strict'

  class AuthorInfo extends Model
    fetch: (callback) =>
      @fetchParams = {}
      @fetchParams.method = "GET"
      @fetchParams.data = {}

      @url =  -> "api/author/get_short_info/#{@id}"

      fetchCallback = =>
        callback?()

      @request(fetchCallback)


#


#    fetch: (callback) ->
#      @fetchParams = {}
#      @fetchParams =
#       method: 'GET'
#       data: {}
#
#     @url =  -> "api/author/get_short_info/#{@id}"
#     @request(callback)
#
#
#   initialize: ->
#       super
#       @subscribeEvent 'postAdded', @postAddedHandler
#       @subscribeEvent 'postDeleted', @postDeletedHandler
#       @subscribeEvent 'answerAdded', @answerAddedHandler
#
#   postAddedHandler: (post) ->
#     if @data.id is parseInt(post.authorId)
#       @data.posts++
#       @trigger 'updated'
#
#   postDeletedHandler: (post) ->
#     if @data.id is parseInt(post.authorId)
#        @data.posts--
#        @trigger 'updated'
#
#   answerAddedHandler: (post) ->
#     if @data.id is parseInt(post.authorId)
#       @data.answers++
#       @trigger 'updated'