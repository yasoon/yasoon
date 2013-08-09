define [
  'chaplin',
  'models/base/model'
], (Chaplin, Model) ->
  'use strict'

  class RegisterRegisterModel extends Model
    name: 'RegisterRegister'


    add: (callback) ->
      if not @validateRegFields()
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

      @request(updateCallback)




    validateRegFields : () ->
      registerForm = $(".register-form")
      statusValidate = false
      if not @validateNotNull('name')
        registerForm.find(".data_name").show()
        statusValidate = false
      else
        registerForm.find(".data_name").hide()
        statusValidate = true

      if not @validateNotNull('lastName')
        registerForm.find(".data_lastName").show()
        statusValidate = false
      else
        registerForm.find(".data_lastName").hide()
        statusValidate = true

      if not @validateNotNull('password')
        registerForm.find(".data_password").show()
        statusValidate = false
      else
        registerForm.find(".data_password").hide()
        statusValidate = true

      if not @validateEmail(@data['email'])
        registerForm.find(".data_email").show()
        statusValidate = false
      else
        registerForm.find(".data_email").hide()
        statusValidate = true

      return statusValidate