define [
         'views/base/editable'
], (EditableView
) ->
  'use strict'

  class InfoInfoView extends EditableView
    className: 'info'

    templateName: 'info_info'

    modes: ['edit']

    events:
      'click #newpass': ->
        @$el.find('#oldpass').show()
