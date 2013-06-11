define [
  'views/base/view'
  'JST'
], (View, JST) ->
  'use strict'

  class HeaderAdminBlank extends View
    # Automatically render after initialize.
    autoRender: true
    className: 'inside'
    region: 'header'

    templateName: 'header_admin_blank'


