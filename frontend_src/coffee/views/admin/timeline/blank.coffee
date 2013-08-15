define [
  'views/admin/timeline/post'
  'JST'
], (PostView, JST) ->
  'use strict'

  class AdminTimelineBlankView extends PostView
    templateName: 'admin_timeline_blank'