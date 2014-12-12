define(
  [
    'text!templates/mainPageHistoryTpl.htm'
    'backbone'
  ]
  (
    MainPageHistoryTpl
  ) ->
    class MainPageHistoryView extends Backbone.View
      
      events: ->
        'click .like-this': 'addLike'

      tagName: 'section'

      className: 'main-layout'

      template: _.template(MainPageHistoryTpl)

      render: ->
        @$el.html(@template(@model.toJSON()))
        @

      addLike: (event) ->
        event.preventDefault()
        $.post('/api/post/add_likes', {'postlike': @likeData()}, (data) => @changeLikeCount(data))

      changeLikeCount: (data) ->
        if not data.error and data.count then @$el.find('.like-this .counter').text(data.count)

      likeData: ->
        _.extend({}, {postId: @model.get('id'), type: 'add'})
)