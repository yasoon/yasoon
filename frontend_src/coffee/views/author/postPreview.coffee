define [
         'views/base/view'
         'JST'
], (View, JST) ->
  'use strict'

  class AuthorPostPreviewView extends View
  # Automatically render after initialize.
    autoRender: true
    className: 'content'
    region: 'list'

    templateName: 'author_postPreview'

    getTemplateData: ->
      {author: @model.data}