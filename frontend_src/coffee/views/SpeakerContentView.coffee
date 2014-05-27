define(
  [
    'views/SpeakerPostsCollectionView'
    'views/SpeakerAnswersCollectionView'
    'views/EmptyView'
    'views/QuestionFormView'
    'collections/SpeakerPostsCollection'
    'collections/SpeakerAnswersCollection'
    'models/QuestionModel'
    'backbone'
  ]
(
  SpeakerPostsCollectionView
  SpeakerAnswersCollectionView
  EmptyView
  QuestionFormView
  SpeakerPostsCollection
  SpeakerAnswersCollection
  QuestionModel
) ->
  Backbone.View.extend({
    tagName: 'section'

    className: 'lim'

    initialize: (options) ->
      @options = options || {}
      if @options.page is 'answers'
        if @options.id isnt window.userId
          @createQuestionForm()
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
      if @options.answers.length > 0
        $.post('/api/post/getQuestions', {
          'questionid[]': @options.answers
        }, (data) =>
          if not @speakerAnswersCollectionView?
            @speakerAnswersCollectionView = new SpeakerAnswersCollectionView({
              id: @options.id
              collection: new SpeakerAnswersCollection(data)
            })
          else
            @speakerAnswersCollectionView.delegateEvents()
          answered = @speakerAnswersCollectionView.answered()
          if answered.length > 0
            @$el.append(@speakerAnswersCollectionView.render().$el)
          else if @options.id is window.userId
            @$el.append(@speakerAnswersCollectionView.render().$el)
          else
            @emptyView = new EmptyView({
              message: 'Нет ни одного вопроса!'
            })
            @$el.append(@emptyView.render().$el)
        , 'json')
      else
        @emptyView = new EmptyView({
          message: 'Нет ни одного вопроса!'
        })
        @$el.append(@emptyView.render().$el)

    createQuestionForm: ->
      if not @questionFormView?
        @questionFormView = new QuestionFormView({
          model: new QuestionModel({
            'author_id': @options.id
          })
        })
      else
        @questionFormView.delegateEvents()
      @$el.append(@questionFormView.render().$el)
  })
)