define [
         'models/base/queue'
         'models/timeline/post'
], (Queue, PostModel) ->
  'use strict'

  class TimelinePostQueueModel extends Queue
    name: 'TimelinePostQueue'
    elementName: 'TimelinePost'

    paging: on

    load: (callback) ->
      @url    = -> 'api/friends/timeline/'+@offset
      @method = 'GET'
      super(callback)

    createElementModel: (elData) ->
      model = new PostModel()
      model.data = elData
      return model