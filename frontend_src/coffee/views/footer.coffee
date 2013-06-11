define [
  'views/base/view'
  'JST'
], (View, JST) ->
  'use strict'

  class Footer extends View
    # Automatically render after initialize.
    autoRender: true
    className: 'inside'
    region: 'footer'

    templateName: 'footer'


