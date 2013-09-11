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
      $('#fileupload').fileupload({
            dataType: 'json',
            autoUpload: true,
            number: 1,
            done: (e, data) ->
                $.each(data.result, (index, file) ->
                      fileName = file.dir + file.file_name
                      $(".files_success_upload").append('<img src="' + fileName + '" width="53" height="53"/>')
                )
      })
