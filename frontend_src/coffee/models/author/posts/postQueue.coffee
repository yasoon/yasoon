define [
         'models/base/queue'
         'models/author/posts/post'
], (Queue, PostModel) ->
  'use strict'

  class AuthorPostsPostQueueModel extends Queue
    name: 'AuthorPostsPostQueue'
    elementName: 'AuthorPostsPost'

    initialize: (params) ->
      super
      @authorId = params.authorId

    load: (callback) ->
      @url    = -> 'api/author/get_posts/'+@authorId
      @method = 'GET'
      super(callback)

    updatePlaces: (callback) ->
      @url = -> 'api/author/update_posts_places/'+@authorId
      @method = 'POST'
      super(callback)

    createElementModel: (elData) ->
      model = new PostModel(authorId: elData.authorId)
      model.data = elData
      return model