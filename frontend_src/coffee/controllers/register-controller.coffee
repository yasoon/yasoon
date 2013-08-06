define [
        'controllers/base/controller'
        'views/register/page'
        'lib/validate'
], (
  Controller,
  RegisterPageView,
  Validate
) ->
  'use strict'

  class RegisterController extends Controller

    #Work with questions in blank
    indexAction: ->
      @view = new RegisterPageView()

    submtAction: ->
      alert "aaa"


