define [
        'controllers/base/controller'
        'views/author/questions/page'
        'views/author/posts/page'
        'views/author/posts/new/page'
        'views/author/posts/new/blank/page'
        'views/author/posts/read/page'
        'views/author/posts/blank/page'
], (
  Controller,
  AuthorQuestionsPageView,
  AuthorPostsPageView,
  AuthorPostsNewPageView,
  AuthorPostsNewBlankPageView,
  AuthorPostsReadPageView
  AuthorPostsBlankPageView
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

    newBlankPostAction: (params) ->
      @postView = new AuthorPostsNewBlankPageView(authorId: params.authorId)

    readPostAction: (params) ->
      if params.postId is 'blank'
        @postView = new AuthorPostsBlankPageView(authorId: params.authorId)
      else
        @postView = new AuthorPostsReadPageView(authorId: params.authorId, postId: params.postId)