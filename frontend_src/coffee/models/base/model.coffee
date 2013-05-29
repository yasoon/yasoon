define [
  'chaplin'
], (Chaplin) ->

  class Model extends Chaplin.Model
    # Mixin a synchronization state machine.
    # _(@prototype).extend Chaplin.SyncMachine

    # Place your application-specific model features here.

    data: {}

    fetchParams:
      method: 'GET'
      data: {}

    formatUrl: (url) ->
       "http://localhost:83/#{url}"
#      'http://'+document.domain+':'+document.port"/#{url}"


    fetch: (callback) ->
      request =
        url: @formatUrl(@url())
        method: @fetchParams.method
        requestData: @fetchParams.data

      $.ajax(
        url:    request.url
        method: request.method
        data:   request.requestData

        success: (data) =>
          @data = data
          callback?()
      )