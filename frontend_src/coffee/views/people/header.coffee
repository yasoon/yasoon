define [
  'views/index/header'
  'JST'
], (IndexHeaderView, JST) ->
  'use strict'

  class PeopleHeaderView extends IndexHeaderView
    autoRender: true
    className: 'inside'
    region: 'header'

    templateName: 'people_header'

    initialize: (params) ->
      super(params)
      @categoryId = params.catId
      if params.mode
        @mode = params.mode
      else
        @mode = 'date'



    getTemplateData: =>
      {catId: @categoryId, mode: @mode, model: @model.data}

    events:
      'click #logout': ->
        @model.logout => @render
        @publishEvent 'onLogout'