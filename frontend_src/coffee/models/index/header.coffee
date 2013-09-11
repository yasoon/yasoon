define [
  'chaplin',
  'models/base/model'
], (Chaplin, Model) ->
  'use strict'

  class IndexHeaderModel extends Model
    name: 'IndexHeader'

    load: (callback)->
      @url    = -> 'api/author/get_status_info'
      @method = 'GET'
      @request(callback)

    logout: (callback) ->
      @url    = -> 'logout'
      @method = 'GET'
      logoutCallback = =>
        @access = 'ANON'
        callback?()
      @request(logoutCallback)
