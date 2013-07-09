define [
  'views/base/view'
  'JST'
], (View, JST) ->
  'use strict'

  class AdminBlankHeaderView extends View
    autoRender: true
    className: 'inside'
    region: 'header'

    templateName: 'admin_blank_header'


