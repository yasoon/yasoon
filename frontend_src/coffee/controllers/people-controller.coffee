define [
        'controllers/base/controller'
        'views/people/page'
], (
  Controller,
  PeoplePageView
) ->
  'use strict'

  class PeopleController extends Controller

    #Work with questions in blank
    listAction: (params) ->
      @view = new PeoplePageView()
