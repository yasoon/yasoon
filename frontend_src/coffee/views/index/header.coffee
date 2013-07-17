define [
  'views/base/view'
  'JST'
], (View, JST) ->
  'use strict'

  class IndexHeaderView extends View
    autoRender: true
    className: 'inside'
    region: 'header'

    templateName: 'index_header'


