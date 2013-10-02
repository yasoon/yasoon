define [
  'chaplin',
  'models/base/model'
], (Chaplin, Model) ->
  'use strict'

  # @TODO ОБЪЕДИНИТЬ С AUTHOR/INFO???
  class RegisterRegisterModel extends Model
    name: 'RegisterRegister'

    load: (callback) ->
      @method = 'GET'
      @url = -> 'api/author/get_private_info'
      @requestData = {}
      @request(callback)


    #
    add: (callback) ->
      if !@validateRegFields('name') ||  !@validateRegFields('password') || !@validateEmail(@data['email'])
        $('html,body').animate({ scrollTop: 150 }, 'slow');
        return

      @method = 'POST'
      @url    = -> 'api/author/register'
      @requestData =
        author:
          name: @data.name
          email: @data.email
          password: @data.password
          shortHistory: @data.shortHistory
          job: @data.job
          interests: @data.interests
          dreams: @data.dreams
          homepage: @data.homepage
          subscribed: @data.subscribed


      callback()

      addCallback = (data) =>
        if data.error?
          @publishEvent 'publicError', 'Пользователь с этим email уже зарегистрирован'
        else
          authorId = data.id
          callback()

      @request(addCallback)

      #
    addStep2: (callback) ->
        @method = 'POST'
        @url = ->
          'api/author/register_step2'
        @requestData =
          author:
            shortHistory: @data.shortHistory
            job: @data.job
            interests: @data.interests
            dreams: @data.dreams

        addCallback = (data) =>
          if !data.error?
            authorId = data.id
            @publishEvent 'redirect', "author/#{authorId}/posts/new/blank"

        @request(addCallback, true)

    #
    update: (callback) ->
      if !@validateRegFields('name') || !@validateEmail(@data['email'])
        $('html,body').animate({ scrollTop: 150 }, 'slow');
        return

      if @data.new_password
        if !@validateRegFields('old_password')
          $('html,body').animate({ scrollTop: 150 }, 'slow');
          return

      @method = 'POST'
      @url    = -> 'api/author/editinfo'
      @requestData =
        author:
          id: @data.id

          name: @data.name
          email: @data.email
          password: @data.password
          subscribed: @data.subscribed

          shortHistory: @data.shortHistory
          job: @data.job
          interests: @data.interests
          dreams: @data.dreams

          homepage: @data.homepage

      updateCallback = (data) =>
        authorId = data.id
        @publishEvent 'redirect', "author/#{authorId}/posts"

      @request(updateCallback, true)

    #
    validateRegFields : (fieldName) ->
      registerForm = $(".register-form, .info-form")
      statusValidate = false
      if not @validateNotNull(fieldName)
        registerForm.find(".data_" + fieldName).show()
        registerForm.find("input[data-field='" + fieldName + "']").addClass('error')
        statusValidate = false
      else
        registerForm.find(".data_" + fieldName).hide()
        registerForm.find("input[data-field='" + fieldName + "']").removeClass('error')
        statusValidate = true

      return statusValidate

    #
    validateEmail : (email) =>
      registerForm = $(".register-form, .info-form")
      statusValidate = false
      if not super(email)
        registerForm.find(".data_email").show()
        registerForm.find("input[data-field='email']").addClass('error')
        statusValidate = false
      else
        registerForm.find(".data_email").hide()
        registerForm.find("input[data-field='email']").removeClass('error')
        statusValidate = true

      return statusValidate