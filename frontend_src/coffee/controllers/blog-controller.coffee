define [
        'controllers/base/controller'

        'views/blog/blog/page'
        'views/blog/about/page'
        'views/blog/blog/questions/page'

        'views/blog/agreement/page'
], (
  Controller,
  BlogBlogPageView,
  BlogAboutPageView,
  BlogQuestionsPageView

  AgreementPageView
) ->
  'use strict'

  class BlogController extends Controller
    blogAction: ->
      @blogView = new BlogBlogPageView();

    aboutAction: ->
      @aboutView = new BlogAboutPageView();

    questionsAction: ->
      @aboutView = new BlogQuestionsPageView();

    agreementAction: ->
      @agreementView = new AgreementPageView();
