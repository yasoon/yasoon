define [
  'chaplin',
  'models/base/model'
], (Chaplin, Model) ->
  'use strict'

  class AuthLoginModel extends Model
    name: 'AuthLogin'


    notify: (callback) ->
#      if !@validateEmail(@data.email)
#        @publishEvent 'publicError', 'Некорректный email'

      @method = 'POST'
      @url    = -> 'api/author/notify'
      @requestData = {email: @data.email}

      @request(callback)

    add: (callback) ->
      callback?()
#      if !@validateEmail(@data.email) || !@validateNotNull('password')
#        @publishEvent 'publicError', 'Неправильно введен email или пароль'
#        return
#
#      @method = 'POST'
#      @url    = -> 'api/auth/login'
#      @requestData =
#        model:
#          email: @data.email
#          password: @data.password
#
#      updateCallback = =>
#        @publishEvent 'modelUpdated', @
#        callback?()
#
#      console.log @data
#      return
#      @request(updateCallback)

