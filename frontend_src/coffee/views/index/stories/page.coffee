define [
         'views/base/page'
         'JST'
         'views/common/footer'
         'views/index/header'
         'views/index/stories/postQueue'
         'models/index/stories/postQueue'
], (PageView,
    JST,
    FooterView,
    HeaderView,
    PostQueueView,
    PostQueueModel
) ->
  'use strict'

  class IndexStoriesPageView extends PageView
    className: 'indexPage'

    regions:
      'queue': '#queue'
      'footer': 'footer'
      'header': 'header'

    templateName: 'index_stories_page'

    render: ->
      super
      new HeaderView()
      new FooterView()

      pq = new PostQueueModel()
      pq.load =>
        (new PostQueueView(model: pq)).setRegion('queue').render()

      pressFooter()