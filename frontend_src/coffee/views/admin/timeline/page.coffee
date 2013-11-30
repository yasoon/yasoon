define [
         'views/base/page'
         'JST'
         'views/common/footer'
         'views/admin/header'
         'models/admin/timeline/postQueue'
         'views/admin/timeline/postQueue'
], (PageView,
    JST,
    FooterView,
    HeaderView,

    TimelinePostQueueModel,
    TimelinePostQueueView
) ->
  'use strict'

  class AdminTimelinePageView extends PageView
    className: 'timelinePage'

    regions:
      '#queue': 'queue'
      'footer': 'footer'
      'header': 'header'

    templateName: 'timeline_page'

    initialize: () ->
      super

    render: ->
      super
      new HeaderView()
      new FooterView()

      tq = new TimelinePostQueueModel()
      tq.load =>
        tqView = new TimelinePostQueueView(model: tq)
        tqView.setRegion('queue').render()