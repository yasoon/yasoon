define [
         'views/base/page'
         'JST'
         'views/common/footer'
         'views/author/posts/header'

         'views/author/posts/post'
         'models/author/posts/post'
], (PageView,
    JST,
    FooterView,
    HeaderView,

    PostView,
    PostModel
) ->
  'use strict'

  class BlogAboutPageView extends PageView
    className: 'aboutPage'

    regions:
      '#post': 'post'
      'footer': 'footer'
      'header': 'header'

    templateName: 'blog_about_page'

    render: ->
      super
      hv = new HeaderView()
      fv = new FooterView()


#      pModel = new PostModel(authorId: @authorId)
#      pView  = new PostView(model: pModel).setRegion('post').setMode('active')

    #
#    getTemplateData: ->
#      {authorId: @authorId}