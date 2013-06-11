define [
         'controllers/base/controller'
         'views/page/author/posts'
         'models/author/info'
         'views/author/info'
#         'models/authorPosts'
#         'views/authorPosts-view'
#         'models/post'
#         'views/post-view'
#         'views/authorPostsQueue-view'

], (Controller,
     PostsPageView
    AuthorInfo, AuthorInfoView
#    AuthorPosts, AuthorPostsView,
#    Post, PostView,
#    AuthorPostsQueueView
) ->
  'use strict'

  class AuthorController extends Controller
    postsAction: (params) ->
      @pageView = new PostsPageView()
      @info = new AuthorInfo(id: params.id)
      @info.fetch =>
        @infoView = new AuthorInfoView(model: @info)

#      @authorInfo = new AuthorInfo(id: params.id)
#      @authorInfo.fetch =>
#        infoView = new AuthorInfoView(model: @authorInfo)
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


    initialize: ->
      super
      @subscribeEvent 'dispose', @disposeHandler

    disposeHandler: ->
      console.log 'dispose'
      @dispose
