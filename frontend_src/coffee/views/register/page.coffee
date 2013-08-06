define [
         'views/base/page'
         'JST'
         'views/common/footer'
         'views/author/posts/header'
         'lib/validate'
], (PageView,
    JST,
    FooterView,
    HeaderView,
    Validate
) ->
  'use strict'

  class PeoplePageView extends PageView
    className: 'registerPage'

    regions:
      'footer': 'footer'
      'header': 'header'

    templateName: 'register_page'

    events:
      'click .regbtn': ->
          validator = new FormValidator('register-form', [{
              name: 'req'
              display: 'required'
              rules: 'required'
          }], (errors, event) ->
             log errors
          )
