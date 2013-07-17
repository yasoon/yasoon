define [
         'views/base/page'
         'JST'
         'views/common/footer'
         'views/admin/header'

         'views/admin/blank/questionTemplate'
         'models/admin/blank/questionTemplate'

         'views/admin/blank/questionTemplateQueue'
         'models/admin/blank/questionTemplateQueue'
], (PageView,
    JST,
    FooterView,
    HeaderView,
    QuestionTemplateView,
    QuestionTemplateModel,
    QuestionTemplateQueueView,
    QuestionTemplateQueueModel
) ->
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


      qtv = new QuestionTemplateView(model: new QuestionTemplateModel())
      qtv.setRegion('new').setMode('button')

      qtqModel = (new QuestionTemplateQueueModel()).load =>
        qtqView = new QuestionTemplateQueueView(model:  qtqModel)
        qtqView.setRegion('queue').render()