define [
         'views/base/view'
         'JST'
], (View, JST) ->
  'use strict'

  class AdminTimelinePostView extends View
    className: 'element'

    templateName: 'admin_timeline_post'

    events:
      'click': (e) ->
        $target = $(e.target)

        if $target.attr('data-check-button')? then @model.setChecked(=> $target.parent().parent().hide())