define(
  [
    'text!admin/templates/contentTpl.htm'
    'backbone'
    'stickit'
  ]
  (
    contentTpl
  )->
    Backbone.View.extend({
      tagName: 'article'

      template: _.template(contentTpl)

      events:
        'click .js-edit': 'showEdit'
        'click .js-cancel': 'hideEdit'
        'click .js-save': 'saveContent'

      bindings:
        '#description': 'description'
        '#text': 'text'
        '.description': 'description'
        '.text': 'text'

      render: ->
        @$el
          .data('contentId', @model.get('id'))
          .append(@template(@model.toJSON()))

        @stickit()

        @

      showEdit: (event) ->
        event.preventDefault()
        @$('.edit').show().siblings().hide()

      hideEdit: (event) ->
        event.preventDefault()
        @$('.content').show().siblings().hide()

      saveContent: (event) ->
        event.preventDefault()
        $.post('/api/content/edit', {
          model: @model.toJSON()
        }, (data) =>
          if data
            @hideEdit(event)
        , 'json')

    })
)
