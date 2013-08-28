define [
         'views/base/page'
         'JST'
         'views/common/footer'
         'views/author/questions/header'
], (PageView,
    JST,
    FooterView,
    HeaderView
) ->
  'use strict'

  class BlogAgreementPageView extends PageView
    className: 'agreementPage'

    regions:
      'footer': 'footer'
      'header': 'header'

    templateName: 'blog_agreement_page'

    render: ->
      super
      hv = new HeaderView()
      fv = new FooterView()