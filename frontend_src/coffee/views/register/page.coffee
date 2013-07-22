define [
         'views/base/page'
         'JST'
         'views/common/footer'
         'views/author/posts/header'
], (PageView,
    JST,
    FooterView,
    HeaderView
) ->
  'use strict'

  class PeoplePageView extends PageView
    className: 'registerPage'

    regions:
      'footer': 'footer'
      'header': 'header'

    templateName: 'register_page'