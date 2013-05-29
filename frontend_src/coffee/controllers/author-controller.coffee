define [
         'controllers/base/controller'
         'models/authorInfo'
         'views/authorInfo-view'
         'models/authorPosts'
         'views/authorPosts-view'
         'models/post'
         'views/post-view'
         'views/authorPostsQueue-view'

], (Controller,
    AuthorInfo, AuthorInfoView,
    AuthorPosts, AuthorPostsView,
    Post, PostView,
    AuthorPostsQueueView
) ->
  'use strict'

  class AuthorController extends Controller
    postsAction: (params) ->
      @authorInfo = new AuthorInfo(id: params.id)
      @authorInfo.fetch =>
        infoView = new AuthorInfoView(model: @authorInfo)

      @authorPosts = new AuthorPosts(id: params.id)
      @authorPosts.fetch =>
        postsView = new AuthorPostsView()

        newPost = new Post();
        newPost.data.authorId = params.id
        newPostView = new PostView(model: newPost)
        newPostView.region = 'newPost'
        newPostView.setButtonMode();

        postsQueue = new AuthorPostsQueueView(model: @authorPosts)


