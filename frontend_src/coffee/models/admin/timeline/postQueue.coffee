define [
        'models/base/pagingQueue'
        'models/admin/timeline/post'
], (PagingQueue, PostModel) ->
  'use strict'

  class AdminTimelinePostQueueModel extends PagingQueue
    name: 'AdminTimelinePostQueue'
    elementName: 'AdminTimelinePost'

    paging: on

    stackUrl: -> 'api/friends/admin_timeline_stack'
    loadUrl:  -> 'api/friends/timeline'

    createElementModel: (elData) ->
      model = new PostModel()
      model.data = elData
      return model