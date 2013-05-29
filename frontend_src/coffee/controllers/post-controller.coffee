define [
         'controllers/base/controller'
         'models/authorInfo'
         'views/authorInfo-view'
         'models/post'
         'views/post-view'

], (Controller,
    AuthorInfo, AuthorInfoView,
    Post, PostView
) ->
  'use strict'

  class AuthorController extends Controller
    postAction: (params) ->
      @post = new Post(id: params.id)
      @post.fetch =>
        postView = new PostView(model: @post)
        postView.container = '#center'
        postView.setPassiveMode()

        @authorInfo = new AuthorInfo(id: @post.data.authorId)
        @authorInfo.fetch =>
           infoView = new AuthorInfoView(model: @authorInfo)
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


