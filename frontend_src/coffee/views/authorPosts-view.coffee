define [
         'views/base/view'
         'JST'
], (View, JST) ->
  'use strict'

  class AuthorPostsView extends View
  # Automatically render after initialize.
    autoRender: true
    className: 'authorPosts'
    container: '#center'
    regions:
      '#newPost': 'newPost'

    templateName: 'authorPosts'

    getTemplateData: ->
      {author: @model.data}