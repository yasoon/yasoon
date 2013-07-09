define [
         'controllers/base/controller'
         'views/page/author/blank'

         'models/author/info'
         'views/author/info'
         'models/author/interviewQueue'
         'views/author/interviewQueue'

         'views/page/author/post'
         'models/author/post'
         'views/author/post'
], (Controller
    BlankPageView
    AuthorInfo, AuthorInfoView,
    InterviewQueue, InterviewQueueView
    PostPageView,
    Post, PostView
) ->
  'use strict'

  class PostController extends Controller
    postAction: (params) ->
      if params.id is 'blank'
        return @blankAction(params)

      @view = new PostPageView()

      @info = new AuthorInfo(id: params.authorId)
      @info.fetch =>
        @infoView = new AuthorInfoView(model: @info)

      @post = new Post(id: params.id)
      @post.fetch =>
        @view = new PostView(model: @post)
        @view.setRegion('post').setPassiveMode()

    blankAction: (params)->

      @view = new BlankPageView()

      @info = new AuthorInfo(id: params.authorId)
      @info.fetch =>
        @infoView = new AuthorInfoView(model: @info)

      @interview = new InterviewQueue(authorId: params.authorId)
      @interview.fetch =>
        new InterviewQueueView(model: @interview)
