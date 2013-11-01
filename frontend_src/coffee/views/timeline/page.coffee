define [
         'views/base/page'
         'JST'
         'views/common/footer'
         'views/author/posts/header'
         'models/timeline/postQueue'
         'views/timeline/postQueue'
         'models/index/header'
], (PageView,
    JST,
    FooterView,
    HeaderView,

    TimelinePostQueueModel,
    TimelinePostQueueView

    HeaderModel
) ->
  'use strict'

  class TimelinePageView extends PageView
    className: 'timelinePage'

    regions:
      'queue': '#queue'
      'footer': 'footer'
      'header': 'header'

    templateName: 'timeline_page'

    initialize: () ->
      super

    render: ->
      super
      hModel = new HeaderModel()
      hModel.load =>
        (new HeaderView(model: hModel, catId: @activeCategoryId, mode: @mode)).render()
      new FooterView()

      tq = new TimelinePostQueueModel()
      tq.load =>
        tqView = new TimelinePostQueueView(model: tq)
        tqView.setRegion('queue').render()