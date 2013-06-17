define [
         'controllers/base/controller'
         'views/page/author/posts'
         'models/author/info'
         'views/author/info'
         'models/author/postsQueue'
         'views/author/postsQueue'
         'views/page/author/questions'
         'models/author/questionsQueue'
         'views/author/questionsQueue'
         'views/page/author/newPost'
         'views/page/author/newPostInterview'
         'models/author/interviewQueue'
         'views/author/interviewQueue'

], (Controller,
     PostsPageView
    AuthorInfo, AuthorInfoView,
    AuthorPostsQueue, AuthorPostsQueueView,
    QuestionsPageView,
    AuthorQuestionsQueue, AuthorQuestionsQueueView,
    NewPostPageView,
    NewPostInterviewPageView,
    InterviewQueue,
    InterviewQueueView
#    Post, PostView,
#    AuthorPostsQueueView
) ->
  'use strict'

  class AuthorController extends Controller

    postsAction: (params) ->
      @pageView = new PostsPageView(authorId: params.id)
      @info = new AuthorInfo(id: params.id)
      @info.fetch =>
        @infoView = new AuthorInfoView(model: @info)
      @authorPosts = new AuthorPostsQueue(id: params.id)
      @authorPosts.fetch =>
        new AuthorPostsQueueView(model: @authorPosts)

    questionsAction: (params) ->
      @pageView = new QuestionsPageView(authorId: params.id)
      @info = new AuthorInfo(id: params.id)
      @info.fetch =>
        @infoView = new AuthorInfoView(model: @info)
      @authorsQuestions = new AuthorQuestionsQueue(authorId: params.id)
      @authorsQuestions.fetch =>
        new AuthorQuestionsQueueView(model: @authorsQuestions)

    newPostAction: (params) ->
      @pageView = new NewPostPageView

    newPostInterviewAction: (params) ->
      @pageView = new NewPostInterviewPageView
      @interview = new InterviewQueue()
      @interview.fetch =>
        new InterviewQueueView(model: @interview)

    initialize: ->
      super
      @subscribeEvent 'dispose', @disposeHandler

    disposeHandler: ->
      console.log 'dispose'
      @dispose
