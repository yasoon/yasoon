define [
  'chaplin',
  'models/base/model'
], (Chaplin, Model) ->
  'use strict'

  class RegisterRegisterModel extends Model
    name: 'RegisterRegister'


    add: (callback) ->
      if !@validateRegFields('name') || !@validateRegFields('lastName')  || !@validateRegFields('password') || !@validateEmail(@data['email'])
        $('html,body').animate({ scrollTop: 150 }, 'slow');
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

      @publishEvent 'goLogin'
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

    validateEmail : (email) =>
      registerForm = $(".register-form")
      statusValidate = false
      if not super(email)
        registerForm.find(".data_email").show()
        statusValidate = false
      else
        registerForm.find(".data_email").hide()
        statusValidate = true

      return statusValidate