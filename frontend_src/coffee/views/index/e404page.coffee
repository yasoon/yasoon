define [
         'views/base/page'
         'JST'

], (PageView,
    JST
) ->
  'use strict'

  class e404PageView extends PageView
    className: 'indexPage'

    templateName: 'e404page'