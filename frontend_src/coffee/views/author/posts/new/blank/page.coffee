define [
         'views/base/page'
         'JST'
         'views/common/footer'
         'views/author/posts/header'

         'views/author/posts/new/blank/question'
         'models/author/posts/new/blank/question'
         'views/author/posts/new/blank/questionQueue'
         'models/author/posts/new/blank/questionQueue'

         'views/author/posts/new/blank/caption'
], (PageView,
    JST,
    FooterView,
    HeaderView,

    QuestionView,
    QuestionModel,
    QuestionQueueView,
    QuestionQueueModel,

    CaptionView
 ) ->
  'use strict'

  class AuthorPostsNewBlankPageView extends PageView
    className: 'postPage'

    regions:
      '#caption': 'caption'
      '#category': 'category'
      '#new':   'new'
      '#queue': 'queue'
      'footer': 'footer'
      'header': 'header'

    templateName: 'author_posts_new_blank_page'

    #
    initialize: (params) ->
      super(params)
      @authorId = params.authorId

    #
    render: ->
      super
      hv = new HeaderView()
      fv = new FooterView()

      cv = new CaptionView()
      cv.setRegion('caption').setMode('passive')

      qtv = new QuestionView(model: new QuestionModel(authorId: @authorId))
      qtv.setRegion('new').setMode('button')

      qqModel = (new QuestionQueueModel(authorId: @authorId)).load =>
        qqView = new QuestionQueueView(model:  qqModel)
        qqView.setRegion('queue').render()

    #
    getTemplateData: ->
      {authorId: @authorId}