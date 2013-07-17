define [
  'models/base/queue'
  'models/admin/stories/post'
], (Queue, PostModel) ->
  'use strict'

  class AdminStoriesPostQueueModel extends Queue
    name: 'AdminStoriesPostQueue'
    elementName: 'AdminStoriesPost'


    load: (callback)->
      @url    = -> 'api/post/get_all_last_week'
      @method = 'GET'
      super(callback)

    createElementModel: (elData) ->
      model = new PostModel()
      model.data = elData
      return model