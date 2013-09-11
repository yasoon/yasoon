define [
         'views/base/page'
         'JST'
         'views/common/footer'
         'views/author/posts/header'

         'views/author/posts/post'
         'models/author/posts/post'

         'models/author/posts/info'
         'views/author/posts/info'
], (PageView,
    JST,
    FooterView,
    HeaderView,

    PostView,
    PostModel

    AuthorInfoModel,
    AuthorInfoView
) ->
  'use strict'

  class AuthorPostsReadPageView extends PageView
    className: 'postPage'

    regions:
      'author': '#author'
      'post': '#post'
      'footer': 'footer'
      'header': 'header'

    templateName: 'author_posts_read_page'

    initialize: (params) ->
      super(params)
      @authorId = params.authorId
      @postId   = params.postId

    render: ->
      super
      hv = new HeaderView()
      fv = new FooterView()


      am= new AuthorInfoModel(authorId: @authorId)
      am.load =>
        av = new AuthorInfoView(model: am)
        av.setRegion('author').render()


      @pModel = new PostModel(authorId: @authorId, id: @postId)
      @pModel.load =>
        pView  = new PostView(model: @pModel).setRegion('post').setMode('full')

    #
    getTemplateData: ->
      {authorId: @authorId}