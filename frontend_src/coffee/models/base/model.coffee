define [
  'chaplin'
], (Chaplin) ->

  class Model extends Chaplin.Model
    data: {}

    url: ''
    method: ''
    requestData: ''

    formatUrl: (url) ->
      'http://'+document.domain+"/#{url}"

    request: (callback) ->
      $.ajax(
        url:    @formatUrl(@url())
        method: @method
        data:   @requestData

        success: (data) =>
          @data = data
          callback?(data)
      )