define [
         'views/base/view'
         'JST'
], (View, JST) ->
  'use strict'

  class TimelinePostAuthorView extends View
    className: 'author'

    templateName: 'timeline_post'