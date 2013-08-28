define [
  'chaplin',
  'models/base/model'
], (Chaplin, Model) ->
  'use strict'

  class BlogPageModel extends Model
    name: 'BlogPageModel'

    follow: (callback)->
      @method = 'GET'
      @url = -> 'api/friends/add/0/'
      @requestData = {}
      @request(callback)

    unfollow: (callback)->
      @method = 'GET'
      @url = -> 'api/friends/delete/0'
      @requestData = {}
      @request(callback)