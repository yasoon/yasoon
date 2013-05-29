define [
         'views/base/view'
         'JST'
], (View, JST) ->
  'use strict'

  class AuthorInfoView extends View
  # Automatically render after initialize.
    autoRender: true
    className: 'authorInfo'
    container: '#left'

    templateName: 'authorInfo'

    getTemplateData: ->
      {author: @model.data}