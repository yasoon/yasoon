define [
        'models/base/queue'
        'models/admin/content/row'
], (Queue, RowModel) ->
  'use strict'

  class AdminContentRowQueueModel extends Queue
    name: 'AdminContentRowQueue'
    elementName: 'AdminContentRow'

    sortable: false

    load: (callback) ->
      @elements = []
      console.log @elements
      for key, elData of managedContent
        @elements.push @createElementModel(elData)
      callback?()

    createElementModel: (elData) ->
      model = new RowModel()
      model.data = elData
      return model