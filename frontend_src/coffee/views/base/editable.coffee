define [
         'views/base/view'
         'JST'
], (View, JST) ->
  'use strict'

  class EditableView extends View
    autoRender: false

    #
    events:
      'click': (e) ->
        $target = $(e.target)

        if $target.attr('data-to-mode')? then @setMode $target.attr('data-to-mode')

        if $target.attr('data-send-button')? then @send()

        if $target.attr('data-delete-button')? then @del()

      'keyup': (e) ->
        $target = $(e.target)
        if $target.attr('data-field')?
#          if e.target.tagName is 'INPUT'
          @model.data[$target.attr('data-field')] = $target.val()
    #
    send: ->
      if @model.data.id?
        @update()
      else
        @add()

    #
    add: ->
      @model.add =>
        @addCallback()

    #
    update: ->
      @model.update =>
        @setMode('passive')

    #
    del: ->
      @model.delete()
      @dispose()

    #
    checkTemplate: ->
      for mode in @modes
        tempName = @formatTemplateName(mode)
        if not JST[tempName]?
          throw "no template with name #{tempName} found"

    #
    initialize: ->
      super
      @regionSet = false
      @rendered  = false
      @modesHistory = []

    #
    getTemplateFunction: ->
       JST[@currentTemplateName]

    #
    setRegion: (region) ->
      @region = region
      @regionSet = true
      @

    #
    softRender: ->
      if @rendered
        @$el.html JST[@currentTemplateName](@getTemplateData())
      else
        tnBuffer = @templateName
        @templateName = @currentTemplateName
        @render()
        @templateName = tnBuffer
        @rendered = true

    #
    setMode: (mode, callback) ->
      if @modes.indexOf(mode) is -1 then throw "no mode '#{mode}' available"
      @currentTemplateName = @formatTemplateName(mode)
      @softRender()
      @modesHistory.push(@mode) if @mode ?
      @mode = mode
      callback?()
      @

    #
    formatTemplateName: (mode) ->
      return "#{@templateName+'_'+mode}"

    #
    setPreviousMode: ->
     @setMode(@modesHistory[@modesHistory.length-1])

