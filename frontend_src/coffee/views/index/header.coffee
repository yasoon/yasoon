define [
  'views/base/view'
  'JST'
'sitefunctions'
], (View, JST, SiteFunctions) ->
  'use strict'

  class IndexHeaderView extends View

    autoRender: true
    className: ''
    region: 'header'

    templateName: 'index_header'

    events:
      'click .sign-in': ->
        @publishEvent 'goLogin'

