define [
         'views/base/page'
         'JST'
         'views/common/footer'
         'views/index/header'
         'views/index/daystory'
         'models/index/daystory'
], (PageView,
    JST,
    FooterView,
    HeaderView,
    DaystoryView,
    DaystoryModel
) ->
  'use strict'

  class IndexPageView extends PageView
    className: 'indexPage'

    regions:
      '#daystory': 'daystory'
      'footer': 'footer'
      'header': 'header'

    templateName: 'index_page'

    render: ->
      super
      new HeaderView()
      new FooterView()

      dsModel = new DaystoryModel
      dsModel.load =>
        (new DaystoryView(model: dsModel)).setRegion('daystory').render()