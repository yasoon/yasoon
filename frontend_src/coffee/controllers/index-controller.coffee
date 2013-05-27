define [
         'controllers/base/controller'
         'views/index-view'
       ], (Controller, HelloWorldView) ->
  'use strict'

  class HelloController extends Controller
    indexAction: (params) ->
      @view = new IndexView