define [
         'chaplin'
], (Chaplin) ->
  'use strict'

  class View extends Chaplin.View
    getTemplateFunction: ->
      templateFunc = JST[@templateName]

    softRender: ->
      @$el.html JST[@templateName](@getTemplateData())

    manageAuthAreas: ->
      for el in @$el.find('.auth-area')
        if @authorized then $(el).show() else $(el).hide()

    initialize: ->
      @authorized = true
      @subscribeEvent 'logout', ->
        @authorized = false
        @softRender()
      @subscribeEvent 'login', ->
        @authorized = true
        @softRender()





