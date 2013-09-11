define [
         'views/base/page'
         'JST'
         'views/common/footer'
         'views/author/posts/header'

         'views/author/posts/postQueue'
         'models/author/posts/postQueue',
         'models/author/posts/info'
         'views/author/posts/info'
], (PageView,
    JST,
    FooterView,
    HeaderView,

    PostQueueView,
    PostQueueModel,

    AuthorInfoModel,
    AuthorInfoView
) ->
  'use strict'

  class AuthorPostsPageView extends PageView
    className: 'postPage'

    regions:
      'queue': '#queue'
      'author': '#author'
      'footer': 'footer'
      'header': 'header'

    templateName: 'author_posts_page'

    initialize: (params) ->
      super(params)
      @authorId = params.authorId


    render: =>
      am= new AuthorInfoModel(authorId: @authorId)
      am.load =>
        @model = am #сетим себе модель автора чтобы получить статус доступа
        super
        av = new AuthorInfoView(model: am)
        av.setRegion('author').render()

        new HeaderView()
        new FooterView()

        qqModel = (new PostQueueModel(authorId: @authorId)).load =>
          qqView = new PostQueueView(model:  qqModel)
          qqView.setRegion('queue').render()



    #
    getTemplateData: ->
      {authorId: @authorId}