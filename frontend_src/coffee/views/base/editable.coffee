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

        if $target.attr('data-send-button')? then if not $target.attr('disable')? then @send()

        if $target.attr('data-delete-button')? then @del()

      'keyup': (e) ->
        $target = $(e.target)
        if $target.attr('data-field')
          if $(e.target).is('input')
            @model.data[$target.attr('data-field')] = $target.val()
          else
            @model.data[$target.attr('data-field')] = $target.html()

      'change': (e) ->
        $target = $(e.target)
        if $target.is("select") and $target.attr('data-field')?
          @model.data[$target.attr('data-field')] = $target.find('option:selected').attr('id')
          #@model.dataField[$target.attr('data-field')] = $target
    #
    send: ->
      ell = @model
      self = @
      count = $(@el).find('[data-get-pre-send]').length

      if count is 0
        @callBackFn()
        
      $(@el).find('[data-get-pre-send]').each(->
        if $(@).is('input')
          ell.data[$(@).attr('data-field')] = $(@).val()
        else
          ell.data[$(@).attr('data-field')] = $(@).html()

        if (!--count)
          self.callBackFn()
      )


    callBackFn: =>
      console.log @model , @model.data.id
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
        @updateCallback()

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
    softRender: ->
      if @rendered
        @$el.html JST[@currentTemplateName](@getTemplateData())
        @manageEditableContent()
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

