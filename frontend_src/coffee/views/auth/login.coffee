define [
  'views/base/page'
  'JST'
  'models/auth/login'
], (PageView,
    JST,
    LoginModel
) ->
  'use strict'

  class LoginView extends PageView
    autoRender: true
    className: 'auth_login'

    templateName: 'auth_login'

    render: ->
      super

      loginModel = new LoginModel()
      loginView = new LoginView(model:loginModel)


