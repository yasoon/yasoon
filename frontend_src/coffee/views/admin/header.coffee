define [
  'views/base/view'
  'JST'
], (View, JST) ->
  'use strict'

  class AdminHeaderView extends View
    autoRender: true
    className: 'inside'
    region: 'header'

    templateName: 'admin_header'


