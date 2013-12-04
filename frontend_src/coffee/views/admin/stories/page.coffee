define [
         'views/base/page'
         'JST'
         'views/common/footer'
         'views/admin/header'
         'views/admin/stories/postQueue'
         'models/admin/stories/postQueue'
], (PageView,
    JST,
    FooterView,
    HeaderView,
    StoryQueueView,
    StoryQueueModel
) ->
  'use strict'

  class AdminStoriesPageView extends PageView
    className: 'AdminStoriesPage'

    regions:
      'queue': '#queue'
      'footer': 'footer'
      'header': 'header'

    templateName: 'admin_stories_page'

    render: ->
      super
      new HeaderView()
      new FooterView()

      qsModel = new StoryQueueModel()
      qsModel.load =>
        (new StoryQueueView(model: qsModel)).setRegion('queue').render()