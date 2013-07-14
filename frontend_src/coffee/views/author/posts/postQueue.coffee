define [
         'views/base/queue'
         'JST'
         'views/author/posts/post'
         'models/author/posts/post'
], (QueueView, JST, PostView) ->
  'use strict'

  class AuthorPostsPostQueueView extends QueueView
    className: 'authorPostsPostQueue'

    templateName: 'author_posts_post_queue'

    sortable: true

    createElementView: (model) ->
      new PostView(model: model)