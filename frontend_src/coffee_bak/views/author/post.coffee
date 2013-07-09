define [
         'views/base/editable'
         'JST'
         'tinyEditor'
], (EditableView, JST, TinyEditor) ->
  'use strict'

  class PostView extends EditableView
    templateName: 'author_post_view'
  # Automatically render after initialize.
    autoRender: false
    className: ''
    tagName: 'article'

    initialize: ->
      super
      if @model.data.preview
        @previewTouched = true
      else
        @previewTouched = false

    events:
      'click h3': ->
        @setActiveMode() if @mode isnt 'active'

      #active events
      'keydown #body': (e) ->
        if e.keyCode is 27 #esc
          @setPreviousMode()

      'keydown #caption': (e) ->
        if e.keyCode is 27 #esc
          @setPreviousMode()

      'keyup #body': (e) ->
          @model.data.text = $(e.target).val()
          if not @previewTouched
            @model.data.preview = @model.data.text.substring(0,255)
            @$el.find('#preview').val(@model.data.preview)

      'keyup #preview': (e)->
        text = @$el.find('#preview').val()
        if text
          if e.keyCode in [48..90] or e.keyCode is 32 #space
            @previewTouched = true
        else
          @previewTouched = false
        @model.data.preview = text.substring(0, 300);

      'keyup #caption': (e) ->
          @model.data.caption = $(e.target).val()

      'click #sendButton': (e) ->
        @$el.find('#buttons').hide()
        if @model.id
          @model.update =>
            @publishEvent 'redirect', '#author/1/posts' #AUTHOR ID!!!
        else
          @model.add =>
            @publishEvent 'redirect', '#author/1/posts'

      'click #previewButton': (e) ->
        @setPassiveMode()

      'click #editButton': (e) ->
        @setActiveMode()


    setActiveMode: ->
      super
      @$el.find('#body').focus()

    getTemplateData: =>
      {post: @model.data, authorized: @authorized}

    render: ->
      super
      @$el.attr('id', @model.data.id)




