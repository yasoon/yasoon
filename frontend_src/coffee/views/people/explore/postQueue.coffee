define [
         'views/base/queue'
         'JST'
         'views/people/explore/post'
], (QueueView, JST, PostView) ->
  'use strict'

  class PeopleExplorePostQueueView extends QueueView
    className:    'PeopleExplorePostQueue'

    templateName: 'people_explore_post_queue'

    placeholder:  'people_author_queue_placeholder'

    sortable: true

    createElementView: (model) ->
      new PostView(model: model)