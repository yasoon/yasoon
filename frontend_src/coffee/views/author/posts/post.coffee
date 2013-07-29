define [
         'views/base/editable'
         'JST'
         'categories'
], (EditableView, JST, categories) ->
  'use strict'

  class AuthorPostsPostView extends EditableView
    className: 'post'

    templateName: 'author_posts_post'

    modes: ['active', 'preview', 'passive', 'full']

    addCallback: ->
      @publishEvent 'redirect', "author/#{@model.authorId}/posts"

    updateCallback: ->
      @publishEvent 'redirect', "author/#{@model.authorId}/posts"

    getTemplateData: ->
      cats = {}
      for key, cat of categories
        cats[key] = cat if key > 0

      data = super
      data.categories =  cats
      data
