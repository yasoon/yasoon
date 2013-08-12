define [
  'views/base/page'
  'JST'
], (PageView,
    JST
) ->
  'use strict'

  class LoginView extends PageView
    autoRender: true
    className: 'auth_login'

    templateName: 'auth_login'


