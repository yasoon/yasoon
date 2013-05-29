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

    @previewTouched = false

    setButtonMode: ->
      @templateName = 'newPostButton'
      @modesHistory.push(@mode) if @mode?
      @mode = 'button'
      @render()

    setActiveMode: ->
      @templateName = 'postActive'
      @modesHistory.push(@mode) if @mode?
      @mode = 'active'
      @render()
      @$el.find('.activePostCaption').focus()

    setPassiveMode: ->
      @templateName = 'postPassive'
      @modesHistory.push(@mode) if @mode?
      @mode = 'passive'
      @render()

    events:
      'click #newPostButton': ->
        @setActiveMode()

      'keydown .activePost': (e) ->
        if e.keyCode is 27 #esc
          return @setButtonMode()


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
          @model.data = {authorId: @model.data.authorId}
          @setButtonMode()


    getTemplateData: ->
      {post: @model.data}