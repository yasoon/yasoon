define [
         'views/base/editable'
         'JST'
         'categories'
], (EditableView, JST, categories) ->
  'use strict'

  class AuthorPostsNewBlankCaptionView extends EditableView
    className: 'interview'
    tagName: 'article'

    templateName: 'author_posts_new_blank_caption'

    modes: ['passive', 'active']

    getTemplateData: ->
      cats = {}
      for key, cat of categories
        cats[key] = cat if key > 0
      {categories: cats}
