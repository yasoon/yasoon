define(
  [
    'views/SpeakerPostsCollectionView'
    'views/SpeakerAnswersCollectionView'
    'views/EmptyView'
    'views/QuestionFormView'
    'views/SpeakerWritePostButtonView'
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
    SpeakerWritePostButtonView
    SpeakerPostsCollection
    SpeakerAnswersCollection
    QuestionModel
  ) ->
    class SpeakerContentView extends Backbone.View
      tagName: 'section'
      className: 'lim'

      initialize: (options) ->
        @model.set({'id': options.id, 'answers': options.author.answers, 'posts': options.author.posts, 'page': options.page})
        @setHandlers()
        if @model.get('page') is 'answers' then @answersPage() else @postsPage()

      answersPage: ->
        if not @isAuthor() then @createQuestionForm()
#        if @model.get('answers').length then @getAnswers() else if @model.get('posts').length then @emptyQuestions(50) else @emptyQuestions(48)
        if @model.get('answers').length then @getAnswers() else if !@model.get('posts').length and @isAuthor() then @emptyQuestions(48) else @emptyQuestions(50)

      setHandlers: ->
        @listenTo(@model, 'change:speakerPosts', @createPosts)
        @listenTo(@model, 'change:speakerAnswers', @createAnswers)

      isAuthor: ->
        Window.config.userId is parseInt(@model.get('id'))

      postsPage: ->
        if @isAuthor() then @writeButton()
        if @model.get('posts').length then @getPosts() else @emptyQuestions(34)

      writeButton: ->
        if not @writePostButton? then @writePostButton = new SpeakerWritePostButtonView() else @writePostButton.delegateEvents()
        @$el.append(@writePostButton.render().$el)

      getPosts: ->
        $.post("/api/post/getPosts", {'postid[]': @model.get('posts')}, (data) => @model.set('speakerPosts', data))

      createPosts: ->
        postsCollection = new SpeakerPostsCollection(@model.get('speakerPosts'))
        if not @postsList? then @postsList = new SpeakerPostsCollectionView({collection: postsCollection}) else @postsList.delegateEvents()
        @$el.append(@postsList.render().$el)

      getAnswers: ->
        $.post('/api/post/getQuestions', {'questionid[]': @model.get('answers')}, (data) => @model.set('speakerAnswers', data))

      createAnswers: ->
        @answersCollection = new SpeakerAnswersCollection(@model.get('speakerAnswers'))
        if not @speakerAnswers? then @speakerAnswers = new SpeakerAnswersCollectionView({id: @model.get('id'), collection: @answersCollection}) else @speakerAnswers.delegateEvents()
        @showList()

      showList: ->
        if @isAuthor() then @createAskedList() else @createAnsweredList()

      createAnsweredList: ->
        if @speakerAnswers.answered().length then @answeredQuestions() else @emptyQuestions(47)

      createAskedList: ->
        if @speakerAnswers.asked().length then @askedQuestions()
        if @speakerAnswers.answered().length then @answeredQuestions()

      askedQuestions: ->
        @$el.prepend(@speakerAnswers.renderQuestion().$el)

      answeredQuestions: ->
        @$el.append(@speakerAnswers.renderAnswer().$el)

      emptyQuestions: (contentId) ->
        @emptyView = new EmptyView({message: _.getContent(contentId)})
        @$el.append(@emptyView.render().$el)

      createQuestionForm: ->
        questionModel = new QuestionModel({'author_id': @model.get('id')})
        if not @questionForm? then @questionForm = new QuestionFormView({model: questionModel}) else @questionForm.delegateEvents()
        @$el.append(@questionForm.render().$el)
)