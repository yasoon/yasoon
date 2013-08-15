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
      '#queue': 'queue'
      '#author': 'author'
      'footer': 'footer'
      'header': 'header'

    templateName: 'author_posts_page'

    initialize: (params) ->
      super(params)
      @authorId = params.authorId


    render: =>
      super
      am= new AuthorInfoModel(authorId: @authorId)
      am.load =>
        av = new AuthorInfoView(model: am)
        av.setRegion('author').render()

      hv = new HeaderView()
      fv = new FooterView()


      qqModel = (new PostQueueModel(authorId: @authorId)).load =>
        qqView = new PostQueueView(model:  qqModel)
        qqView.setRegion('queue').render()

    #
    getTemplateData: ->
      {authorId: @authorId}