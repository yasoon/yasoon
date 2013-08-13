define [
  'chaplin',
  'models/base/model'
], (Chaplin, Model) ->
  'use strict'

  class RegisterRegisterModel extends Model
    name: 'RegisterRegister'


    add: (callback) ->
#      @publishEvent 'goLogin'

      if !@validateRegFields('name') || !@validateRegFields('lastName')  || !@validateRegFields('password') || !@validateEmail(@data['email'])
        return

      @method = 'POST'
      @url    = -> 'api/register'
      @requestData =
        model:
          name: @data.name
          lastName: @data.lastName
          email: @data.email
          password: @data.password
          shortHistory: @data.shortHistory
          job: @data.job
          interests: @data.interests
          dreams: @data.dreams

      updateCallback = =>
        @publishEvent 'modelUpdated', @
        callback?()

      console.log @data
      return
      @request(updateCallback)




    validateRegFields : (fieldName) ->
      registerForm = $(".register-form")
      statusValidate = false
      if not @validateNotNull(fieldName)
        registerForm.find(".data_" + fieldName).show()
        statusValidate = false
      else
        registerForm.find(".data_" + fieldName).hide()
        statusValidate = true

      return statusValidate