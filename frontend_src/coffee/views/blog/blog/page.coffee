define [

         'views/base/page'
         'JST'
         'views/common/footer'
         'views/author/posts/header'

         'views/author/posts/postQueue'
         'models/author/posts/postQueue'

         'models/blog/blog'

], (PageView,
    JST,
    FooterView,
    HeaderView,

    PostQueueView,
    PostQueueModel

    BlogModel
) ->
  'use strict'

  class BlogBlogPageView extends PageView
    className: 'blogPage'

    regions:
      '#queue': 'queue'
      'footer': 'footer'
      'header': 'header'

    templateName: 'blog_blog_page'

    initialize: ->
      @model = new BlogModel()

    events:
      'click #follow': ->
        @model.follow()
        $('#follow').hide()
        $('#unfollow').show()

      'click #unfollow': ->
        @model.unfollow()
        $('#follow').show()
        $('#unfollow').hide()

    render: ->
      super
      hv = new HeaderView()
      fv = new FooterView()


      qqModel = (new PostQueueModel(authorId: 0)).load =>
        qqView = new PostQueueView(model:  qqModel)
        qqView.setRegion('queue').render()