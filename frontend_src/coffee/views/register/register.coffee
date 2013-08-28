define [
         'views/base/editable'
], (EditableView
) ->
  'use strict'

  class RegisterRegisterView extends EditableView
    className: 'register'

    templateName: 'register'

    modes: ['active', 'active_step2']

    addCallback: =>
      @setMode('active_step2')

    updateCallback: =>


