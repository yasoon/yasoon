define [
        'models/base/pagingQueue'
        'models/timeline/post'
], (PagingQueue, PostModel) ->
  'use strict'

  class TimelinePostQueueModel extends PagingQueue
    name: 'TimelinePostQueue'
    elementName: 'TimelinePost'

    paging: on

    stackUrl: -> 'api/friends/timeline_stack'
    loadUrl:  -> 'api/friends/timeline'

    createElementModel: (elData) ->
      model = new PostModel()
      model.data = elData
      return model