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
        'click #register': 'registerAction'
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
      window.open(
        '/socauth/vkontakte',
        '',
        'top=100,
        left=100,
        width=700,
        height=400,
        scrollbars=no,
        location=no,
        toolbar=no,
        directories=no,
        status=yes,
        menubar=no,
        resizable=yes'
      )

    facebookLogin: (event) ->
      event.preventDefault()
      window.open(
        '/socauth/facebook',
        '',
        'top=100,
        left=100,
        width=700,
        height=400,
        scrollbars=no,
        location=no,
        toolbar=no,
        directories=no,
        status=yes,
        menubar=no,
        resizable=yes'
      )

    registerAction: (event) ->
      @closePopUp()

    loginAction: (event) ->
      event.preventDefault()
      @hideErrors()
      if @model.isValid()
        $.post('/login_check', {
          email: @model.get('email')
          password: @model.get('password')
        }, (data) =>
          if data.error is yes
            if data.errorType is 'nouser'
              @showErrors([{
                name: 'email'
                message: 'Пользователя с таким email нет'
              }])
            else if data.errorType is 'invalidPassword'
              @showErrors([{
                name: 'password'
                message: 'Неверный пароль'
              }])
          else
            window.userId = data.userData.id
            window.location.reload(true)
        , 'json')
      else
        @showErrors(@model.validationError)

    showErrors: (errors) ->
      _.each(errors, (error) ->
        @$el
          .find('#' + error.name)
          .closest('.form-group')
          .removeClass('has-success')
          .addClass('has-error')
          .find('.help-block')
          .text(error.message)
      , @)

    hideErrors: ->
      @$('.form-group')
        .removeClass('has-error')
        .addClass('has-success')
        .find('.help-block')
        .text('')

)