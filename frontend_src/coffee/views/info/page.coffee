define [
         'views/base/page'
         'JST'
         'views/common/footer'
         'views/author/posts/header'
         'models/register/register'
         'views/info/info'
], (PageView,
    JST,
    FooterView,
    HeaderView
    InfoModel
    InfoView
) ->
  'use strict'

  class InfoPageView extends PageView
    className: 'infoPage'

    regions:
      'footer': 'footer'
      'header': 'header'
      '#page-layout' : 'info'

    templateName: 'info_page'

    render: ->
      super
      new HeaderView()
      new FooterView()

      infoModel = new InfoModel()
      infoModel.load =>
        infoView = new InfoView(model:infoModel)
        infoView.setRegion('info').setMode('edit')


