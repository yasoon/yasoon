define [
         'views/base/pagingQueue'
         'JST'
         'views/admin/timeline/post'
         'views/admin/timeline/question'
         'views/admin/timeline/blank'
], (PagingQueueView, JST, PostView, QuestionView, BlankView) ->
  'use strict'

  class AdminTimelinePostQueueView extends PagingQueueView
    className: 'AdminTimelinePostQueue'

    templateName: 'admin_timeline_post_queue'

    sortable: false

    createElementView: (model) ->
      if model.data.type is 'p'
        new PostView(model: model)
      else if model.data.type is 'q'
        new QuestionView(model: model)
      else if model.data.type is 'b'
        new BlankView(model: model)