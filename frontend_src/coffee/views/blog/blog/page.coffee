define [

         'views/base/page'
         'JST'
         'views/common/footer'
         'views/author/posts/header'

         'views/author/posts/postQueue'
         'models/author/posts/postQueue'

], (PageView,
    JST,
    FooterView,
    HeaderView,

    PostQueueView,
    PostQueueModel
) ->
  'use strict'

  class BlogBlogPageView extends PageView
    className: 'blogPage'

    regions:
      '#queue': 'queue'
      'footer': 'footer'
      'header': 'header'

    templateName: 'blog_blog_page'

    render: ->
      super
      hv = new HeaderView()
      fv = new FooterView()


      qqModel = (new PostQueueModel(authorId: 0)).load =>
        qqView = new PostQueueView(model:  qqModel)
        qqView.setRegion('queue').render()