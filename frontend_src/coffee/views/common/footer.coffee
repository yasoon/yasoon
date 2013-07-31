define [
  'views/base/view'
  'JST'
], (View, JST) ->
  'use strict'

  class CommonFooterView extends View
    # Automatically render after initialize.
    autoRender: true
    className: 'inside'
    region: 'footer'

    templateName: 'common_footer'


