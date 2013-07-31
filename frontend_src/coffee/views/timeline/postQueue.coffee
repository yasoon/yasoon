define [
         'views/base/pagingQueue'
         'JST'
         'views/timeline/post'
], (PagingQueueView, JST, PostView) ->
  'use strict'

  class TimelinePostQueueView extends PagingQueueView
    className: 'TimelinePostQueue'

    templateName: 'timeline_post_queue'

    placeholder: 'timeline_queue_post_placeholder'

    sortable: true

    createElementView: (model) ->
      new PostView(model: model)