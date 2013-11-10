define [
         'chaplin',
         'handlebars'
         'helper'
], (Chaplin, Handlebars, Helper) ->
  'use strict'

  class View extends Chaplin.View
    autoRender: false

    #
    events:
      'click': (e) ->
        $target = $(e.target)

        if $target.attr('data-link')? then @publishEvent 'redirect', $target.attr('data-link')
        if $target.attr('data-to-login')? then @publishEvent 'goLogin'

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
      pressFooter()

    #
    softRender: ->
      if @rendered
        @$el.html JST[@templateName](@getTemplateData())
      else
        @render()
        @rendered = true

      pressFooter()

      @managerAuthAreas()
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
      if @model?.access?
        for el in @$el.find("[data-permission='ANON']")
          if @model.access is 'ANON' then $(el).show() else $(el).hide()
        for el in @$el.find("[data-permission='USER']")
          if @model.access is 'USER' then $(el).show() else $(el).hide()
        for el in @$el.find("[data-permission='ADMIN']")
          if @model.access is 'ADMIN' then $(el).show() else $(el).hide()

    permissions:
      'admin' : ['create', 'update', 'read']
      'guest' : ['read']
      'author': ['create', 'update', 'read']
      'user'  : ['read']

    #
    getTemplateData: ->
      if @model? then {model: @model.data, isLoggedIn: @model.isLoggedIn}
