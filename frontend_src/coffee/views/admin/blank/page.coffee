define [
         'views/base/page'
         'JST'
         'views/common/footer'
         'views/admin/blank/header'

         'views/admin/blank/questionTemplate'
], (PageView, JST, FooterView, HeaderView, QuestionTemplate) ->
  'use strict'

  class AdminBlankPageView extends PageView
    className: 'postPage'

    regions:
      '#queue': 'queue'
      '#new': 'new'
      'footer': 'footer'
      'header': 'header'

    templateName: 'admin_blank_page'

    render: ->
      super
      hv = new HeaderView()
      fv = new FooterView()

      q = new QuestionTemplate()
      q.setRegion('new').setMode('button')