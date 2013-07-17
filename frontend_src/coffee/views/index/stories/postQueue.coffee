define [
         'views/base/queue'
         'JST'
         'views/index/stories/post'
         'models/index/stories/post'
], (QueueView, JST, PostView) ->
  'use strict'

  class IndexStoriesPostQueueView extends QueueView
    className: 'IndexStoriesPostQueue'

    templateName: 'index_stories_post_queue'

    sortable: false

    createElementView: (model) ->
      new PostView(model: model)