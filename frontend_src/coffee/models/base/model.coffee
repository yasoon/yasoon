define [
  'chaplin'
], (Chaplin) ->

  class Model extends Chaplin.Model
    data: {}
    # При заполнении модели из data-field в этот объект сохраняются ссылки на эти объекты в DOM
    #dataField: {}

    access: 'NONE'

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

    validateEmail: (email) ->
      regExp =  new RegExp("[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
      return regExp.test(email)


    request: (callback, dontUpdateData=false) ->
      $.ajax(
        url:    @formatUrl(@url())
        method: @method
        data:   @requestData

        success: (data) =>
          if data.access?
            @access = data.access
            data = data.data

          if not dontUpdateData
            @data = data
          callback?(data)
      )