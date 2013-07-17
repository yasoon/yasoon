define [
  'chaplin',
  'models/base/model'
], (Chaplin, Model) ->
  'use strict'

  class AdminStoriesPostModel extends Model
    name: 'AdminStoriesPost'

    assignAsDayStory: (callback) ->
      @method = 'GET'
      @url    = -> 'api/post/set_daystory/'+@data.id
      @request(callback, true)

    addLikes: (likes, callback) ->
      @method = 'POST'
      @url = -> 'api/post/add_likes/'+@data.id
      @requestData = likes: likes
      @request(callback, true)