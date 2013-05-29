define [
         'controllers/base/controller'
         'models/authorInfo'
         'views/authorInfo-view'
         'models/authorPosts'
         'views/authorPosts-view'
         'models/post'
         'views/post-view'
], (Controller,
    AuthorInfo, AuthorInfoView,
    AuthorPosts, AuthorPostsView,
    Post, PostView
) ->
  'use strict'

  class AuthorController extends Controller
    postsAction: (params) ->
      @authorInfo = new AuthorInfo(id: params.id)
      @authorInfo.fetch =>
        infoView = new AuthorInfoView(model: @authorInfo)

      @authorPosts = new AuthorPosts(id: params.id)
      @authorPosts.fetch =>
        postsView = new AuthorPostsView(model: @authorPosts)
        post = new Post();
        post.data.authorId = params.id
        newPostView = new PostView(model: post)
        newPostView.region = 'newPost'
        newPostView.setButtonMode();


