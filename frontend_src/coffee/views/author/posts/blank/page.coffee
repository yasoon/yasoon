define [
         'views/base/page'
         'JST'
         'views/common/footer'
         'views/author/posts/header'

         'views/author/posts/new/blank/question'
         'models/author/posts/new/blank/question'
         'views/author/posts/new/blank/questionQueue'
         'models/author/posts/new/blank/questionQueue'
], (PageView,
    JST,
    FooterView,
    HeaderView,

    QuestionView,
    QuestionModel,
    QuestionQueueView,
    QuestionQueueModel
) ->
  'use strict'

  class AuthorPostsBlankPageView extends PageView
    className: 'postPage'

    regions:
      'queue': '#queue'
      'footer': 'footer'
      'header': 'header'

    templateName: 'author_posts_blank_page'

    #
    initialize: (params) ->
      super(params)
      @authorId = params.authorId

    #
    render: ->
      super
      hv = new HeaderView()
      fv = new FooterView()

      qqModel = (new QuestionQueueModel(authorId: @authorId)).load =>
        qqView = new QuestionQueueView(model:  qqModel)
        qqView.setRegion('queue').render()

    #
    getTemplateData: ->
      {authorId: @authorId}