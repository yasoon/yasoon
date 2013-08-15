define [
         'views/base/queue'
         'JST'
         'views/admin/content/row'
], (QueueView, JST, RowView) ->
  'use strict'

  class AdminContentRowQueueView extends QueueView
    className: 'rowQueue'

    templateName: 'admin_content_row_queue'

    sortable: false

    createElementView: (model) ->
      new RowView(model: model)