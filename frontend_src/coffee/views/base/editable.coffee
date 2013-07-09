define [
         'views/base/view'
         'JST'
], (View, JST) ->
  'use strict'

  class EditableView extends View
    autoRender: false

    events:
      'click': (e) ->
        target = $(e.target)

        if target.attr('data-to-mode')? then @setMode target.attr('data-to-mode')

        if target.attr('data-send-button')? then @send()

        if target.attr('data-delete-button')? then @del()

    send: ->
      if @model.id?
        @update()
      else
        @add()

    add: ->
      @setMode('button')

    update: ->
      @setMode('passive')


    del: ->
      console.log 'delete'

    checkTemplate: ->
      for mode in @modes
        tempName = @formatTemplateName(mode)
        if not JST[tempName]?
          throw "no template with name #{tempName} found"

    initialize: ->
      super
      @regionSet = false
      @rendered  = false
      @modesHistory = []


    getTemplateFunction: ->
       templateFunc = JST[@currentTemplateName]

    setRegion: (region) ->
      @region = region
      @regionSet = true
      @

    render: ->
      if @rendered
        @$el.html JST[@currentTemplateName](@getTemplateData())
      else
        tnBuffer = @templateName
        @templateName = @currentTemplateName
        super
        @templateName = tnBuffer
        @rendered = true
      if $('#q').get(0)?
        $('#q').focus()

    setMode: (mode, callback) ->
      @currentTemplateName = @formatTemplateName(mode)
      @render()
      @modesHistory.push(@mode) if @mode ?
      @mode = mode
      callback?()
      @

    formatTemplateName: (mode) ->
      return "#{@templateName+'_'+mode}"

    setPreviousMode: ->
     @setMode(@modesHistory[@modesHistory.length-1])

