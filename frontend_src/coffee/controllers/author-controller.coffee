define [
        'controllers/base/controller'
        'views/author/questions/page'
        'views/author/posts/page'
        'views/author/posts/new/page'
        'views/author/posts/read/page'
], (
  Controller,
  AuthorQuestionsPageView,
  AuthorPostsPageView,
  AuthorPostsNewPageView,
  AuthorPostsReadPageView
) ->
  'use strict'

  class AuthorController extends Controller

    #Work with questions in blank
    questionsAction: (params) ->
      @questionsView = new AuthorQuestionsPageView(authorId: params.authorId)

    postsAction: (params) ->
      @postsView = new AuthorPostsPageView(authorId: params.authorId)

    newPostAction: (params) ->
      @postView = new AuthorPostsNewPageView(authorId: params.authorId)

    readPostAction: (params) ->
      @postView = new AuthorPostsReadPageView(authorId: params.authorId, postId: params.postId)