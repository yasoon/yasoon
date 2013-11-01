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
      @continueRegistration()

    updateCallback: =>



    continueRegistration: =>
      @setMode('active_step2')
      $('#fileuploadr').fileupload({
        dataType: 'json',
        autoUpload: true,
        number: 1,
        done: (e, data) ->
          fileName = data.result.dir + data.result.file_name
          $(".files_success_upload").append('<img src="' + fileName + '" width="53" height="53"/>')
      })
