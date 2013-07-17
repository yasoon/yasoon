define [
         'models/base/queue'
         'models/index/stories/post'
], (Queue, PostModel) ->
  'use strict'

  class IndexStoriesPostQueueModel extends Queue
    name: 'IndexStoriesPostQueue'
    elementName: 'IndexStoriesPost'

    load: (callback) ->
      @method = 'GET'
      @url = -> 'api/post/get_best_posts'
      @requestData = {}
      super(callback)

    createElementModel: (data) ->
      model = new PostModel()
      model.data = data
      model