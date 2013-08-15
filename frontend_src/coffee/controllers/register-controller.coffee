define [
        'controllers/base/controller'
        'views/register/page'
        'views/info/page'
], (
  Controller,
  RegisterPageView,
  InfoPageView
) ->
  'use strict'

  class RegisterController extends Controller

    #
    indexAction: ->
      @view = new RegisterPageView()

    #
    editInfoAction: ->
      @view = new InfoPageView()


