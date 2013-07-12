define [
  'views/base/view'
  'JST'
], (View, JST) ->
  'use strict'

  class CommonMessageView extends View
    # Automatically render after initialize.
    autoRender: true
    className: 'barrier'
    container: 'body'

    templateName: 'common_message'

    initialize: (data) ->
      @caption = data.caption
      @text = data.text

    getTemplateData: ->
      {caption: @caption, text: @text}


    events:
      'click #disposeButton': ->
        @dispose()


