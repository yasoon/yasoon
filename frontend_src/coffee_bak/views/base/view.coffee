define [
         'chaplin'
], (Chaplin) ->
  'use strict'

  class View extends Chaplin.View
    getTemplateFunction: ->
      templateFunc = JST[@templateName]

    softRender: ->
      @$el.html JST[@templateName](@getTemplateData())
      @manageAuthAreas()

    render: ->
      super
      @manageAuthAreas()

    manageAuthAreas: ->
      for el in @$el.find("[data-permission='authorized']")
        if @authorized then $(el).show() else $(el).hide()
      for el in @$el.find("[data-permission='not-authorized']")
        if @authorized then $(el).hide() else $(el).show()
      for el in @$el.find("[data-permission='author']")
        if @authorized then $(el).show() else $(el).hide()
      for el in @$el.find("[data-permission='not-author']")
        if @authorized then $(el).hide() else $(el).show()

    initialize: ->
      @authorized = true
      @subscribeEvent 'logout', ->
        @authorized = false
        @softRender()
      @subscribeEvent 'login', ->
        @authorized = true
        @softRender()





