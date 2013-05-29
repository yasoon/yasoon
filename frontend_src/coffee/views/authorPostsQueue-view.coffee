define [
         'views/base/view'
         'JST'
], (View, JST) ->
  'use strict'

  class AuthorPostsQueueView extends View
  # Automatically render after initialize.
    autoRender: true
    className: 'authorPosts'
    region: 'queue'

    templateName: 'authorPostsQueue'

    listen:
      'updated model': 'render'

    getTemplateData: ->
      {posts: @model.data}
