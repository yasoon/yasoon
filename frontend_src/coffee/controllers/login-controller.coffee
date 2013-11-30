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
      Chaplin.mediator.subscribe 'onLogout', @onLogout

      @loginActive = false

    goLogin: (afterLoginUrl) =>
      if not @loginActive
        @loginActive = 1

        loginModel = new LoginModel()
        @loginView = new LoginView(model:loginModel, callback: @setLoginActive, afterLoginUrl: afterLoginUrl)
        @loginView.setMode('active')

    hideLogin: =>
      @loginActive = false
      @loginView.dispose()

    setLoginActive: (state) =>
      @loginActive = state

    onLogout: =>
      alert('onLogout')