define [
         'views/base/editable'
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
