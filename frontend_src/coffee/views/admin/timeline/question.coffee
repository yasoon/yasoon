define [
         'views/admin/timeline/post'
         'JST'
], (PostView, JST) ->
  'use strict'

  class AdminTimelineQuestionView extends PostView
    templateName: 'admin_timeline_question'