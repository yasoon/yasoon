define(
  [
    'text!templates/speakerPostTpl.htm'
    'backbone'
  ]
  (
    speakerPostTpl
  ) ->
    class SpeakerPostView extends Backbone.View
      tagName: 'article'
      className: 'lim'
      template: _.template(speakerPostTpl)

      events: ->
        'click .like-this': 'addLike'

      addLike: (event) ->
        event.preventDefault()
        $.post('/api/post/add_likes', {'postlike': {'postId': @model.id, 'type': 'add'}}, (data) => @likesCount(data))

      likesCount: (data) ->
        if not data.error and data.count then @$el.find('.like-this .counter').text(data.count)

      render: ->
        @$el.html(@template(@model.toJSON()))
        @
)