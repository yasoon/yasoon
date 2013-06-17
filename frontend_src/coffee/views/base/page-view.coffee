define [
   'views/base/view'
], (View) ->
  'use strict'

  class PageView extends View
    autoRender: true
    className: 'pageView'
    container: 'body'

    softRender: ->
      #page views must not be re-rendered