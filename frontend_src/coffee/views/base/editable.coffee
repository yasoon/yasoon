define [
         'views/base/view'
], (View) ->
  'use strict'

  class EditableView extends View


    getTemplateFunction: ->
       templateFunc = JST[@currentTemplateName]

    setRegion: (region) ->
      @region = region
      @

    initialize: ->
      super
      @modesHistory =  []

    rendered: false

    softrender: ->
      if @rendered
        @$el.html JST[@currentTemplateName](@getTemplateData())
      else
        @render()
        @rendered = true

    setButtonMode:(callback) ->
       @currentTemplateName = "#{@templateName}Button"
       @softrender()
       @modesHistory.push(@mode) if @mode?
       @mode = 'button'
       callback?()

    setActiveMode: (callback) ->
      @currentTemplateName = "#{@templateName}Active"
      @softrender()
      @modesHistory.push(@mode) if @mode?
      @mode = 'active'
      callback?()

    setPassiveMode: (callback) ->
       @currentTemplateName = "#{@templateName}Passive"
       @softrender()
       @modesHistory.push(@mode) if @mode?
       @mode = 'passive'
       callback?()

    setPreviousMode: ->
      if @modesHistory[@modesHistory.length-1] is 'button'
        @setButtonMode()
      else if @modesHistory[@modesHistory.length-1] is 'active'
        @setActiveMode()
      else if @modesHistory[@modesHistory.length-1] is 'passive'
        @setPassiveMode()

