define [
         'chaplin'
], (Chaplin) ->
  'use strict'

  class View extends Chaplin.View

    checkTemplate: ->
      if not JST[@templateName]?
        throw "no template with name #{@templateName} found"

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
      @checkTemplate()

      @authorized = true
      @subscribeEvent 'logout', ->
        @authorized = false
        @softRender()
      @subscribeEvent 'login', ->
        @authorized = true
        @softRender()





