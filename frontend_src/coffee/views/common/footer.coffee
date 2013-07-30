define [
  'views/base/view'
  'JST'
], (View, JST) ->
  'use strict'

  class CommonFooterView extends View
    # Automatically render after initialize.
    autoRender: true
    className: 'inside'
    container: 'footer'

    templateName: 'common_footer'


