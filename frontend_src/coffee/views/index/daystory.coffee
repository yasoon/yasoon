define [
         'views/base/view'
         'JST'
         'chaplin'
], (View, JST, Chaplin) ->
  'use strict'

  class IndexDaystoryView extends View
    className: 'daystory'

    templateName: 'index_daystory'

    initialize: ->
      super
      Chaplin.mediator.subscribe 'onLogout', @softRender()

    softRender: ->
      super