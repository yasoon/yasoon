define [
  'controllers/base/controller'
  'chaplin',
  'views/auth/login'
], (
  Controller,
  Chaplin
  LoginView
) ->
  'use strict'

  class LoginController extends Controller
    initialize: ->
      super
      Chaplin.mediator.subscribe 'goLogin', alert 'sf'

    goLogin: ->
      alert 'login'
      loginView = new LoginView();
