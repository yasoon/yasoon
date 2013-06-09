define [
   'views/base/view'
], (View) ->
  'use strict'

  class PageView extends View
    autoRender: true
    className: 'pageView'
    container: '#center'