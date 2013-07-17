define [
  'chaplin'
], (Chaplin) ->

  class Model extends Chaplin.Model
    data: {}

    url: ''
    method: ''
    requestData: ''

    initialize: ->
      super
      if not @name? then throw 'Model name must be defined'

    formatUrl: (url) ->
      'http://'+document.domain+"/#{url}"


    validateNotNull: (fields...) ->
      for field in fields
        if not @data[field]? or @data[field] is ''
          return false
      return true


    request: (callback, dontUpdateData=false) ->
      $.ajax(
        url:    @formatUrl(@url())
        method: @method
        data:   @requestData

        success: (data) =>
          if not dontUpdateData
            @data = data
          callback?(data)
      )