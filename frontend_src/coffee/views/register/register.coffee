define [
         'views/base/editable',
         'jqueryui',
         'jquery.ui.widget'
         'jqueryupload',
         'jqueryuploadiframetransport'
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



    continueRegistration: =>
      @setMode('active_step2')
