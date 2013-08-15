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
      Handlebars.registerHelper 'equals', (a, b, block) ->
        if parseInt(a) is parseInt(b)
          return block.fn(this)
        else
          return block.inverse(this)


    #
    checkTemplate: ->
      if not JST[@templateName]?
        throw "no template with name #{@templateName} found"

    #
    getTemplateFunction: ->
      templateFunc = JST[@templateName]

    render: ->
      super
      @manageAuthAreas()
      @manageEditableContent()

    #
    softRender: ->
      console.log 'softRender'
      if @rendered
        @$el.html JST[@templateName](@getTemplateData())
      else
        @render()
        @rendered = true

      @manageAuthAreas()
      @manageEditableContent()

    #
    setRegion: (region) ->
      @region = region
      @

    manageEditableContent: ->
      for el in @$el.find("[data-managed-content]")
        id = $(el).attr('data-managed-content')
        $(el).html managedContent[id].text

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




