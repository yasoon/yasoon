define [
         'views/base/editable'
         'JST'
], (EditableView, JST) ->
  'use strict'

  class AdminContentRowView extends EditableView
    className: 'row'

    templateName: 'admin_content_row'

    modes: ['passive', 'active']

    updateCallback: ->
      @setMode('passive')