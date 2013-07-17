define [
  'chaplin',
  'models/base/model'
], (Chaplin, Model) ->
  'use strict'

  class IndexDaystoryModel extends Model
    name: 'IndexDaystory'

    load: (callback)->
      @url    = -> 'api/post/get_daystory'
      @method = 'GET'
      @request(callback)
