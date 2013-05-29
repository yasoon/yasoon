define [
         'chaplin'
], (Chaplin) ->
  'use strict'

  class View extends Chaplin.View
    getTemplateFunction: ->
      templateFunc = JST[@templateName]
