define [
         'chaplin'
], (Chaplin) ->
  'use strict'

  class View extends Chaplin.View
    getTemplateFunction: ->
      templateFunc = JST[@templateName]

    softRender: ->
      @$el.html JST[@templateName](@getTemplateData())

    initialize: ->
      @authorized = true
      @subscribeEvent 'logout', ->
        @authorized = false
        @softRender()
      @subscribeEvent 'login', ->
        @authorized = true
        @softRender()





