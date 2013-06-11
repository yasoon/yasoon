define [
         'views/base/view'
         'JST'
], (View, JST) ->
  'use strict'

  class AuthorInfoView extends View
  # Automatically render after initialize.
    autoRender: true
    className: 'authorInfo'
    region: 'info'

    templateName: 'author_info'

#    listen:
#      'updated model': 'render'

    getTemplateData: ->
      {author: @model.data}