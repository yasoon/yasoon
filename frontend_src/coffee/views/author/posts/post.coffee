define [
         'views/base/editable'
         'JST'
], (EditableView, JST) ->
  'use strict'

  class AuthorPostsPostView extends EditableView
    className: 'post'
#    tagName: 'article'

    templateName: 'author_posts_post'

    modes: ['active', 'preview', 'passive', 'full']

    addCallback: ->
      @publishEvent 'redirect', "author/#{@model.authorId}/posts"
