define [
  'views/base/editable'
  'JST'
  'models/auth/login'
], (EditableView,
    JST,
    LoginModel
) ->
  'use strict'

  class LoginView extends EditableView
    autoRender: true
    className: 'login'
    container: 'body'

    modes: ['active', 'notify', 'sent']

    templateName: 'auth_login'

    events:
      'click .go_register': ->
        @dispose()

      'click': (e) ->
        $target = $(e.target)

        if $target.hasClass('barrier') or $target.attr('id') is 'closeButton'
          @publishEvent 'hideLogin'

        if $target.attr('id') is 'notify'
          @model.notify =>
            @setMode('sent')

    addCallback: ->
      console.log 'add'
