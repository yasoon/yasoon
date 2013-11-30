define [
  'views/base/view'
  'JST'
  'models/index/header'
  'sitefunctions'
], (View, JST, HeaderModel, Sitefunctions) ->
  'use strict'

  class IndexHeaderView extends View

    autoRender: true
    className: ''
    region: 'header'

    templateName: 'index_header'

    initialize: ->
      super
      @model = new HeaderModel
      @model.load =>
        @render()

    events:
        'click #logout': ->
          @model.logout => @render
          @publishEvent 'onLogout'

