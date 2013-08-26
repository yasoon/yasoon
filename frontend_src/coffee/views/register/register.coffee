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

    events:
      'click .reg_srep2': ->
        @model.addStep2()

    add: =>
      @model.add(@continueRegistration)

    continueRegistration: =>
      @setMode('active_step2')
      $('#fileupload').fileupload({
            dataType: 'json',
            done: (e, data) ->
               $.each(data.result.files, (index, file) ->
                   $('<p/>').text(file.name).appendTo(document.body);
               )
      })
