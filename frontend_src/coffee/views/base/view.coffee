define [
         'chaplin',
         'handlebars'
], (Chaplin, Handlebars) ->
  'use strict'

  class View extends Chaplin.View
    autoRender: false

    #
    events:
      'click': (e) ->
        $target = $(e.target)

        if $target.attr('data-link')? then @publishEvent 'redirect', $target.attr('data-link')

    #
    initialize: ->
      @initHandlebarsHelpers()
      @checkTemplate()
      if not @autoRender then @rendered = false

    #
    initHandlebarsHelpers: ->
      Handlebars.registerHelper 'ifEquals', (a, b, block) ->
        console.log a is b
        if parseInt(a) is parseInt(b)
          return block.fn(this)


    #
    checkTemplate: ->
      if not JST[@templateName]?
        throw "no template with name #{@templateName} found"

    #
    getTemplateFunction: ->
      templateFunc = JST[@templateName]

    #
    softRender: ->
      if @rendered
        @$el.html JST[@templateName](@getTemplateData())
      else
        @render()
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

    #
    getTemplateData: ->
      if @model? then {model: @model.data}




