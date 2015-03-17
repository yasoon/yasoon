define(
  [
    'text!templates/speakerPostTpl.htm'
    'text!templates/oneReviewPreviewTpl.htm'
    'backbone'
  ]
  (
    speakerPostTpl
    oneReviewPreviewTpl
  ) ->
    class SpeakerPostView extends Backbone.View
      tagName: 'article'
      className: 'lim'
      template: _.template(speakerPostTpl)
      
      reviewTemplate: _.template(oneReviewPreviewTpl)

      events: ->
        'click .like-this': 'addLike'
        'click .like-this-review': 'addLikeReview'
        

      addLike: (event) ->
        event.preventDefault()
        $.post('/api/post/add_likes', {'postlike': {'postId': @model.id, 'type': 'add'}}, (data) => @likesCount(data))
        
      addLikeReview: (event) ->
        event.preventDefault()
        $.post('/api/post/add_likes_review', {'reviewlike': {'reviewId': @model.id, 'type': 'add'}}, (data) => @likesCountReview(data))


      likesCount: (data) ->
        if not data.error and data.count then @$el.find('.like-this .counter').text(data.count)
        
      likesCountReview: (data) ->
        if not data.error and data.count then @$el.find('.like-this-review .counter').text(data.count)

      render: ->
        if @model.get('type') == 'post' then  @$el.html(@template(@model.toJSON()))
        else  if @model.get('type') == 'review' then @$el.html(@reviewTemplate(@model.toJSON()))
        @
        
)