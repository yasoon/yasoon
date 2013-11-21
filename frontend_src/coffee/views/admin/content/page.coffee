define [
         'views/base/page'
         'JST'
         'views/common/footer'
         'views/admin/header'
         'views/admin/content/rowQueue'
         'models/admin/content/rowQueue'
], (PageView,
    JST,
    FooterView,
    HeaderView,
    RowQueueView,
    RowQueueModel
) ->
  'use strict'

  class AdminContentPageView extends PageView
    className: 'postPage'

    regions:
      'queue': '#queue'
      'footer': 'footer'
      'header': 'header'

    templateName: 'admin_content_page'

    render: ->
      super
      hv = new HeaderView()
      fv = new FooterView()

      rModel = (new RowQueueModel())
      rModel.load =>
        console.log rModel
        rView = new RowQueueView(model:  rModel)
        rView.setRegion('queue').render()