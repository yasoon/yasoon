define [
  'chaplin',
  'models/base/model'
], (Chaplin, Model) ->
  'use strict'

  class AuthLoginModel extends Model
    name: 'AuthLogin'


    notify: (callback) ->
      #обрабатывать некорретный email

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
      @url    = -> 'login_check'
      @requestData = {email: @data.email, password: @data.password}

      @request(callback)