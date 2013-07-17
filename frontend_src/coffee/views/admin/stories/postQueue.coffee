define [
         'views/base/queue'
         'JST'
         'views/admin/stories/post'
], (QueueView, JST, PostView) ->
  'use strict'

  class AdminStoriesPostQueueView extends QueueView
    className: 'storiesPostQueue'

    templateName: 'admin_stories_post_queue'

    sortable: false

    createElementView: (model) ->
      new PostView(model: model)