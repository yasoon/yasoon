define [
  'views/base/view'
  'JST'
], (View, JST) ->
  'use strict'

  class AuthorPostsQueue extends View
    className: 'postQueue'
    autoRender: true
    region: 'queue'
    regions:
      '#list': 'list'

    templateName: 'author_postsQueue'

    getTemplateData: ->
      {posts: @model.posts, authorized: @authorized}


