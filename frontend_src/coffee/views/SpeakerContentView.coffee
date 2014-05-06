define(
  [
    'views/SpeakerPostsCollectionView'
    'views/SpeakerAnswersCollectionView'
    'views/EmptyView'
    'collections/SpeakerPostsCollection'
    'collections/SpeakerAnswersCollection'
    'backbone'
  ]
(
  SpeakerPostsCollectionView
  SpeakerAnswersCollectionView
  EmptyView
  SpeakerPostsCollection
  SpeakerAnswersCollection
) ->
  Backbone.View.extend({
    tagName: 'section'
    className: 'lim'

    initialize: (options) ->
      @options = options || {}
      if @options.page is 'answers'
        @createSpeakerAnswers()
      else
        @createSpeakerPosts()

    createSpeakerPosts: ->
      $.post("/api/post/getPost", {
        'postid[]': @options.posts
      }, (data) =>
        if not @speakerPostsCollectionView?
          @speakerPostsCollectionView = new SpeakerPostsCollectionView({
            collection: new SpeakerPostsCollection(data)
          })
        else
          @speakerPostsCollectionView.delegateEvents()
        @$el.append(@speakerPostsCollectionView.render().$el)
      , 'json')

    createSpeakerAnswers: ->
      $.post('/api/post/getQuestions', {
        'questionid[]': @options.answers
      }, (data) =>
        if not @speakerAnswersCollectionView?
          @speakerAnswersCollectionView = new SpeakerAnswersCollectionView({
            collection: new SpeakerAnswersCollection(data)
          })
        else
          @speakerAnswersCollectionView.delegateEvents()
        answered = @speakerAnswersCollectionView.answered()
        if answered.length > 0
          @$el.append(@speakerAnswersCollectionView.render().$el)
        else
          emptyView = new EmptyView({
            message: 'Нет ни одного вопроса!'
          })
          @$el.append(emptyView.render().$el)
      , 'json')

  })
)