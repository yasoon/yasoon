define [
         'views/base/view'
         'JST'
], (View, JST) ->
  'use strict'

  class TimelinePostView extends View
    className: 'element'

    templateName: 'timeline_post'