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
        if $target.attr('data-to-login')? then @publishEvent 'goLogin', $target.attr('data-to-login')

    #
    initialize: ->
      @initHandlebarsHelpers()
      @checkTemplate()
      @rendered = false

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
      @rendered = true

    #
    softRender: ->
      if @rendered
        @$el.html JST[@templateName](@getTemplateData())
        pressFooter()
        @manageAuthAreas()
        @manageEditableContent()
      else
        @render()

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
        elementsThatHavePermission = @$el.find("[data-permission]")
        map = $.map(elementsThatHavePermission, (it) ->
          {el: it, perm: $(it).attr('data-permission').split(',')})
        for it in map
          b = @model.access in it.perm
          if b then $(it.el).show() else $(it.el).hide()

#        for el in @$el.find("[data-permission='ANON']")
#          if @model.access is 'ANON' then $(el).show() else $(el).hide()
#        for el in @$el.find("[data-permission='USER']")
#          if @model.access is 'USER' then $(el).show() else $(el).hide()
#        for el in @$el.find("[data-permission='ADMIN']")
#          if @model.access is 'ADMIN' then $(el).show() else $(el).hide()

    permissions:
      'admin' : ['create', 'update', 'read']
      'guest' : ['read']
      'author': ['create', 'update', 'read']
      'user'  : ['read']

    #
    getTemplateData: ->
      if @model? then {model: @model.data}
