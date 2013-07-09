define [
         'views/base/view'
         'JST'
], (View, JST) ->
  'use strict'

  class PostView extends View
  # Automatically render after initialize.
    autoRender: false
    className: 'post'

    # can be: post, post-active, newPostButton
    templateName: 'post'

    modesHistory: []

    initialize: ->
      super
      if @model.data.preview
        @previewTouched = true
      else
        @previewTouched = false

    setButtonMode: ->
      #@model.data = {id: @model.data.id, authorId: @model.data.authorId}
      @$el.empty()
      @templateName = 'newPostButton'
      @modesHistory.push(@mode) if @mode?
      @mode = 'button'
      @render()

    setActiveMode: ->
      @$el.empty()
      @templateName = 'postActive'
      @modesHistory.push(@mode) if @mode?
      @mode = 'active'
      @render()
      @$el.find('.activePostCaption').focus()

    setPassiveMode: ->
      @$el.empty()
      @templateName = 'postPassive'
      @modesHistory.push(@mode) if @mode?
      @mode = 'passive'
      @render()

    events:
      'click #newPostButton': ->
        @setActiveMode()

      'keydown .activePost': (e) ->
        if e.keyCode is 27 #esc
          @setPreviousMode()

      'keyup .activePostBody': (e) ->
        @model.data.text = @$el.find('.activePostBody').val()
        if not @previewTouched
          @model.data.preview = @model.data.text.substring(0,255)
          @$el.find('.activePostPreview').val(@model.data.preview)

      'keyup .activePostPreview': (e) ->
        text = @$el.find('.activePostPreview').val()
        if text
          if e.keyCode in [48..90] or e.keyCode is 32 #space
            @previewTouched = true
        else
          @previewTouched = false
        @model.data.preview = text.substring(0, 300);

      'keyup .activePostCaption': (e) ->
        @model.data.caption = @$el.find('.activePostCaption').val()


      'click #sendPostButton': ->
        @$el.find('#sendPostButton').hide()
        @model.sync =>
          @setPreviousMode()

      'click #editPostButton': ->
        @setActiveMode()

      'click #deletePostButton': ->
        @model.delete =>
          @publishEvent 'redirect', "#author/#{@model.data.authorId}/posts"


    getTemplateData: ->
      {post: @model.data}