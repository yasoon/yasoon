define [
         'views/base/view'
         'JST'
         'jqueryui'
], (View, JST, jqueryui) ->
  'use strict'

  class QueueView extends View
    autoRender: false

    regions:
      '#elements': 'elements'

    #
    render: ->
      super
      for element in @model.elements
        @createElementView(element).setRegion('elements').render()

      if @sortable
        @$el.find('.sortable').sortable(
          cursor: 'move'
          update: =>
            @updateOrder()
        )

    #
    updateOrder: ->
      console.log 'order updated'

    #
    getTemplateData: ->
      {}

    #
    createElementView: ->
      throw "Abstract method 'createElementView' must be redefined"