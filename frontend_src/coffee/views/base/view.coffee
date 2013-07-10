define [
         'chaplin'
], (Chaplin) ->
  'use strict'

  class View extends Chaplin.View
    #
    initialize: ->
      @checkTemplate()
      if not @autoRender then @rendered = false
#      @subscribeEvent 'logout', ->
#        @authorized = false
#        @softRender()
#      @subscribeEvent 'login', ->
#        @authorized = true
#        @softRender()

    #
    checkTemplate: ->
      if not JST[@templateName]?
        throw "no template with name #{@templateName} found"

    #
    getTemplateFunction: ->
      templateFunc = JST[@templateName]

    #
    softRender: ->
      @$el.html JST[@templateName](@getTemplateData())
      @manageAuthAreas()

    #
    render: ->
      if @rendered
        @$el.html JST[@templateName](@getTemplateData())
      else
        super
        @rendered = true

      @manageAuthAreas()

    #
    setRegion: (region) ->
      @region = region
      @

    #
    manageAuthAreas: ->
      for el in @$el.find("[data-permission='authorized']")
        if @authorized then $(el).show() else $(el).hide()
      for el in @$el.find("[data-permission='not-authorized']")
        if @authorized then $(el).hide() else $(el).show()
      for el in @$el.find("[data-permission='author']")
        if @authorized then $(el).show() else $(el).hide()
      for el in @$el.find("[data-permission='not-author']")
        if @authorized then $(el).hide() else $(el).show()







