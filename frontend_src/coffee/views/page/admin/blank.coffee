define [
         'views/base/page-view'
         'JST'
], (PageView, JST) ->
  'use strict'

  class AdminBlankPageView extends PageView
    className: 'postPage'

    regions:
      '#queue': 'queue'
      '#new': 'new'

    templateName: 'admin_blank-page'