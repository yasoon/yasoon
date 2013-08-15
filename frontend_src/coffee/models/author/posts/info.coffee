define [
  'chaplin',
  'models/base/model'
], (Chaplin, Model) ->
  'use strict'

  class AuthorPostsInfoModel extends Model
    name: 'AuthorPostsInfo'

    #
    initialize: (params)->
      super(params)
      @authorId = params.authorId

    load: (callback) ->
      @method = 'GET'
      @url = -> 'api/author/get_short_info/'+@authorId
      @requestData = {}
      @request(callback)

    follow: (callback)->
      @method = 'GET'
      @url = -> 'api/friends/add/'+@authorId
      @requestData = {}
      @request(callback)

    unfollow: (callback)->
      @method = 'GET'
      @url = -> 'api/friends/delete/'+@authorId
      @requestData = {}
      @request(callback)