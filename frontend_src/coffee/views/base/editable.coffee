define [
         'views/base/view'
], (View) ->
  'use strict'

  class EditableView extends View
    modesHistory: []

    getTemplateFunction: ->
       templateFunc = JST[@currentTemplateName]

    setButtonMode:(callback) ->
       @$el.empty()
       @currentTemplateName = "#{templateName}Button"
       @modesHistory.push(@mode) if @mode?
       @mode = 'button'
       @render()
       callback()

    setActiveMode: (callback) ->
       @$el.empty()
       @currentTemplateName = "#{templateName}Active"
       @modesHistory.push(@mode) if @mode?
       @mode = 'active'
       @render()
       callback()

    setPassiveMode: (callback) ->
       @$el.empty()
       @currentTemplateName = "#{templateName}Passive"
       @modesHistory.push(@mode) if @mode?
       @mode = 'passive'
       @render()
       callback()

