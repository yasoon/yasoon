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
    initialize: ->
      super
      Chaplin.mediator.subscribe 'goLogin', @goLogin()

    goLogin: ->
      loginModel = new LoginModel()
#      loginView = new LoginView(model:loginModel)
