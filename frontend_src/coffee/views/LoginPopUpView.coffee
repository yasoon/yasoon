define(
  [
    'text!templates/loginPopUpTpl.htm'
    'views/PopUpView'
    'backbone'
    'stickit'
  ]
  (
    loginPopUpTpl
    PopUpView
  ) ->
    class LoginPopUpView extends PopUpView
      events: ->
        _.extend {}, super,
          'click #vk-login': 'vkLogin'
          'click #fb-login': 'facebookLogin'
          'click #js-register': 'registerAction'
          'submit form': 'loginAction'

      bindings:
        '#email': 'email'
        '#password': 'password'

      className: 'barrier'

      template: _.template(loginPopUpTpl)

      render: ->
        @$el.empty().append(@template())
        super
        @onRender()
        @

      onRender: ->
        @$el.show()
        @stickit()

      vkLogin: (event) ->
        event.preventDefault()
        window.open('/socauth/vkontakte', '', 'top=100, left=100, width=700, height=400, scrollbars=no, location=no, toolbar=no, directories=no, status=yes, menubar=no, resizable=yes')

      facebookLogin: (event) ->
        event.preventDefault()
        window.open('/socauth/facebook', '', 'top=100, left=100, width=700, height=400, scrollbars=no, location=no, toolbar=no, directories=no, status=yes, menubar=no, resizable=yes')

      registerAction: ->
        location = window.location.hash
        if location.indexOf "#/post/new/" >= 0 then window.newPost = location.replace '#/post/new/', ''
        $('.popUpBackground').click()

      loginAction: (event) ->
        this.$('input').change();
        event.preventDefault()
        @toggleButton(off)
        @hideErrors()
        if @model.isValid() then @checkUser() else @showErrors(@model.validationError)

      toggleButton: (mode) ->
        @$('button[type="submit"]').prop('disabled', mode)

      checkUser: ->
        $.post('/login_check', {email: @model.get('email'), password: @model.get('password')}, (data) => @showAnswer(data))

      showAnswer: (data) ->
        if data.error is yes then @checkError(data.errorType) else @changeLocation(data.userData)

      checkError: (data) ->
        @toggleButton(off)
        if data is 'nouser' then @showErrors([{name: 'email', message: 'Пользователя с таким email нет'}])
        else if data is 'invalidPassword' then @showErrors([{name: 'password', message: 'Неверный пароль'}])

      changeLocation: (data) ->
        Window.config.userId = data.id
        window.location.reload(true)

      showErrors: (errors) ->
        _.each(errors, (error) => @$el.find('#' + error.name).closest('.form-group').removeClass('has-success').addClass('has-error').find('.help-block').text(error.message))

      hideErrors: ->
        @$('.form-group').removeClass('has-error').addClass('has-success').find('.help-block').text('')
        
)