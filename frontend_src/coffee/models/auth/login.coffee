define [
  'chaplin',
  'models/base/model'
], (Chaplin, Model) ->
  'use strict'

  class AuthLoginModel extends Model
    name: 'AuthLogin'


    add: (callback) ->
      if !@validateEmail(@data.email)
        $("input[data-field='email']").addClass('error')
        return
      else
        $("input[data-field='email']").removeClass('error')

      if !@validateNotNull('password')
        $("input[data-field='password']").addClass('error')
        return
      else
        $("input[data-field='password']").removeClass('error')

      @method = 'POST'
      @url    = -> 'api/auth/login'
      @requestData =
        model:
          email: @data.email
          password: @data.password

      updateCallback = =>
        @publishEvent 'modelUpdated', @
        callback?()

      console.log @data
      return
      @request(updateCallback)