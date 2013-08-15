define [
         'views/base/editable'
], (EditableView
) ->
  'use strict'

  class RegisterRegisterView extends EditableView
    className: 'register'

    templateName: 'register'

    modes: ['active']

    add: ->
#      $(@$el).find('.regbtn').attr('disable','')
      @model.add()