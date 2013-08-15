define [
         'views/base/page'
         'JST'
         'views/common/footer'
         'views/author/questions/header'

         'views/author/questions/questionQueue'
         'models/author/questions/questionQueue'

          'views/author/questions/question'
          'models/author/questions/question'
], (PageView,
    JST,
    FooterView,
    HeaderView,

    QuestionQueueView,
    QuestionQueueModel,

    QuestionView,
    QuestionModel
) ->
  'use strict'

  class BlogBlogQuestionsPageView extends PageView
    className: 'postPage'

    regions:
      '#queue': 'queue'
      '#new': 'new'
      'footer': 'footer'
      'header': 'header'

    templateName: 'blog_blog_questions_page'

    initialize: (params) ->
      super(params)
      @authorId = 0

    render: ->
      super
      hv = new HeaderView()
      fv = new FooterView()

      qtv = new QuestionView(model: new QuestionModel(authorId: @authorId))
      qtv.setRegion('new').setMode('button')

      qqModel = (new QuestionQueueModel(authorId: @authorId)).load =>
        qqView = new QuestionQueueView(model:  qqModel)
#        qqView.setRegion('queue').render()

    #
    getTemplateData: ->
      {authorId: @authorId}