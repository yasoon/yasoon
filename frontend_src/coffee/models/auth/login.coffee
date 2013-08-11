define [
  'chaplin',
  'models/base/model'
], (Chaplin, Model) ->
  'use strict'

  class AuthLoginModel extends Model
    name: 'AuthLogin'


    add: (callback) ->
      if !@validateRegFields('login') || !@validateRegFields('password')
        return

      @method = 'POST'
      @url    = -> 'api/auth/login'
      @requestData =
        model:
          login: @data.login
          password: @data.password

      updateCallback = =>
        @publishEvent 'modelUpdated', @
        callback?()

      console.log @data
      return
      @request(updateCallback)




    validateAuthFields : (fieldName) ->
      loginForm = $(".login-form")
      statusValidate = false
      if not @validateNotNull(fieldName)
        loginForm.find(".data_" + fieldName).show()
        statusValidate = false
      else
        loginForm.find(".data_" + fieldName).hide()
        statusValidate = true

      return statusValidate