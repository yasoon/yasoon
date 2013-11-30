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
    afterLoginUrl: null

    modes: ['active', 'notify', 'sent']

    templateName: 'auth_login'

    initialize: (params)->
      super(params)
      @callback = params.callback
      @afterLoginUrl = params.afterLoginUrl

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

    addCallback: (data) ->
      @publishEvent 'redirect', if @afterLoginUrl then @afterLoginUrl else 'author/'+@model.data.id+'/posts'
      @callback(false)
      @dispose()
