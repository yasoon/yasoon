define [
         'views/base/page'
         'JST'
         'views/common/footer'
         'views/author/questions/header'

         'views/author/questions/questionQueue'
         'models/author/questions/questionQueue'

          'views/author/questions/question'
          'models/author/questions/question'
          'models/author/posts/info'
          'views/author/posts/info'
], (PageView,
    JST,
    FooterView,
    HeaderView,

    QuestionQueueView,
    QuestionQueueModel,

    QuestionView,
    QuestionModel,

    AuthorInfoModel,
    AuthorInfoView
) ->
  'use strict'

  class AuthorQuestionsPageView extends PageView
    className: 'postPage'

    regions:
      'queue' : '#queue'
      'new'   : '#new'
      'footer': 'footer'
      'header': 'header'

    templateName: 'author_questions_page'

    initialize: (params) ->
      super(params)
      @authorId = params.authorId

    render: ->
      am= new AuthorInfoModel(authorId: @authorId)
      am.load =>
        @model = am #сетим себе модель автора чтобы получить статус доступа (чертовски грязный хак)
        super
        hv = new HeaderView()
        fv = new FooterView()

        qtv = new QuestionView(model: new QuestionModel(authorId: @authorId))
        qtv.setRegion('new').setMode('button')

        qqModel = (new QuestionQueueModel(authorId: @authorId)).load =>
          qqView = new QuestionQueueView(model:  qqModel)
          qqView.setRegion('queue').render()

    #
    getTemplateData: ->
      {authorId: @authorId}