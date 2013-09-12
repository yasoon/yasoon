define [
         'views/base/page'
         'JST'
         'views/common/footer'
         'views/author/posts/header'
         'models/register/register'
         'views/register/register'
], (PageView,
    JST,
    FooterView,
    HeaderView
    RegisterModel
    RegisterView
) ->
  'use strict'

  class RegisterPageView extends PageView
    className: 'registerPage'

    regions:
      'footer': 'footer'
      'header': 'header'
      'page-layout' : '#page-layout'

    templateName: 'register_page'

    render: ->
      super
      new HeaderView()
      new FooterView()

      registerModel = new RegisterModel()
      registerView = new RegisterView(model:registerModel)
      registerView.setRegion('page-layout').setMode('active')


