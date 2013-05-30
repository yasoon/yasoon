define [
         'controllers/base/controller'
         'models/authorInfo'
         'views/authorInfo-view'
         'models/post'
         'views/post-view'
         'models/postQuestionsQueue',
         'views/postQuestionsQueue-view'
         'views/postPage-view'
         'models/question'
         'views/question-view'
], (Controller,
    AuthorInfo, AuthorInfoView,
    Post, PostView,
    PostQuestionsQueue, PostQuestionsQueueView,
    PostPageView,
    Question, QuestionView
) ->
  'use strict'

  class PostController extends Controller
    postAction: (params) ->
      @post = new Post(id: params.id)
      @post.fetch =>
        postPageView = new PostPageView()

        postView = new PostView(model: @post)
        postView.region = 'post'
        postView.setPassiveMode()

        @authorInfo = new AuthorInfo(id: @post.data.authorId)
        @authorInfo.fetch =>
          infoView = new AuthorInfoView(model: @authorInfo)

        @postQuestionsQueue = new PostQuestionsQueue(id: params.id)
        @postQuestionsQueue.fetch =>
          queueView = new PostQuestionsQueueView(model: @postQuestionsQueue)

        @newQuestion = new Question()
        @newQuestion.data.postId = params.id
        @newQuestion.data.authorId = @post.data.authorId

        @newQuestionView = new QuestionView(model: @newQuestion)
        @newQuestionView.region = 'newQuestion'
        @newQuestionView.setButtonMode()

#
#      @authorPosts = new AuthorPosts(id: params.id)
#      @authorPosts.fetch =>
#        postsView = new AuthorPostsView()
#
#        newPost = new Post();
#        newPost.data.authorId = params.id
#        newPostView = new PostView(model: newPost)
#        newPostView.region = 'newPost'
#        newPostView.setButtonMode();
#
#        postsQueue = new AuthorPostsQueueView(model: @authorPosts)


