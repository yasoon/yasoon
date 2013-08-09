define [
        'controllers/base/controller'
        'views/register/page'
], (
  Controller,
  RegisterPageView
) ->
  'use strict'

  class RegisterController extends Controller

    #Work with questions in blank
    indexAction: ->
      @view = new RegisterPageView()


