define [
  'views/base/view'
  'JST'
], (View, JST) ->
  'use strict'

  class PeopleHeaderView extends View
    autoRender: true
    className: 'inside'
    region: 'header'

    templateName: 'people_header'

    initialize: (params) ->
      @categoryId = params.catId
      if params.mode
        @mode = params.mode
      else
        @mode = 'date'


    getTemplateData: ->
      {catId: @categoryId, mode: @mode}
