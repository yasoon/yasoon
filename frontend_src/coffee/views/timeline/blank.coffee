define [
         'views/base/view'
         'JST'
], (View, JST) ->
  'use strict'

  class TimelineBlankView extends View
    className: 'element'

    templateName: 'timeline_blank'