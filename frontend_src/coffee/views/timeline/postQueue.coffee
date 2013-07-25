define [
         'views/base/queue'
         'JST'
         'views/timeline/post'
], (QueueView, JST, PostView) ->
  'use strict'

  class TimelinePostQueueView extends QueueView
    className: 'TimelinePostQueue'

    templateName: 'timeline_post_queue'

    placeholder: 'timeline_queue_post_placeholder'

    sortable: true

    createElementView: (model) ->
      new PostView(model: model)