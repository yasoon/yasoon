define [
         'views/base/page-view'
         'JST'
         'views/footer'
         'views/header/author_posts'
], (PageView, JST, FooterView, HeaderView) ->
  'use strict'

  class AdminBlankPageView extends PageView
    className: 'postPage'

    regions:
      '#queue': 'queue'
      '#new': 'new'
      'footer': 'footer'
      'header': 'header'
      '#authorInfo': 'info'

    templateName: 'author_posts-page'

    render: ->
      super
      footerView = new FooterView()
      headerView = new HeaderView()

