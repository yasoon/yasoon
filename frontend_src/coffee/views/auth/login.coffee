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
    className: 'barrier'
    container: 'body'

    modes: ['active']

    templateName: 'auth_login'


