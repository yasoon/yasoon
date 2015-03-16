define(
  [
    'views/ReviewPageModelView'
    'views/PostAuthorModelView'
    'models/PostAuthorModel'
    'models/ReviewPageModel'
    'models/ReviewViewModel'
    'backbone'
  ]
  (
    ReviewPageModelView
    PostAuthorModelView
    PostAuthorModel
    ReviewPageModel
    ReviewViewModel
  ) ->
    class ReviewPageView extends Backbone.View
      tagName: 'section'

      className: 'page-layout row'

      events: ->
        'click .like-this': 'addLike'

      initialize: (options) ->
        @model = new ReviewViewModel()
        @model.set({'reviewId': options.id})
        @setHandlers()
        @getReviewData()
        

      setHandlers: ->
        @listenTo(@model, 'change:reviewData', @getAuthorData)
        @listenTo(@model, 'change:userData', @createPostAuthor)

      getReviewData: ->
        $.post("/api/post/getReview", {reviewid: @model.get('reviewId')}, (data) => @setSocial(data))

      getAuthorData: ->
        author = @model.get('reviewData')
        $.post("/api/author/getAuthorInfo", {author_id: author.authorId}, (data) => @model.set('userData', data[0]))

      createPostAuthor: ->
        authorModel = new PostAuthorModel(@model.get('userData'))
        if not @postAuthor? then @postAuthor = new PostAuthorModelView({model: authorModel}) else @postAuthor.delegateEvents()
        @$el.append(@postAuthor.render().$el)
        @createReviewContent()

      createReviewContent: ->
        reviewModel = new ReviewPageModel(@setReviewModel())
        if not @reviewPage? then @reviewPage = new ReviewPageModelView({model: reviewModel}) else @reviewPage.delegateEvents()
        @$el.append(@reviewPage.render().$el)
        $('.ratingSpeaker').rating();

      setReviewModel: ->
        _.extend({}, @model.get('reviewData'), {'questionCount': @model.get('userData').answers_count}, {'path': @model.get('path')})

      
      addLike: (event) ->
        event.preventDefault()
        $.post('/api/post/add_likes_review', {'reviewlike': @likeData()}, (data) => @changeLikeCount(data))

      likeData: ->
        _.extend({}, {reviewId: @model.get('reviewId'), type: 'add'})

      changeLikeCount: (data) ->
        if not data.error and data.count then @$el.find('.like-this .counter').text(data.count)

      setSocial: (data) ->
        if data.error == false then @setData(data)
        
      setData: (data) ->
        @model.set('path', data.path)
        @model.set('reviewData', data.result[0])
        
        
        
        
)