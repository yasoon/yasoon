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

    events:
      'click .post': (e) ->
        target = $(e.target)
        while not target.hasClass('post')
          target = target.parent()

        @publishEvent 'redirect', '#post/'+target.attr('id')


    getTemplateData: ->
      {posts: @model.data}
