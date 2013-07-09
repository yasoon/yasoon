define [
         'views/base/page-view'
         'JST'
         'views/footer'
         'views/header/admin_blank'
], (PageView, JST, FooterView, HeaderView) ->
  'use strict'

  class AdminBlankPageView extends PageView
    className: 'postPage'

    regions:
      '#queue': 'queue'
      '#new': 'new'
      'footer': 'footer'
      'header': 'header'

    templateName: 'admin_blank-page'

    render: ->
      super
      footerView = new FooterView()
      headerView = new HeaderView()
