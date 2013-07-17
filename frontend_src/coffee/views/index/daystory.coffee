define [
         'views/base/view'
         'JST'
], (View, JST) ->
  'use strict'

  class IndexDaystoryView extends View
    className: 'daystory'

    templateName: 'index_daystory'