define [
         'views/base/view'
         'JST'
         'jqueryui',
         'chaplin'
         'views/base/editable'
], (View, JST, jqueryui, Chaplin, EditableView) ->
  'use strict'

  class QueueView extends View
    autoRender: false

    #
    initialize: ->
      super
      Chaplin.mediator.subscribe 'modelAdded', @add
      Chaplin.mediator.subscribe 'modelDeleted', @del

    regions:
      '#elements': 'elements'

    #
    add: (model) =>
      if  model.name is @model.elementName
        @model.pushElement(model)
        @render()

    #
    del: (id) =>
      @model.removeDeleted()

    #
    render: ->
      super
      for element in @model.elements
        el = @createElementView(element).setRegion('elements')
        if el instanceof EditableView then el.setMode('passive') else el.render()

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