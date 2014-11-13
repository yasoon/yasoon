define(
  [
    'text!templates/registerTpl.htm'
    'models/UserUpdateModel'
    'views/ValidationView'
    'fileupload'
    'backbone'
    'stickit'
    'mediator'
  ]
  (
    registerTpl
    UserUpdateModel
    ValidationView
  ) ->
    class Register extends ValidationView
      events: ->
        'click .js-register':   'registerAction'
        'click .js-update':     'updateAction'
        'click .nav':           'goToStep'

      bindings:
        '#interviewCaption':    'interviewCaption'
        '#subscribed':          'subscribed'
        '#password':            'password'
        '#interest':            'interest'
        '#homepage':            'homepage'
        '#email':               'email'
        '#dream':               'dream'
        '#name':                'name'
        '#img':                 'img'
        '#job':                 'job'

      className:                'page-layout m-page'
      tagName:                  'section'
      template:                 _.template(registerTpl)

      initialize: ->
        @handler()
        @model.set('maxLength', 290)

      handler: ->
        @listenTo(@model, 'change:img', @changeImage)
        @listenTo(@model, 'change:interviewCaption', @symbolsCounter)

      ui: ->
        @.ui =
          counter: @$('.counter')

      setModels: ->
        @model = new UserUpdateModel(@model.toJSON())
        @stickit()
        @handler()

      render: ->
        @$el.empty().append(@template(@model.toJSON()))
        @createSteps()
        @

      onRender: ->
        @ui()
        @setImageUploader(@model)
        @showStep(0)
        @stickit()

      createSteps: ->
        steps = @$el.find('fieldset')
        steps.each( (step) -> steps.eq(step).wrap('<div id="step' + step + '"></div>'))
        @onRender()

      setImageUploader: (model) ->
        reg = typeof window.config.regFrom is "undefined" or parseInt(window.config.regFrom) is 0
        if reg
          new AjaxUpload(
            @$('#uploadImage')[0],
            action: '/api/author/upload_user_image'
            name: 'files[]'
            id: 'upload'
            createInput: ->
            onComplete: (file, data) ->
              ret = JSON.parse(data)
              model.set('img', ret.file_name)
              #hotfix @toDo listener not call change img
              $('.file_upload_block, header').find('img').attr('src', "/web/upload/avatar/#{ret.file_name}")
          )

      changeImage: ->
        $('.file_upload_block, header').find('img').attr('src', "/web/upload/avatar/#{@model.get('img')}")

      goToStep: (event) ->
        $this = $(event.currentTarget)
        step = $this.data('count')
        if $this.hasClass('next') then @showStep(step + 1) else @showStep(step - 1)

      showStep: (step) ->
        @$el.find("#step" + step).show().siblings().hide()

      registerAction: (event) ->
        event.preventDefault()
        @hideErrors()
        @$(event.currentTarget).prop('disabled', yes)
        if @model.isValid() then @register() else @returnToRegister(event)

      returnToRegister: (event) ->
        @$(event.currentTarget).prop('disabled', no)
        @showErrors(@model.validationError)

      register: ->
        $.post('/api/author/register', @model.toJSON(), (data) => if data.error is no then @registered(data) else @existedEmail(data))

      registered: (data) ->
        @model.set('id', data.userId)
        @showStep(1)
        @setModels()

      existedEmail: (data) ->
        if data.errorType is 'emailExist'
          @$(event.currentTarget).prop('disabled', no)
          @showErrors([{name: 'email', message: 'Пользователь с таким email уже есть'}])

      updateAction: (event) ->
        event.preventDefault()
        @hideErrors()
        @$(event.currentTarget).prop('disabled', yes)
        if @model.isValid() then @updateProfile() else @returnToUpdate()

      returnToUpdate: ->
        @showErrors(@model.validationError)
        @showStep(1)
        @$(event.currentTarget).prop('disabled', no)

      updateProfile: ->
        $.post('/api/author/editinfo', @model.toJSON(), (data) => if data.authorData is yes then @loadUser())

      loadUser: ->
        if window.newPost? then window.location = "/#/post/new/" + window.newPost
        else window.location = "/#/speaker/#{@model.get('id')}/posts/"
        window.location.reload(yes)
)