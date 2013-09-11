define [
         'views/base/page'
         'JST'
         'views/common/footer'
         'views/author/posts/header'

         'models/blog/about/page'
], (PageView,
    JST,
    FooterView,
    HeaderView,

    AboutPageModel
) ->
  'use strict'

  class BlogAboutPageView extends PageView
    className: 'aboutPage'

    regions:
      'post': '#post'
      'footer': 'footer'
      'header': 'header'

    templateName: 'blog_about_page'

    initialize: ->
      @model = new AboutPageModel()

    render: ->
      @model.load =>
        super
        hv = new HeaderView()
        fv = new FooterView()
        pressFooter()