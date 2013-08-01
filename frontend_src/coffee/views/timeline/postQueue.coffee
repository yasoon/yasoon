define [
         'views/base/pagingQueue'
         'JST'
         'views/timeline/post'
         'views/timeline/question'
         'views/timeline/blank'
], (PagingQueueView, JST, PostView, QuestionView, BlankView) ->
  'use strict'

  class TimelinePostQueueView extends PagingQueueView
    className: 'TimelinePostQueue'

    templateName: 'timeline_post_queue'

    placeholder: 'timeline_placeholder'

    sortable: true

    createElementView: (model) ->
      if model.data.type is 'p'
        new PostView(model: model)
      else if model.data.type is 'q'
        new QuestionView(model: model)
      else if model.data.type is 'b'
        new BlankView(model: model)