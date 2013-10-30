define [
  'controllers/base/controller'
  'chaplin',
  'views/auth/login'
  'models/auth/login'
], (
  Controller,
  Chaplin
  LoginView
  LoginModel
) ->
  'use strict'

  class LoginController extends Controller
    initialize: =>
      super
      Chaplin.mediator.subscribe 'goLogin', @goLogin
      Chaplin.mediator.subscribe 'hideLogin', @hideLogin

      @loginActive = false

    goLogin: =>
      if not @loginActive
        @loginActive = 1

        loginModel = new LoginModel()
        @loginView = new LoginView(model:loginModel, callback: @setLoginActive)
        @loginView.setMode('active')

    hideLogin: =>
      @loginActive = false
      @loginView.dispose()

    setLoginActive: (state) =>
      @loginActive = state