define [
  'chaplin',
  'models/base/model'
], (Chaplin, Model) ->
  'use strict'

  class InfoInfoModel extends Model
    name: 'InfoInfo'


    add: (callback) ->
      if !@validateInfoFields('name') || !@validateInfoFields('lastName')  || !@validateInfoFields('password') || !@validateEmail(@data['email'])
        $('html,body').animate({ scrollTop: 200 }, 'slow');
        return

      @method = 'POST'
      @url    = -> 'api/user/info/edit'
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




    validateInfoFields : (fieldName) ->
      infoForm = $(".info-form")
      statusValidate = false
      if not @validateNotNull(fieldName)
        infoForm.find(".data_" + fieldName).show()
        statusValidate = false
      else
        infoForm.find(".data_" + fieldName).hide()
        statusValidate = true

      return statusValidate

    validateEmail : (email) =>
      infoForm = $(".info-form")
      statusValidate = false
      if not super(email)
        infoForm.find(".data_email").show()
        statusValidate = false
      else
        infoForm.find(".data_email").hide()
        statusValidate = true

      return statusValidate