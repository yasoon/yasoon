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
        @createElementView(element).setRegion('elements').setMode('passive')

      if @sortable
        @$el.find('.sortable').sortable(
          cursor: 'move'
          update: =>
            @updateOrder()
        )

    #
    updateOrder: ->
      place = 0;
      for element in @$el.find('.element')
        id = $(element).attr('id')
        model = @model.getElementById(id)
        model.data.place = ++place
      @model.updatePlaces => @render()

    #
    getTemplateData: ->
      {}

    #
    createElementView: ->
      throw "Abstract method 'createElementView' must be redefined"